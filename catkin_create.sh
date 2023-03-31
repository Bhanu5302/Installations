source /opt/ros/noetic/setup.bash
mkdir -p ~/nala_moco/src
cd ~/nala_moco/
catkin_make
source devel/setup.bash
echo $ROS_PACKAGE_PATH
cd ~/nala_moco/src
gitclone https://github.com/Bhanu5302/moco2.1.git
cd ..
catkin_make
