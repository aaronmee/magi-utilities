#!/bin/bash

#installing m-minerd
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -qq git
sudo apt-get install -qq libcurl4-openssl-dev -y
sudo apt-get install -qq libgmp-dev -y
sudo apt-get install -qq openssl -y

echo "Downloading... 0%"
git clone 'https://github.com/m-pays/m-cpuminer-v2'
cd m-cpuminer-v2
echo "Configuring... 25%"
./autogen.sh
./configure CFLAGS='-O3' CXXFLAGS='-O3'
echo "Compiling... 75%"
make
sudo make install
