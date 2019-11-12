*** Variables ***
${now_playing_bar}    class=now-playing-bar
${shuffle_button}    xpath=//button[@title='Enable shuffle']
${skip_back_button}    css:.control-button.spoticon-skip-back-16
${play_button}    css:.control-button.spoticon-play-16.control-button--circled
${skip_forward_button}    css:.control-button.spoticon-skip-forward-16
${repeat_button}    css:.control-button.spoticon-repeat-16
${progress_bar}    class=progress-bar
${queue_button}    css:.control-button.spoticon-queue-16
${devices_button}    css:.spoticon-devices-16.control-button
${volume_bar}     class=volume-bar
${mute_button}    xpath=//button[@aria-label='Mute']
${search_button}    xpath=//a[@aria-label='Search']
${search_bar}     xpath=//input[@placeholder='Search for Artists, Songs, or Podcasts']
${artist_name}    Paul Hardcastle
${top_result_search}    class=d9eb38f5d59f5fabd8ed07639aa3ab77-scss
${topmost_playlist_item}    class=RootlistItem__link
${list_of_songs}    css:.col-xs-12.col-lg-3.col-xl-4
${clicking_the_play_button}    document.querySelector('.btn.btn-green.false').click()
${create_playlist_button}    Class=CreatePlaylistButton__svg-plus-path
${playlist_name}    New Playlist
${search_field}    Class=inputBox-input
${click_create_playlist_button}    document.querySelector('.bf5f0e3120a568434ce7ed7fe108e659-scss .button-group .btn-green').click()
${top_results}    Top result
${credentials_path}    ../credentials_fab.json
${clicking_delete_button}    document.querySelector('.btn.btn-green').click()
${warning}        class=alert-warning
${invalid_password}    thisisaninvalidpassword
${invalid_username}    Thisisaninvalidusername
${featured_button}    css:._137ec408b14ac4ea5aec6ded3d95f328-scss.be059487cfa7b71ee0f482c8e5be2b7e-scss
${podcasts_button}    xpath=//a[@href='/browse/podcasts']
${charts_button}    xpath=//a[@href='/browse/charts']
${new_releases_button}    xpath=//a[@href='/browse/newreleases']
${genres_button}    xpath=//a[@href='/browse/genres']
${discover_button}    xpath=//a[@href='/browse/discover']
${spotify_logo}    class=spotify-logo--text
${home_button}    css:.link-subtle.navBar-link.ellipsis-one-line.navBar-link--active
${your_library_button}    xpath=//a[@aria-label='Your Library']
${playlist_title_header}    class=Rootlist__playlists-header
${install_app_button}    xpath=//a[@href='/download']
${username_name}    xpath=//a[@href='/settings/account']
${recently_played_label}    xpath=//*[contains(text(), 'Recently played')]
${upgrade_pro_url}    https://www.spotify.com/ro/purchase/products/
${Page_Title_Account_Overview}    css:.Page__title--TbL6e
${webplayer-left-navbar}    css:.navBar
${top-result-frame}    css:.d56489c83fe6b79db9f89b06371835cf-scss
${play_song_button}    css:.btn.btn-green.false
