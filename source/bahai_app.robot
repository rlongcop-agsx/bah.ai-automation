*** Settings ***
Documentation     This is the main keywords for the Asenso app
Resource          pages/login_page.robot
Resource          pages/signup_page.robot

*** Keywords ***
Navigate to the login page
    [Arguments]                          ${url}    
    ...                                  ${locator}
    login_page.Navigate to login page    ${url}
    login_page.Verify page loaded        ${locator}

Click the signup button
    [Arguments]                          ${locator}
    login_page.Verify page loaded        ${locator}
    login_page.Click button              ${locator}

Enter credential
    [Arguments]                          ${locator}    
    ...                                  ${credential}
    signup_page.Verify element visible   ${locator}
    signup_page.Enter credential         ${credential}    
    ...                                  ${locator}

Click create account
    [Arguments]                          ${locator}
    signup_page.Verify element visible   ${locator}
    signup_page.Click button            ${locator}

Validate name displayed
    [Arguments]                          ${expected_text}    
    signup_page.Validate text displayed in page    ${expected_text}    

Click sign in
    [Arguments]                          ${locator}
    login_page.Verify page loaded        ${locator}
    login_page.Click button              ${locator}