*** Settings ***
Resource          helper_kw.robot    # Library    ../lib/base_layer/ArtistEndpoint.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json

*** Test Cases ***
Check Get Artist Endpoints
    Check Get Artist Endpoint

Check artists related artists endpoint
    Check Get Artists Related Artists Endpoint



*** Keywords ***
