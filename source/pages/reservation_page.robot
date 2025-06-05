*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Keywords ***
Click text link
    [Arguments]                          ${text}
    Click Link                           ${text}

Navigate to page
    [Arguments]                          ${url}
    Go To                                ${url}
    Location Should Be                   ${url}

Verify page loaded
    [Arguments]                         ${locator}
    Wait Until Keyword Succeeds    10    1s    Wait Until Element Is Visible       ${locator}

Click button
    [Arguments]                          ${button}
    Click Element                        ${button}

Enter credential
    [Arguments]                          ${credential}     
    ...                                  ${locator}
    Input Text                           ${locator}        
    ...                                  ${credential}
    
Validate text displayed in page
    [Arguments]                          ${expected_text}
    Wait Until Keyword Succeeds    10    1    Page Should Contain                  ${expected_text}

Validate text displayed in element
    [Arguments]                          ${expected_text}     
    ...                                  ${locator}
    Element Should Contain               ${locator}    
    ...                                  ${expected_text}

Validate value displayed
    [Arguments]                          ${locator}
    ...                                  ${expected_text}
    ${value}    Get Element Attribute    ${locator}    
    ...                                  value
    Should Be Equal As Strings           ${value}    
    ...                                  ${expected_text}

Validate aria label displayed
    [Arguments]                          ${locator}
    ...                                  ${expected_text}
    ${value}    Get Element Attribute    ${locator}    
    ...                                  aria-label
    Should Be Equal As Strings           ${value}    
    ...                                  ${expected_text}
    
Click property
    [Arguments]                          ${property_title}
    Wait Until Page Contains             ${property_title}
    Click Element                        xpath=//div[@title="${property_title}"]/ancestor::div[contains(@class, "relative") and contains(@class, "flex")]/descendant::button[.//span[text()="View Details"]]

Validate checkbox
    [Arguments]                          ${locator}
    ...                                  ${expected_text}
    ${value}    Get Element Attribute    ${locator}    
    ...                                  data-state
    Should Be Equal As Strings           ${value}    
    ...                                  ${expected_text}

Page Location Should Contain
    [Arguments]                          ${url}             
    Wait Until Location Contains         ${url}    
    ...                                  timeout=15s

Switch to new tab
    [Arguments]                          ${url}
    Switch Window                        NEW
    Wait Until Keyword Succeeds    10    1s    Location Should Be                   ${url}
    

