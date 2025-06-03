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

Test Case 1: Verify that the user can access the home page via URL.
    [Documentation]    The home page should be displayed;
    [Tags]             home    
    ...                HP-TC-001
    bahai_app.Navigate to the home page    ${HOME_PAGE}/    
    ...                                    ${home_header}
    Sleep    2s
    Validate text displayed                Your Philippine Dream Home Awaits

Test Case 2: Verify that the user can access the home page by clicking the bahai logo.
    [Documentation]    The home page should be displayed;
    [Tags]             home    
    ...                HP-TC-002
    bahai_app.Navigate to the home page    ${HOME_PAGE}/    
    ...                                    ${home_header}
    bahai_app.Click button                 ${bahai_logo}
    bahai_app.Verify the URL loaded        ${HOME_PAGE}/

Test Case 3: Verify that the featured properties section is displayed.
    [Documentation]    The Featured Properties section should be displayed.
    [Tags]             home    
    ...                HP-TC-005
    bahai_app.Navigate to the home page    ${HOME_PAGE}/    
    ...                                    ${home_header}
    bahai_app.Validate text displayed      Featured Properties

Test Case 4: Verify that the View All Properties button is displayed.
    [Documentation]    The View All Properties button should be displayed.
    [Tags]             home    
    ...                HP-TC-007
    bahai_app.Navigate to the home page    ${HOME_PAGE}/    
    ...                                    ${home_header}
    bahai_app.Validate text displayed      View All Properties