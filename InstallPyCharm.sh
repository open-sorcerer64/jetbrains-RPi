#!/bin/bash

#Defining Variables
downloadlink=https://download.jetbrains.com/python/pycharm-community-2021.2.2.tar.gz
name=pycharm-community

# Get dependencies
sudo apt -y install python-pip openjdk-11-jdk

#Removing if pycharm-community-2021.2.2.tar.gz already downloaded
rm $name.tar.gz

#Removing pycharm-community-2021.2.2.tar.gz if already extracted
sudo rm -r /opt/$name

#Downloading pycharm-community-2021.2.2.tar.gz
wget $downloadlink -O $name.tar.gz

#Extracting pycharm-community-2021.2.2.tar.gz to /opt
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/

#Deleting pycharm-community-2021.2.2.tar.gz
rm $name.tar.gz

#Making file executable
sudo chmod +x /opt/$name/bin/pycharm.sh

#Implementing terminal fix
git clone https://github.com/JetBrains/pty4j.git ~/pty4j
cd ~/pty4j/native
gcc -fPIC -c *.c
gcc -shared -o libpty.so *.o
sudo mkdir /opt/$name/lib/pty4j-native/linux/arm
sudo cp libpty.so /opt/$name/lib/pty4j-native/linux/arm
sudo rm -r ~/pty4j

#Creating desktop shortcut
echo "[Desktop Entry]
Type=Application
Name=PyCharm Community Edition
Icon=/opt/$name/bin/pycharm.svg
Exec=/opt/$name/bin/pycharm.sh %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce" > ~/.local/share/applications/jetbrains-pycharm-ce.desktop

