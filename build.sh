#!/bin/bash
echo "For Help Contact at amzker@protonmail.com"
echo "Version 1.0 || Simple Builder";sleep 2 
pr="Amzker"
pt="usr/bin/"
user=$("whoami")
mkdir $pr
cd $pr
mkdir -p $pt
mkdir DEBIAN
cp ../common/control DEBIAN/control
cp ../common/postinst DEBIAN/postinst
clear
echo "Opening control file";sleep 2
nano DEBIAN/control;
clear;echo "Opening postinst script";sleep 2
nano DEBIAN/postinst
clear
echo "Copying Your Scripts"
cp ../script/* $pt
clear;sleep 2
chmod 0775 DEBIAN/postinst
chmod 0775 $pt/*
dpkg-deb --build ../$pr
