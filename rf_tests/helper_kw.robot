*** Settings ***
Library           ../lib/helper_methods/ArtistEndpointVerifications.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json

*** Keywords ***
Check Get Artist Endpoint
    get_artist_verification

Check Get Artists Related Artists Endpoint
    get_artist_related_artists_verification