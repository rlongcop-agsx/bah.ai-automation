*** Variables ***
# homepage
${home_header}=                xpath=//h1[text()='Home is just a search away.']
${login_btn}=                  xpath=//button/span[text()='Login']


# login page
${login_form}                  xpath=//*[text()='Sign in to your account']
${signup_btn}                  xpath=//*[text()='Sign up']
${login_email_field}=          name=email
${login_password_field}=       name=password
${signin_btn}=                 xpath=//*[text()='Sign in']
${show_password_btn}=          css=button[aria-label='Show password']

# signup page
${name_field}=                 id=name
${email_field}=                id=email
${password_field}=             id=password
${confirm_password_field}=     id=confirmPassword
${create_account_btn}=         xpath=//*[text()='Create Account']
${profile_icon}=               xpath=//div[text()='S']
${logout_btn}=                xpath=//*[text()='Log out']