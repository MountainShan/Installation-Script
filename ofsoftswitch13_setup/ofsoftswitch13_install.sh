echo ">>> install dependencies...";
sleep 3
sudo apt-get install -y git-core autoconf automake autotools-dev pkg-config make gcc g++ libtool libc6-dev cmake \
						libpcap-dev libxerces-c3.1 libxerces-c-dev libxerces-c-doc libxerces-c-samples  unzip libpcre3-dev flex bison libboost-dev;
wget -nc http://de.archive.ubuntu.com/ubuntu/pool/main/b/bison/bison_2.5.dfsg-2.1_amd64.deb \
		 http://de.archive.ubuntu.com/ubuntu/pool/main/b/bison/libbison-dev_2.5.dfsg-2.1_amd64.deb;
sudo dpkg -i bison_2.5.dfsg-2.1_amd64.deb libbison-dev_2.5.dfsg-2.1_amd64.deb;
rm bison_2.5.dfsg-2.1_amd64.deb libbison-dev_2.5.dfsg-2.1_amd64.deb;
sleep 3
echo ">>> install nbeesrc...";
sleep 3
wget -nc http://www.nbee.org/download/nbeesrc-jan-10-2013.zip;
unzip nbeesrc-jan-10-2013.zip;
cd nbeesrc-jan-10-2013/src;
cmake .;
make;
sudo cp ../bin/libn*.so /usr/local/lib;
sudo ldconfig;
sudo cp -R ../include/* /usr/include/;
cd ~;
echo ">>> install OF Soft Switch 13...";
sleep 3
git clone https://github.com/CPqD/ofsoftswitch13.git;
cd ofsoftswitch13;
git checkout d174464dcc414510990e38426e2e274a25330902;
./boot.sh;
./configure;
make;
sudo make install;
cd ~;
echo ""
echo ">>> Done! Enjoy...  "
sleep 3
