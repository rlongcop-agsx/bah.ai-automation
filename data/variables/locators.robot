*** Variables ***
# homepage
${home_header}=                xpath=//h1[text()='Your Philippine Dream Home Awaits']
${header_login_btn}=                  xpath=(//*[text()='Login'])[1]


# login page
${login_form}                  xpath=//*[text()='Sign in to your account']
${signup_btn}                  xpath=//*[text()='Sign up']
${login_email_field}=          name=email
${login_password_field}=       name=password
${login_btn}=                  xpath=(//*[text()='Login'])[4]
${show_password_btn}=          css=button[aria-label='Show password']
${hide_password_btn}=          css=button[aria-label='Hide password']

${reset_password_link}=       xpath=//*[text()='Forgot password?']
${reset_password_field}=      name=password
${reset_confirm_password_field}=      name=confirmPassword
${reset_password_btn}=         xpath=(//*[text()='Reset Password'])[2]
${reset_otp_field}=            xpath=//*[@id="root"]/div/div/main/div[2]/div/div[2]/div[2]/div[1]/input[1]
${reset_submit_btn}=           xpath=//*[@id="root"]/div/div/main/div[2]/div/div[2]/button
${reset_login_btn}=            xpath=xpath=(//*[text()='Login'])[2]

# signup page
${signup_form}=                xpath=//*[@id="root"]/div/div/main/div[2]/div/div[2]
${name_field}=                 name=firstName
${middle_field}=               name=middleName
${last_field}=                 name=lastName
${suffix_field}=               name=suffix
${email_field}=                name=email
${password_field}=             name=password
${confirm_password_field}=     name=confirmPassword
${create_account_btn}=         xpath=//*[text()='Create Account']
${profile_icon}=               css=button[aria-label='User menu']
${logout_btn}=                 xpath=//*[text()='Log out']
${signin_text_link}=           xpath=//*[text()='sign in to your existing account']
${signup_otp_field}=            xpath=//*[@id="root"]/div/div/main/div[2]/div/div[2]/div[2]/div[1]/input[1]
${signup_submit_btn}=            xpath=//*[@id="root"]/div/div/main/div[2]/div/div[2]/button
${change_email_link}=           xpath=//*[text()='Change your email']

# home page
${home_header}=                xpath=//*[@id="root"]/div/div/main/div[2]/div[1]/img
${bahai_logo}=                xpath=//*[@id="root"]/div/div/main/div[1]/div[1]/a

# reservation page
${properties_nav}=             xpath=(//*[text()='Properties'])[1]
${property}=                   xpath=(//*[text()='View Details'])[1]
${reserve_btn}=                 xpath=//*[text()='Reserve Now']
${consent_checkbox}=            id=terms
${consent_modal}=               xpath=//*[text()='Payment Terms and Conditions']
${back_btn}=                    xpath=//*[text()='Back to Property']
${proceed_btn}=                 xpath=//*[text()='Proceed to Payment']
${card_number_field}=           name=cardNumber
${cardholder_name_field}=       name=billingName
${expiry_date_field}=           name=cardExpiry
${cvc_field}=                   name=cardCvc
${payment_form}=                css=div.App-Payment
