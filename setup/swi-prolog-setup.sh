#!/usr/bin/env bash

sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install -y swi-prolog
