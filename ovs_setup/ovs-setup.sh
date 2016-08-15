echo ">>> Setup OpenVSwith Environment..."
sleep 3
ovs-vsctl add-br UA-br 
ovs-vsctl add-port UA-br veth11
ovs-vsctl add-port UA-br veth13
ovs-vsctl add-port UA-br veth15
ovs-vsctl add-port UA-br veth17
ovs-vsctl add-port UA-br veth19
ovs-vsctl set-controller UA-br tcp:127.0.0.1:6633
ovs-vsctl set bridge UA-br protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13

sudo ovs-ofctl show UA-br
echo ""
echo ">>> Done! Enjoy...  "
sleep 3 
