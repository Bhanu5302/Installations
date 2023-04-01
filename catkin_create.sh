#!/bin/bash -eu
echo "creating workspace"
source /opt/ros/noetic/setup.bash
mkdir -p ~/nala_moco/src
cd ~/nala_moco/
catkin_make
source ~/nala_moco/devel/setup.bash
echo $ROS_PACKAGE_PATH
echo ">>>>>downloading the moco2.1 project-----"
cd ~/nala_moco/src
git clone https://github.com/Bhanu5302/moco2.1.git
cd ~/nala_moco
catkin_make
source ~/nala_moco/devel/setup.bash
echo "source ~/nala_moco/devel/setup.bash">>~/.bashrc
source ~/.bashrc
echo "Downloaded moco2.1"
echo "Downloading busybox & python can packages"
sudo apt-get install busybox
sudo apt-get install pip
pip install python-can
