#!/bin/bash
pr=$(whiptail --inputbox "Project-Name" 8 78  --title "Project-Name" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $pr

echo "Project  $pr" > info
else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"
pt=$(whiptail --inputbox "Path For Instaliaion" 8 78  --title "Give-Path" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $pt

echo "Path $pt" >> info

else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"


work=$(whiptail --msgbox "Start Building???" 8 78  --title "OK/NO" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $work

mkdir $pr
cd $pr
mkdir -p $pt
mkdir DEBIAN
cp ../common/control DEBIAN/control
cp ../common/postinst DEBIAN/postinst
clear

else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"

con=$(whiptail --msgbox "Open COntrol-file???" 8 78  --title "OK/NO" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $con

echo "Opening control file";sleep 2
nano DEBIAN/control;

else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"

post=$(whiptail --msgbox "Open postinst???" 8 78  --title "OK/NO" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $post

echo "Opening post file";sleep 2
nano DEBIAN/postinst;
clear
else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"


deb=$(whiptail --msgbox "Making Deb file ???" 8 78  --title "OK/NO" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
        echo "User selected Ok and entered " $deb

echo "Copying Your Scripts"
cp ../script/* $pt
clear;sleep 2
chmod 0775 DEBIAN/postinst
chmod 0775 $pt/*
dpkg-deb --build ../$pr

else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"

exit





