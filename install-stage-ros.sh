#install ROS (and Stage)
sudo cp /etc/apt/sources.list  /etc/apt/sources.list.backup
sudo sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list 
#instructions for 14.04 (Trusty)
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install xvfb x11-apps screen
sudo apt-get -y install gdb
sudo apt-get -y install python-rosdistro python-rosdep python-rosinstall python-rosinstall-generator
sudo apt-get -y install ros-indigo-rosbash
sudo apt-get -y install ros-indigo-mjpeg-server
sudo apt-get -y install ros-indigo-stage-ros
sudo apt-get -y install ros-indigo-angles
sudo rosdep init
rosdep update
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
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
git clone https://github.com/ros-simulation/stage_ros.git 
cd stage_ros
wget https://raw.githubusercontent.com/slremy/installtools/master/setpose.patch
patch -p0 < setpose.patch
cd ~/catkin_ws/
catkin_make
source ~/.bashrc

sudo apt-get -y install python-webpy

screen
Xvfb :1 -screen 0 1024x768x24 2>&1 >/dev/null &

