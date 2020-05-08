#!/bin/bash
sudo apt install git nitrogen rofi python-pip binutils gcc make pkg-config fakeroot cmake python-xcbgen xcb-proto libxcb-ewmh-dev wireless-tools libiw-dev libasound2-dev libpulse-dev libcurl4-openssl-dev libmpdclient-dev libjsoncpp-dev libxcb-composite0-dev -y

cd /tmp/
git clone https://github.com/jaagr/polybar
# shellcheck disable=SC2164
cd polybar
# shellcheck disable=SC2164
USE_GCC=ON ENABLE_I3=ON ENABLE_ALSA=ON ENABLE_PULSEAUDIO=ON ENABLE_NETWORK=ON ENABLE_MPD=ON ENABLE_CURL=ON ENABLE_IPC_MSG=ON INSTALL=OFF INSTALL_CONF=OFF ./build.sh -f
# shellcheck disable=SC2164
cd build
sudo make install
sudo make userconfig
cd ../..
rm -fr polybar
