#change to yours
server=server
#change to yours
shareFolder=public
#change to yours
savePath="shared files/support"
#change to yours
smbLogin=login
#change to yours
smbPass=pass


#The delay is necessary to close the Menu from which LogScreenshot is launched.
sleep 1

#SCREENSHOT ==============================
screenFile="$(date +"%Y-%m-%d %H-%M-%S %2N").jpg"
scrot "/tmp/$screenFile"

smbclient //$server/$shareFolder -c "md \"$savePath/screen\"" -U $smbLogin%$smbPass
smbclient //$server/$shareFolder -c "md \"$savePath/screen/$USER\"" -U $smbLogin%$smbPass
smbclient //$server/$shareFolder -c "put \"/tmp/$screenFile\" \"$savePath/screen/$USER/$screenFile\"" -U $smbLogin%$smbPass

rm "/tmp/$screenFile"

#LOGS ==============================
#save application logs if needed
#change to yours
#example
#logPath="$HOME/myApp/logs"
#logFile="$(date +"LogFile.%Y-%m-%d.0.log")"
#smbclient //$server/$shareFolder -c "md \"$savePath/screen/$USER/myAppLog\"" -U $smbLogin%$smbPass
#smbclient //$server/$shareFolder -c "put \"$logPath/$logFile\" \"$savePath/screen/$USER/myAppLog/$logFile\"" -U $smbLogin%$smbPass



#COMPLETED ==============================
notify-send "The screenshot was taken successfully"
