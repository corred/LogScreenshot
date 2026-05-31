cd "$(dirname "$0")"

echo INSTALL LIBNOTIFY...
dnf install libnotify

echo INSTALL SMBCLIENT...
dnf install samba-client

echo INSTALL SCROT...
dnf install scrot
#or from rpm package
#dnf install lib64giblib1-1.2.4-20-omv4050.x86_64.rpm -y
#dnf install scrot-1.3-1-omv4002.x86_64.rpm -y

echo INSTALL LOGSCREENSHOT...
cp LogScreenshot.desktop /usr/share/applications
cp LogScreenshot.sh /usr/bin
chmod -R 777 /usr/bin/LogScreenshot.sh

echo INSTALL DONE
