#!/bin/bash

if [ "`whoami`" == "root" ]; then
	echo "Please run the script as your normal user, not root."
	echo "You will get asked for root access separately."
	exit 1
fi

echo "This script requires superuser access to install apt packages."
echo "You will be prompted for your password by sudo."

# clear any previous sudo permission
sudo -k

# run inside sudo
sudo sh <<SCRIPT
	# partly copied from https://toolbelt.heroku.com/install-ubuntu.sh

	# add heroku repository to apt
	echo "add heroku repository to apt"
	apt-add-repository -y 'deb http://toolbelt.herokuapp.com/ubuntu ./' > /dev/null

	# install heroku's release key for package verification
	echo "add heroku key to apt"
	wget -q -O- https://toolbelt.heroku.com/apt/release.key | apt-key add - > /dev/null

	# add the repo for sublime-text
	echo "add sublime repository to apt"
	add-apt-repository -y ppa:webupd8team/sublime-text-2 > /dev/null 2>1&
	
	# update sources
	echo "updating apt-get sources"
	apt-get update > /dev/null

	# build-essential is for g++ compiling
	echo "start installing / updating packages"
	apt-get install -y heroku git tig gitg sublime-text build-essential terminator curl mongodb
SCRIPT

# install / upgrade rvm
echo "installing rvm"
curl -s -L get.rvm.io | bash -s stable --auto
. ~/.bash_profile
rvm reload

echo "enable rvm autolibs"
rvm autolibs enable > /dev/null

echo "installing rvm requirements"
rvm requirements > /dev/null

echo "installing ruby 1.9.3"
rvm install 1.9.3

echo "setting up ruby 1.9.3 as default version to use"
rvm use 1.9.3
rvm --default use 1.9.3-p392
rvm rvmrc warning ignore allGemfiles

echo "installing bundler"
gem install bundler
echo "installing rails 3.2.9"
gem install rails -v 3.2.9

echo "We are done, thank you for using our services!"