#!/bin/bash
echo "TODO"

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
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/i3.config ~/.config/i3/config

# Link polybar
ln -s ~/Dropbox/Projekter/Diverse/dotfiles/polybar.config ~/.config/polybar/config

# Link dunstrc
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/dunstrc /etc/xdg/dunst/dunstrc

# Link i3exit
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/i3exit /usr/bin/i3exit

# Link xmodmap
sudo ln -s ~/Dropbox/Projekter/Diverse/dotfiles/xmodmap ~/.xmodmap 

# Link config files
ln -rs ~/Dropbox/Projekter/Diverse/dotfiles/.config/* ~/.config/

