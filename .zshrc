# Path to your oh-my-zsh installation.
export ZSH="/home/avi/.oh-my-zsh"
export EDITOR="micro"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# custom aliases
alias yay="paru"
alias ed="micro" # some editor


# git
alias gada="git add --all"
alias gcmm="git commit -m \""
alias gpus="git push"
alias gpul="git pull"
alias gsts="git status"
alias gbrc="git branch"

# system
alias goodnight="systemctl suspend"
alias ls="exa -F --group-directories-first --git --git-ignore" # regular ls
alias lst="exa -T -F --group-directories-first --git --git-ignore" # show as tree
alias lsa="exa -F --group-directories-first --git -a" # show all files
alias spd="systemctl restart --user spotifyd"

# vim
alias vim="nvim"

eval "$(starship init zsh)"

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

#startx
