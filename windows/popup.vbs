on error resume next
msg = Wscript.Arguments(0)
title = Wscript.Arguments(1)
sec = Wscript.Arguments(2)
 
WScript.CreateObject("WScript.Shell").Popup msg, sec, title, vbOkOnly + vbInformation
