#!/bin/bash -e

# # install behavioral-model dependencies
sudo apt-get install -y git autoconf python-pip build-essential python-dev \
    cmake libjudy-dev libgmp-dev libpcap-dev mktemp libffi-dev r-base gawk

sudo rm -rf behavioral-model p4c-bm
git clone https://github.com/p4lang/behavioral-model.git
git clone https://github.com/p4lang/p4c-bm.git

# # install thrift
sudo apt-get install -y libboost-dev libboost-test-dev libboost-program-options-dev \
libboost-filesystem-dev libboost-thread-dev libevent-dev automake libtool \
flex bison pkg-config g++ libssl-dev
tmpdir=`mktemp -d -p .`
cd $tmpdir

wget http://mirror.switch.ch/mirror/apache/dist/thrift/0.9.3/thrift-0.9.3.tar.gz
tar -xvf thrift-0.9.3.tar.gz
cd thrift-0.9.3
./configure --with-cpp=yes --with-c_glib=no --with-java=no --with-ruby=no \
--with-erlang=no --with-go=no --with-nodejs=no
sudo make -j2
sudo make install
cd ..
# install nanomsg
bash ../behavioral-model/travis/install-nanomsg.sh
sudo ldconfig

# install nnpy
bash ../behavioral-model/travis/install-nnpy.sh

# clean up
cd ..
sudo rm -rf $tmpdir

cd behavioral-model
./autogen.sh
# better performance for behavioral-model
#./configure --disable-logging-macros --disable-elogger CXXFLAGS=-O3
./configure
sudo make

cd ../p4c-bm
sudo pip install -r requirements.txt
sudo pip install -r requirements_v1_1.txt
sudo python setup.py install