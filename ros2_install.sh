#!/bin/bash


name_ros_distro=humble
echo "Installing ros2 humble"
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings


sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt upgrade


echo "#######################################################################################################################"
echo ">>> {Step 5: Install ROS, you pick how much of ROS you would like to install.}"
echo "     [1. Desktop Install: (Recommended) : Everything in Desktop plus 2D/3D simulators and 2D/3D perception packages ]"
echo ""
echo "     [2. ROS-Base: (Bare Bones) ROS packaging, build and communication libraries. No GUI tools.]"
echo ""
echo "     [3. dev-ttols: Development toools:compilers and other tools to build ROS packages.]"
echo ""

read -p "Enter your install (Default is 1):" answer 

case "$answer" in
  1)
    package_type="desktop"
    ;;
  2)
    package_type="ros-base"
    ;;
  3)
    package_type="dev-tools"
    ;;
  * )
    package_type="desktop"
    ;;
esac


echo "#######################################################################################################################"
echo ""
echo ">>>  {Starting ROS installation, this will take about 20 min. It will depends on your internet  connection}"
echo ""
sudo apt install  ros-${name_ros_distro}-${package_type} 

echo "source /opt/ros/$name_ros_distro/setup.bash" >> ~/.bashrc
source ~/.bashrc


source /opt/ros/$name_ros_distro/setup.bash

sudo apt update && sudo apt install -y build-essential cmake git libbullet-dev python3-colcon-common-extensions python3-flake8 python3-pip python3-pytest-cov python3-rosdep python3-setuptools python3-vcstool wget
sudo rosdep init
rosdep update

echo "ROS2 $name_ros_distro Installation is completed
