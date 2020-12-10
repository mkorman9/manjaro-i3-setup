export PATH="$PATH"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/usr/bin/vim"
export NODE_OPTIONS="--experimental-repl-await"

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias ll='ls -lah'
alias ipy="ipython"

compdef -d java

eval "$(pyenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
