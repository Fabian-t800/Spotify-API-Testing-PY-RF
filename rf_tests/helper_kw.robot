*** Settings ***
Library           ../lib/helper_methods/ArtistEndpointVerifications.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json    D:\\QA_Automation_Spotify\\test_data\\schema.json
Library           SeleniumLibrary
Library           ../lib/base_layer/GetCredentials.py
Library           Collections
Resource          ../rf_tests/Pages.robot

*** Keywords ***
Check Endpoint Get Artist
    get_artist_verification

Check Endpoint Get Artists Related Artists
    get_artist_related_artists_verificatGion

Check Endpoint Get Artists Several Albums
    get_artist_album_verification

Check Endpoint Get Artists Top Tracks
    get_artists_top_tracks_verification

Check Endpoint Get Several Artists
    get_artists_top_tracks_verification

Navigate To Login Page
    ${BROWSER}    SET VARIABLE    googlechrome
    ${URL}    SET VARIABLE    https://www.spotify.com/ro/
    Open Browser    ${URL}    ${BROWSER}
    ${elem}=    Get Webelement    xpath = //a[@href = 'https://www.spotify.com/ro/account/overview/']
    click element    ${elem}

Login
    [Arguments]    ${username}    ${password}
    Set Browser Implicit Wait    2
    ${username_field}=    Get Webelement    id=login-username
    ${password_field}=    Get Webelement    id=login-password
    Press Keys    ${username_field}    ${username}
    Press Keys    ${password_field}    ${password}
    ${login_button}=    Get Webelement    id=login-button
    Click element    ${login_button}

Successful Login
    Navigate To Login Page
    Set Browser Implicit Wait    2
    Login    ${username}    ${password}
    ${navigate_to_webplayer_button}=    Get Webelement    class=mh-brand-wrapper
    Click Element    ${navigate_to_webplayer_button}

Click Launch Webplayer Button
    ${launch_webplayer_button}=    Get Webelement    class=btn-stroked-dark
    Click Element    ${launch_webplayer_button}

Verify Webplayer UI
    ${featured_button}=    Get Webelement    xpath=//a[@href='/browse/featured']
    ${podcasts_button}=    Get Webelement    xpath=//a[@href='/browse/podcasts']
    ${charts_button}=    Get Webelement    xpath=//a[@href='/browse/charts']
    ${new_releases_button}=    Get Webelement    xpath=//a[@href='/browse/newreleases']
    ${genres_and_moods_button}=    Get Webelement    xpath=//a[@href='/browse/genres']
    ${discover_button}=    Get Webelement    xpath=//a[@href='/browse/discover']
    Comment    ${upgrade_button}=    Get Webelement    css:.btn.btn--no-margin.btn-black    Webelement no longer exists in page
    ${spotify_logo}=    Get Webelement    class=spotify-logo--text
    ${home_button}=    Get Webelement    xpath=//a[@class = 'link-subtle navBar-link ellipsis-one-line navBar-link--active']
    ${search_button}=    Get Webelement    xpath=//a[@aria-label='Search']
    ${your_library_button}=    Get Webelement    xpath=//a[@aria-label='Your Library']
    ${playlist_title_label}=    Get Webelement    class=Rootlist__playlists-header
    ${create_playlist_button}=    Get Webelement    class=CreatePlaylistButton
    ${install_app_button}=    Get Webelement    xpath=//a[@href='/download']
    ${username_name}=    Get Webelement    xpath=//a[@href='/settings/account']
    ${recently_played_label}=    Get Webelement    xpath=/html[1]/body[1]/div[2]/div[1]/div[4]/div[2]/div[1]/div[1]/div[1]/section[1]/div[1]/div[1]/section[1]/div[1]/div[1]/div[1]/section[1]/div[1]/div[1]/a[1]
    Page Should Contain Element    ${featured_button}
    Log    Featured button has been found    WARN
    Page Should Contain Element    ${podcasts_button}
    Log    Podcasts button has been found    WARN
    Page Should Contain Element    ${charts_button}
    Log    Charts button has been found    WARN
    Page Should Contain Element    ${new_releases_button}
    Log    New releases button has been found    WARN
    Page Should Contain Element    ${genres_and_moods_button}
    Log    Genres and moods button is present    WARN
    Page Should Contain Element    ${discover_button}
    Log    Discover button is present    WARN
    Comment    Page Should Contain Element    ${upgrade_button}
    Log    Upgrade button has been removed from the Webplayer UI    WARN
    Page Should Contain Element    ${spotify_logo}
    Log    Spotify logo is present    WARN
    Page Should Contain Element    ${home_button}
    Log    Home button is present    WARN
    Page Should Contain Element    ${search_button}
    Log    Search button is present    WARN
    Page Should Contain Element    ${your_library_button}
    Log    Your library button is present    WARN
    Page Should Contain Element    ${create_playlist_button}
    Log    Create playlist button is present    WARN
    Page Should Contain Element    ${install_app_button}
    Log    Install app button is present    WARN
    Page Should Contain Element    ${username_name}
    Log    Username is present in the page    WARN
    Page Should Contain Element    ${recently_played_label}
    Log    Recently Played label is present in the page    WARN

Check upgrade to pro
    Successful Login
    Set Browser Implicit Wait    3
    go to    https://www.spotify.com/ro/purchase/products/
    ${elements}=    Get Webelements    xpath=//h3[@class='card-heading']
    Element text should be    ${elements}[0]    Spotify Premium
    Element text should be    ${elements}[1]    Spotify Premium Family
    Element text should be    ${elements}[2]    Premium for Students
    Log    All elements are present!

Get UN-PW
    ${creds}=    read_credentials    D:\\credentials_fab.json
    ${username}=    Get From List    ${creds}    0
    ${password}=    Get From List    ${creds}    1
    Set global variable    ${username}
    Set global variable    ${password}

Create an empty playlist
    Successful Login
    Click Launch Webplayer Button
    ${create_playlist_button_first}=    Get Webelement    Class=CreatePlaylistButton__svg-plus-path
    Click Element    ${create_playlist_button_first}
    ${new_playlist_name_inbox}=    Get Webelement    Class=inputBox-input
    Press Keys    ${new_playlist_name_inbox}    Brand new playlist 1
    Execute Javascript    document.querySelector('.bf5f0e3120a568434ce7ed7fe108e659-scss .button-group .btn-green').click()

Play first song in library
    Successful login
    Click Launch Webplayer Button
    ${first_playlist}=    Get Webelement    class=RootlistItem__link
    Click Element    ${first_playlist}
    ${play_button_click}=    set variable    document.querySelector('.btn.btn-green.false').click()
    Wait until page contains element    css:.col-xs-12.col-lg-3.col-xl-4    timeout=5    error=Element play button is not present and clickable
    Execute Javascript    ${play_button_click}

Search For an artist - Positive
    Successful Login
    Click Launch Webplayer Button
    Sleep    1
    ${search_button}=    Get Webelement    xpath=//a[@aria-label='Search']
    Click element    ${search_button}
    ${search_bar}=    Get Webelement    xpath=//input[@placeholder='Search for Artists, Songs, or Podcasts']
    ${artist_name}=    Set Variable    Paul Hardcastle
    Press Keys    ${search_bar}    ${artist_name}
    sleep    3
    Element should contain    class=d9eb38f5d59f5fabd8ed07639aa3ab77-scss    ${artist_name}

Webplayer Console UI Check
    Successful Login
    Click Launch Webplayer Button
    Wait until page contains element    class=now-playing-bar
    Page should contain element    css:.control-button.spoticon-shuffle-16
    Page should contain element    css:.control-button.spoticon-skip-back-16.control-button--disabled
    Page should contain element    css:.control-button.spoticon-play-16.control-button--circled
    Page should contain element    css:.control-button.spoticon-skip-forward-16
    Page should contain element    css:.control-button.spoticon-repeat-16
    Page should contain element    class=progress-bar
    Page should contain element    css:.control-button.spoticon-queue-16
    Page should contain element    css:.spoticon-devices-16.control-button
    Page should contain element    class=volume-bar
    Page should contain element    css:.spoticon-volume-16.control-button.volume-bar__icon
