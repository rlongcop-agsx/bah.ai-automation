*** Settings ***
Resource                    private_variables.robot

*** Variables ***
${BROWSER}=                 chrome
${HOME_PAGE}=               ${BASE_URL}
${LOGIN_PAGE}=              ${BASE_URL}/login
${SIGNUP_PAGE}=             ${BASE_URL}/signup
${EMAIL}=                   sample@email.com
${PASSWORD}=                Password@123