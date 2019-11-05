*** Settings ***
Suite Setup       Get UN-PW
Suite Teardown    Close Browser
Resource          helper_kw.robot

*** Test Cases ***
Login to Spotify Account - Negative 1
    Navigate To Login Page
    ${username}    Set variable    winterlord22
    ${password}    Set variable    bla bla
    Set Browser Implicit Wait    2
    Login    ${username}    ${password}
    ${warning}=    Get Webelement    class=alert-warning
    Page Should Contain Element    ${warning}

Login to Spotify Account - Happy Path
    Navigate To Login Page
    Set Browser Implicit Wait    2
    Login    ${username}    ${password}

Login to Spotify Account - Negative 2
    Navigate To Login Page
    ${username}    Set variable    winterman
    Set Browser Implicit Wait    2
    Login    ${username}    ${password}
    ${warning}=    Get Webelement    class=alert-warning
    Page Should Contain Element    ${warning}

Start Webplayer
    Successful login
    Click Launch Webplayer Button

WebPlayer UI Verification
    Successful Login
    Click Launch Webplayer Button
    Verify Webplayer UI

Upgrade to pro
    Check upgrade to pro

Create a new empty playlist
    Create an empty playlist

Play the first song in your custom library
    Play first song in library

Search For an Artist
    Search for an artist - Positive

Webplayer "Console" is present and has all needed UI elements
    Webplayer Console UI Check
