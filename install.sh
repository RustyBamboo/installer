#!/bin/bash

CATKIN_DIR=~/mil_ws

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install git

sudo apt-get install binutils-dev

sudo apt-get install ros-kinetic-desktop-full

sudo apt-get install ros-kinetic-ompl

sudo apt-get install ros-kinetic-spacenav-node

sudo apt-get install python-scipy

sudo apt-get install tesseract-ocr

sudo apt-get install libusb-1.0-0-dev

sudo apt-get install catkin

wget https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz
tar -xvzf protobuf-2.6.1.tar.gz
cd protobuf-2.6.1
./configure
make
make check
sudo make install
cd ..
sudo rm -r protobuf-2.6.1
sudo rm -r protobuf-2.6.1.tar.gz

mkdir -p $CATKIN_DIR/src
cd $CATKIN_DIR/src
catkin_init_workspace
git clone https://github.com/ros-drivers/driver_common
CMAKE_PREFIX_PATH=/opt/ros/kinetic
catkin_make -C $CATKIN_DIR -B

source ../devel/setup.bash

git clone https://github.com/RustyBamboo/camera1394.git
git clone https://github.com/uf-mil/sub8.git
git clone https://github.com/txros/txros.git

mv $CATKIN_DIR/src/sub8/gnc/sub8_trajectory_generator $CATKIN_DIR/src/sub8/gnc/.sub8_trajectory_generator

catkin_make -C $CATKIN_DIR -B
