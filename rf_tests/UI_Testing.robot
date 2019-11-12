*** Settings ***
Suite Setup       Get UN&PW
Suite Teardown    Close All Browsers
Test Setup        Open-Browser-Navigate-to-Spotify
Test Teardown     Close Browser
Resource          helper_kw.robot
Resource          Elements.robot

*** Test Cases ***
Login to Spotify Account - Negative Invalid PW
    [Documentation]    https://trello.com/c/Ve3FeFGa/2-test-case-2-login-negative-1\
    [Tags]    Smoke
    Given Navigate To Login Page
    And Login    ${username}    ${invalid_password}
    Then Page Should Contain Element    ${warning}

Login to Spotify Account - Happy Path
    [Documentation]    https://trello.com/c/NKN2yz5L/1-test-case-1-login-happy-path
    [Tags]    Regression    Critical
    Given Navigate To Login Page
    And Login    ${username}    ${password}
    Then Page should contain element    ${Page_Title_Account_Overview}

Login to Spotify Account - Negative Negative Username
    [Documentation]    https://trello.com/c/oD0fysx2/3-test-case-3-login-negative-2
    [Tags]    Smeoke
    Given Navigate To Login Page
    And Login    ${invalid_username}    ${password}
    Then Page Should Contain Element    ${warning}

Start Webplayer
    [Documentation]    https://trello.com/c/9KFzYkwV/4-test-case-4-start-webplayer
    [Tags]    Regression
    Given Successful login
    And Click Launch Webplayer Button
    Then Title Should Be    Spotify – Home

WebPlayer UI Verification
    [Documentation]    https://trello.com/c/lK06aQjo/7-test-case-7-webplayer-ui-verification
    [Tags]    Regression
    Given Successful Login
    And Click Launch Webplayer Button
    Then Page Should Contain Element    ${featured_button}
    And Page Should Contain Element    ${podcasts_button}
    And Page Should Contain Element    ${charts_button}
    And Page Should Contain Element    ${new_releases_button}
    And Page Should Contain Element    ${genres_button}
    And Page Should Contain Element    ${discover_button}
    And Page Should Contain Element    ${spotify_logo}
    And Page Should Contain Element    ${home_button}
    And Page Should Contain Element    ${search_button}
    And Page Should Contain Element    ${your_library_button}
    And Page Should Contain Element    ${create_playlist_button}
    And Page Should Contain Element    ${install_app_button}
    And Page Should Contain Element    ${username_name}
    And Page Should Contain Element    ${recently_played_label}

Upgrade to pro
    [Documentation]    https://trello.com/c/PxtdcgWz/8-test-case-8-upgrade-to-pro
    [Tags]    Smoke
    Given Successful login
    And Click Launch Webplayer Button
    When Go To    ${upgrade_pro_url}
    Then Page should contain    Spotify Premium

Create a new empty playlist
    [Documentation]    https://trello.com/c/skj37a1Q/10-test-case-10-create-an-empty-playlist
    [Tags]    Regression
    Given Successful login
    And Click Launch Webplayer Button
    When Click Element    ${create_playlist_button}
    And Press Keys    ${search_field}    ${playlist_name}
    When Click create button
    Then Wait until page contains    ${playlist_name}    timeout=5    error=No new playlsit was created
    [Teardown]    Teardown Create a new empty playlist

Play the first song in your custom library
    [Documentation]    https://trello.com/c/NfClLzYK/6-test-case-6-play-the-first-library-in-your-list-of-libraries
    [Tags]    Critical    Smoke
    Given Successful Login
    And Click Launch Webplayer Button
    When Click Element    ${topmost_playlist_item}
    Then Page should contain element    ${play_song_button}
    When Click the play button

Search For an Artist
    [Documentation]    https://trello.com/c/JTlqneSpoG4/5-test-case-5-search-for-an-artist-and-verify-that-search-results-are-showed-positive
    [Tags]    Smoke
    Given Successful Login
    And Click Launch Webplayer Button
    When Click element    ${search_button}
    And Press Keys    ${search_bar}    ${artist_name}
    When Wait Until Page Contains    ${top_results}
    And Wait Until page contains element    ${top-result-frame}
    Then Element should contain    ${top_result_search}    ${artist_name}

Webplayer "Console" is present and has all needed UI elements
    [Documentation]    https://trello.com/c/BQ3thh7n/9-test-case-9-webplayer-console-is-present-at-the-bottom-of-the-page-with-all-the-prerequisite-buttons
    [Tags]    Regression    UI
    Given Successful Login
    And Click Launch Webplayer Button
    When Wait until page contains element    ${now_playing_bar}
    And Page should contain element    ${install_app_button}
    And Page should contain element    ${skip_back_button}
    And Page should contain element    ${play_button}
    And Page should contain element    ${skip_forward_button}
    And Page should contain element    ${repeat_button}
    And Page should contain element    ${progress_bar}
    And Page should contain element    ${queue_button}
    And Page should contain element    ${devices_button}
    And Page should contain element    ${volume_bar}
    And Page should contain element    ${mute_button}
