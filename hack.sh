#!/bin/bash

#cowsay -f eyes 'HACKING-WIFI' | toilet --gay -f term
interface=`iwconfig 2>&1 | awk '{print $1}' | grep wlp` #Or ... | awk '/wlp/ {print $1}'

ifconfig

sudo ifconfig $interface down 
sudo macchanger -r $interface 
sudo ifconfig $interface up 

ifconfig

sudo airmon-ng start $interface 
sudo airmon-ng check kill 

interface_mon=`iwconfig 2>&1 | awk '{print $1}' | grep mon`

sudo airodump-ng $interface_mon -a
