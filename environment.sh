#!/bin/bash

# Create a "downloads" folder

mkdir downloads


# Download deb files

wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O downloads/sublime.deb
wget https://atom.io/download/deb -O downloads/atom.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.3.4-amd64.deb -P downloads/slack.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O downloads/chrome.deb

# Entering downloads folder and installing everything with a loop

cd downloads

PROGRAMS=$(ls *deb)

for PROGRAM in $PROGRAMS
do
  sudo dpkg -i ${PROGRAM}
done


# Installing apps  from repositories
sudo apt update


############################################################################################

# Add the Spotify repository signing key to be able to verify downloaded packages #
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Plank repository
sudo add-apt-repository ppa:ricotz/docky #

# Adapta theme repository
sudo add-apt-repository ppa:tista/adapta

############################################################################################

# Update repositories
sudo apt update

# 4. Install Spotify
sudo apt install -y spotify-client gnome-tweak-tool plank adapta-gtk-theme virtualbox
