#!/usr/bin/env bash

cd ~
git clone git://github.com/mininet/mininet

cd mininet
git tag
git checkout t-b 2.2.1 2.2.1
cd ..
mininet/util/install.sh -a
