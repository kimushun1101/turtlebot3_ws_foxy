# VSCode ROS2 Workspace Template

This template will get you set up using ROS2 with VSCode as your IDE.

See [how I develop with vscode and ros2](https://www.allisonthackston.com/articles/vscode_docker_ros2.html) for a more in-depth look on how to use this workspace.

## Features

### Style

ROS2-approved formatters are included in the IDE.  

* **c++** uncrustify; config from `ament_uncrustify`
* **python** autopep8; vscode settings consistent with the [style guide](https://index.ros.org/doc/ros2/Contributing/Code-Style-Language-Versions/)

### Tasks

There are many pre-defined tasks, see [`.vscode/tasks.json`](.vscode/tasks.json) for a complete listing.  Feel free to adjust them to suit your needs.  

Take a look at [how I develop using tasks](https://www.allisonthackston.com/articles/vscode_tasks.html) for an idea on how I use tasks in my development.

### Debugging

This template sets up debugging for python files and gdb for cpp programs.  See [`.vscode/launch.json`](.vscode/launch.json) for configuration details.

### Continuous Integration

The template also comes with basic continuous integration set up. See [`.github/workflows/ros.yaml`](/.github/workflows/ros.yaml).  

To remove a linter just delete it's name from this line:

```yaml
      matrix:
          linter: [cppcheck, cpplint, uncrustify, lint_cmake, xmllint, flake8, pep257]
```

## How to use this template

### Prerequisites

You should already have Docker and VSCode with the remote containers plugin installed on your system.
To make nvidia driver and opengl available in docker, follow the installation instructions for docker-nvidia. 
They include the steps in docker and add the additional gpu layer. 

* [docker](https://docs.docker.com/engine/install/)
* [docker-nvidia (includes docker install and additional installation for NVidia GPU accelerated hosts)](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
* [vscode](https://code.visualstudio.com/)
* [vscode remote containers plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Get the template

Click on "use this template"

![template_use](https://user-images.githubusercontent.com/6098197/91331899-43f23b80-e780-11ea-92c8-b4665ce126f1.png)

### Create your repository

On the next dialog, name the repository you would like to start and decide if you want all of the branches, or just the latest LTS: Foxy.

![template_new](https://user-images.githubusercontent.com/6098197/91332035-713ee980-e780-11ea-81d3-13b170f568b0.png)

Github will then create a new repository with the contents of this one in your account.  It grabs the latest changes as "initial commit".

### Clone your repo

Now you can clone your repo as normal

![template_download](https://user-images.githubusercontent.com/6098197/91332342-e4e0f680-e780-11ea-9525-49b0afa0e4bb.png)

### Open it in vscode

Now that you've cloned your repo onto your computer, you can open it in VSCode (File->Open Folder). 

When you open it for the first time, you should see a little popup that asks you if you would like to open it in a container.  Say yes!

![template_vscode](https://user-images.githubusercontent.com/6098197/91332551-36898100-e781-11ea-9080-729964373719.png)

If you don't see the pop-up, click on the little green square in the bottom left corner, which should bring up the container dialog

![template_vscode_bottom](https://user-images.githubusercontent.com/6098197/91332638-5d47b780-e781-11ea-9fb6-4d134dbfc464.png)

In the dialog, select "Remote Containers: Reopen in container"

VSCode will build the dockerfile inside of `.devcontainer` for you.  If you open a terminal inside VSCode (Terminal->New Terminal), you should see that your username has been changed to `ros`, and the bottom left green corner should say "Dev Container"

![template_container](https://user-images.githubusercontent.com/6098197/91332895-adbf1500-e781-11ea-8afc-7a22a5340d4a.png)


### Update the template with your code

1. Specify the repositories you want to include in your workspace in `src/ros2.repos` or delete `src/ros2.repos` and develop directly within the workspace.
   1. If you are using a `ros2.repos` file, import the contents `Terminal->Run Task..->import from workspace file`
2. Install dependencies `Terminal->Run Task..->install dependencies`
3. Develop!



## Error handling for GPU acceleration


#### Docker image cannot be built: 

The dockerfile can be built but using devcontainer.json results in error messages like "docker container cannot connect to device [[gpu]]" means docker itself is installed, but not the above mentioned nvidia part. 

Solution is, to follow the guide and the test with nvidia-smi as indicated here: 
- [docker-nvidia(for GPU acceleration on Nvidia GPU hosts)](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)


### Programs in Docker cannot access GPU

Error messages that show lacking GPU acceleration (in docker terminal) 
```
  $ sudo apt-get update   && sudo apt-get install -y -qq glmark2   && glmark2
```
results in: 
```
   libGL error: No matching fbConfigs or visuals found
   libGL error: failed to load driver: swrast
      X Error of failed request:  GLXBadContext
   Major opcode of failed request:  151 (GLX)
   Minor opcode of failed request:  6 (X_GLXIsDirect)
   Serial number of failed request:  48
   Current serial number in output stream:  47
```

Solution is, to follow the guide and the test with nvidia-smi as indicated here: 
[docker-nvidia(for GPU acceleration on Nvidia GPU hosts)](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)


#### more information

- https://wiki.ros.org/docker/Tutorials/GUI
- https://medium.com/@benjamin.botto/opengl-and-cuda-applications-in-docker-af0eece000f1
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

## Sample source codes and environment

### Turtlebot3

See [TurtleBot3 - ROBOTIS e-Manual](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start).
TurtleBot is a ROS standard platform robot.
`turtlebot3_ws` can import turtlebot3 simulation source codes by using vcs.

In addition, Turtlebot3 scripts are prepared in `scripts`.
Those shell scripts are copied on Desktop in VNC environment.

### Terminator settings

See [chikuta-docker-envs](https://github.com/chikuta/chikuta-dockerfiles/blob/master/docker/ros2-foxy-focal/config/terminator/config).
That is MIT License.