*** Settings ***
Library           ../../../../QA_Automation_Spotify/lib/base_layer/RefreshToken.py    ../../../../QA_Automation_Spotify/config/Spotify_API_fabian.postman_environment.json
Suite Setup  Obtain token
*** Keywords ***
Obtain token
    ${oauth_token}=    RefreshToken.generate_auth_token
    Set Global Variable    ${oauth_token}
