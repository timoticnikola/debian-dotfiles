#!/bin/bash

mkdir install
cd install
curl -L -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -o -E "https://(.*)_amd64.deb"
URL=$(curl -L -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -o -E "https://(.*)_amd64.deb")
NAME=$(curl -L -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -o -E -m 1 "obsidian_(.*)_amd64.deb")

curl -OL $URL
sudo dpkg -i $NAME
sudo apt -f install -y

cd .. 
cp -r .config/ ~/.config
