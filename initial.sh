#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.57.0/rclone-v1.57.0-linux-amd64.zip
unzip -q rclone-v1.57.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.57.0-linux-amd64:$PATH

# Install aria2c static binary
wget -q https://github.com/P3TERX/Aria2-Pro-Core/releases/download/1.36.0_2021.08.22/aria2-1.36.0-static-linux-amd64.tar.gz
tar xf aria2-1.36.0-static-linux-amd64.tar.gz
export PATH=$PWD:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

# Tracker
tracker_list=`curl -Ns https://raw.githubusercontent.com/rcloneherokuonedrive/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
echo "bt-tracker=$tracker_list" >> aria2c.conf

echo $PATH > PATH
