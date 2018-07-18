#!/bin/bash

# remove IPs from input/output interface to prepare them for bridging
ip addr flush dev $IFIN
ip addr flush dev $IFOUT

# bridge interfaces (layer 2)
brctl addbr br0
brctl addif br0 $IFIN $IFOUT
ifconfig br0 up
