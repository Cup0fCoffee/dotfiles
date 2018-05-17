### eniromental variable
export EDITOR=vim

export PLATFORM=$(uname -s)

### PATH
# PhantomJs (added manually)
export PATH=$HOME/webdrivers/phantomjs-2.1.1-macosx/bin:$PATH

# Chromedriver (added manually)
export PATH=$HOME/webdrivers/chromedriver:$PATH

# Firefox (added manually)
export PATH=$HOME/webdrivers/firefox:$PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export PATH

### PYTHONUSERBASE
# For local packages installed with `pip install --user`
PYTHONUSERBASE="/usr/local/"
export PYTHONUSERBASE

### PYTHONPATH
# Additional for python packages installed with brew; really don't like this
# PYTHONPATH="/usr/local/lib/python3.6/site-packages:${PYTHONPATH}"
# PYTHONPATH="/usr/local/lib/python2.7/site-packages:${PYTHONPATH}"
# export PYTHONPATH

### CDPATH (for shorter cd commands)
CDPATH=".:~/programming"

### tmux aliases
alias tmux="tmux -2" # for 256 color support
alias ths="tmuxp load hscr"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias ta="tmux attach -t"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### PS1
__git_ps1() { :;}
# contains code to show the current git branch
if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\W\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
export PS1

### Colored ls
if [ -d ~/.dircolors ]; then
    eval $(gdircolors ~/.dircolors/dircolors.ansi-dark)
    alias ls='gls --color=auto'
    alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
    alias ls='ls -G'
fi

### git completion
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\W\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'

### Better-looking less for binary files
# for syntax hl use '-r' flag when calling less
LESSOPEN="|/usr/local/bin/lesspipe.sh %s"; export LESSOPEN

### 256 color support in bash
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

### alias for screen clear
alias cl="clear"
