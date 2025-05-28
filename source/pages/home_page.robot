*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Keywords ***
Navigate to login page
    [Arguments]                          ${url}
    Go To                                ${url}
    Location Should Be                   ${url}

Verify URL loaded
    [Arguments]                          ${url}
    Location Should Be                   ${url}

Verify page loaded
    [Arguments]                         ${locator}
    Wait Until Keyword Succeeds    10    1s    Wait Until Element Is Visible       ${locator}

Click button
    [Arguments]                         ${button}
    Click Element                       ${button}

Enter credential
    [Arguments]                          ${credential}     
    ...                                  ${locator}
    Input Text                           ${locator}        
    ...                                  ${credential}
    
Validate text displayed in page
    [Arguments]                          ${expected_text}
    Page Should Contain                  ${expected_text}   

Validate text displayed in element
    [Arguments]                          ${expected_text}     
    ...                                  ${locator}
    Element Should Contain               ${locator}    ${expected_text}

Validate value displayed
    [Arguments]                          ${locator}
    ...                                  ${expected_text}
    ${value}    Get Element Attribute    ${locator}    value
    Should Be Equal As Strings    ${value}    ${expected_text}

Validate aria label displayed
    [Arguments]                          ${locator}
    ...                                  ${expected_text}
    ${value}    Get Element Attribute    ${locator}    aria-label
    Should Be Equal As Strings    ${value}    ${expected_text}

Reopen the website
    [Arguments]    ${url}
    Execute JavaScript    window.open();
    ${handles}=    Get Window Handles
    Switch Window    ${handles[0]}
    Close Window
    Switch Window    ${handles[1]}
    Go To    ${url}

Validate OTP code is not empty
    [Arguments]                          ${otp_code}
    Should Not Be Empty                  ${otp_code}