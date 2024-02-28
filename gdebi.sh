#!/bin/bash
# Script to install prerequisites for package management on Ubuntu Linux

# Add the 'universe' repository using add-apt-repository
echo -ne '\n' | sudo add-apt-repository universe \

# Update the package index to reflect changes
&& sudo apt-get update \

# Install gdebi-core for handling .deb packages
&& sudo apt-get install gdebi-core -y \

# Install gdebi for a graphical package installer
&& sudo apt-get install gdebi -y
