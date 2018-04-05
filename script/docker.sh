#!/bin/sh

echo -e "\n\nInstalling docker ce..."
echo "=============================="

# docker ce
# install packages to allow apt to use a repository over https
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# setup the stable repository
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# update the apt package index
sudo apt-get update

# install latest Docker CE
sudo apt-get install docker-ce

exit 0
