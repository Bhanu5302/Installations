#!/bin/bash -eu
# nodejs14.x & node-red instllation instllation 2-01-2023 bhanu prakash

user_name=$(whoami)
echo "#######################################################################################################################"
echo ">>Nodejs14.x & Node-red installation started"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install v14.10.0
echo $nvm list
sudo npm install -g --unsafe-perm node-red
echo $node-red -v
