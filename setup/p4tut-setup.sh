#!/bin/sh
sudo pip install scapy thrift
cd ~
git clone https://github.com/p4lang/tutorials.git
rm ~/tutorials/SIGCOMM_2015/*/*.tar.gz

git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
sudo pip install -r p4c-bmv2/requirements.txt

git clone https://github.com/p4lang/behavioral-model.git bmv2

cd ~/bmv2
sudo ./install_deps.sh
./autogen.sh
./configure
make
