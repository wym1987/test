export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

sudo apt-get update && DEBIAN_FRONTEND=noninteractive sudo apt install -y tzdata && sudo apt-get install -y git curl wget apt-utils rsync

sudo apt-get update && sudo apt-get install gh -y