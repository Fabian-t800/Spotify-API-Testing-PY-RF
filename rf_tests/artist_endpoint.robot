*** Settings ***
Resource          helper_kw.robot    # Library    ../lib/base_layer/ArtistEndpoint.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json

*** Test Cases ***
Get Artist
    ${resp}=    ArtistEndpoint.get_artists
    LOG    ${resp}    WARN

Check Get Artist Endpoint
    Check Get Artist Endpoint

Get Related artists
    ${resp1}=    get_artist_related_artists
    LOG    ${resp1}    WARN

Get Artist Albums
    ${resp}    get_artist_albums
    LOG    ${resp}    WARN

*** Keywords ***
