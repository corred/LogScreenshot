# LogScreenshot
LogScreenshot is a simple script for Windows and Linux that takes screenshots and logs of the required programs in one step. Can be used as a technical support tool for servicing a large number of computers. To take a screenshot and logs and immediately send them to the technical support department, the user only needs to do one thing: run the application (script) from the Start menu.

## How does this work
1) The user sees a problem in his work application
2) Click Start menu -> LogScreenshot
3) The screenshot and logs are immediately saved to a shared folder on the server. The user no longer interacts with LogScreenshot.

## Installation for Windows
1) Download the LogScreenshot\windows folder from the repository.
screenCapture.exe - this is a console application for taking screenshots, compiled from this bat file: https://github.com/npocmaka/batch.scripts/blob/master/hybrids/.net/c/screenCapture.bat
2) Save the Log Screenshot folder either locally on the user's computer or in a shared folder on the server.
3) change in LogScreenshot.bat:
workPath - The working folder where LogScreenshot is located
savePath - where screenshots and logs will be placed
4) Create a shortcut for LogScreenshot.bat. The shortcut should point to the working folder, with the window mode set to Minimized. You can add hotkeys.
Place it in the Start menu.

You can also use CreateLink.bat, which will automatically create a shortcut. This can be used, for example, in AD group policies on the server for specific workstations.
Or simply in PowerShell:
```
powershell "$x=(New-Object -ComObject WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\LogScreenshot.lnk');$x.TargetPath='\\server\public\Apps\LogScreenshot\LogScreenshot.bat';$x.Arguments='';$x.WorkingDirectory ='\\server\public\Apps\LogScreenshot';$x.WindowStyle=7;$x.HotKey='Ctrl+Shift+Alt+J';$x.Save()"
```

## Installation for Linux
1) Install Libnotify, smbclient, Scrot
Debian
```
$ sudo apt-get install libnotify-bin smbclient scrot -y
```
Centos
```
$ sudo dnf install libnotify samba-client scrot -y
```

2) Install LogScreenshot
Download LogScreenshot.desktop and LogScreenshot.sh from the LogScreenshot\linux folder in the repository.

Open LogScreenshot.sh for editing.
```
$ sudo nano LogScreenshot.sh
```
Change server, shareFolder, savePath, smbLogin, and smbPass to your own information. Screenshots will be saved to the shared folder on the SMB server.

Copy to your work computer
```
$ sudo cp LogScreenshot.desktop /usr/share/applications
$ sudo cp LogScreenshot.sh /usr/bin
$ sudo chmod -R 777 /usr/bin/LogScreenshot.sh
```