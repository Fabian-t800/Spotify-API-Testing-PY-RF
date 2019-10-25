*** Settings ***
Resource          helper_kw.robot    # Library    ../lib/base_layer/ArtistEndpoint.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json

*** Test Cases ***
Check Get Artist Endpoints
    Check Endpoint Get Artist

Check artists related artists endpoint
    Check Endpoint Get Artists Related Artists

Check Get Artists Several Albums Endpoint
    Check Endpoint Get Artists Several Albums

Check Get Artists Top Tracks Endpoint
    Check Endpoint Get Artists Top Tracks

Check Get Several Artists Endpoint
    Check Endpoint Get Several Artists

*** Keywords ***
