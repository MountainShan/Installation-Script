echo ">>> remove old OpenVSwitch...";
sleep 3;
apt-get remove openvswitch-common openvswitch-datapath-dkms openvswitch-controller openvswitch-pki openvswitch-switch;
echo ""
echo ">>> download new OpenVSwitch...";
sleep 3;
cd /root;
wget http://openvswitch.org/releases/openvswitch-2.5.0.tar.gz;
tar zxvf openvswitch-2.5.0.tar.gz;
echo ""
echo ">>> compile new OpenVSwitch...";
sleep 3;
cd openvswitch-2.5.0/;
./configure --prefix=/usr --with-linux=/lib/modules/'uname -r'/build;
make;
make install;
make modules_install;
rmmod openvswitch;
depmod -a;
/etc/init.d/openvswitch-controller stop;
update-rc.d openvswitch-controller disable;
/etc/init.d/openvswitch-switch start;
echo ""
echo ">>> show new OpenVSwitch version...";
sleep 3;
ovs-vsctl show;
modinfo openvswitch | grep version: ;
echo ""
echo ">>> Done! Enjoy..."
