#!/bin/bash

#This script installs the environment required for all Intensivate projects.
#It is generally the first thing run after creating a new VM, according to the Intensivate standard
#For directions on setting up the standard Intensivate VM, see the wiki:
#https://github.com/Intensivate/learning-journey/wiki/Chisel-Environment

##########################################################
# Install the needed packages.
##########################################################
sudo aptitude --assume-yes install gcc-multilib
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install g++
sudo apt-get --assume-yes install makeinfo
sudo apt-get --assume-yes install default-jdk
sudo apt-get --assume-yes install texinfo
sudo apt-get --assume-yes install gtkwave
sudo apt-get --assume-yes install autoconf
sudo apt-get --assume-yes install scala
sudo apt-get --assume-yes install libz-dev
sudo apt-get --assume-yes install automake autotools-dev curl
sudo apt-get --assume-yes install libmpc-dev libmpfr-dev libgmp-dev
sudo apt-get --assume-yes install gawk build-essential bison flex gperf
wget https://dl.bintray.com/sbt/debian/sbt-0.13.12.deb
sudo dpkg -i sbt-0.13.12.deb
sudo apt-get update
sudo apt-get --assume-yes install sbt
sudo apt-get --assume-yes install libncurses5-dev libusb-1.0-0 libboost-dev swig
sudo apt-get --assume-yes install libtool libreadline6 libreadline6-dev libelf-dev python-dev xterm
sudo apt-get --assume-yes install device-tree-compiler patchutils bc zlib1g-dev
sudo apt-get --assume-yes install libusb-1.0-0-dev

rm -rf sbt-0.13.12.deb

# Replace git:// by https:// to avoid any proxy issues.
git config --global url."https://".insteadOf git://
