export PATH="/usr/local/opt/php@8.1/bin:$PATH"
export PATH="/usr/local/opt/php@8.1/sbin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

autoload -U colors && colors

source $HOME/Configs-PC/config/prompt/git-prompt.zsh/git-prompt.zsh
source $HOME/Configs-PC/config/prompt/git-prompt.zsh/examples/compact.zsh

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
alias ga="git add ."
alias gb="git branch"
alias gs="git status"
alias gcc="git commit"
alias gc="git checkout"
alias gm="git merge"
alias gpod="git pull origin dev"
alias gp="git pull"
alias gpp="git push"
alias gcf="git clean -f"
alias gf="git fetch --all"
alias gbb="git branch -vv"
alias gps="git push --set-upstream"
alias gr='git restore .'
alias grs='git restore --staged .'
alias gl="git log --oneline"
alias grr="git reflog"
alias arbol="git log --oneline --graph --color --all --decorate"
alias bu="brew update && brew upgrade && brew cleanup && brew autoremove --dry-run && brew autoremove && brew doctor"
alias sz="source $HOME/.zshrc"
alias bc="magick mogrify -format webp *.png"
alias dc="docker compose"
alias dd="docker"
alias drc="docker rm -vf $(docker ps -aq)"
alias dri="docker rmi -f $(docker images -aq)"

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

export VISUAL=vim
export EDITOR="$VISUAL"

export KEYTIMEOUT=10
