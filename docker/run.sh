#!/bin/bash

xhost +
#--privileged 
docker run --privileged -v /dev/kvm:/dev/kvm \
       -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
       -v $HOME/.Xauthority:/root/.Xauthority \
       -it  sdk_android /bin/bash
