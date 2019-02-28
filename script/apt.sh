#!/bin/sh

echo -e "\n\nInstalling apt-get packages..."
echo "=============================="

# cli tools
apt-get install wget
apt-get install build-essential
apt-get install libssl-dev

# development tools
apt-get install zsh
apt-get install tmux
apt-get install tmuxinator

# install neovim
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim

exit 0
