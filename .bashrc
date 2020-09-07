#
# ~/.bashrc
#

export VISUAL=$HOME/bin/ewrap
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

# set up Starship prompt
eval "$(starship init bash)"

# nnn settings via environment variables
export LC_COLLATE="C"
export NNN_BMS='c:~/.config;h:~/dev/heatflask;d:~/Downloads/'
export NNN_PLUG='v:imgview;p:preview-tui;c:.cbcp;f:fzopen;l:launch;s:pskill;'
export NNN_COLORS="2136"               # use a different color for each context
export NNN_TRASH=1                     # trash (needs trash-cli) instead of delete
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_OPEN="$VISUAL"

# -E forces nnn to use $EDITOR for internal editor use (like batch rename)
# -n type-to-nav mode, -A don't automatically choose the only remaining option
# -d detail mode
# -H show hidden files
# -u always use selection, vs current (e.g. delete)
# -a use auto NNN_FIFO
export NNN_OPTS="EAoa"

# Set up environment for nnn
n ()
{
        # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified

    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


# fzf stuff
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash
