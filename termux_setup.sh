#!/data/data/com.termux/files/usr/bin/bash
# Get a Termux environment set up quickly
clear
 
# Get the storage set up
termux-setup-storage
 
# Install some packages
apt install -y nano git openssh python python-dev python2 python2-dev coreutils proot ruby ruby-dev libllvm gsl g++ make libffi libffi-dev termux-exec openssl-dev libgmp-dev libev-dev c-ares-dev libcrypt-dev llvm
 
#update 
apt-get update&&apt-get upgrade

#install python3
pkg install python

#install git

pkg install git


#install nano 

pkg install nano

#set nano as default editor  

export EDITOR='nano'

#additional buttons
 
#mkdir $HOME/.termux/ ;echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> $HOME/.termux/termux.properties; termux-reload-properties;

#neo fetch 

pkg install neofetch&&neofetch

echo "That's all folks(°×°)"

