#!/bin/bash
#This script installs magid on your device.
#It should be started from the home directory
#and has been tested on debian10 with aarch64 architecture. 
#The architecture can be changed to your architecture (use lscpu to find out).

#the required depencies + wget
sudo apt-get update -y && sudo apt upgrade -y
sudo apt-get install wget -y
sudo apt-get install build-essential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libprotobuf-dev -y
sudo apt-get install libqrencode-dev -y

#berkeley-db is required to compile magid, this installs it from the source
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c
tar -xzvf db-4.8.30.NC.tar.gz
rm db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix
../dist/configure --disable-shared --enable-cxx --disable-replication --with-pic --prefix=/opt/local/db-4.8.30.NC --build=aarch64-unknown-linux-gnu
make
sudo make install

#compiling magid
wget https://github.com/ruckard/magi/archive/refs/tags/v1.4.7.2.tar.gz
tar -zxvf v1.4.7.2.tar.gz
rm v1.4.7.2.tar.gz
cd magi-1.4.7.2/src/leveldb
chmod +x build_detect_platform
make clean
make libleveldb.a libmemenv.a
cd ..
make -f makefile.unix xCPUARCH=aarch64 CXXFLAGS='-I /opt/local/db-4.8.30.NC/include -L /opt/local/db-4.8.30.NC/lib'
#replace "aarch64" with your architecture, e.g. armv7l for arm!

#deleting the build directory and installing magid in the system
cd magi-1.4.7.2/src
sudo install -m 755 magid /usr/bin/magid
cd ..
cd ..
rm -rf magi-1.4.7.2
echo script terminated, to start the wallet in background mode type magid
echo to read the help type magid --help
echo don't forget to create the magi.conf file first!
