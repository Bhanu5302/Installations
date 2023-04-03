#!/bin/bash -eu
# nodejs14.x & node-red instllation instllation 2-01-2023 bhanu prakash

user_name=$(whoami)
echo "#######################################################################################################################"
echo ">>Nodejs14.x & Node-red installation started"
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
cat /etc/apt/sources.list.d/nodesource.list
sudo apt -y install nodejs
sudo npm install -g --unsafe-perm node-red
node-red -v
