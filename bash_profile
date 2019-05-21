### eniromental variable
export EDITOR=vim

export PLATFORM=$(uname -s)

### PS1
__git_ps1() { :;}
# contains code to show the current git branch
if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
PS1='\w \[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]>\[\e[0m\] '
export PS1


### Colored ls
if [ -d ~/.dircolors ]; then
    eval $(gdircolors ~/.dircolors/dircolors.ansi-dark)
    alias ls='gls --color=auto'
    alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
    alias ls='ls -G'
fi

### 256 color support in bash
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

### alias for screen clear
alias cl="clear"

### Auto-launching ssh-agent on Git for Windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
