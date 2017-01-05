#!/bin/bash

# Create a "downloads" folder
mkdir downloads


# Download deb files from list and add them to downloads folder
wget -P downloads --content-disposition -i apps.txt


# Entering downloads folder and installing everything (.deb files) with a loop
cd downloads

PROGRAMS=$(ls *deb)

for PROGRAM in $PROGRAMS
do
  sudo dpkg -i ${PROGRAM}
done

# Install missing dependencies
sudo apt install -y -f


############################################################################################

# Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Plank repository
sudo add-apt-repository -y ppa:ricotz/docky #

# Adapta theme repository
sudo add-apt-repository -y ppa:tista/adapta

############################################################################################


# Custom installations

#Flat-Remix icon theme
cd /tmp
git clone https://github.com/daniruiz/Flat-Remix
mkdir -p ~/.icons
mv "Flat-Remix/Flat Remix" ~/.icons


############################################################################################

# Install important apps from default and added repositories
sudo apt update
sudo apt install -f spotify-client gnome-tweak-tool plank adapta-gtk-theme virtualbox git

############################################################################################


# Updating in case there is any outdated apps
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
