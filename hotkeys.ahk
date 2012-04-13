;Settings
#SingleInstance force
#HotkeyInterval 0
#InstallKeybdHook
#UseHook On
#MaxThreads 20
SetBatchLines, -1
SetKeyDelay , -1, -1
#Persistent

;Variables
ShowAHp := False
ShowEHp := False
DWK := True
EQC := True
NUM1=!Z
NUM2=!X
NUM4=!A
NUM5=!S
NUM7=!Q
NUM8=!W
enhotkeys := True

tab := 1

;Quick Command Variables
QCVF5 := "-di"
QCVF6 := "-rd"
QCVF7 := "-ma"
QCVF8 := "-apm"

;Ini
ifExist, %A_WorkingDir%\dotahotkeys.ini
{
  IniRead, ShowAHP, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowAHP
  IniRead, ShowEHP, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowEHP
  IniRead, DWK, %A_WorkingDir%\dotahotkeys.ini, Settings, DWK
  IniRead, EQC, %A_WorkingDir%\dotahotkeys.ini, Settings, EQC
  IniRead, enhotkeys, %A_WorkingDir%\dotahotkeys.ini, Settings, enhotkeys
  IniRead, NUM1, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM1
  IniRead, NUM2, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM2
  IniRead, NUM4, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM4
  IniRead, NUM5, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM5
  IniRead, NUM7, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM7
  IniRead, NUM8, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM8
  IniRead, QCVF5, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF5
  IniRead, QCVF6, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF6
  IniRead, QCVF7, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF7
  IniRead, QCVF8, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF8
} else {
  IniWrite, %ShowAHP%, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowAHP
  IniWrite, %ShowEHP%, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowEHP
  IniWrite, %DWK%, %A_WorkingDir%\dotahotkeys.ini, Settings, DWK
  IniWrite, %EQC%, %A_WorkingDir%\dotahotkeys.ini, Settings, EQC
  IniWrite, %enhotkeys%, %A_WorkingDir%\dotahotkeys.ini, Settings, enhotkeys
  IniWrite, %NUM1%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM1
  IniWrite, %NUM2%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM2
  IniWrite, %NUM4%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM4
  IniWrite, %NUM5%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM5
  IniWrite, %NUM7%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM7
  IniWrite, %NUM8%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM8
  IniWrite, %QCVF5%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF5
  IniWrite, %QCVF6%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF6
  IniWrite, %QCVF7%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF7
  IniWrite, %QCVF8%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF8
}

;Menu
Menu, tray, tip, DotaHotKeys v1.06b
Menu, tray, NoStandard
Menu, tray, DeleteAll
Menu, tray, add, showahp
Menu, tray, Rename, showahp, Show Ally HP
Menu, tray, add, showehp
Menu, tray, Rename, showehp, Show Enemy HP
Menu, tray, add
Menu, tray, add, dwk
Menu, tray, Rename, dwk, Disable Windows Key
Menu, tray, add
Menu, tray, add, eqc
Menu, tray, Rename, eqc, Enable Quick Chat
Menu, tray, add, editqc
Menu, tray, Rename, editqc, Edit Quick Chat
Menu, tray, add
Menu, tray, add, enhotkeys
Menu, tray, Rename, enhotkeys, Enable Hotkeys
Menu, tray, add, edithk
Menu, tray, Rename, edithk, Edit Hotkeys
Menu, tray, add
Menu, tray, add, Help
Menu, tray, add, About
Menu, tray, add
Menu, tray, add, Pause
Menu, tray, add, Exit
Menu, tray, Icon,,, 1

if (showahp == true)
Menu, tray, check, Show Ally HP
if (showehp == true)
Menu, tray, check, Show Enemy HP
if (dwk == true)
Menu, tray, check, Disable Windows Key
if (eqc == true)
Menu, tray, check, Enable Quick Chat
if (enhotkeys == true){
  Menu, tray, check, Enable Hotkeys
  GoSub,Inithotkeys
}
return

InitHotkeys:
Hotkey, IfWinActive, Warcraft III
;Hotkeys
if (NUM1 != "") {
  Hotkey, %NUM1%, numpad1, On
}
if (NUM2 != "") {
  Hotkey, %NUM2%, numpad2, On
}
if (NUM4 != "") {
  Hotkey, %NUM4%, numpad4, On
}
if (NUM5 != "") {
  Hotkey, %NUM5%, numpad5, On
}
if (NUM7 != "") {
  Hotkey, %NUM7%, numpad7, On
}
if (NUM8 != "") {
  Hotkey, %NUM8%, numpad8, On
}
Hotkey, IfWinActive,
REturn

Hotkeysoff:
Hotkey, IfWinActive, Warcraft III
if (NUM1 != "") {
  Hotkey, %NUM1%, Off
}
if (NUM2 != "") {
  Hotkey, %NUM2%, Off
}
if (NUM4 != "") {
  Hotkey, %NUM4%, Off
}
if (NUM5 != "") {
  Hotkey, %NUM5%, Off
}
if (NUM7 != "") {
  Hotkey, %NUM7%, Off
}
if (NUM8 != "") {
  Hotkey, %NUM8%, Off
}
Hotkey, IfWinActive,
Return
numpad1:
numpad2:
numpad4:
numpad5:
numpad7:
numpad8:
Send,{%a_thislabel%}
REturn

;Settings GUI
edithk:
Gui, +Default -MinimizeBox -MaximizeBox
Gui, 3:Add, Text, x8 y13 w20 h20 , 7
Gui, 3:Add, Text, x108 y13 w20 h20 , 8
Gui, 3:Add, Text, x8 y43 w20 h20 , 4
Gui, 3:Add, Text, x108 y43 w20 h20 , 5
Gui, 3:Add, Text, x8 y73 w20 h20 , 1
Gui, 3:Add, Text, x108 y73 w20 h20 , 2
Gui, 3:Add, Hotkey, vNUM1 x26 y70 w70 h20 , %NUM1%
Gui, 3:Add, Hotkey, vNUM2 x126 y70 w70 h20 , %NUM2%
Gui, 3:Add, Hotkey, vNUM4 x26 y40 w70 h20 , %NUM4%
Gui, 3:Add, Hotkey, vNUM5 x126 y40 w70 h20 , %NUM5%
Gui, 3:Add, Hotkey, vNUM7 x26 y10 w70 h20 , %NUM7%
Gui, 3:Add, Hotkey, vNUM8 x126 y10 w70 h20 , %NUM8%
Gui, 3:Add, Button, x6 y100 w90 h20 , OK
Gui, 3:Add, Button, x106 y100 w90 h20 , Cancel
Gui, 3:Show, h133 w208, Hotkeys
Return

editqc:
Gui, +Default -MinimizeBox -MaximizeBox
Gui, 4:Add, Text, x6 y14 w30 h20 , F5
Gui, 4:Add, Text, x106 y14 w30 h20 , F6
Gui, 4:Add, Text, x6 y54 w30 h20 , F7
Gui, 4:Add, Text, x106 y54 w30 h20 , F8
Gui, 4:Add, Edit, vQCVF5 x6 y30 w90 h20 , %QCVF5%
Gui, 4:Add, Edit, vQCVF6 x106 y30 w90 h20 , %QCVF6%
Gui, 4:Add, Edit, vQCVF7 x6 y70 w90 h20 , %QCVF7%
Gui, 4:Add, Edit, vQCVF8 x106 y70 w90 h20 , %QCVF8%
Gui, 4:Add, Button, x6 y100 w90 h20 , OK
Gui, 4:Add, Button, x106 y100 w90 h20 , Cancel
Gui, 4:Show, h133 w208, Quick Chat
Return

3ButtonOK:
Gosub,Hotkeysoff
Gui, 3:Submit
GoSub,InitHotkeys
IniWrite, %NUM1%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM1
IniWrite, %NUM2%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM2
IniWrite, %NUM4%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM4
IniWrite, %NUM5%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM5
IniWrite, %NUM7%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM7
IniWrite, %NUM8%, %A_WorkingDir%\dotahotkeys.ini, Hotkeys, NUM8
Gui, 3:Destroy
return

4ButtonOK:
IniWrite, %QCVF5%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF5
IniWrite, %QCVF6%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF6
IniWrite, %QCVF7%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF7
IniWrite, %QCVF8%, %A_WorkingDir%\dotahotkeys.ini, QChat, QCVF8
Gui, 4:Destroy
return


3ButtonCancel:
GuiClose:
GuiEscape:
Gui, Cancel
Gui, Destroy
return

4ButtonCancel:
Gui, Cancel
Gui, Destroy
return

lwin::
ifWinActive, Warcraft III
{
  if (DWK == True)
  {
    return
  } else {
    Send {lwin}
    return
  }
} else {
  Send {lwin}
  return
}
rwin::
if (DWK == True)
{
  if (DWK == True)
  {
    return
  } else {
    Send {rwin}
    return
  }
} else {
  Send {rwin}
  return
}

;Toggle Ally HP
showahp:
if (ShowAHP == True)
  {
    ShowAHp := False
    Menu, tray, uncheck, Show Ally HP
  }
  else if (ShowAHP == False)
  {
    ShowAHp := True
    Menu, tray, check, Show Ally HP
}
IniWrite, %ShowAHP%, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowAHP
return

;Toggle Enemy HP
showehp:
if (ShowEHP == True)
  {
    ShowEHp := False
    Menu, tray, uncheck, Show Enemy HP
  }
  else if (ShowEHP == False)
  {
    ShowEHp := True
    Menu, tray, check, Show Enemy HP
}
IniWrite, %ShowEHP%, %A_WorkingDir%\dotahotkeys.ini, HPBars, ShowEHP
return

;Toggle Disable Windows Key
dwk:
if (DWK == True)
  {
    DWK := False
    Menu, tray, uncheck, Disable Windows Key
  }
  else if (DWK == False)
  {
    DWK := True
   Menu, tray, check, Disable Windows Key
}
IniWrite, %DWK%, %A_WorkingDir%\dotahotkeys.ini, Settings, DWK
return

;Toggle Enable Quick Chat
eqc:
if (EQC == True)
  {
    EQC := False
    Menu, tray, uncheck, Enable Quick Chat
  }
  else if (EQC== False)
  {
    EQC := True
   Menu, tray, check, Enable Quick Chat
}
IniWrite, %EQC%, %A_WorkingDir%\dotahotkeys.ini, Settings, EQC
return

;Quick Command Hotkeys
F5::
ifWinActive, Warcraft III
{
  if (EQC == True && QCVF5 != "")
  {
    Send {Enter}
    Send %QCVF5%
    Send {Enter}
    return
  } else {
    Send {F5}
   return
  }
} else {
  Send {F5}
}
F6::
ifWinActive, Warcraft III
{
  if (EQC == True && QCVF5 != "")
  {
    Send {Enter}
    Send %QCVF6%
    Send {Enter}
    return
  } else {
    Send {F6}
   return
  }
} else {
  Send {F5}
}
F7::
ifWinActive, Warcraft III
{
  if (EQC == True && QCVF5 != "")
  {
    Send {Enter}
    Send %QCVF7%
    Send {Enter}
    return
  } else {
    Send {F7}
   return
  }
} else {
  Send {F5}
}
F8::
ifWinActive, Warcraft III
{
  if (EQC == True && QCVF5 != "")
  {
    Send {Enter}
    Send %QCVF8%
    Send {Enter}
    return
  } else {
    Send {F8}
   return
  }
} else {
  Send {F5}
}
return

enhotkeys:
if (enhotkeys == True)
{
  Menu, tray, uncheck, Enable Hotkeys
  enhotkeys := False
  Gosub,Hotkeysoff
} else {
  Menu, tray, check, Enable Hotkeys
  enhotkeys := True
  Gosub,initHotkeys
}
IniWrite, %enhotkeys%, %A_WorkingDir%\dotahotkeys.ini, Settings, enhotkeys
return

;Help Window
Help:
Gui, 2:+Default -MinimizeBox -MaximizeBox
Gui, 2:Add, Text, x10 y10 w200 h20 , Use Ctrl+Cap Locks while Ingame to
Gui, 2:Add, Text, x10 y25 w200 h20 , activate the HP Bars.
Gui, 2:Add, Text, x10 y40 w200 h20 , Quick Chat:
Gui, 2:Add, Text, x10 y55 w200 h20 , F5 = %QCVF5%
Gui, 2:Add, Text, x10 y70 w200 h20 , F6 = %QCVF6%
Gui, 2:Add, Text, x10 y85 w200 h20 , F7 = %QCVF7%
Gui, 2:Add, Text, x10 y100 w200 h20 , F8 = %QCVF8%
Gui, 2:Show, h125 w200, Help
return

;About Window
About:
Gui, 3:+Default -MinimizeBox -MaximizeBox
Gui, 3:Add, Picture, x10 y15 w32 h32 , %A_WorkingDir%\%A_ScriptName%
Gui, 3:Add, Text, x50 y10 w200 h20 , Dota Hot Keys v1.06b
Gui, 3:Add, Text, x50 y25 w200 h20 , By Vinthian (vinthian@gmail.com)
Gui, 3:Add, Text, x50 y40 w200 h20 , Version Date: July 21`, 2008
Gui, 3:Show, h65 w220, About
return

;Pause
Pause:
Menu, tray, togglecheck, Pause
Pause, Toggle
return

Exit:
ExitApp
return

OnExit, ExitSub
return

ExitSub:
ExitApp

;Ingame Activation
^Capslock::
ifWinActive, Warcraft III
{
  if (ShowAHP == True)
  {
    Send, {[ Down}
  }
  if (ShowEHP == True)
  {
    Send, {] Down}
  }
}
return