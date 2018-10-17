#
# ~/.bashrc
#
SCM_CHECK=true
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
#set -o vi

PATH=$(getconf PATH)

# Set up a default Go workspace
[ -z "$GOPATH" ] && export GOPATH=$HOME/dev/golang
export GOROOT=/usr/local/go

export PATH=/usr/share/maven/bin:$PATH
export PATH=/usr/local/buildtools/java/jdk/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Add Go to the path
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it
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
if [ -s $HOME/.keys/google.key.json ]; then
  export GOOGLE_CREDENTIALS=$(cat $HOME/.keys/google.key.json)
  export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.keys/google.key.json
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
alias tf='$GOPATH/bin/terraform'
alias vim='/usr/bin/nvim'

# tmux
alias tmux='tmux -2'
alias mux='tmuxinator start'

# intellij
alias ij='/opt/intellij-ce-stable/bin/idea.sh'
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google/home/evanbrown/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/google/home/evanbrown/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google/home/evanbrown/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/google/home/evanbrown/google-cloud-sdk/completion.bash.inc'; fi

eval "$(direnv hook bash)"
