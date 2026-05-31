:change to yours - TargetPath and WorkingDirectory

@echo off
powershell "$x=(New-Object -ComObject WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\LogScreenshot.lnk');$x.TargetPath='\\server\public\Apps\LogScreenshot\LogScreenshot.bat';$x.Arguments='';$x.WorkingDirectory ='\\server\public\Apps\LogScreenshot';$x.WindowStyle=7;$x.HotKey='Ctrl+Shift+Alt+J';$x.Save()"
