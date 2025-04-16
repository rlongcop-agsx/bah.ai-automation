*** Settings ***
Resource               ../source/bahai_app.robot
Resource               ../source/common.robot
Resource               ../data/variables/public_variables.robot
Resource               ../data/variables/locators.robot
Test Setup             Main Web Setup    
...                    ${BROWSER}
Test Teardown          Main Web Teardown

*** Test Cases ***
Test Case 1: Validate user registration
    [Documentation]    Validate user registration
    [Tags]             signup
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Click the signup button       ${signup_btn}
    bahai_app.Enter credential              ${name_field}    
    ...                                     John Doe
    bahai_app.Enter credential              ${email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${password_field}
    ...                                     ${PASSWORD}
    bahai_app.Enter credential              ${confirm_password_field}
    ...                                     ${PASSWORD}
    bahai_app.Click create account          ${create_account_btn}
    bahai_app.Validate name displayed       Welcome back, John!

    


    