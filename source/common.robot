*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
# Library           AutoRecorder

*** Keywords ***
Main Web Setup
    [Documentation]    Main web setup
    [Arguments]        ${browser}

    IF    '${browser}' == 'chrome' or '${browser}' == 'headlesschrome'
        ${dir}=    Set Variable    chrome
    ELSE IF    '${browser}' == 'firefox' or '${browser}' == 'headlessfirefox'
        ${dir}=    Set Variable    firefox
    ELSE
        ${dir}=    Set Variable    ${browser}
    END

    Create Directory    logs/${dir}/screenshots
    # Empty Directory     logs/${dir}/screenshots
    SeleniumLibrary.Set Screenshot Directory    logs/${dir}/screenshots

    Open Browser        about:blank    ${browser}
    Maximize Browser Window

Main Web Teardown
    [Documentation]            Main web teardown
    SeleniumLibrary.Capture Page Screenshot
    Close All Browsers

Currency Web Setup
    [Documentation]             Currency web setup
    [Arguments]                 ${browser}
    # Empty Directory             logs/screenshots

    SeleniumLibrary.Set Screenshot Directory    logs/${browser}/screenshots
    Open Browser                about:blank    
    ...                         ${browser}
    Maximize Browser Window

Currency Web Teardown
    [Documentation]            Currency web teardown
    SeleniumLibrary.Capture Page Screenshot
    Close All Browsers

Screen Capture
    [Documentation]            Capture the screen
    [Arguments]                ${filename}
    SeleniumLibrary.Capture Page Screenshot    ${filename}