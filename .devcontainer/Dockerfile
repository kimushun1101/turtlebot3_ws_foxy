FROM tiryoh/ros2-desktop-vnc:foxy

# Replace apt urls
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

# && apt-get upgrade -y
RUN apt-get update && apt-get install -y --no-install-recommends \ 
terminator \
# See https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/
python3-colcon-common-extensions \
ros-foxy-gazebo-ros-pkgs \
ros-foxy-cartographer ros-foxy-cartographer-ros \ 
ros-foxy-navigation2 ros-foxy-nav2-bringup \
python3-vcstool \
# See https://qiita.com/porizou1/items/d63a41fc1e478dfa5ab6
ros-foxy-dynamixel-sdk \
# Clean up
&& apt-get autoremove -y \
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/ubuntu/Desktop/ && cp /usr/share/applications/terminator.desktop /home/ubuntu/Desktop

# Set up auto-source of workspace for ros user
ARG WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ubuntu/.bashrc