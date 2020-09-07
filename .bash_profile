#
# ~/.bash_profile
#


# Auto start tbsm only on tty1
if [[ -z ${DISPLAY} ]] && [[ ${XDG_VTNR} == 1 ]]; then
    exec ~/.config/sway/sway-run
fi

[[ -f ~/.bashrc ]] && source ~/.bashrc
