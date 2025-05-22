*** Settings ***
Resource                    private_variables.robot

*** Variables ***
${BROWSER}=                 chrome
${HOME_PAGE}=               ${BASE_URL}
${LOGIN_PAGE}=              ${BASE_URL}/login
${SIGNUP_PAGE}=             ${BASE_URL}/signup
${EMAIL}=                   ${PRIVATE_EMAIL}
${EMAIL_2}=                   ${PRIVATE_EMAIL_2}
${PASSWORD}=                ${PRIVATE_PASSWORD}