#!/bin/bash
printf "Updating system\n"
sudo apt update -y
sudo apt upgrade -y

printf "\nAdding ppas\n"
sudo apt install -f curl
sudo add-apt-repository ppa:agornostal/ulauncher
sudo add-apt-repository ppa:numix/ppa

# ppa for vs-code

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# ppa for spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

printf "\nInstalling packages\n"
sudo apt install -y vim \
                    emacs \
                    neovim \
                    make \
                    git \
                    curl \
                    python3-pip \
                    kitty \
                    steam \
                    xfce4-power-manager \
                    xfce4-volumed \
                    xfce4-clipman \
                    xfce4-notifyd \
                    xfce4-settings \
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
                    gnome-shell-pomodoro \
                    ulauncher \
                    arc-theme \
                    numix-icon-theme-circle \
                    lxappearance \
                    gnome-screensaver \
                    apt-transport-https \
                    autorandr \
                    spotify-client \
                    fish \
                    zathura \
                    texlive-full \
		    gnome-tweak-tool \
		    chrome-gnome-shell \
		    ranger \
		    fonts-powerline \
		    ispell \
		    aspell-da \
                    suckless-tools \
                    htop \
                    mplayer \
                    compton \
                    golang \
                    npm \
                    ipython3 \
                    flake8 \
                    neofetch \
                    screenfetch \
                    arandr

printf "\nInstalling snap packages\n"
sudo snap install android-studio --classic 
sudo snap install caprine 
sudo snap install clion --classic 
sudo snap install emoj 
sudo snap install intellij-idea-ultimate --classic --edge 
sudo snap install postman 
sudo snap install pycharm-professional --classic 
sudo snap install slack 
sudo snap install youtube-dl 
sudo snap install termdown 
sudo snap install mathpix-snipping-tool

printf "\nInstalling pip packages\n"
# TODO

printf "\nInstalling debs\n"
cd ~/Downloads

wget -O mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
sudo dpkg -i mailspring.deb

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb

wget -O zoom.deb "https://zoom.us/client/latest/zoom_amd64.deb"
sudo dpkg -i zoom.deb 

wget -O google-chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome.deb

wget -O dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb"
sudo dpkg -i dropbox.deb

sudo apt install -f -y

printf "\nfish setup\n"
curl -L https://get.oh-my.fish | fish
echo "omf install z" | fish
echo "omf install agnoster" | fish

printf "\nConfiguring\n"
echo "export EDITOR='nvim'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "exec fish" >> ~/.bashrc

sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper

dropbox start & disown

# Enable wakeup on USB
sudo cp rc.local /etc/
