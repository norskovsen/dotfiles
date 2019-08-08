#!/bin/bash
echo "TODO"

# Link repos
ln -s ~/Dropbox/Repos ~/Repos

# Link documents
sudo rm -rf ~/Documents
ln -s ~/Dropbox/Dokumenter ~/Documents

# Link pictures
sudo rm -rf ~/Pictures
ln -s ~/Dropbox/Billeder ~/Pictures

# Link emacs
ln -s ~/Dropbox/Dokumenter/Backup/.emacs.d ~/.emacs.d

# Link vim
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/.vimrc ~/.vimrc

# Link i3
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/i3.config ~/.config/i3/config

# Link polybar
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/polybar.config ~/.config/polybar/config

# Link compton
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/compton.conf ~/.config/compton.conf

# Link dunstrc
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/dunstrc /etc/xdg/dunst/dunstrc

# Link gestures
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/libinput-gestures.conf ~/.config/libinput-gestures.conf

# Link i3exit
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/i3exit /usr/bin/i3exit

# Link blurlock
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/blurlock /usr/bin/blurlock

# Link xmodmap
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/xmodmap ~/.xmodmap 

# Install programs
# TODO

## Install i3-gaps
## Install polybar
## Install betterlockscreen
