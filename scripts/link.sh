#!/bin/bash
DOTFILE_PATH=~/Dropbox/Projekter/Diverse/dotfiles/

ln -s ~/Dropbox/Repos ~/Repos
ln -s ~/Dropbox/Diverse ~/Diverse

sudo rm -rf ~/Documents
ln -s ~/Dropbox/Dokumenter ~/Documents

# Link pictures
sudo rm -rf ~/Pictures
ln -s ~/Dropbox/Billeder ~/Pictures

# Link i3
mkdir -p ~/.config/i3/config
rm ~/.config/i3/config
ln -s ${DOTFILE_PATH}i3.config ~/.config/i3/config

# Link polybar
mkdir -p ~/.config/polybar/config
rm ~/.config/polybar/config
ln -s ${DOTFILE_PATH}polybar.config ~/.config/polybar/config

# Link dunstrc
sudo rm /etc/xdg/dunst/dunstrc
sudo ln -s ${DOTFILE_PATH}dunstrc /etc/xdg/dunst/dunstrc

# Link i3exit
sudo ln -s ${DOTFILE_PATH}i3exit /usr/bin/i3exit

# Link xmodmap
sudo ln -s ${DOTFILE_PATH}xmodmap ~/.xmodmap 

# Link config files
ln -rs ${DOTFILE_PATH}.config/* ~/.config/
