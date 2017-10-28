#!/bin/bash

interface=`iwconfig 2>&1 | awk '{print $1}' | grep wlp`

cowsay -f eyes 'HACKING-WIFI' | toilet --gay -f term
sudo espeak "Are you ready for hacking wi-fi?"

ifconfig

sudo ifconfig $interface down 
sudo macchanger -r $interface 
sudo ifconfig $interface up 

ifconfig


cowsay -f bunny MAC cambiada 


sudo airmon-ng start $interface 
sudo airmon-ng check kill 
sudo espeak "Now... please, select your victim"

interface_mon=`iwconfig 2>&1 | awk '{print $1}' | grep mon`


sudo airodump-ng $interface_mon -a
