#!/bin/bash

# Install packages
echo "Installing packages"
sudo apt install vim \
                 emacs \
                 dropbox \
                 redlight \
                 make \
                 git \
                 python3-pip \
                 tilix \
                 steam


# Installing snap packages
sudo snap install android-studio --classic \
                  caprine \
                  clion --classic \
                  emoj \
                  intellij-idea-ultimate --classic --edge \
                  postman \
                  pycharm-professional --classic \
                  slack \
                  spotify \
                  youtube-dl


echo "Starting dropbox" 
dropbox start & disown


# Set tilix som default
# TODO

# Enable wakeup on USB
sudo cp rc.local /etc/


echo "TODO finish"
