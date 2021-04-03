FROM ros:noetic-ros-base

ADD install-stage-ros.sh install-stage-ros.sh
RUN chmod 755 install-stage-ros.sh
RUN ./install-stage-ros.sh

CMD /bin/bash -c "source /opt/ros/noetic/setup.bash; source /root/catkin_ws/devel/setup.bash; xvfb-run roslaunch ros_web_service stage.launch"
