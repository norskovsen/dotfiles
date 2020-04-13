#!/bin/bash
printf "Updating system"
sudo apt update -y
sudo apt upgrade -y

printf "\n Adding ppas"
sudo add-apt-repository ppa:agornostal/ulauncher
sudo add-apt-repository ppa:numix/ppa

# ppa for vs-code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# ppa for spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

printf "\nInstalling packages"
sudo apt install -y vim \
                    emacs \
                    dropbox \
                    redlight \
                    make \
                    git \
                    curl \
                    python3-pip \
                    tilix \
                    steam \
                    xfce4-power-manager \
                    xfce4-volumed \
                    xfce4-clipman \
                    xfce4-notifyd \
                    xfce-settings \
                    xfce4-pulseaudio-plugin \
                    wget \
                    volumeicon-alsa \
                    nitrogen \
                    blueman \
                    redshift \
                    redshift-gtk \
                    unclutter \
                    dunst \
                    deepin-screenshot \
                    playerctl \
                    gnome-pomodoro \
                    ulauncher \
                    arc-theme \
                    numix-icon-theme-circle \
                    lxappearance \
                    gnome-screensaver \
                    code \
                    apt-transport-https \
                    autorandr \
                    spotify-client \
                    fish

printf "\nInstalling snap packages"
sudo snap install android-studio --classic \
                  caprine \
                  clion --classic \
                  emoj \
                  intellij-idea-ultimate --classic --edge \
                  postman \
                  pycharm-professional --classic \
                  slack \
                  youtube-dl \
                  termdown \
                  mathpix-snipping-tool

printf "\nInstalling pip packages"
# TODO

printf "\nInstalling debs"
cd Downloads

wget -O mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
sudo dpkg -i mailspring.deb

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb

wget -O zoom.deb "https://zoom.us/client/latest/zoom_amd64.deb"
sudo dpkg -i zoom.deb 

wget -O google-chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome.deb

printf "\nfish setup"
curl -L https://get.oh-my.fish | fish
omf install z

printf "\nConfiguring"

echo "export EDITOR='nvim" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "exec fish" >> ~/.bashrc

sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper

dropbox start & disown

# Enable wakeup on USB
sudo cp rc.local /etc/
