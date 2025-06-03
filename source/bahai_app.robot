*** Settings ***
Documentation     This is the main keywords for the Asenso app
Resource          pages/login_page.robot
Resource          pages/signup_page.robot
Resource          pages/home_page.robot
Resource          pages/reservation_page.robot
Library           ../helpers/OtpLibrary.py
Resource          ../helpers/psql_script.robot

*** Keywords ***
Click the Terms text link
    [Arguments]                                          ${text}
    reservation_page.Click text link                     ${text}

Click the Privacy text link
    [Arguments]                                          ${text}
    reservation_page.Click text link                     ${text}

Get the OTP code
    [Arguments]                                          ${subject}
    ${otp_code}=                                         get_otp    ${subject}
    RETURN                                               ${otp_code}

Navigate to the login page
    [Arguments]                                          ${url}    
    ...                                                  ${locator}
    login_page.Navigate to login page                    ${url}
    login_page.Verify page loaded                        ${locator}

Click the signup button
    [Arguments]                                          ${locator}
    login_page.Verify page loaded                        ${locator}
    login_page.Click button                              ${locator}

Enter credential
    [Arguments]                                          ${locator}    
    ...                                                  ${credential}
    signup_page.Verify element visible                   ${locator}
    signup_page.Enter credential                         ${credential}    
    ...                                                  ${locator}

Click create account
    [Arguments]                                          ${locator}
    signup_page.Verify element visible                   ${locator}
    signup_page.Click button                             ${locator}

Validate name displayed
    [Arguments]                                          ${expected_text}    
    signup_page.Validate text displayed in page          ${expected_text}    

Click sign in
    [Arguments]                                          ${locator}
    login_page.Verify page loaded                        ${locator}
    login_page.Click button                              ${locator}

Click button
    [Arguments]                                          ${locator}
    signup_page.Verify element visible                   ${locator}
    signup_page.Click button                             ${locator}

Validate text displayed
    [Arguments]                                          ${expected_text}    
    signup_page.Validate text displayed in page          ${expected_text}

Wait until text displayed
    [Arguments]                                          ${expected_text}    
    reservation_page.Validate text displayed in page     ${expected_text}

Validate value displayed
    [Arguments]                                          ${locator}    
    ...                                                  ${expected_text}
    login_page.Verify page loaded                        ${locator}
    login_page.Validate value displayed                  ${locator}    
    ...                                                  ${expected_text}

Validate aria label displayed
    [Arguments]                                          ${locator}    
    ...                                                  ${expected_text}
    login_page.Verify page loaded                        ${locator}
    login_page.Validate aria label displayed             ${locator}    
    ...                                                  ${expected_text}

Reopen Bahai website
    [Arguments]                                          ${url}    
    ...                                                  ${locator}
    login_page.Reopen the website                        ${url}
    login_page.Verify page loaded                        ${locator}

Verify element displayed
    [Arguments]                                          ${locator}    
    login_page.Verify page loaded                        ${locator}
    signup_page.Verify element visible                   ${locator}

Validate OTP code is not empty
    [Arguments]                                          ${otp_code}
    login_page.Validate OTP code is not empty            ${otp_code}

Navigate to the home page
    [Arguments]                                          ${url}    
    ...                                                  ${locator}
    home_page.Navigate to login page                     ${url}
    home_page.Verify page loaded                         ${locator}

Verify the URL loaded
    [Arguments]                                          ${url}    
    home_page.Verify URL loaded                          ${url}

Navigate to the signup page
    [Arguments]                                          ${url}    
    ...                                                  ${locator}
    signup_page.Navigate to login page                   ${url}
    signup_page.Verify page loaded                       ${locator}

Click a Property
    [Arguments]                                          ${property_title}
    reservation_page.Click property                      ${property_title}

Validate checkbox
    [Arguments]                                          ${locator}    
    ...                                                  ${expected_text}
    reservation_page.Validate checkbox                   ${locator}    
    ...                                                  ${expected_text}

Page URL Should Contain
    [Arguments]                                          ${url}             
    reservation_page.Page Location Should Contain        ${url}   

Switch to new tab
    [Arguments]                                          ${url}    
    reservation_page.Switch to new tab                   ${url}

Delete registered user
    [Arguments]                                          ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
    
    psql_script.Delete User in Identity Crendentials     ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
    
    psql_script.Delete User in Identities                ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
    
    psql_script.Delete User in Payments                  ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}

    psql_script.Delete User in Customer Properties       ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
    
    psql_script.Delete User in Customer Scheduled Viewings       ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
    
    psql_script.Delete User in Customers                 ${DB_NAME}    
    ...                                                  ${DB_USER}    
    ...                                                  ${DB_PASSWORD}    
    ...                                                  ${DB_HOST}    
    ...                                                  ${DB_PORT}
