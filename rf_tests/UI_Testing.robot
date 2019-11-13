*** Settings ***
Suite Setup       Navigate To Login Page
Suite Teardown    Close Browser
Test Setup
Test Teardown     Clear-fields-login
Resource          helper_kw.robot
Resource          Elements.robot

*** Test Cases ***
Login to Spotify Account - Negative Invalid PW
    [Documentation]    https://trello.com/c/Ve3FeFGa/2-test-case-2-login-negative-1\
    [Tags]    Smoke    Negative
    Given Go To    https://accounts.spotify.com/en/login/?_locale=en-RO&continue=https:%2F%2Fwww.spotify.com%2Fro%2Faccount%2Foverview%2F
    Login    ${username}    ${invalid_password}
    Input Text    ${username_field}    ${username}    clear=True
    Input Text    ${password_field}    ${invalid_password}    clear=True
    ${login_button}=    Get Webelement    id=login-button
    Click element    ${login_button}
    Then Page Should Contain Element    ${warning}
    [Teardown]

Login to Spotify Account - Negative Negative Username
    [Documentation]    https://trello.com/c/oD0fysx2/3-test-case-3-login-negative-2
    [Tags]    Smoke    Negative
    Given Go To    https://accounts.spotify.com/en/login/?_locale=en-RO&continue=https:%2F%2Fwww.spotify.com%2Fro%2Faccount%2Foverview%2F
    And Reload Page
    Input Text    ${username_field}    ${username}    clear=True
    Input Text    ${password_field}    ${invalid_password}    clear=True
    ${login_button}=    Get Webelement    id=login-button
    Click element    ${login_button}
    Then Page Should Contain Element    ${warning}
    [Teardown]

Login to Spotify Account - Happy Path
    [Documentation]    https://trello.com/c/NKN2yz5L/1-test-case-1-login-happy-path
    [Tags]    Regression    Critical
    Given Go To    https://accounts.spotify.com/en/login/?_locale=en-RO&continue=https:%2F%2Fwww.spotify.com%2Fro%2Faccount%2Foverview%2F
    Reload Page
    Input Text    ${username_field}    ${username}    clear=True
    Input Text    ${password_field}    ${password}    clear=True
    ${login_button}=    Get Webelement    id=login-button
    wait until page contains element    ${login_button}    timeout=5
    Click element    ${login_button}
    Then Page should contain element    ${Page_Title_Account_Overview}
    [Teardown]
