#!/bin/bash
sudo gpasswd -a $USER input
sudo apt install xdotool wmctrl
sudo apt-get install libinput-tools

cd /tmp/
git clone git@github.com:bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
libinput-gestures-setup autostart


