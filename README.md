# SeriousM’s dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/scripts`, with `~/scripts` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/SeriousM/scripts.git && cd scripts && set -- -f && source bootstrap.sh ; cd .. ; rm -rf scripts
```

To update, `cd` into your local `scripts` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/SeriousM/scripts/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,apt-install.sh,sync-files.sh,auth-check.sh}
```

To update later on, just run that command again.

### File-Sync only

```bash
. sync-files.sh
```

### Extending the default script

It's not recomended to change the schripts because they get overwritten with the next update.
Modifying the `.bash_env` file is a better way to add custom scripts.

### Installing rbenv

```bash
echo "Installing rbenv to ~/.rbenv"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

echo "Installing ruby-build"
git clone git://github.com/sstephenson/ruby-build.git /tmp/ruby-build
cd /tmp/ruby-build

sudo ./install.sh
# export PREFIX=~ && ./install.sh # use this if you cannot sudo

cd -
rm -rf /tmp/ruby-build

echo "Installing ruby 2.1.0"
rbenv install 2.1.0
echo "setting ruby 2.1.0 as global default"
rbenv global 2.1.0
echo "recreating rbenv shims"
rbenv rehash

echo "updating system gems"
gem update --system
echo "installing gems bundler and rails"
gem install bundler
gem install rails

echo "reload shell"
exec $SHELL -l
```

### Uninstalling RVM
```bash
echo "yes" | rvm implode
sudo rm -rf ~/.rvm
sudo rm -rf ~/.rvmrc
sudo rm -rf /etc/rvmrc
```

### Installing RVM

```bash
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
echo "installing rails 3.2.13"
gem install rails -v 3.2.13

echo "reload shell"
exec $SHELL -l
```

### TMUX

[Crash Course](http://robots.thoughtbot.com/a-tmux-crash-course), [dotFiles](https://github.com/fatih/dotfiles/blob/master/tmuxconf)

### [TMUX && Koding.com](https://koding.com/Activity/keeping-your-shell-session-alive-with-tmux)

Install tmux:
```bash
sudo apt-get install tmux
```
Write in `~/.tmux.conf` (ctrl-n will be the tmux prefix, as ctrl-b conflicts with koding's screen session. See the tmux manual pages to understand how to use the prefix command.):
```bash
set-option -g prefix C-n
new-session
```
In the end of `~/.bashrc` or `~/.bash_env`:
```bash
if which tmux 2>&1 >/dev/null; then
    [[ ( $TERM == "screen" ) && ( -z $TMUX ) ]] && tmux attach \
    && echo '+---------------------------+' \
    && echo '| The tmux prefix is ctrl-n |' \
    && echo '+---------------------------+' \
    && exit
fi
```
Now, you can close your terminal window, it comes back when you reopen it within 15 minutes. The session remains alive during 15 minutes, until koding shuts down your VM. I wish they hibernated it instead.

### Credits
[https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
