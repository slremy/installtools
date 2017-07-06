#install ROS (and Stage)
sudo cp /etc/apt/sources.list  /etc/apt/sources.list.backup
sudo sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list 
#instructions for 16.04 (Xenial)
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get -y update
sudo apt-get -y install xvfb x11-apps screen
sudo apt-get -y install gdb
sudo apt-get -y install python-rosinstall
sudo apt-get -y install ros-lunar-ros-base
sudo apt-get -y install ros-lunar-stage-ros
#sudo apt-get -y install ros-lunar-angles
sudo rosdep init
rosdep update
echo "source /opt/ros/lunar/setup.bash" >> ~/.bashrc
source ~/.bashrc

#install ROS web service manually
#create catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
cd ~/catkin_ws/src/
git clone https://github.com/slremy/ros_web_service
chmod 755 ros_web_service/src/*py
cd ~/catkin_ws/
catkin_make
cd ~/catkin_ws/src/
sudo apt-get -y install ros-lunar-cv-bridge ros-lunar-image-transport
git clone https://github.com/GT-RAIL/async_web_server_cpp.git
git clone https://github.com/RobotWebTools/web_video_server.git
cd ~/catkin_ws/
catkin_make
#cd ~/catkin_ws/src/
#git clone https://github.com/slremy/stage_ros.git 
#cd ~/catkin_ws/
#catkin_make
source ~/.bashrc

pip install web.py

#screen
#Xvfb :1 -screen 0 1024x768x24 2>&1 >/dev/null &

