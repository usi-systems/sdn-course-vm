#!/usr/bin/env python

from scapy.all import *
import sys
import argparse

class EasyRoute(Packet):
    name = "EasyRoute "
    fields_desc = [ XIntField("num_port", 0x0)]

class EasyPort(Packet):
    name = "EasyPort "
    fields_desc = [ XByteField("port", 0x1)]


bind_layers(Ether, EasyRoute, type=0x6900)

def client(itf):
    eth = Ether(src="00:00:00:00:00:01", dst="00:00:00:00:00:03")
    p = eth / EasyRoute(num_port=3) / EasyPort(port=2) / EasyPort(port=3) / EasyPort(port=1) / "Hello"
    p.show()
    sendp(p, iface = itf)

def handle(x):
    x.show()

def server(itf):
    sniff(iface = itf, prn = lambda x: handle(x))

def main():
    parser = argparse.ArgumentParser(description='receiver and sender to test P4 program')
    parser.add_argument("-s", "--server", help="run as server", action="store_true")
    parser.add_argument("-c", "--client", help="run as client", action="store_true")
    parser.add_argument("-i", "--interface", default='eth0', help="bind to specified interface")
    args = parser.parse_args()

    if args.server:
        server(args.interface)
    elif args.client:
        client(args.interface)
    else:
        parser.print_help()

if __name__=='__main__':
    main()