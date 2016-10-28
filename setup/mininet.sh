#!/usr/bin/env bash

cd ~
git clone git://github.com/mininet/mininet

cd mininet
git tag
git checkout -b 2.2.1 2.2.1
cd ..
mininet/util/install.sh -a

cd ~
cd pox
git checkout -b ad-net f95dd1a81584d716823bbf565fa68254416af603