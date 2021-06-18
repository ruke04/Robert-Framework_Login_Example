*** Settings ***
Documentation            Checking different login scenarios
Library                  SeleniumLibrary
Test Setup              Preconditions for Login
Test Teardown            Close Browser

*** Variables ***

${BROWSER}               headlesschrome
${URL}                   http://automationpractice.com/
${LOGIN_EMAIL}           id:email
${LOGIN_PASSWORD}        id:passwd
${LOGIN_BUTTON}          id:SubmitLogin
${HOMEPAGE_SIGNIN}       class:login

*** Test Cases ***
Valid login
    [Tags]                               T1
    Wait Until Element Is Visible        ${LOGIN_EMAIL}                       10s
    Input Text                           ${LOGIN_EMAIL}                       lanreikuesan+1@gmail.com
    input Password                       ${LOGIN_PASSWORD}                    march2021
    Click Button                         ${LOGIN_BUTTON}
    Page Should Contain                  Uche Abayomi

Invalid Login Scenarios
    [Template]      Invalid Login Tests Scenarios
    lanreikuesan+1@gmail.com            march202211                           Authentication failed.
    lanreikuesan+11@gmail.com           march2021                             Authentication failed.
    lanreikuesan+21@gmail.com           march20222                            Authentication failed.
    ${empty}                            march2021                             An email address required
    lanreikuesan+1@gmail.com            ${empty}                              Password is required
    ${empty}                            ${empty}                              An email address required

#Invalid Login 1
    #[Tags]                               T2
    #Wait Until Element Is Visible       ${LOGIN_EMAIL}                       10s
    #Input Text                          ${LOGIN_EMAIL}                       lanreikuesan+1@gmail.com
    #input Password                      ${LOGIN_PASSWORD}                    march2022
    #Click Button                        ${LOGIN_BUTTON}
    #Page Should Contain                 Authentication failed



#Invalid login 2
#    [Tags]                               T3
#    Wait Until Element Is Visible       ${LOGIN_EMAIL}                       10s
#    Input Text                          ${LOGIN_EMAIL}                        lanreikuesanh+1@gmail.com
#    input Password                      ${LOGIN_PASSWORD}                     march2021
 #   Click Button                        ${LOGIN_BUTTON}
  #  Page Should Contain                 Authentication failed


*** Keywords ***
Preconditions for Login
    Open Browser                ${URL}                                ${BROWSER}
    Maximize Browser Window
    Click Element               ${HOMEPAGE_SIGNIN}

Invalid Login Tests Scenarios
    [Arguments]      ${user_email}     ${user_password}      ${expected_message}
    Input Text                          ${LOGIN_EMAIL}                        ${user_email}
    input Password                      ${LOGIN_PASSWORD}                     ${user_password}
    Click Button                        ${LOGIN_BUTTON}
    Page Should Contain                 ${expected_message}