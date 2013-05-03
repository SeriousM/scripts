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

### Installing rbenv

```bash
echo "Installing rbenv to ~/.rbenv"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

echo "Installing ruby-build"
git clone git://github.com/sstephenson/ruby-build.git /tmp/ruby-build
cd /tmp/ruby-build
sudo ./install.sh
cd -
rm -rf /tmp/ruby-build

echo "Installing ruby 1.9.3"
rbenv install 1.9.3-p392
echo "setting ruby 1.9.3 as global default"
rbenv global 1.9.3-p392
echo "recreating rbenv shims"
rbenv rehash

echo "updating system gems"
gem update --system
echo "installing gems bundler and rails"
gem install bundler
gem install rails -v 3.2.9

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
echo "installing rails 3.2.9"
gem install rails -v 3.2.9

echo "reload shell"
exec $SHELL -l
```

### Credits
[https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
