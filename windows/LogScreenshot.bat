@echo off
echo Please minimize this window.

:change to yours
set workPath=\\server\public\apps\LogScreenshot
:change to yours
set savePath=\\server\public\shared files\support


set toDir=%savePath%\screen\%username%

:The delay is necessary to close the Start menu from which LogScreenshot is launched.
TIMEOUT /T 1

:SCREENSHOT ==============================
mkdir "%toDir%"
set screenFile=%toDir%\%date:~-4%-%date:~3,2%-%date:~0,2% %time:~0,2%-%time:~3,2%-%time:~6,2% %TIME:~9,2%.jpg
%workPath%\screenCapture.exe "%screenFile%"


:LOGS ==============================
:save application logs if needed
:change to yours
:example
:mkdir "%toDir%\myAppLog"
:set logFile=%HOMEDRIVE%%HOMEPATH%\myApp\logs\LogFile.%date:~-4%-%date:~3,2%-%date:~0,2%.0.log
:copy "%logFile%" "%toDir%\myAppLog\" /Y


:COMPLETED ==============================
:show message to user
:If this bat file is minimized, then a direct call to cscript will also hide the message box. 
:Therefore, we make a separate bat file for the message.

:success check
@If Exist "%screenFile%" (
	set msg=The screenshot was taken successfully.
) else (
	set msg=Screenshot NOT taken
)
start /min %workPath%\popup.bat "%workPath%" "%msg%"
