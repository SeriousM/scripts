#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
function run() {
  . apt-install.sh
  . auth-check.sh
  if [ "`. sync-files.sh | grep .fonts`" ]; then
    # renew the font cache
    sudo fc-cache -f -v
  fi
  
  echo "We are done, thank you for using our services!"
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	run
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		run
	fi
fi
unset run
source ~/.bash_profile

echo "You should open a fresh terminal session."
