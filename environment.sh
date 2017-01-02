#!/bin/bash

#Testing sublime text download and install

wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O sublime.deb && dpkg -i sublime.deb
