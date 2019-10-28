from lib.base_layer.ArtistEndpoint import ArtistEndpoint
from robot.api import logger
from jsonschema import validate
import json


class ArtistEndpointVerifications:

    def __init__(self, oauth, file_path, json_schema_path=""):
        self.oauth = oauth
        self.file_path = file_path
        self.json_schema_path = json_schema_path

    def json_schema_validation(self, resp_body):
        if self.json_schema_path != "":
            with open(self.json_schema_path) as json_file:
                json_schema = json.load(json_file)
                validate(resp_body, json_schema)
        else:
            return "JSON schema empty. No validation is required."

    def get_artist_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        print(self.json_schema_validation(body))
        if response == "<Response [200]>" and body is not None:
            self.json_schema_validation(body)
            logger.info("Response is correct <Response [200]>, body of the response is not empty.")
        else:
            raise AssertionError(f"Expected response was, instead received {response}\n Body of the response is: {body}")

    def get_artist_related_artists_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.info("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(f"Expected response was <Response [200]>, instead received  response {response}\n Body of the response is: {body}")

    def get_artist_album_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.info("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(f"Expected response was <Response [200]>, instead received  response {response}\n Body of the response is: {body}")

    def get_artists_top_tracks_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.info("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(
                f"Expected response was <Response [200]>, instead received  response {response}\n Body of the response is: {body}")

    def get_several_artists_verification(self):
        response = str(ArtistEndpoint(self.oauth, self.file_path).get_artists()[0])
        body = ArtistEndpoint(self.oauth, self.file_path).get_artists()[1]
        if response == "<Response [200]>" and body is not None:
            logger.info("Response is correct(Response 200), body of the response is not empty.")
        else:
            raise AssertionError(
                f"Expected response was <Response [200]>, instead received  response {response}\n Body of the response is: {body}")

