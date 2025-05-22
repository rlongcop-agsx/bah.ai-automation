import os, pickle, base64, time
from datetime import datetime, timezone
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from bs4 import BeautifulSoup

SCOPES = ["https://www.googleapis.com/auth/gmail.readonly"]

def authenticate_gmail(creds_file, token_file):
    creds = None
    if os.path.exists(token_file):
        with open(token_file, "rb") as token:
            creds = pickle.load(token)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(creds_file, SCOPES)
            creds = flow.run_local_server(port=0)
        with open(token_file, "wb") as token:
            pickle.dump(creds, token)
    return build("gmail", "v1", credentials=creds)

def extract_message_body(payload):
    if 'parts' in payload:
        for part in payload['parts']:
            result = extract_message_body(part)
            if result:
                return result
    else:
        body = payload.get('body', {}).get('data')
        mime_type = payload.get('mimeType')
        if body and mime_type in ['text/plain', 'text/html']:
            decoded_body = base64.urlsafe_b64decode(body).decode('utf-8')
            return decoded_body
    return None

def extract_otp_from_html(html_body):
    soup = BeautifulSoup(html_body, "html.parser")
    otp_element = soup.find("div", class_="otp-code")
    if otp_element:
        return otp_element.get_text(strip=True)
    return ""

class OtpLibrary:
    def get_otp(self, subject):
        BASE_DIR = os.path.dirname(os.path.abspath(__file__))
        creds_file = os.path.join(BASE_DIR, "credentials.json")
        token_file = os.path.join(BASE_DIR, "token.pickle")

        service = authenticate_gmail(creds_file, token_file)
        query = f'subject:"{subject}"'
        response = service.users().messages().list(userId='me', q=query, maxResults=1).execute()
        messages = response.get('messages', [])

        if not messages:
            return ""

        message_id = messages[0]['id']
        message = service.users().messages().get(userId='me', id=message_id, format='full').execute()
        payload = message.get('payload', {})

        body = extract_message_body(payload)
        if body:
            otp = extract_otp_from_html(body)
            return otp
        return ""
