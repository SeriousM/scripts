#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
function doIt() {
  . sync-dotfiles.sh
  . apt-install.sh
  . auth-check.sh
  echo "We are done, thank you for using our services!"
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile

echo "You should open a fresh terminal session."
