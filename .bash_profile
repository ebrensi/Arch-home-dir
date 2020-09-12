#
# ~/.bash_profile
#

# Auto start tbsm after login on first two VTs
 [[ $TERM == "linux" ]] && [[ $XDG_VTNR -le 1 ]] && tbsm


[[ -f ~/.bashrc ]] && . ~/.bashrc
