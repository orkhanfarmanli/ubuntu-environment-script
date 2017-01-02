#!/bin/bash

# Create a "downloads" folder

mkdir downloads


# Download deb files

wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O downloads/sublime.deb
wget https://atom.io/download/deb -O downloads/atom.deb


# Entering downloads folder and installing everything with a loop

cd downloads

PROGRAMS=$(ls *deb)

for PROGRAM in $PROGRAMS
do
  sudo dpkg -i ${PROGRAM}
done
