#!/bin/bash

downloadlink=https://download.jetbrains.com/cpp/CLion-2021.2.2.tar.gz
name=clion
sudo apt -y install python-pip openjdk-11-jdk
rm $name.tar.gz
sudo rm -r /opt/$name
wget $downloadlink -O $name.tar.gz
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/
rm $name.tar.gz
sudo chmod +x /opt/$name/bin/$name.sh

echo "[Desktop Entry]
Type=Application
Name=$name
Icon=/opt/$name/bin/$name.svg
Exec=/opt/$name/bin/$name.sh %f
Categories=Development;IDE;
Terminal=false" > ~/.local/share/applications/$name.desktop
