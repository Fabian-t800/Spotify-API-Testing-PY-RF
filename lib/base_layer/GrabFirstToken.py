from selenium import webdriver
from selenium.webdriver.common import keys
from selenium.common.exceptions import NoSuchElementException
from robot.api import logger
from requests import post
import json


class GrabFirstToken:
    def __init__(self, token_url, env_var_path, credentials):
        self.token_url = token_url
        self.env_var_path = env_var_path
        self.credentials = credentials
        self.username = ""
        self.password = ""

    def read_credentials(self):
        with open(self.credentials, mode='r') as json_file:
            data = json.load(json_file)
            for item in data:
                if item['username'] is not None:
                    self.username = item['username']
                    logger.info('Username found and loaded.')
                if item['password'] is not None:
                    self.password = item['password']
                    logger.info('Password found and loaded.')
                break

    # Quick and dirty: accesses the URL using selenium with chromedriver
    # Returns access code
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

    # Exchanges access code for refresher token
    # TODO: cid_cid - needs to be read from env var json (hardcoding removal)
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

    # Adds the refresher token to the  env var if one isn't already given
    def post_code_to_env_variable(self):
        needs_update = None
        with open(self.env_var_path, mode='r') as json_file:
            data = json.load(json_file)
            env_values = data.get("values")
            for env_value in env_values:
                if env_value['key'] == 'refresh_token':
                    if env_value['value'] == "":
                        env_value['value'] = self.request_new_token()[1]['refresh_token']
                        logger.info("Refresher token has been added to your the environment variables json file.")
                        needs_update = True
                        break
                    else:
                        logger.info("Refresher token was already present in the environment variables json file.")
                        print('Refresher token already present.')
        if needs_update:
            with open(self.env_var_path, mode='w') as json_file:
                json.dump(data, json_file, indent=4)
