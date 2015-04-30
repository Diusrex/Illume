Illume, by Magpie Rodeo
=========

This is our game for CMPUT 250 at the University of Alberta.

Team
---------
  - Deanna "Denaynay" Dombroski: Producer & Artist  
  - Doug "Penman" Bennett: Lead Designer/Audio Design  
  - Schyler "Schyler" Palm: Writer  
  - Morgan "INT Ninja" Redshaw: Lead Programmer  
  - Stuart "Dingmaster" Bildfell: Programmer  
  - Shuxiao "Trailer Saver" Miao: Programmer  
  - Ellit "Executive Lurker" Colp: Executive Producer  

Voice Actors:  

  - Karisma Kapoor  
  - Anya Palm  
  - Christopher M. Jaillet  
    
Additional Story Credit to Derek Kwan


Playing the Game
=========

Installation
---------
You will first need to have Neverwinter Nights (NWN) installed. It is available on [GOG](http://www.gog.com/game/neverwinter_nights_diamond_edition) for $10, or you can [download it here](https://drive.google.com/file/d/0B8USOqus2_p7SWRkcGZwTURCOEk/view?usp=sharing).

Then, download and extract the zip from github into the Neverwinter Nights directory.

If you want to play anything other than the forest levels, you will need to also download the [CEP hakpaks](https://drive.google.com/open?id=0B1LUiDYaJlGFRV81WUFtcVVMSG8&authuser=0) that we use from google drive, and extract that into the Neverwinter Nights directory.

Everything should now be installed!

Instructions
---------

1. Start NWN, then select "New".
2. Select "Other Modules".
3. Load Illume - Area 1.
4. Select "Use Pre-made Character".
5. Select Susan Donado.
6. Start the game.
7. In-game controls are left-click to move, and F1 to pulse.

WARNING: If you are unable to pulse, then you selected the wrong character



Developing
=========


Adding a new Module
---------

1. Once you have created the module, import the packages you will need from the folder called 'erf'. (To import, go to file->import). Required Packages:

  * MR_audio_log
  * MR_dinger
  * MR_environment
  * MR_step_stones
  * MR_tutorial

2. Add the needed hakpaks to the module, using Edit->Module Properties, tab "Custom Content". Required Hakpaks:

  * MR_dinger
  * MR_models
  * MR_remove_ui
  * MR_sounds
  * JacobysJungle
  * Jungle Creatures
  * Jungle Sound

3. Edit the scripts ran by the Module (under Edit->Module Properties, tab "Events"):
  * OnPlayerChat should use the script 'activate_pulse'

4. Add all of the scripts imported by MR_dinger.erf to the cache (under Edit->Module Properties, tab "Cached Scripts").

5. From the 'localvault' folder, ensure that the character is copied over into the 'localvault' folder in your NWN directory.

NOTE: If you are going to play an already configured module from the repository, you only need to ensure the character and needed hakpaks are in your NWN directory.

Adding a new Area
--------

1. To set up the camera, edit the OnEnter event of the area to use the script 'enter_area'.

2. To disable resting, go to the "Area Properties" tab 'Advanced', and check the option "No Rest"

Intro tutorial
--------

1. To set up the intro tutorial, change the OnEnter event of the area from 'enter_area' to 'tutorial_start'.

Adding a dingable object
--------

There are only two variables that are needed to be added to the object:

1. An int variable named 'can_be_pulsed', with the value 1.

2. A string variable named 'pulse_type', with the value of the pulse effect you want to use. To add a new effect, create a new tag for the effect, then add it into the pulse_effect file.

Organization
---------

- Should add the prefix "MR_" to all files created for this project.

- All modules for our project should be in the modules folder, all hakpaks should be in the hak folder, the character should be in the localvault folder, and the scripts should be exported together by purpose (eg MR_Camera for camera scripts, MR_Dinger for scripts related to the dinger).  

- The purpose of this organization is that then you can just copy all of the contents of this repository into the Neverwinter nights directory and immediately run it.