#!/bin/bash
#berkeley-db is required to compile magid, this installs it from the source since it's not available through apt
wget 'https://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
tar -xzvf db-4.8.30.NC.tar.gz
rm db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/dist
sudo curl -o config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
sudo curl -o config.sub 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
cd ../build_unix
../dist/configure --disable-shared --enable-cxx --disable-replication --with-pic --prefix=/opt/local/db-4.8.30.NC
make
sudo make install
