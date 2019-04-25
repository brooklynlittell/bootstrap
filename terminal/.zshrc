# Path to your oh-my-zsh installation.
export ZSH=/Users/brandonlittell/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

plugins=(git)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/brandonlittell/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh

export EDITOR=code

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

function new() { touch "$1" }

alias g='git'
alias gfa='git fetch --all -p'
alias gpa='git branch --merged| egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias dev='cd ~/dev'


