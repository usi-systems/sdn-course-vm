#!/bin/sh
wget http://spinroot.com/spin/Src/spin643.tar.gz
tar xzvf spin643.tar.gz
cd Spin/Src*
make
echo "PATH=\$PATH:`pwd`" >> ~/.bashrc
