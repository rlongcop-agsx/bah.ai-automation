*** Settings ***
Resource               ../source/bahai_app.robot
Resource               ../source/common.robot
Resource               ../data/variables/public_variables.robot
Resource               ../data/variables/locators.robot
Test Setup             Main Web Setup    
...                    ${BROWSER}
Test Teardown          Main Web Teardown

*** Test Cases ***
Test Case 1: Verify that the is navigated to the registration page after clicking the "create a new account" link.
    [Documentation]    
    [Tags]             signup    
    ...                UR-TC-001
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Click the signup button       ${signup_btn}
    bahai_app.Validate text displayed       Create your account

Test Case 2: Verify that the user can successfully input a first name.
    [Documentation]    The user should be able to successfully input alphanumeric values in the First Name field.
    [Tags]             signup    
    ...                UR-TC-003
    bahai_app.Navigate to the signup page   ${SIGNUP_PAGE}    
    ...                                     ${signup_form}
    bahai_app.Enter credential              ${name_field}
    ...                                     Reden
    bahai_app.Validate value displayed      ${name_field}
    ...                                     Reden

Test Case 3: Verify that the user can successfully input a middle name.
    [Documentation]    The user should be able to successfully input alphanumeric values in the Middle Name field.
    [Tags]             signup    
    ...                UR-TC-004
    bahai_app.Navigate to the signup page   ${SIGNUP_PAGE}    
    ...                                     ${signup_form}
    bahai_app.Enter credential              ${middle_field}
    ...                                     Capoquian
    bahai_app.Validate value displayed      ${middle_field}
    ...                                     Capoquian

Test Case 4: Verify that the user can successfully input a last name.
    [Documentation]    The user should be able to successfully input alphanumeric values in the Last Name field.
    [Tags]             signup    
    ...                UR-TC-005
    bahai_app.Navigate to the signup page   ${SIGNUP_PAGE}    
    ...                                     ${signup_form}
    bahai_app.Enter credential              ${last_field}
    ...                                     Longcop
    bahai_app.Validate value displayed      ${last_field}
    ...                                     Longcop
    
Test Case 5: Verify that the user can successfully input a suffix name.
    [Documentation]    The user should be able to successfully input alphanumeric values in the Suffix Name field.
    [Tags]             signup    
    ...                UR-TC-006
    bahai_app.Navigate to the signup page   ${SIGNUP_PAGE}    
    ...                                     ${signup_form}
    bahai_app.Enter credential              ${suffix_field}
    ...                                     James
    bahai_app.Validate value displayed      ${suffix_field}
    ...                                     James
    
Test Case 6: Verify that the user can successfully input an email address.
    [Documentation]    The user should be able to successfully input an email.
    [Tags]             signup    
    ...                UR-TC-007
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${email_field}
    ...                                      ${EMAIL}
    bahai_app.Validate value displayed       ${email_field}
    ...                                      ${EMAIL}

Test Case 7: Verify that the user can input a passsword in the Password field.
    [Documentation]    The user should be able to input a password in the Password field.
    [Tags]             signup
    ...                UR-TC-008
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${password_field}
    ...                                      ${PASSWORD}
    bahai_app.Validate value displayed       ${password_field}
    ...                                      ${PASSWORD}
    
Test Case 8: Verify that the user can input a passsword in the Confirm Password field.
    [Documentation]    The user should be able to input a password in the Confirm Password field.
    [Tags]             signup
    ...                UR-TC-009
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${confirm_password_field}
    ...                                      ${PASSWORD}
    bahai_app.Validate value displayed       ${confirm_password_field}
    ...                                      ${PASSWORD}
    
Test Case 9: Verify that the Login page is displayed upon clicking the "sign in your existing account" link.
    [Documentation]    The Login page should be displayed.
    [Tags]             signup
    ...                UR-TC-010
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Click button                   ${signin_text_link}
    bahai_app.Validate text displayed        Sign in to your account

Test Case 10: Verify that the Sign Up page is displyed upon clicking the "Sign Up" link.
    [Documentation]    The user should be navigated to the Sign Up page
    [Tags]             signup
    ...                UR-TC-011
    bahai_app.Navigate to the login page     ${LOGIN_PAGE}    
    ...                                      ${login_form}
    bahai_app.Click button                   ${signup_btn}
    bahai_app.Validate text displayed        Create your account

Test Case 11: Verify that submitted email address is displayed and masked on the OTP page.
    [Documentation]    The submitted email address should be displayed.
    [Tags]             signup
    ...                UR-TC-013
    bahai_app.Delete registered user         ${DB_NAME}    
    ...                                      ${DB_USER}    
    ...                                      ${DB_PASSWORD}    
    ...                                      ${DB_HOST}    
    ...                                      ${DB_PORT}
    
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${name_field}    
    ...                                      Reden
    bahai_app.Enter credential               ${last_field}    
    ...                                      Longcop
    bahai_app.Enter credential               ${email_field}
    ...                                      ${EMAIL}
    bahai_app.Enter credential               ${password_field}
    ...                                      ${PASSWORD}
    bahai_app.Enter credential               ${confirm_password_field}
    ...                                      ${PASSWORD}
    bahai_app.Click create account           ${create_account_btn}
    bahai_app.Validate text displayed        ${PRIVATE_MASKED_EMAIL}

Test Case 12: Verify that the "Change your email" text link works as expected.
    [Documentation]    The user should be able to click the "Change your email" text link.
    [Tags]             signup
    ...                UR-TC-014
    bahai_app.Delete registered user         ${DB_NAME}    
    ...                                      ${DB_USER}    
    ...                                      ${DB_PASSWORD}    
    ...                                      ${DB_HOST}    
    ...                                      ${DB_PORT}
    
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${name_field}    
    ...                                      Reden
    bahai_app.Enter credential               ${last_field}    
    ...                                      Longcop
    bahai_app.Enter credential               ${email_field}
    ...                                      ${EMAIL}
    bahai_app.Enter credential               ${password_field}
    ...                                      ${PASSWORD}
    bahai_app.Enter credential               ${confirm_password_field}
    ...                                      ${PASSWORD}
    bahai_app.Click create account           ${create_account_btn}
    bahai_app.Validate text displayed        We've sent an OTP to

    bahai_app.Click button                   ${change_email_link}
    bahai_app.Verify element displayed       ${signup_form}

    
Test Case 13: Validate that the user can successfully register.
    [Documentation]    The user should be able to register an account successfully.
    [Tags]             signup    
    ...                UR-TC-018    
    ...                smoke
    bahai_app.Delete registered user         ${DB_NAME}    
    ...                                      ${DB_USER}    
    ...                                      ${DB_PASSWORD}    
    ...                                      ${DB_HOST}    
    ...                                      ${DB_PORT}
    
    bahai_app.Navigate to the signup page    ${SIGNUP_PAGE}    
    ...                                      ${signup_form}
    bahai_app.Enter credential               ${name_field}    
    ...                                      Reden
    bahai_app.Enter credential               ${last_field}    
    ...                                      Longcop
    bahai_app.Enter credential               ${email_field}
    ...                                      ${EMAIL}
    bahai_app.Enter credential               ${password_field}
    ...                                      ${PASSWORD}
    bahai_app.Enter credential               ${confirm_password_field}
    ...                                      ${PASSWORD}
    bahai_app.Click create account           ${create_account_btn}
    bahai_app.Validate text displayed       We've sent an OTP to
    Sleep    10s
    ${otp_code}=                            bahai_app.Get the OTP code    
    ...                                     Bahai Deals Registration OTP

    bahai_app.Enter credential              ${reset_otp_field}
    ...                                     ${otp_code}
    bahai_app.Click button                  ${signup_submit_btn}
    bahai_app.Validate text displayed       Thanks for signing up!


