#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

Gui, Add, Text,, Reset the following files:
Gui, Add, DropdownList,vwhattodo,Nothing||Nothing at all|Just nothing
Gui, Add, Button, gOk wp, Ok
Gui, Show, , This is the title
return

Ok:
Gui, Submit, Nohide
MsgBox, 64, %A_ScriptName%, You want to do '%whattodo%' with '%text%'
return