DISABLE_AUTO_TITLE="true"

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
alias d="cd"

bindkey -v
bindkey -M viins ' i' vi-cmd-mode

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

