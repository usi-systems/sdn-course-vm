#!/usr/bin/env bash
if [ ! -f "datalog-2.5.tar.gz" ]; then 
	wget -O datalog-2.5.tar.gz http://sourceforge.net/projects/datalog/files/datalog/2.5/datalog-2.5.tar.gz/download
fi

if [ ! -d "datalog-2.5" ]; then
tar xzvf datalog-2.5.tar.gz
fi

cd datalog-2.5
./configure
make
sudo make install