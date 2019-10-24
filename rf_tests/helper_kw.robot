*** Settings ***
Library           ../lib/helper_methods/ArtistEndpointVerifications.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json

*** Keywords ***
Check Get Artist Endpoint
    ${resp11}=    get_artist_verification
    Set Global Variable    ${resp11}
    LOG    ${resp11}
