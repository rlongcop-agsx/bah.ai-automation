*** Settings ***
Resource               ../source/bahai_app.robot
Resource               ../source/common.robot
Resource               ../data/variables/public_variables.robot
Resource               ../data/variables/locators.robot
Test Setup             Main Web Setup    
...                    ${BROWSER}
Test Teardown          Main Web Teardown

# robot -d logs -v BROWSER:chrome tests
# robot -d logs -v BROWSER:firefox tests
# robot -d logs -v BROWSER:edge tests

*** Test Cases ***
Test Case 1: Validate that the user can successfully navigate to the login page.
    [Documentation]    Validate that the user can successfully navigate to the login page.
    [Tags]             signin    
    ...                UL-TC-002
    bahai_app.Navigate to the login page    ${HOME_PAGE}    
    ...                                     ${home_header}
    bahai_app.Click button                  ${login_btn}
    bahai_app.Validate text displayed       Sign in to your account

Test Case 2: Validate that the user can successfully input a valid email address
    [Documentation]    Validate that the user can successfully input a valid email address
    [Tags]             signin    
    ...                UL-TC-003
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Validate value displayed      ${login_email_field}    
    ...                                     ${EMAIL}
    Sleep    2

Test Case 3: Validate that the user can successfully input the correct password
    [Documentation]    Validate that the user can successfully input the correct password
    [Tags]             signin    
    ...                UL-TC-004
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Validate value displayed      ${login_password_field}    
    ...                                     ${PASSWORD}
    Sleep    2

    


    