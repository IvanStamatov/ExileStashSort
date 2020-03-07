#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include tf.ahk
#Persistent
#SingleInstance force

x = 
y =
clipboard = 

^f::
IfWinActive, Path of Exile
   {
       Goto, SortStash
   }
Return

SortStash:
{
    FileDelete, clipboardtext.txt
    Send {Left 20}
    MouseGetPos, x, y,
    Send ^c
    ClipWait
    FileAppend, %clipboard%, clipboardtext.txt
    clipboard =

    mapFind = % TF_Find("clipboardtext.txt", "", "", "Map Tier:")
    if(mapFind > 0)
    {
        WinActivate, Path of Exile
        Send {Right}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 100,1
        SetTimer, RemoveToolTip1, -3000
        x =
        y =
    }

    essFind = % TF_Find("clipboardtext.txt", "", "", "Essence")
    if(essFind > 0)
    {
        WinActivate, Path of Exile
        Send {Right 3}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left 3}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 200,2
        SetTimer, RemoveToolTip2, -3000
        x =
        y =
    }

    scFind = % TF_Find("clipboardtext.txt", "", "", "Scarab")
    if(scFind > 0)
    {
        WinActivate, Path of Exile
        Send {Right 2}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left 2}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 300, 3
        SetTimer, RemoveToolTip3, -3000
        x =
        y =
    }

    cardFind = % TF_Find("clipboardtext.txt", "", "", "Divination Card")
    if(cardFind > 0)
    {
        WinActivate, Path of Exile
        Send {Right 4}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left 4}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 400, 4
        SetTimer, RemoveToolTip4, -3000
        x =
        y =
    }

    vaalFind = % TF_Find("clipboardtext.txt", "", "", "Souls Per Use:")
    if(vaalFind > 0)
    {
        WinActivate, Path of Exile
        Send {Right 5}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left 5}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 500,5
        SetTimer, RemoveToolTip5, -3000
        x =
        y =
    }

    qg1Find = % TF_Find("clipboardtext.txt", "", "", "Quality:")
    qg2Find = % TF_Find("clipboardtext.txt", "", "", "Rarity: Gem")
    if(qg1Find > 0) && (qg2Find > 0)
    {
        WinActivate, Path of Exile
        Send {Right 6}
        MouseMove, x, y, 50
        Send, {Ctrl Down}{Click}{Ctrl up}
        Send {Left 6}
        FileReadLine, itemName, clipboardtext.txt, 2
        ToolTip, %itemName% is stashed, 100, 500,5
        SetTimer, RemoveToolTip5, -3000
        x =
        y =
    }

    TF_RemoveLines("clipboardtext.txt", 1,50)
    FileDelete, clipboardtext.txt
    FileMove, clipboardtext_copy.txt, clipboardtext.txt
    
    x =
    y =
}
Return


RemoveToolTip1:
ToolTip,,,,1
return
RemoveToolTip2:
ToolTip,,,,2
return
RemoveToolTip3:
ToolTip,,,,3
return
RemoveToolTip4:
ToolTip,,,,4
return
RemoveToolTip5:
ToolTip,,,,5
return
RemoveToolTip6:
ToolTip,,,,6
return


OnExit("ExitCleanUp")
Return

ExitCleanUp:
{
    FileDelete, clipboardtext.txt
}

