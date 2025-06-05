*** Settings ***
Resource               ../source/bahai_app.robot
Resource               ../source/common.robot
Resource               ../data/variables/public_variables.robot
Resource               ../data/variables/locators.robot
Test Setup             Main Web Setup    
...                    ${BROWSER}
Test Teardown          Main Web Teardown

# robot -d logs/chrome -v BROWSER:chrome tests
# robot -d logs/firefox -v BROWSER:firefox tests
# robot -d logs/edge -v BROWSER:edge tests

*** Test Cases ***
Test Case 1: Validate that the user can successfully navigate to the login page.
    [Documentation]    Validate that the user can successfully navigate to the login page.
    [Tags]             signin    
    ...                UL-TC-002
    bahai_app.Navigate to the login page    ${HOME_PAGE}/    
    ...                                     ${home_header}
    bahai_app.Click button                  ${header_login_btn}
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
    
Test Case 4: Validate that the password can be unmasked
    [Documentation]    Validate that the password can be unmasked
    [Tags]             signin    
    ...                UL-TC-005
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${show_password_btn}
    bahai_app.Validate aria label displayed  ${hide_password_btn}        
    ...                                      Hide password

Test Case 5: Validate if that the password can be masked.
    [Documentation]    Validate if that the password can be masked.
    [Tags]             signin    
    ...                UL-TC-006
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${show_password_btn}
    bahai_app.Click button                  ${hide_password_btn}
    bahai_app.Validate aria label displayed  ${show_password_btn}        
    ...                                      Show password

Test Case 6: Validate that the user can login successfully.
    [Documentation]    Validate that the user can login successfully.
    [Tags]             signin    
    ...                UL-TC-008    
    ...                smoke
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${login_btn}
    ${msg}=    Run Keyword And Ignore Error    bahai_app.Verify element displayed    ${profile_icon}
    Run Keyword If    '${msg[0]}' == 'FAIL'    Fail    FAILED: Login failed.

    
Test Case 7: Verify that the user remains signed in after closing and reopening the tab.
    [Documentation]    The user should remain signed in upon returning to the app.
    [Tags]             signin
    ...                UL-TC-010
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${login_btn}
    ${msg}=    Run Keyword And Ignore Error    bahai_app.Verify element displayed    ${profile_icon}
    Run Keyword If    '${msg[0]}' == 'FAIL'    Fail    FAILED: Login failed.

    bahai_app.Reopen Bahai website          ${HOME_PAGE}
    ...                                     ${home_header}

    ${msg}=    Run Keyword And Ignore Error    bahai_app.Verify element displayed    ${profile_icon}
    Run Keyword If    '${msg[0]}' == 'FAIL'    Fail    FAILED: Login failed.
    
    bahai_app.Click button                  ${profile_icon}
    bahai_app.Validate text displayed       ${EMAIL}

Test Case 8: Verify that the user remains signed in after refreshing the page.
    [Documentation]    The user should remain signed in upon refreshing the webapp.
    [Tags]             signin
    ...                UL-TC-012
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${login_btn}
    ${msg}=    Run Keyword And Ignore Error    bahai_app.Verify element displayed    ${profile_icon}
    Run Keyword If    '${msg[0]}' == 'FAIL'    Fail    FAILED: Login failed.

    Reload Page
    ${msg}=    Run Keyword And Ignore Error    bahai_app.Verify element displayed    ${profile_icon}
    Run Keyword If    '${msg[0]}' == 'FAIL'    Fail    FAILED: Login failed.
    
    bahai_app.Click button                  ${profile_icon}
    bahai_app.Validate text displayed       ${EMAIL}

Test Case 9: Verify that the user is redirected to the Forget Password page.
    [Documentation]    The user should be redirected to the Forget Password page.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-027
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Validate text displayed       Reset Password

Test Case 10: Verify that the user can successfully input a valid email in the Email Address field.
    [Documentation]    The user should be able to input a valid email in the Email Address field.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-029
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}

Test Case 11: Verify that the user can successfully input a valid password in the Password field.
    [Documentation]    The user should be able to input a valid password in the Password field.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-030
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${reset_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Validate value displayed      ${reset_password_field}
    ...                                     ${PASSWORD}
    
Test Case 12: Verify that the user can successfully input a valid password in the Confirm Password field.
    [Documentation]    The user should be able to input a valid password in the Password field.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-031
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${reset_confirm_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Validate value displayed      ${reset_confirm_password_field}
    ...                                     ${PASSWORD}

Test Case 13: Verify that the OTP page is displayed upon clicking the Reset Password button.
    [Documentation]    The OTP page should be displayed upon clicking the Reset Password button.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-032
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${reset_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Enter credential              ${reset_confirm_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${reset_password_btn}
    bahai_app.Validate text displayed       We've sent an OTP to

Test Case 14: Verify that the registered address is displayed.
    [Documentation]    The registered address should be displayed.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-033
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${reset_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Enter credential              ${reset_confirm_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${reset_password_btn}
    bahai_app.Validate text displayed       ${PRIVATE_MASKED_EMAIL}

Test Case 15: Verify that the user successfully received the OTP.
    [Documentation]    The user should successfully receive the OTP.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-034
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${reset_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Enter credential              ${reset_confirm_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${reset_password_btn}
    Sleep    10s
    ${otp_code}=                            bahai_app.Get the OTP code    
    ...                                     Bahai Deals Password Reset OTP
    bahai_app.Validate OTP code is not empty    ${otp_code}

Test Case 16: Validate that the user can successfully reset the password.
    [Documentation]    The user should be able to reset the password.
    [Tags]             signin    
    ...                forget_password
    ...                UL-TC-035    
    ...                smoke
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}
    ...                                     ${login_form}
    bahai_app.Click button                  ${reset_password_link}
    bahai_app.Enter credential              ${login_email_field}
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${reset_password_field}
    ...                                     ${PASSWORD}
    bahai_app.Enter credential              ${reset_confirm_password_field}
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${reset_password_btn}
    bahai_app.Validate text displayed       ${PRIVATE_MASKED_EMAIL}
    Sleep    10s
    ${otp_code}=                            bahai_app.Get the OTP code    
    ...                                     Bahai Deals Password Reset OTP
    bahai_app.Enter credential              ${reset_otp_field}
    ...                                     ${otp_code}
    bahai_app.Click button                  ${reset_submit_btn}
    bahai_app.Validate text displayed       Password changed!