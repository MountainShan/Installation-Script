#!/bin/bash
noOfVeths=18
if [ $# -eq 1 ]; then 
    noOfVeths=$1
fi
echo "No of Veths is $noOfVeths"
idx=0
let "vethpairs=$noOfVeths/2"
while [ $idx -lt $vethpairs ]
do 
    intf0="veth$(($idx*2))"
    intf1="veth$(($idx*2+1))"
    idx=$((idx + 1))
    if ip link show $intf0 &> /dev/null; then
        ip link set dev $intf0 down;
        ip link set dev $intf1 down;
        ip link del $intf0;
	echo "Interface $intf0 $intf1 deleted. ";
    fi
done
