# VU_InternetOfThings_Container
A docker container providing the setup and tools required for the lecture 182.753 Internet of Things (VU 4,0)

The container is available under https://hub.docker.com/repository/docker/lehrchristoph/vu_internet_of_things_container 

# Helper Scripts:

A set of scripts is located inside the `scripts` folder.

`setup.sh` Installs the required udev rules and pulls the container from docker hub

`open_shell.sh` Starts the container with the usb devices mounted as well as the project folder 

`open_x11_shell.sh` Does the same as `open_shell.sh`, but additionally provides the possibility of openen GUI applications

If any tool is missing please rais an issue.

# Building the container

The Dockerfile inside the `container` is self contained and the image can be built by using `docker build .` inside the directory.