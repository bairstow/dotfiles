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
alias sshAdminSydney="ssh -i ~/.ssh/id_ci_service administrator@45.77.237.136"
alias removeDanglingImages="docker rmi $(docker images --quiet --filter "dangling=true")"
alias vpn="node ~/git/scriptify/vpnify-build"
alias irc="node ~/git/scriptify/ircify-build"
alias obsidianMount="rclone mount jb-google-drive:'Obsidian Vault' ~/Documents/'Obsidian Vault' --allow-non-empty"
alias obsidianSync="rclone sync -i ~/Documents/'Obsidian Vault' jb-google-drive:'Obsidian Vault'"
alias obsidianUnmount="fusermount -u ~/Documents/'Obsidian Vault'"
alias audioReset="pulseaudio -k && sudo alsa force-reload"

# emacs
if [[ `uname` == "Darwin" ]]; then
  alias tEmacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
else
  alias tEmacs="emacs -nw"
fi

