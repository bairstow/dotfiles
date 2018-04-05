#!/bin/sh

echo -e "\n\nInstalling user tools..."
echo "=============================="

# user tools
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

exit 0
