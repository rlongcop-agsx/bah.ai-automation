*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Navigate to login page
    [Arguments]                          ${url}
    Go To                                ${url}
    Location Should Be                   ${url}

Verify page loaded
    [Arguments]                         ${locator}
    Wait Until Keyword Succeeds    10    1s    Wait Until Element Is Visible       ${locator}

Click button
    [Arguments]                         ${button}
    Click Element                       ${button}

Click link
    [Arguments]                         ${text}
    Click Link                           ${text}

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