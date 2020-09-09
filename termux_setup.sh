
#!/system/bin/sh
# Get a Termux environment set up quickly
clear

ver=V1.0_RC
vendor=$( getprop ro.product.brand)
model=$( getprop ro.product.model)
rom=$( getprop ro.build.display.id)
androidos=$( getprop ro.build.version.release)
id=$(id); id=${id#*=}; id=${id%%[\( ]*}
  
 echo "Vendor: $vendor"
 echo "Model: $model"
 echo "ROM: $rom"
 echo "Android Version: $androidos"
 
sleep 3s

echo "make sure to have a worrking internet connection "

sleep 2s

# Get the storage set up
echo "-------------------"
echo  "setting up storage"
echo "-------------------"

sleep 1s
termux-setup-storage
 
#update

echo  "--------------------"
echo  "  updating termux"
echo  "--------------------"

sleep 1s

apt-get update&&apt-get upgrade

# Install some packages
echo "---------------------------"
echo "installing some packages"
echo "---------------------------"
sleep 1s

apt install -y nano git openssh python python-dev python2 python2-dev coreutils proot ruby ruby-dev libllvm gsl g++ make libffi libffi-dev termux-exec openssl-dev libgmp-dev libev-dev c-ares-dev libcrypt-dev llvm

#install python3
echo " ------------------"
echo " installing python"
echo "-------------------"

sleep 1s
pkg install python3

#install git

echo "-----------------"
echo "installing git"
echo "-----------------"

sleep 1s

pkg install git


#install nano 

echo "----------------------------"
echo "Installing nano text editor"
echo "----------------------------"

sleep 1s
 
pkg install nano

#set nano as default editor  

export EDITOR='nano'

#additional buttons
 
#mkdir $HOME/.termux/ ;echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> $HOME/.termux/termux.properties; termux-reload-properties;

#neo fetch 

pkg install neofetch&&neofetch

echo "That's all folks(°×°)"

echo "-----------------------------------------"
echo "https://github.com/royalturd/Termux_setup"
echo "-----------------------------------------"


sleep 5s
 echo " Have a nice day (◔‿◔) "
sleep 3s

 exit
