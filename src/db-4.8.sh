#!/bin/bash

# This script installs BerkeleyDB, version 4.8.30.NC, on your system.
# Since db-4.8 is not available through apt, it's going to be installed from the source.
# It's going to be installed under /opt/local/db-4.8.30.NC

echo "Downloading... 0%"
wget -q 'https://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
tar -zxf db-4.8.30.NC.tar.gz
rm db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/dist
sudo curl -s -o config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
sudo curl -s -o config.sub 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
cd ../build_unix
echo "Configuring... 25%"
../dist/configure -q --disable-shared --enable-cxx --disable-replication --with-pic --prefix=/opt/local/db-4.8.30.NC
echo "Compiling... 50%"
make -j 4 > /dev/null
echo "Installing... 75%"
sudo make install > /dev/null
cd ../..
