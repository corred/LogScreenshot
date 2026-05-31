cd "$(dirname "$0")"

echo INSTALL LIBNOTIFY...
apt-get install libnotify-bin

echo INSTALL SMBCLIENT...
apt-get install smbclient

echo INSTALL SCROT...
apt-get install scrot -y

echo INSTALL LOGSCREENSHOT...
cp LogScreenshot.desktop /usr/share/applications
cp LogScreenshot.sh /usr/bin
chmod -R 777 /usr/bin/LogScreenshot.sh

echo INSTALL DONE
