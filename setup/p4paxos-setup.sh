#!/bin/sh

# install p4c-bmv2
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
sudo pip install -r p4c-bmv2/requirements.txt

# install new behavioral-model
git clone https://github.com/p4lang/behavioral-model.git bmv2
cd ~/bmv2
sudo ./install_deps.sh
./autogen.sh
./configure
make

# install p4paxos
cd ~
git clone https://github.com/usi-systems/p4paxos.git
