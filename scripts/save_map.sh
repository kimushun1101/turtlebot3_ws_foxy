#!/bin/bash
source /opt/ros/foxy/setup.bash
source /workspaces/turtlebot3_ws/install/setup.bash

SAVE_DIRECTORY=$HOME
# SAVE_DIRECTORY="/workspaces/turtlebot3_ws"

# https://emanual.robotis.com/docs/en/platform/turtlebot3/slam_simulation/
ros2 run nav2_map_server map_saver_cli -f $SAVE_DIRECTORY/map

echo $SAVE_DIRECTORY && ls $SAVE_DIRECTORY
read -p "input Enter"