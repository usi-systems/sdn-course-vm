#!/usr/bin/env bash

# Make sure that Mininet is uninstalled before this re-installation
cd ~
sudo rm -rf mininet
sudo rm -rf openflow
sudo apt-get remove -y mininet openvswitch-switch openvswitch-controller

# Now re-install Mininet
sudo apt-get install -y openvswitch-switch openvswitch-controller
sudo apt-get install -y mininet
#git clone git://github.com/mininet/mininet
#pushd mininet
#git checkout -b 2.1.0p2 2.1.0p2
#./util/install.sh -fn03
#popd
