#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
CoordMode, Pixel, screen
CoordMode, Mouse, screen

; Plan
;   Control and left click 
;   Select an area of the screen
;   Sort all items found in that area
;   Mark check spots every %% spaces from X1/Y1 to X1/Y2
;       %% - a bit less or equal to a single square of the inventory
;   Check marked check spots with Ctrl C and make an object filter
;   Depending on what the object is, go to specific stash tab and deposit item


;   ? Hardcode stuff and try to make them dynamic later on ?
;   Have a window to select which stash tab is for which type of items
;   Future idea - set child sorting filters
;       - Example : For gems, sort quality gems at the bottom or make groups that equal 20% quantity or sort by color
;   
;   

#NoEnv
SetBatchLines, -1 ; For speed in general
SetWinDelay, -1   ; For speed of WinMove
BW := 3           ; Border width (and height) in pixels
BC := "Aqua"       ; Border color

OriginalX1 :=
OriginalX2 :=
OriginalY1 :=
OriginalY2 :=
OriginalW := 
OriginalH :=
; ______________________________________________________________________________________________________________________
FirstCall := True
CoordMode, Mouse, Screen
Gui, -Caption +ToolWindow +LastFound +AlwaysOnTop
Gui, Color, %BC%
Return
; ______________________________________________________________________________________________________________________
^LButton::
    MouseGetPos, OriginX, OriginY
    OriginalX1 := OriginX
    OriginalY1 := OriginY
	WinGetActiveStats, Title, WindowWidth, WindowHeight, WindowX, WindowY
    SetTimer, DrawRectangle, 5
Return
; ______________________________________________________________________________________________________________________
^LButton Up::
    SetTimer, DrawRectangle, Off
    FirstCall := True
    Gui, Cancel
    ToolTip
    ;MsgBox, 0, Coordinates, X = %X1%  -  Y = %Y1%  -  W = %W1%  -  H = %H1%
    ;MsgBox, 0, relative: %Title%, % "X = " X1-WindowX  "  -  Y = " Y1-WindowY

    MouseGetPos, endX2, endY2
    OriginalX2 := endX2
    OriginalY2 := endY2

    ;MsgBox, OriginalX1 = %OriginalX1% `nOriginalY1 = %OriginalY1% `nOriginalX2 = %OriginalX2% `nOriginalY2 = %OriginalY2%
    OriginalW := OriginalX2 - OriginalX1
    OriginalH := OriginalY2 - OriginalY1
    ;MsgBox, width %OriginalW% `n height %OriginalH%
    ;MsgBox, w%OriginalW% h%OriginalH% x%OriginalX1% y%OriginalY1%
    ;GUIMainRectangle(OriginalW, OriginalH, OriginalX1, OriginalY1) 
    Gui, New
    Gui, Color, EEAA99
    Gui +LastFound +AlwaysOnTop +ToolWindow
    Gui -Caption
    WinSet, Transparent, 50
    Gui Show, 
    WinMove,,,%OriginalX1%, %OriginalY1%, %OriginalW%, %OriginalH%

    ;OriginalX1, OriginalY1, OriginalX2, OriginalY2
    ;MouseMove, OriginalX1, OriginalY1,
    ;While, OriginalY1 < OriginalY2
    ;{
    ;Sleep, 500
    ;OriginalY1 := OriginalY1 + 25
    ;MouseMove, OriginalX1, OriginalY1,
    ;}

    ; cycle thhough the pixel points
    ; ctrl c to check item 

Return
; ______________________________________________________________________________________________________________________
DrawRectangle:
   MouseGetPos, X2, Y2
   
   ; Has the mouse moved?
   If (XO = X2) And (YO = Y2)
      Return
   Gui, +LastFound
   XO := X2, YO := Y2
   ; Allow dragging to the left of the click point.
   If (X2 < OriginX)
      X1 := X2, X2 := OriginX
   Else
      X1 := OriginX
   ; Allow dragging above the click point.
   If (Y2 < OriginY)
      Y1 := Y2, Y2 := OriginY
   Else
      Y1 := OriginY
   ; Draw the rectangle
   W1 := X2 - X1, H1 := Y2 - Y1
   W2 := W1 - BW, H2 := H1 - BW
   WinSet, Region, 0-0 %W1%-0 %W1%-%H1% 0-%H1% 0-0  %BW%-%BW% %W2%-%BW% %W2%-%H2% %BW%-%H2% %BW%-%BW%
   If (FirstCall) {
      Gui, Show, NA x%X1% y%Y1% w%W1% h%H1%
      FirstCall := False
   }
   WinMove, , , X1, Y1, W1, H1
   ; ToolTip, %X1% - %Y1% - %X2% - %Y2%
Return





; 1 inventory square is 50x50 pixels 
; so start clicking every 50 pixels from the top x1y1 until x1y2




GUIMainRectangle(w, h, x, y)
{
    MsgBox, in rectangle function w%w% h%h% x%x% y%y%
    Gui, New
    Gui, Color, EEAA99
    Gui +LastFound +AlwaysOnTop +ToolWindow
    Gui -Caption
    WinSet, Transparent, 50
    Gui Show, w%w% h%h% x%x% y%y%
}
Return





