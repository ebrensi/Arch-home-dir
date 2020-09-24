#!/bin/bash
#
# ~/.bashrc
#

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

export VISUAL="bat --paging=never"
export EDITOR=micro
export TERMINAL=$TERM

alias ls=exa
alias cat="bat --paging=never"

complete -cf sudo
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -nRF"

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
# We store npm packages locally to avoid giving them elevated priviledges
export npm_config_prefix=$HOME/.node_modules_global
export PATH="$HOME/bin:$npm_config_prefix/bin:$PATH"

shopt -s expand_aliases

# If not running interactively, we can leave now
[[ $- != *i* ]] && return

# export QT_SELECT=4
source $HOME/.config/nnn/nnnrc

# Enable history appending instead of overwriting.  #139609
shopt -s histappend


# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# fzf stuff
[ -r /usr/share/fzf/completion.bash ]   && . /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash

# set up Starship prompt
eval "$(starship init bash)"
