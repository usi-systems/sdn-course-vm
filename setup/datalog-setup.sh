#!/usr/bin/env bash
cd ~
wget -O datalog-2.5.tar.gz http://sourceforge.net/projects/datalog/files/datalog/2.5/datalog-2.5.tar.gz/download
tar xzvf datalog-2.5.tar.gz
cd datalog-2.5
./configure
make
sudo make install
