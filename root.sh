#!/bin/bash

########################
# Change Debian to SID Branch
########################

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list 

########################
# Update and upgrade system
########################

sudo apt update && sudo apt upgrade -y

########################
# Spotify install
########################

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt upgrade -y

########################
# Install packages
########################

sudo bash installPackages.sh

########################
# Brave browser
########################

sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt upgrade -y
sudo apt install brave-browser -y

########################
# visual studio code
########################

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# sudo apt install apt-transport-https
sudo apt update
sudo apt install code 
# or code-insiders

########################
# Coursor
########################

# git clone https://github.com/keeferrourke/capitaine-cursors.git
# cd capitaine-cursors
# sudo apt install inkscape x11-apps -y
# chmod +x build.sh
# bash build.sh -p -t
# cd ..

########################
# Obsidian 
########################

# bash obsidian.sh

# sddm - lock screen
# psmisc - killall command

########################
# Copy dotfiles
########################

cp -r .config/ ~/

########################
# Oh My Zsh
########################

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

########################
# Oh My Zsh - Powerlevel10K
########################

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

########################
# Oh My Zsh - Plugins
########################

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

########################
# ZSH Config
########################

cp ~/.zshrc ~/.zshrc_bk
cp .zshrc ~/.zshrc

########################
# Enable Desktop Manager 
########################

sudo systemctl start sddm --now
