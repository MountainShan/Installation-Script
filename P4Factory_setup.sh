# P4 Installation
# This is a installation shell script for newer install P4 language easily.
# For more detail, please send a Email to wongtingshan111@hotmail.com
echo "\n================================"
echo "= Downloading the Github tools ="
echo "================================\n"
sudo sed -i 's/tw.archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list
sudo apt-get update;
sudo apt-get install git -y;
echo "\n============================="
echo "= Downloading the P4Factory ="
echo "=============================\n"
git clone https://github.com/p4lang/p4factory;
cd p4factory;
git submodule update --init --recursive;
./install_deps.sh;
sudo tools/veth_setup.sh;
./autogen.sh;
./configure;
cd ~/;
echo "\n==================="
echo "= Installation done="
echo "=====================\n"



