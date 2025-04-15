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
    [Tags]             signin
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click sign in                 ${signin_btn}
    bahai_app.Validate name displayed       Welcome back, sample!

Test Case 2: Validate logout navigation
    [Documentation]    Validate user renavigates to logout page
    [Tags]             signin
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click sign in                 ${signin_btn}
    bahai_app.Validate name displayed       Welcome back, sample!

    bahai_app.Click button                 ${profile_icon}
    bahai_app.Click button                 ${logout_btn}
    bahai_app.Validate text displayed      Sign in to your account

    


    