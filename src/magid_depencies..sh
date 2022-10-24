#!/bin/bash
#the depencies required to compile magid
sudo apt update && sudo apt upgrade
sudo apt-get install build-essential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libprotobuf-dev
sudo apt-get install libqrencode-dev -y
