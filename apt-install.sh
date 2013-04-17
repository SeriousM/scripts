#!/bin/bash

if [ "`whoami`" == "root" ]; then
	echo "Please run the script as your normal user, not root."
	echo "You will get asked for root access separately."
	exit 1
fi

# add the repo for sublime-text
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo apt-get update

# build-essential for g++ compiling
sudo apt-get install -y sublime-text build-essential terminator curl

# install / upgrade rvm
curl -L get.rvm.io | bash -s stable --auto
. ~/.bash_profile

rvm autolibs enable
rvm requirements

rvm install 1.9.3
rvm use 1.9.3
rvm --default use 1.9.3-p392
rvm rvmrc warning ignore allGemfiles

gem install bundler
gem install rails -v 3.2.9

echo "Done"
