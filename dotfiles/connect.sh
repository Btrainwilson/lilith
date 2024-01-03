#!/bin/bash
 
# Connect to internet
if [ "$1" == "wp" ]; then
	nmcli device wifi connect $2 password $3
fi
if [ "$1" == "w" ]; then
	nmcli device wifi connect $2
fi
if [ "$1" == "ws" ]; then
	nmcli device wifi list
fi
if [ "$1" == "blt" ]; then
	if [ "$2" == "d" ]; then
		sudo grep -Ri trust /var/lib/bluetooth/
	fi
	if [ "$2" == "jbl" ]; then
		bluetoothctl connect 78:5E:A2:C3:5C:23
	fi
fi
if [ "$1" == "purdue-vpn" ]; then
  sudo -E openconnect --user=wilso692 webvpn2.purdue.edu
fi
