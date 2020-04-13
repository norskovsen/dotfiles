#!/bin/bash
DOTFILE_PATH="~/Dropbox/Projekter/Diverse/dotfiles/"
echo "Linking files"

ln -s ~/Dropbox/Repos ~/Repos
ln -s ~/Dropbox/Diverse ~/Diverse

# Link documents
sudo rm -rf ~/Documents
ln -s ~/Dropbox/Dokumenter ~/Documents

# Link pictures
sudo rm -rf ~/Pictures
ln -s ~/Dropbox/Billeder ~/Pictures

# Link emacs
ln -s ~/Dropbox/Dokumenter/Backup/.emacs.d ~/.emacs.d

# Link i3
ln -s ${DOTFILE_PATH}i3.config ~/.config/i3/config

# Link polybar
ln -s ${DOTFILE_PATH}polybar.config ~/.config/polybar/config

# Link dunstrc
sudo ln -s ${DOTFILE_PATH}dunstrc /etc/xdg/dunst/dunstrc

# Link i3exit
sudo ln -s ${DOTFILE_PATH}i3exit /usr/bin/i3exit

# Link xmodmap
sudo ln -s ${DOTFILE_PATH}xmodmap ~/.xmodmap 

# Link config files
ln -rs ${DOTFILE_PATH}.config/* ~/.config/

echo "\nCompile programs from source"
for f in ${DOTFILE_PATH}scripts/installers/*
do
    echo "Running "${f}
    $f
done
