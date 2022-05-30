#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 

sudo apt install vim kitty awesome fonts-roboto psmisc sddm lxappearance papirus-icon-theme nautilus qt5-style-plugins materia-gtk-theme -y


# brave browser
sudo apt install apt-transport-https curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install brave-browser -y

sudo echo -e "XDG_CURRENT_DESKTOP=Unity\nQT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment

bash obsidian.sh




# sddm - lock screen
# psmisc - killall command
