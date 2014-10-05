CMPUT-250
=========

All the required files for the project.

Adding a new Module
---------

1. Once you have created the module, import the packages you will need from the folder called 'erf'. (To import, go to file->import). Required Packages:

  * MR_camera
  * MR_ding_objects
  * MR_dinger
  * MR_lantern

2. Add the needed hakpaks to the module, using Edit->Module Properties, tab "Custom Content". Required Hakpaks:

  * MR_dinger
  * MR_remove_ui
  * MR_sounds
  * JacobysJungle
  * Jungle Creatures
  * Jungle Sound

3. Edit the scripts ran by the Module (under Edit->Module Properties, tab "Events"):
  * OnClientEnter should use the script 'enter_module'
  * OnPlayerChat should use the script 'activate_pulse'

4. Add all of the scripts imported by MR_dinger.erf to the cache (under Edit->Module Properties, tab "Cached Scripts").

Intro lantern sequence
--------

1. To set up the intro sequence with the lantern, change the OnClientEnter Module script from 'enter_module' to 'lantern_create'.

2. In the palette on the right side of the toolset, when in an area, click the "Paint Triggers" button, then navigate to Custom->Special->Custom 1
   and place the 'Lantern Death' trigger in the area you would like the player's lantern to die.

Adding a new Area
--------

1. To set up the camera, edit the OnEnter event of the area to use the script 'enter_area'. If this script
   is not available, import the script package 'MR_camera', which should be in the scripts folder.

Adding a dingable object
--------

There are only two variables that are needed to be added to the object:

1. An int variable named 'can_be_pulsed', with the value 1.

2. A string variable named 'pulse_type', with the value of the pulse effect you want to use. To add a new effect, create a new tag for the effect, then add it into the pulse_effect file.

Organization
---------

- Should add the prefix "MR_" to all files created for this project.

- All modules for our project should be in the modules folder, all hakpaks should be in the hak folder, the character should be in the localvault
  folder, and the scripts should be exported together by purpose (eg MR_Camera for camera scripts, MR_Dinger for scripts related to the dinger).  

- The purpose of this organization is that then you can just copy all of the contents of this repository into the Neverwinter nights directory and immediately run it.
