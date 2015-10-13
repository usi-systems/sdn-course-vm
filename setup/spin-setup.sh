#!/bin/sh
if [ ! -f "spin643.tar.gz" ]; then 
	wget http://spinroot.com/spin/Src/spin643.tar.gz
fi
if [ ! -d "Spin" ]; then
	tar xzvf spin*.tar.gz
fi
cd Spin/Src*
make
export PATH=\$PATH:`pwd`