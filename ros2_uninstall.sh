#!/bin/bash -eu
ros_distro=humble
echo "Uninstalling ROS2 $ros_ditro"
sudo apt remove ~nros-${ros_ditro}-* && sudo apt autoremove
sudo rm /etc/apt/sources.list.d/ros2.list
sudo apt update
sudo apt autoremove

sudo apt upgrade
echo "Uninstalltion of ROS2 $ros_distro is done"
