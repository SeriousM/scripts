# Bernhard’s dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/scripts`, with `~/scripts` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/SeriousM/scripts.git && cd scripts && set -- -f && source bootstrap.sh ; . apt-install.sh ; cd .. ; rm -rf scripts
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
cd; curl -#L https://github.com/SeriousM/scripts/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
```

To update later on, just run that command again.

### Credits
[https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
