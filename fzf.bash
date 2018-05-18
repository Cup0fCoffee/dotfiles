# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Maxim/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/Maxim/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/Maxim/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/Maxim/.fzf/shell/key-bindings.bash"

