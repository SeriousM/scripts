#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/."

rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "README.md" --exclude "apt-install.sh" --exclude "sync-files.sh" --exclude "auth-check.sh" -av $DIR ~