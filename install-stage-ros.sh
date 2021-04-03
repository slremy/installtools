#!/bin/bash

sudo apt-get update
sudo apt-get -y install git libssl-dev python3-pip 
sudo apt-get -y install ros-noetic-stage-ros xvfb x11-apps screen
mkdir /root/catkin_ws
mkdir /root/catkin_ws/src
cd /root/catkin_ws/src/
git clone https://github.com/slremy/ros_web_service
chmod 755 ros_web_service/src/*py
pip3 install web.py

cd /root/catkin_ws/src/
sudo apt-get update
sudo apt-get -y install ros-noetic-cv-bridge ros-noetic-image-transport
git clone https://github.com/GT-RAIL/async_web_server_cpp.git
git clone https://github.com/RobotWebTools/web_video_server.git

echo source /opt/ros/noetic/setup.bash >> ~/.bashrc
source ~/.bashrc
cd /root/catkin_ws/
catkin_make -j 1 -DCMAKE_CXX_FLAGS='--param ggc-min-expand=20'
source /root/catkin_ws/devel/setup.bash
