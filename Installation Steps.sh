echo "**Installing Yosys dependencies**"
apt update
apt install build-essential clang lld bison flex \
	  libreadline-dev gawk tcl-dev libffi-dev git \
	  graphviz xdot pkg-config python3 libboost-system-dev \
	  libboost-python-dev libboost-filesystem-dev zlib1g-dev --assume-yes

echo "**cloning yosys and will start installation of yosys**"
git clone https://github.com/YosysHQ/yosys.git
cd yosys
make
make install
cd


echo "**cloning OpenSTA and will start installation of OpenSTA**"
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
cd build
apt install cmake --assune-yes
apt update -y --assume-yes
apt install -y swig --assume-yes
cmake ..
make
make install
cd

##Install Icarus Iverilog
apt install -y autoconf gperf make gcc g++ bison flex
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
chmod 777 autoconf.sh
./autoconf.sh
./configure
make
make install
cd


echo "**Installing gtkwave**"
apt install gtkwave --assume-yes

#To install netlist viewer
cd
apt install npm --assume-yes
git clone https://github.com/nturley/netlistsvg.git
cd netlistsvg
npm install --legacy-peer-deps --assume-yes
npm install -g . --assume-yes
cd

# Magic required files
sudo apt-get update
sudo apt-get install m4 --assume-yes
sudo apt-get install tcsh --assume-yes
sudo apt-get install csh --assume-yes
sudo apt-get install libx11-dev --assume-yes
sudo apt-get install tcl-dev tk-dev --assume-yes
sudo apt-get install libcairo2-dev --assume-yes
sudo apt-get install mesa-common-dev libglu1-mesa-dev --assume-yes
sudo apt-get install libncurses-dev --assume-yes

git clone https://github.com/RTimothyEdwards/magic.git
cd magic
./configure
sudo make
sudo make install

# Openlane
sudo apt install python3.10-venv --assume-yes
echo
echo
echo "**cloning Openlane and will start installation of openlane**"
echo
echo
git clone https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane
sudo make
