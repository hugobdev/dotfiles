# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Disable terminal flow control keystrokes (<c-q>, <c-s>)
stty -ixon

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# store multi-lines commands in one history entry
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# save history immediately
PROMPT_COMMAND="history -a"

# set defaul editor
EDITOR="nvim"
VISUAL="nvim"

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# use bash-git-prompt
GIT_PROMPT_THEME=Min
source ~/.bash-git-prompt/gitprompt.sh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# this loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# FZF init
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Util functions
function pid-for-port {
  sudo netstat -nlp | grep ":$1"
}

# macOS Catalina please stop being annoying
export BASH_SILENCE_DEPRECATION_WARNING=1
