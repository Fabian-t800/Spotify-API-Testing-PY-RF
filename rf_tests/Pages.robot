*** Keywords ***
Login Page
    ${url}=    set variable    https://accounts.spotify.com/en/login/?_locale=en-RO&continue=https:%2F%2Fwww.spotify.com%2Fro%2Faccount%2Foverview%2F

Homepage
    ${url}=    set variable    https://www.spotify.com

Upgrade Page
    Returning
    ${url}=    set variable    https://www.spotify.com/ro/purchase/products/
