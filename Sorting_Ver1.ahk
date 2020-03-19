#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
;   







