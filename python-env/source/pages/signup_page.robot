*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Verify element visible
    [Arguments]                         ${locator}
    Wait Until Element Is Visible       ${locator}

Enter credential
    [Arguments]                          ${credential}     
    ...                                  ${locator}
    Input Text                           ${locator}        
    ...                                  ${credential}

Click button
    [Arguments]                         ${button}
    Wait Until Keyword Succeeds    10    1    Click Element                       ${button}

Validate text displayed in page
    [Arguments]                          ${expected_text}
    Wait Until Keyword Succeeds    10    1    Page Should Contain                  ${expected_text}