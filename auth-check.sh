#!/bin/bash

# ssh
if [ -s ~/.ssh/id_rsa.pub ]; then
	echo "ssh key found!"
else
	echo "No ssh key found, generating:"
	ssh-keygen
fi

# heroku
if [ -s ~/.netrc ]; then
	echo "Heroku login found!"
else
	echo "No heroku login foundm generating:"
	heroku keys:add
fi