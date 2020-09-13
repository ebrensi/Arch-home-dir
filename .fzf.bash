# Setup fzf
# ---------
if [[ ! "$PATH" == */home/efrem/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/efrem/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/efrem/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/efrem/.fzf/shell/key-bindings.bash"
