#!/bin/bash
source /opt/ros/foxy/setup.bash
source /workspaces/turtlebot3_ws/install/setup.bash

# https://emanual.robotis.com/docs/en/platform/turtlebot3/slam_simulation/
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True