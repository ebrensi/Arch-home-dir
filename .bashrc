#
# ~/.bashrc
#

export VISUAL="bat --paging=never"
export EDITOR=micro
export TERMINAL=$TERM

alias ls=exa
alias cat="bat --paging=never"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -nRF"

# We store npm packages locally to avoid giving them elevated priviledges
export npm_config_prefix=$HOME/.node_modules_global
export PATH="$HOME/bin:$npm_config_prefix/bin:$PATH"

# If not running interactively, we can leave now
[[ $- != *i* ]] && return

source $HOME/.config/nnn/nnnrc

# set up Starship prompt
eval "$(starship init bash)"

# fzf stuff
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

