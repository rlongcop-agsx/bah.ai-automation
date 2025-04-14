*** Variables ***
# login page
${login_form}                  xpath=//*[text()='Sign in to your account']
${signup_btn}                  xpath=//*[text()='Sign up']

# signup page
${name_field}=                 id=name
${email_field}=                id=email
${password_field}=             id=password
${confirm_password_field}=     id=confirmPassword
${create_account_btn}=         xpath=//*[text()='Create Account']