#!/bin/bash
#This script installs magid for armv6l on your device.
#It should be started from the home directory.

#the required depencies + wget, curl
sudo apt-get update && sudo apt upgrade -y
sudo apt-get install wget curl -y
sudo apt-get install build-essential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libprotobuf-dev -y
sudo apt-get install libqrencode-dev -y

#berkeley-db is required to compile magid, this installs it from the source since it's not available through apt
wget https://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
rm db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/dist
sudo curl -o config.guess http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD
sudo curl -o config.sub http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD
cd ../build_unix
../dist/configure --disable-shared --enable-cxx --disable-replication --with-pic --prefix=/opt/local/db-4.8.30.NC
make
sudo make install

#compiling magid
wget https://github.com/magi-dev/magi/archive/refs/tags/v1.4.7.2.tar.gz
tar -zxvf v1.4.7.2.tar.gz
rm v1.4.7.2.tar.gz
cd magi-1.4.7.2/src/leveldb
make clean
make libleveldb.a libmemenv.a
cd ..
make -f makefile.unix xCPUARCH=armv6l CXXFLAGS='-I /opt/local/db-4.8.30.NC/include -L /opt/local/db-4.8.30.NC/lib'

#deleting the build directories and installing magid in the system
sudo install -m 755 magid /usr/bin/magid
cd ..
cd ..
rm -rf magi-1.4.7.2
rm -rf db-4.8.30.NC
echo "The script successfully terminated and installed the magi daemon in the system"
echo "You now may delete the script with 'rm magid_aarch64.sh'"
