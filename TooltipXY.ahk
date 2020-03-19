#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen



SetTimer, showToolTip, 5
Return


showToolTip:
    MouseGetPos, x, y
    PixelGetColor, color, %x%, %y%, RGB
    Tooltip, X = %x%`n y = %y%`nColor RGB = %color%
Return


^q::
    FormatTime, TimeString, T12, Time
    FileAppend, %TimeString%`n%A_Tab%X = %x%`n%A_Tab%Y = %y%`n%A_Tab%Color RGB = %color%`n, coordinates.txt
    ToolTip, Nameless Coordinates saved, 50, 1000,2
    SetTimer, RemoveToolTip2, -2000
Return


^e::
    ToolTip
    MouseGetPos, x, y
    InputBox, PosName, , , , 400, 100, %A_ScreenWidth%/2, %A_ScreenHeight%/2
    
    FormatTime, TimeString, T12, Time
    FileAppend, %TimeString%`n%A_Tab%X = %x%`n%A_Tab%Y = %y%`n%A_Tab%Color RGB = %color%`n, NamedCoordinates.txt
    ToolTip, "%PosName%" Coordinates saved, 300, 1000,3
    SetTimer, RemoveToolTip3, -2000
return    



RemoveToolTip2:
ToolTip, , , , 2
return

RemoveToolTip3:
ToolTip, , , , 3
return