#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script should be run using sudo or as the root user";
	exit 1;
fi

if [ $# -lt 2 ]; then 
	echo "Usage: nat.sh [WAN interface] [LAN Interface]";
	exit 1;
fi

WAN=$1;
LAN=$2;
echo 1 > /proc/sys/net/ipv4/ip_forward;
/sbin/iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE;
/sbin/iptables -A FORWARD -i $WAN -o $LAN -m state --state RELATED,ESTABLISHED -j ACCEPT;
/sbin/iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT;
