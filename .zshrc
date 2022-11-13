export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

autoload -U colors && colors

source ~/config/prompt/git-prompt.zsh/git-prompt.zsh
source ~/config/prompt/git-prompt.zsh/examples/compact.zsh

PROMPT='%F{green}%d%f$(gitprompt) '

alias zsh="vim ~/.zshrc"
alias vi="vim ~/.vimrc"
alias pn="pnpm"
alias t="touch"
alias m="mkdir"
alias l="ls -a"
alias c="clear"
alias r="rm -rf"
alias v="vim"
alias .="cd .."
alias x="vim ."
alias d="cd"
alias bu="brew update"
alias bup="brew upgrade"
alias bd="brew doctor"
alias bc="brew cleanup"
alias ga="git add ."
alias gs="git status"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git checkout"
alias gp="git pull"
alias gpod="git pull origin dev"
alias gcc="git commit"
alias gm="git merge"

#enable vi mode in zsh

bindkey -v
bindkey -M viins ' i' vi-cmd-mode

# Basic auto/tab complete:
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
      [[ $1 = 'block' ]]; then
     echo -ne '\e[2 q'

   elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
     echo -ne '\e[6 q'
   fi
}

zle -N zle-keymap-select

# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[2 q' }

# Start in block mode
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

export KEYTIMEOUT=10
