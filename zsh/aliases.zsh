# reload zsh config
alias reload!='source ~/.zshrc'

alias vim="nvim"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

alias l="ls -lah ${colorflag}"
alias ls="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# local
alias sshAdminSydney="ssh administrator@44.77.237.136"
alias removeDanglingImages="docker rmi $(docker images --quiet --filter "dangling=true")"

# emacs
if [[ `uname` == "Darwin" ]]; then
  alias tEmacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
else
  alias tEmacs="emacs -nw"
fi

