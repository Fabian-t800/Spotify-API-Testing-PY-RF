import json
from robot.api import logger


class GetCredentials:

    def __init__(self):
        self.credentials = []

    def read_credentials(self, credentials_path):
        with open(credentials_path, mode='r') as json_file:
            data = json.load(json_file)
            for item in data:
                if item['username'] is not None:
                    self.credentials.append(item['username'])
                    logger.info('Username found and loaded.')
                else:
                    logger.warn('Username not found!')
                if item['password'] is not None:
                    self.credentials.append(item['password'])
                    logger.info('Password found and loaded.')
                else:
                    logger.warn('Password not found!')
                break

            return self.credentials




