# Spotify UI testing
###### The purpose of this readme is to guide a non-technical tester through the setup and running of the automated test suites.

**Requirements:**
For framework and installed package requirements, please check the requirements.txt

**General installation steps:** <br></br>
* _Python:_<br></br>
	* Python 3.7.4 was used, as such please proceed to install on your workstation from the following link: <a href= https://www.python.org/downloads/release/python-374/>Python version install </a>

* Once you have Python installed, you can proceed to install the requirements by using pip install -r requirements.txt<br></br>
	* In order to successfully install the requirements, it is advised that you follow the steps described below:<br></br>
		* Open command line (cmd): Click the windows button, and type cmd
			* Once the command line is opened, please navigate to the folder where you've cloned the git repository. (or just read the note on cmd navigation below)
			* Once in the folder, run the following command: pip install -r requirements.txt
	
* _Chromedriver:_<br></br>
	* Chromedriver 77.0.3865.40 was used. <a href=https://chromedriver.storage.googleapis.com/index.html?path=77.0.3865.40/> You can download chromedriver from this link.</a>
	* **Note:** please download the chromedriver_win32.zip, if you use windows.
	
* _Chrome version:_ <br></br>
	* All tests have been run on Chrome Version 78.0.3904.87 (Official Build) (64-bit)

* _Windows version:_ <br></br>
	* All tests have been run on Windows 10 Pro

_Note on pip:_ A link to how to use the pip install: <a href=https://packaging.python.org/tutorials/installing-packages/#use-pip-for-installing> Use pip for Installing </a><br></br>
_Note on cmd:_ A link to how to navigate with cmd is found here: <a href=https://stackoverflow.com/questions/5576321/need-to-navigate-to-a-folder-in-command-prompt>Opening CMD in the required folder (First answer)</a>


-------

## Setup steps: <br></br>
### Upon installing the required packages mentioned in the the Requirements section, please follow the steps described below:
###### Creating a Spotify account:
In order to be able to run the test suites found in this git repository, it is neccesary to have a an active Spotify account (premium account is not required).<br></br>
*Please go to <a href=https://www.spotify.com/>Spotify and create a free account.</a><br></br>
* Once you've successfuly created your account, go to your local repository (the folder in which you've cloned the online repo) and open the config folder (\QA_Automation_Spotify\config)<br></br>
  * In this folder you will find a file called credentials_template.json (the .json part might be hidden). Open this file using a text editor such as Microsoft Notepad or Notepad++.<br></br>
  * Once credentials_template.json file is open, please enter your username between the empty double quote marks and then proceed in a similar fashion with your password.<br></br>
  * Save a copy of the credentials_template.json outside the QA_Automation_Spotify folder.<br></br>
	**Note:** The test suites will not run without valid credentials. These credentials are stored localy and are used exclusively to login to your Spotify account via the automated software testing suite (Selenium + Robot Framework)<br></br>
Open Command Line once again and type in ride.py . This should open up a python file.
Click Run
* The RIDE (Robotframework IDE) user interface should open now be open.
	* Within RIDE you'll need to import the test suites:
		* To do this you'll need to Click File\Open Directory\Location of your rf_tests file. This will cause all automated UI test suites as well as the helper keywords will be imported into RIDE.
	* Within RIDE you'll also need to set your Pythonpath to the directory where you've cloned the github repository
		* To do this you have to Click on Tools \ Preferences. When The Preferences window pops up, click on the Importing tab, and there add the your local github clone directory.
Once all these steps have been completed, you shouldw be ready to run the automated test suites.
  32
#### _For running the UI test suites, please ignore the code that partains to the API testing, as this will not currently be covered in this readme!_

## Running the automated test suites
All test suites can be run from the RIDE user interface.
* Click the UI_Testing and all the test suites should be displayed.
* Click any and all the checkboxes for the test suites you'd like to run.
* Once all the desired test suites have been selecte, press F8 (or click the Run button from the toolbar)
* To see a detailed log of the runs, after each run click the Log button from the toolbar (Robotframework saves the runs as HTML files.
* Once you've run the tests for as many times as required as the part of the final teardown process, please delete your credentials from the credentials_template.json file, leaving it blank as it was.