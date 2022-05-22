# Welcome to Duke Nukem Forever 2001 Leak Repository #

This repository has multiple aims:

- Reduce fragmentation by combining the various efforts of the Duke Community to fix and improve the game.
- Assembling documentation of the game, its sources, unused content, and share general knowledge of DNF and the Unreal Engine.
- Getting DNF compiling on modern toolsets, such as Visual Studio Community 2022

# The Content #

As you might have noticed, this version has different folders compared to its original leak, that can be found at https://archive.org/details/duke-nukem-forever-2001-leak . 

The Stable folder was originally the "October 26" folder, that has been patched with the MegaPatch and the dnGame.u file re-enabled inside System thanks to Zombie (you can find the thread here https://forums.duke4.net/topic/12013-leaked-duke-nukem-forever-2001/ ).

# How To Run It #

After cloning the repo, you **must** run `REBUILD.bat` at least once to compile the base game assets.
This is by design, as it made no sense to store the `.u` binaries.

Afterwards, to run the game, you can either run `DNF2001_Stable.bat` or simply find DukeForever.exe in Stable/System.

`#FULLBUILD.bat` is a development convenience tool that runs `REBUILD.bat` to compile assets, then automatically starts the game.

You can change the game's resolution in DukeForever.ini under Stable/Players. There is a launcher being made to streamline this process.


# Contibuting #
If you wish to contribute to this repo, make a fork of it (the button is in the upper-right in Gitea). When you wish to submit your changes, create a branch in your fork, then make a merge request.

If the main repository gets updated before you can submit your changes, you can merge those updates into your fork by doing the following:
```
# run this command once.
git remote add upstream https://shadowmavericks.com:3000/DNF-2001-Restoration-Team/DNF2001.git
# Then every time you want to update
git pull upstream main
```

If you run into the following when trying to clone the main repo, or your fork:
```
fatal: An error occurred while sending the request.
fatal: The request was aborted: Could not create SSL/TLS secure channel.
```
Add your username and password between `https://` and the rest of your remote URL.
Example for the main repo:
```
git clone https://myusername:mypassword@shadowmavericks.com:3000/DNF-2001-Restoration-Team/DNF2001.git
```

## Note on line endings ##
Some files in the project require crlf line endings.

If you're on Windows, this is probably the default and you don't need to do anything.
If you're using Linux/Mac, you will need to turn on git autocrlf.

You can do so by setting `core.autocrlf = true` in the git config.
You can add it inside the local `.git/config` in your repository.


```
[core]
autocrlf = true
```

If you already checked out the files, you will need to check them out again.
One way is to delete all files in your working tree, and check out everything again
with `git checkout .`.

## Note for anyone who wants to modify textures and/or sounds ##
DukeEd.exe only partially loads .dtx and .dfx files on launch, causing you to lose half your textures/sounds if you save them in this state! Make sure to go to File -> Open -> yourpackage before making modifications to any texture or sound packages!

# Authors #

- Yasha: Project Management
- thedarnowl: Project Management
- StrikerTheHedgefox: Repo Admin, Programmer
- Zombie: Repo Admin, Programmer
- Green: Repo Admin
- Xinerki: Repo Maintainer, Lead Programmer
- Ozymandias81: Created repo I forked this from, and wrote most of this README.MD.
- BFG9000: Other minor wrapper attempts (D3D8-9)
- meowsandstuff: Lead Audio Director, Music Production, Programmer, Voice Actor, Level Design, Script/Story
- Ch0wW: Programming
- hogsy: Programming

# EOF #

DNF 2001 Community Discord: https://discord.gg/ZxaexEwgSv

==> ALWAYS BET ON THE DUKE COMMUNITY <==