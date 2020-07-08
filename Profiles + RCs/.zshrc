# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/graham/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#PROMPT="%~ %F{1}❯%f%F{3}❯%f%F{2}❯%f "
PROMPT="%~ > "
(cat $HOME/.config/wpg/sequences &)
export PF_INFO='title os host kernel shell uptime pkgs memory'
export PF_COL1=9
export PF_COL2=9
export PF_COL3=9
export PF_ASCII='tux'
