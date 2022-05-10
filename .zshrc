
PROMPT=" %F{green}%d..%f "

alias zsh="vim ~/.zshrc"
alias vi="vim ~/.vimrc"
alias t="touch"
alias m="mkdir"
alias l="ls -a"
alias c="clear"
alias r="rm -rf"
alias v="vim"
alias .="cd .."
alias x="vim ."
alias d="cd"

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
 
