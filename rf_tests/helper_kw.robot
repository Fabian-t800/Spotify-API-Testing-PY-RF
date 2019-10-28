*** Settings ***
Library           ../lib/helper_methods/ArtistEndpointVerifications.py    ${oauth_token}    D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json    D:\\QA_Automation_Spotify\\test_data\\schema.json

*** Keywords ***
Check Endpoint Get Artist
    get_artist_verification

Check Endpoint Get Artists Related Artists
    get_artist_related_artists_verification

Check Endpoint Get Artists Several Albums
    get_artist_album_verification

Check Endpoint Get Artists Top Tracks
    get_artists_top_tracks_verification

Check Endpoint Get Several Artists
    get_artists_top_tracks_verification
