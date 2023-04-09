#!/bin/bash
#this will work for amd64 & arm64 only
echo "Installing Mongodb"
ret=$(curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -)
#Checking return value is OK
case $ret in
  "OK" )
  ;;
  *)
    echo ">>> {ERROR: Unable to add keys}"
    exit 0
esac

echo ">>> {Done: Added Keys}"
echo ""
apt-key list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt install mongodb-org
echo "starting MongoDB service"
sudo systemctl start mongod.service
sudo systemctl status mongod
echo "enabling mongoDB on startup"
sudo systemctl enable mongod
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
echo "MongoDB installtion is completed"
