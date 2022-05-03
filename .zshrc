export ZSH="/Users/juan/.oh-my-zsh"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

ZSH_THEME="simple"

DISABLE_AUTO_TITLE="true"

plugins=(
	git
	vi-mode
)
source $ZSH/oh-my-zsh.sh

alias zsh="vim ~/.zshrc"
alias vi="vim ~/.vimrc"
alias t="touch"
alias m="mkdir"
alias l="ls -a"
alias c="clear"
alias r="rm -rf"
alias v="vim"
alias .=".."
alias x="vim ."

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -M viins ' i' vi-cmd-mode

zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

export KEYTIMEOUT=10
