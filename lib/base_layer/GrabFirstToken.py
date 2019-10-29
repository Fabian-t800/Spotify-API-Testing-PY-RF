from selenium import webdriver
from selenium.webdriver.common import keys
from selenium.common.exceptions import NoSuchElementException
from robot.api import logger
from requests import post
import json


class GrabFirstToken:
    password = "Devdev22"
    username = "winterlord22"

    def __init__(self, token_url, env_var_path, username="", password=""):
        self.token_url = token_url
        self.env_var_path = env_var_path

    def access_url(self):
        driver = webdriver.Chrome("chromedriver")
        driver.get(self.token_url)
        driver.implicitly_wait(2)
        login_field = driver.find_element_by_id("login-username")
        login_field.send_keys(self.username)
        login_password = driver.find_element_by_id("login-password")
        login_password.send_keys(self.password)
        login_password.send_keys(keys.Keys.RETURN)
        try:
            auth_approve_button = driver.find_element_by_id("auth-accept")
            auth_approve_button.click()
        except NoSuchElementException:
            logger.info("Authorization was already done for the first time.")
        finally:
            return driver.current_url

    def request_new_token(self):
        raw_code = self.access_url()
        code = raw_code[48:]
        cid_cis = "Yzg3OThhNTJkMGNmNDkwNzk4ZTU0Yjg3OTBjNDMxYmE6NzZmYjdkNzE4MTEyNGE0ZGJkNjE5MzU4ZjI2NTllN2Y="
        access_point_url = "https://accounts.spotify.com/api/token"
        headers = {
            'Authorization': 'Basic ' + cid_cis,
            'Content-Type': "application/x-www-form-urlencoded",
            'cache-control': "no-cache",
        }
        querystring = {"grant_type": "authorization_code",
                       "code": code,
                       "redirect_uri": "https://www.getpostman.com/oauth2/callback"}
        response = post(access_point_url, querystring, headers=headers)
        return response, response.json()

    def post_code_to_env_variable(self):
        with open(self.env_var_path, mode='r+') as json_file:
            data = json.load(json_file)
            env_values = data.get("values")
            for env_value in env_values:
                if env_value['key'] == 'refresh_token':
                    if env_value['value'] == "":
                        json_file.seek(54)
                        json_file.write(self.request_new_token()[1]['refresh_token'])
                        print(self.request_new_token()[1]['refresh_token'])
                        logger.info("Refresher token has been added to your the environment variables json file.")
                    else:
                        logger.info("Refresher token was already present in the environment variables json file.")
                        print('Refresher token already present.')








env_var_path = "D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment Variables\\Spotify_API_fabian.postman_environment.json"
pl = GrabFirstToken("https://accounts.spotify.com/authorize?client_id=c8798a52d0cf490798e54b8790c431ba&response_type"
                    "=code&redirect_uri=https://www.getpostman.com/oauth2/callback&scope=playlist-read-collaborative"
                    "%20playlist-modify-private%20playlist-modify-public%20playlist-read-private%20user-modify"
                    "-playback-state%20user-read-currently-playing%20user-read-playback-state%20user-read-private"
                    "%20user-read-email%20user-library-modify%20user-library-read%20user-follow-modify%20user-follow"
                    "-read%20user-read-recently-played%20user-top-read%20streaming%20app-remote-control",
                    env_var_path).post_code_to_env_variable()
print(pl)
