#!/bin/bash
sudo apt install -y libx11-dev \
                    libxcomposite-dev \
                    libxdamage-dev \
                    libxfixes-dev \
                    libxext-dev \
                    libxrender-dev \
                    libxrandr-dev \
                    libxinerama-dev \
                    pkg-config \
                    make \
                    x11proto-dev \
                    x11-utils \
                    libpcre++-dev \
                    libconfig-dev \
                    libdrm-dev \
                    libgl-dev \
                    libdbus-1-dev \
                    asciidoc

cd ~/Repos/compton/
git pull
make
make docs
sudo make install
