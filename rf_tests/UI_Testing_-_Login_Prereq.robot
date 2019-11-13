*** Settings ***
Suite Setup       OpenBrowserAndGoToUrl
Suite Teardown    Close Browser
Test Setup
Resource          helper_kw.robot
Resource          Elements.robot

*** Test Cases ***
Start-Web-Player
    go to    https://www.spotify.com/ro/
    And Click Launch Webplayer Button
    Then Title Should Be    Spotify – Home

Webplayer-UI-Verification
    Given Go To    https://open.spotify.com/browse/featured
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

Create-a-new-empty-playlist
    Given Go To    https://open.spotify.com/browse/featured
    When Click Element    ${create_playlist_button}
    And Press Keys    ${search_field}    ${playlist_name}
    When Click create button
    Then Wait until page contains    ${playlist_name}    timeout=5    error=No new playlsit was created
    [Teardown]    Teardown Create a new empty playlist

Play-the-first-song-in-your-custom-library
    Given Go To    https://open.spotify.com/browse/featured
    When Click Element    ${topmost_playlist_item}
    Then Page should contain element    ${play_song_button}
    When Click the play button

Seach-for-an-artist
    Given Go To    https://open.spotify.com/browse/featured
    When Click element    ${search_button}
    And Press Keys    ${search_bar}    ${artist_name}
    When Wait Until Page Contains    ${top_results}
    And Wait Until page contains element    ${top-result-frame}
    Then Element should contain    ${top_result_search}    ${artist_name}

Webplayer-"Console"-is-present-and-has-all-needed-ui-elements
    Given Go To    https://open.spotify.com/browse/featured
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

Upgrade-to-pro
    When Go To    ${upgrade_pro_url}
    Then Page should contain    Spotify Premium
