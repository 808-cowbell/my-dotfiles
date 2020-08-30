# general config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
autoload -Uz compinit
compinit

# prompt
PROMPT='%~ > '

# keybinds
bindkey '^R' history-incremental-search-backward

# aliases
alias thanks='echo ur welcome!'

# env vars
export PF_INFO='title os wm kernel shell uptime pkgs palette'
export PF_COL1=9
export PF_COL2=9
export PF_COL3=9
