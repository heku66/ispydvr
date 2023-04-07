#!/bin/bash
ABSOLUTE_PATH=/WORKSPACE
cd $ABSOLUTE_PATH
export DOTNET_ROOT=$ABSOLUTE_PATH/dotnet
export PATH=$PATH:$ABSOLUTE_PATH/dotnet

# Install script for AgentDVR/ Linux
# To execute: save and `chmod +x ./linux_setup2.sh` then `./linux_setup2.sh`

. /etc/*-release
# arch=`uname -m`

machine_has() {
    eval $invocation

    command -v "$1" > /dev/null 2>&1
    return $?
}

apt update
apt-get install -y software-properties-common alsa-utils
add-apt-repository ppa:savoury1/ffmpeg5 -y
apt update
# apt search ffmpeg | grep ffmpeg
apt install ffmpeg -y
apt upgrade -y

cd $ABSOLUTE_PATH/AgentDVR/
#download latest version

echo "Adding execute permissions"
chmod +x ./Agent
find . -name "*.sh" -exec chmod +x {} \;

cd $ABSOLUTE_PATH

name=$(whoami)
#add permissions for local device access
echo "Adding permission for local device access"
adduser $name video
usermod -a -G video $name

exit 0
