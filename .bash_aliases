# important: add 'source ~/.bash_aliases' to .bash_profile eof

alias cls='printf "\033c"'

# partially copied from https://raw.github.com/charliesome/conf/master/config/bash_profile.erb
alias ls="ls -F --color --show-control-chars"
alias la="ls -a"
alias ll="ls -l"
alias glog="git log --color --oneline"
alias gl="glog --graph"
alias gp="git pull"
alias gpom="git push origin master"
alias gpomp="git push origin master;git push origin master:production;"
alias gphm="git push heroku master;"
alias ga="git add"
alias gr="git rm"
alias gc="git commit"
alias gco="git checkout"
alias gcl="git clone"
alias gg="git gui"
alias gundo="git checkout --"
alias gs="git status -s"
alias gcm="git commit -m"
alias gca="git commit -am"
alias gd="git diff --no-prefix"
alias r="rails"
alias hr="heroku run"
alias b="bundle"
alias be="bundle exec"
alias bi="bundle install"
alias rs="exec $SHELL -l"
alias fp="readlink -f"
alias space="df -kh ."

alias rmf="rm -rf"
alias mkd="mkdir"

# http://www.ubuntujourneyman.com/2011/05/24/100/
alias h.="history | grep -E \"^(.* ) \""
alias hf="history | grep -i $1"
alias pf="ps -e | grep -i $1"
alias pk="kill -9"

alias rpry="bundle exec pry -r ./config/environment"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

function mkcd(){
  mkdir $1;
  cd $1;
}