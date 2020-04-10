# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
source /usr/share/bash-completion/completions/git

launch_agent() {
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa_elo
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#launch_agent
alias myip="curl ifconfig.co"
export TERM=xterm-color
export CLICOLOR=1
export LS_OPTIONS='--color=always'
alias ls='ls $LS_OPTIONS'
alias ovpn_up='sudo ~/tools/openvpn-2.4.6/src/openvpn/openvpn --config ~/workspace/zageno/gabi.ovpn'
alias ovpn_home='sudo ~/tools/openvpn-2.4.6/src/openvpn/openvpn --config ~/workspace/zageno/gabi-home.ovpn'
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export GOROOT=~/tools/go
export GOPATH=~/workspace/go
export GOGLAND_PATH=~/tools/GoLand-2018.3.3/
export PGHOST=localhost
export GOOGLE_TOOLS_PATH=/home/gabi/tools/google-cloud-sdk
export PATH=$PATH:$GOROOT/bin:$GOGLAND_PATH/bin:~/.local/bin/:~/tools/postgres12/bin:~/tools/node-v10.16.0-linux-x64/bin

alias idea=~/tools/idea-IU-192.6603.28/bin/idea.sh
alias pycharm=~/tools/pycharm-community-2019.1.3/bin/pycharm.sh

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/tools/google-cloud-sdk/path.bash.inc' ]; then . '~/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/tools/google-cloud-sdk/completion.bash.inc' ]; then . '~/tools/google-cloud-sdk/completion.bash.inc'; fi
#source <(kubectl completion bash)
complete -C "/usr/local/bin/aws_completer" aws
