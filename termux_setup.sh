#!/system/bin/sh
# Get a Termux environment set up quickly

RED='\033[0;31m' # Red
NC='\033[0m' # No Color
clear

#timestamp
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
echo "$TIMESTAMP"

sleep 2s

#Device info 
echo -e "DEVICE INFORMATION"

ver=V1.0_RC
vendor=$( getprop ro.product.brand)
model=$( getprop ro.product.model)
rom=$( getprop ro.build.display.id)
androidos=$( getprop ro.build.version.release)
id=$(id); id=${id#*=}; id=${id%%[\( ]*}

# Rooted
if [ "$id" = "0" ] || [ "$id" = "root" ]; then
rootin="Rooted "
else
rootin="\e ${RED} Not Rooted\e ${NC}"
fi;
  
 echo -e "Vendor: ${RED} $vendor ${NC}"
 echo -e "Model: ${RED} $model ${NC}"
 echo -e "ROM:  ${RED} $rom ${NC}"
 echo -e "Android Version: ${RED} $androidos ${NC}"
 echo -e "Root Info: ${RED} $rootin ${NC}" 
sleep 3s

echo "  make sure to have a worrking internet connection  "

#install wget 

echo "-----------------"
echo "installing Wget"
echo "-----------------"

 apt install wget

sleep 2s


# Get the storage set up
echo "-------------------"
echo "setting up storage"
echo "-------------------"

sleep 1s
termux-setup-storage
 
#update

echo  "--------------------"
echo  "updating termux"
echo  "--------------------"

sleep 1s

apt-get update&&apt-get upgrade

# Install some packages
echo "---------------------------"
echo "installing open ssh"
echo "---------------------------"
sleep 1s

pkg install openssh

#install python3
echo "------------------"
echo "installing python"
echo "-------------------"

sleep 1s
pkg install python

#install git

echo "-----------------"
echo "installing git"
echo "-----------------"

sleep 1s

pkg install git


#install nano 

echo "----------------------------"
echo "Installing nano text editor"
echo "---------------------------"

sleep 1s
 
pkg install nano

#set nano as default editor  

export EDITOR='nano'

#additional buttons

echo "-----------------------"
echo "Adding more  buttons"
echo "-----------------------" 
mkdir $HOME/.termux/ ;echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" 
sleep 2s

#speedtest  (https://github.com/sivel/speedtest-cli)

echo -n "checking internet speed........."
sleep 1s
echo -e "Getting files......"
sleep 1s
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
./speedtest-cli
sleep 2s

#neo fetch 

pkg install neofetch&&neofetch

echo "That's all folks(°×°)"

echo "-----------------------------------------"
echo "https://github.com/royalturd/Termux_setup"
echo "-----------------------------------------"


sleep 5s
 echo " Have a nice day (◔‿◔) "

 exit

