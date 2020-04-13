#!/bin/bash
sudo gpasswd -a $USER input
sudo apt install xdotool wmctrl
sudo apt-get install libinput-tools

cd ~/Repos/libinput-gestures
git pull
sudo make install
libinput-gestures-setup autostart


