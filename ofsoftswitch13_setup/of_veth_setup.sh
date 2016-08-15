echo ">>> Inserting data path... "
sleep 1 
ip link add name veth11 type veth peer name veth12 
ip link add name veth13 type veth peer name veth14
ip link add name veth15 type veth peer name veth16
ip link add name veth17 type veth peer name veth18
#ip link add name veth19 type veth peer name veth20
ifconfig veth11 up
ifconfig veth12 up
ifconfig veth13 up
ifconfig veth14 up
ifconfig veth15 up
ifconfig veth16 up
ifconfig veth17 up
ifconfig veth18 up
#ifconfig veth19 up
#ifconfig veth20 up
ifconfig | grep veth
#echo ">>> Inserting control path... "
#sleep 3 
#ip link add name veth99 type veth peer name veth100
#ifconfig veth99 up
#ifconfig veth100 up
echo ""
echo ">>> Done! Enjoy...  "
sleep 1
