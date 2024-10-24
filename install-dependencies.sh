#!/bin/bash

# Setup dependencies
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
echo "# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi" | tee -a ~/.profile | tee -a ~/.bashrc
sudo apt-get -y install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev lib32ncurses5-dev libncurses5 libncurses5-dev python3 python-is-python3
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi" | tee -a ~/.profile | tee -a ~/.bashrc
source ~/.profile
git config --global user.email "mw195161@gmail.com"
git config --global user.name "matthew Witherell"
git config --global trailer.changeid.key "Change-Id"
