#!/bin/bash

# Create a "downloads" folder
mkdir downloads


# Download deb files
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O downloads/sublime.deb
wget https://atom.io/download/deb -O downloads/atom.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.3.4-amd64.deb -O downloads/slack.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O downloads/chrome.deb
wget https://github.com/Thomas101/wmail/releases/download/v2.0.0/WMail_2_0_0_linux_x86_64.deb -O downloads/wmail.deb
wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb -O downloads/wps.deb


# Entering downloads folder and installing everything (.deb files) with a loop
cd downloads

PROGRAMS=$(ls *deb)

for PROGRAM in $PROGRAMS
do
  sudo dpkg -i ${PROGRAM}
done


############################################################################################

# Installing apps  from repositories
sudo apt update

# Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Plank repository
sudo add-apt-repository -y ppa:ricotz/docky #

# Adapta theme repository
sudo add-apt-repository -y ppa:tista/adapta

# Update
sudo apt update


############################################################################################


# 4. Install Spotify
sudo apt install -y -f spotify-client gnome-tweak-tool plank adapta-gtk-theme virtualbox git-core


# In case packages are old, upgrade
sudo apt update
sudo apt upgrade
sudo apt autoremove


############################################################################################

# Custom installations

#Flat-Remix icon theme

cd /tmp
git clone https://github.com/daniruiz/Flat-Remix
mkdir -p ~/.icons
mv "Flat-Remix/Flat Remix" ~/.icons
