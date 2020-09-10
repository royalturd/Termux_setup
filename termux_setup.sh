#!/system/bin/sh
# Get a Termux environment set up quickly

: <<'notice'
 *
 * Script information:
 * Personal Termux-setup script.
 *
 * SPDX-License-Identifier: GPL-3.0
 *
 * Copyright (C) Rudra Pratap Singh <samridhh.rudra@hotmail.com>
 *
notice
# Color Code 
Black='\e[0;30m'        # Black          
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
RED='\033[0;31m'        # Red
NC='\033[0m'            # No Color
clear

#timestamp

TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
echo -e "$Cyan  $TIMESTAMP $NC"
Time=$(TZ=Asia/kolkata date +'%H%M-%d%m%y')
DATE=`date`
START=$(date +"%s")

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

echo -e "$Cyan make sure to have a worrking internet connection$NC "

#install wget 

echo -e "$Blue-----------------"
echo -e "installing Wget"
echo -e "-----------------$NC"

 apt install wget

sleep 2s


# Get the storage set up
echo -e "$Blue-------------------"
echo -e "setting up storage"
echo -e "-------------------$NC"

sleep 1s
termux-setup-storage
 
#update

echo -e "$Blue--------------------"
echo -e  "updating termux"
echo -e "--------------------$NC"

sleep 1s

apt-get update&&apt-get upgrade

# Install some packages
echo -e "$Blue---------------------------"
echo -e "installing openssh"
echo -e "---------------------------$NC"
sleep 1s

pkg install openssh

#install python3
echo -e "$Blue------------------"
echo -e "installing python"
echo -e "-------------------$NC"

sleep 1s
pkg install python

#install git

echo -e "$Blue-----------------"
echo -e "installing git"
echo -e "-----------------$NC"

sleep 1s

pkg install git

#echo -e "$Blue-----------------"
#echo -e "setting up git "
#echo -e "---------------$NC"
#sleep 1s

#git config --global user.email "enter your email""
#git config --global user.name "enter your name""


#install nano 

echo -e "$Blue----------------------------"
echo -e "Installing nano text editor"
echo -e "---------------------------$NC"

sleep 1s
 
pkg install nano

#set nano as default editor  
echo -e "$Blue---------------"
echo -e "setting up nano"
echo -e "---------------$NC"
export EDITOR='nano'
git config --global core.editor "nano"
sleep 1s
#additional buttons

echo -e "$Blue-----------------------"
echo -e "Adding more  buttons"
echo -e "-----------------------$NC" 
mkdir $HOME/.termux/ ;echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" 
sleep 2s

#speedtest  (https://github.com/sivel/speedtest-cli)

echo -e  "$Green checking internet speed.........$NC"
sleep 1s
echo  "Getting files......"
sleep 1s
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
./speedtest-cli
sleep 2s

#neo fetch 

pkg install neofetch&&neofetch

echo "That's all folks(°×°)"

echo -e "$Cyan-----------------------------------------"
echo -e "https://github.com/royalturd/Termux_setup"
echo -e "-----------------------------------------$NC"


sleep 5s
 echo " Have a nice day (◔‿◔) "

END=$(date +"%s")
DIFF=$(($END - $START))

echo -e " Time taken $Cyan  $DIFF s $NC "
 exit


