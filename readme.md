# Spotify UI testing
###### The purpose of this readme is to guide a non-technical tester through the setup and running of the automated test suites.

**Requirements:**
For framework and installed package requirements, please check the requirements.txt

**General installation steps:**
_Python:_<br></br>
	Python 3.7.4 was used, as such please proceed to install on your workstation from the following link: <a href= https://www.python.org/downloads/release/python-374/>Python version install </a>

_Robot Framework:_<br></br>
	Robot Framework 3.1.2 was used, as such please proceed to install Robot Framework using the pip install robotframework
	
_Selenium:_<br></br>
	Selenium 3.141 was used, as such please proceed to install selenium using pip install selenium
	
_Chromedriver:_<br></br>
	* Chromedriver 77.0.3865.40 was used. <a href=https://chromedriver.storage.googleapis.com/index.html?path=77.0.3865.40/>Please download chromedriver from this link.</a>
	* **Note:** please download the chromedriver_win32.zip, if you use windows.

_Note:_ A link to how to use the pip install: <a href=https://packaging.python.org/tutorials/installing-packages/#use-pip-for-installing> Use pip for Installing </a>

-------

##Setup steps
###Upon installing the required packages mentioned in the the Requirements section, please follow the steps described below:
#### Creating a Spotify account:
In order to be able to run the test suites found in this git repository, it is neccesary to have a an active Spotify account (premium account is not required).
* Please go to <a href=https://www.spotify.com/>Spotify and create a free account.</a>
* Once you've successfuly created your account, go to your local repository (the folder in which you've cloned the online repo) and open the config folder (\QA_Automation_Spotify\config)
  * In this folder you will find a file called credentials_template.json (the .json part might be hidden). Open this file using a text editor such as Microsoft Notepad or Notepad++.
  * Once credentials_template.json file is open, please enter your username between the empty double quote marks and then proceed in a similar fashion with your password.
  * Save a copy of the credentials_template.json outside the QA_Automation_Spotify folder.
	**Note:** The test suites will not run without valid credentials. These credentials are stored localy and are used exclusively to login to your Spotify account via the automated software testing suite (Selenium + Robot Framework)
  
#### _For running the UI test suites, please ignore the code that partains to the API testing, as this will not currently be covered in this readme._

