export PATH="$PATH:$HOME/scripts"
export NODE_OPTIONS="--experimental-repl-await"
export ZSH="/home/michal/.oh-my-zsh"
export EDITOR="/usr/bin/vim"

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias ll='ls -lah'
alias ipy="ipython"
alias py="source pyutil"

compdef -d java

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
