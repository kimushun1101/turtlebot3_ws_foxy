#!/bin/bash
source /opt/ros/foxy/setup.bash
source /workspaces/turtlebot3_ws/install/setup.bash

# https://emanual.robotis.com/docs/en/platform/turtlebot3/nav_simulation/
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml