#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$(getconf PATH)
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin

# Set up a default Go workspace
[ -z "$GOPATH" ] && export GOPATH=$HOME/dev/golang

# Add Go to the path
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
export PATH=$PATH:$HOME/bin/go_appengine/

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it
#export BASH_IT_THEME='bakke'
export BASH_IT_THEME='powerline-multiline'

# Set editor
export EDITOR="vim"
export GIT_EDITOR="vim"

# vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Load Bash It
source $BASH_IT/bash_it.sh

# gcloud
if [ -x $HOME/bin/google-cloud-sdk/bin/gcloud ]; then
  source $HOME/bin/google-cloud-sdk/path.bash.inc
  source $HOME/bin/google-cloud-sdk/completion.bash.inc
fi

# some sweet google creds
if [ -x $HOME/keys/evandbrown17.key.json ]; then
  export GOOGLE_CREDENTIALS=$(cat $HOME/keys/evandbrown17.key.json)
  export GOOGLE_ACCOUNT_FILE=$GOOGLE_CREDENTIALS_FILE
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'
alias vim='/usr/local/bin/nvim'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
