from lib.base_layer.ArtistEndpoint import ArtistEndpoint
# from lib.base_layer.RefreshToken import RefreshToken
from robot.api import logger


class ArtistEndpointVerifications:

    def __init__(self, oauth, file_path):
        self.oauth = oauth
        self.file_path = file_path

    def get_artist_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.console("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(f"Expected response was <Response [200]>, instead received {response}\n Body of the response is: {body}")

    def get_artist_related_artists_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.console("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(
                "Expected response was <Response [200]>, instead received " + response + "\n" + "Body of the response is: " + str(
                    body))

#
# auth_token = RefreshToken(
#     "D:\\QA_Automation_Spotify\\config\\Spotify_API_fabian.postman_environment.json").generate_auth_token()
#
# # json_path = path to the environment variables file
# json_path = "D:\\Spotify_repo\\Spotify_Api_Testing\\Spotify_Api_Testing\\Environment " \
#             "Variables\\Spotify_API_fabian.postman_environment.json "
# aev1 = ArtistEndpointVerifications(auth_token, json_path).get_artist_verification()
