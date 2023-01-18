#!/bin/bash
#the depencies required to compile magid
sudo apt update && sudo apt upgrade
sudo apt install build-essential -y
sudo apt install libssl-dev -y
sudo apt install libgmp-dev -y
sudo apt install libminiupnpc-dev -y
sudo apt install libboost-all-dev -y
sudo apt install libprotobuf-dev
sudo apt install libqrencode-dev -y
