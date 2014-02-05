# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# enable coloring for grep
export GREP_OPTIONS='--color=auto'

source ~/.bash_aliases
source ~/.bash_prompt

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /etc/bash_completion.d/git ] && source /etc/bash_completion.d/git

# win: run at least the git completion
if [ -e /usr/etc/git-completion.bash ]
then
  source /usr/etc/git-completion.bash
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Make sublime the default editor
export EDITOR="subl"

# enable command line color
export CLICOLOR=1

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
# [ \t]* = suppress history logging by start the command with a space
export HISTIGNORE="[ \t]*:.:ls:ll:la:h.:hf\ *:cls:clear:history*:-:..*:pwd:[bf]g:exit:date"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Add rbenv to the path variable
[[ -s "$HOME/.rbenv/bin" ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

# Add RVM Path and load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && PATH="$PATH:$HOME/.rvm/bin" && source "$HOME/.rvm/scripts/rvm"

# Add nitrous.io auto-parts if existing
[[ -s "$HOME/.parts/autoparts/bin" ]] && export PATH="$HOME/.parts/autoparts/bin:$PATH" && eval "$(parts init -)"

# Start node version manager
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Run additional file if existing
[[ -s "$HOME/.bash_env" ]] && source "$HOME/.bash_env"
