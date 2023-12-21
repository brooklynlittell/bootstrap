# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"

plugins=(git colorize brew)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

source $ZSH/oh-my-zsh.sh

export EDITOR="code"
export GODOT="/Applications/Godot.app/Contents/MacOS/Godot"

export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Disable analytics
export DOTNET_ROOT="/usr/local/share/dotnet"
# Add the .NET SDK to the system paths so we can use the `dotnet` tool.
export PATH="/usr/local/share/dotnet:$PATH"
export PATH="/usr/local/share/dotnet/sdk:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
# Run this if you ever run into errors while doing a `dotnet restore`
alias nugetclean="dotnet nuget locals --clear all"

ZSH_THEME_GIT_PROMPT_SUFFIX=") "
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%}> ' # $(git_super_status)'
RPROMPT=''

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
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
