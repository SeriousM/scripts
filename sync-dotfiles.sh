#!/bin/bash

rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "README.md" --exclude "apt-install.sh" --exclude "sync-dotfiles.sh" --exclude "auth-check.sh" -av . ~