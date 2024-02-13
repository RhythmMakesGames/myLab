﻿; ----------------------------------------------------------------------------------------------------

; A cool AHK script to make your life easier.

; Press Win+R, then run "shell:startup" to open the Startup folder.
; Place a shortcut to this script in the Startup folder to run automatically at startup.

; Remapping: https://www.autohotkey.com/docs/v2/misc/Remap.htm
; Triple custom hotkey: https://www.autohotkey.com/docs/v2/howto/WriteHotkeys.htm#Custom_Combinations
; Hotkey modifiers: https://www.autohotkey.com/docs/v2/Hotkeys.htm#Symbols
; Testing: https://www.mechanical-keyboard.org/key-rollover-test/

; ----------------------------------------------------------------------------------------------------

#Requires AutoHotkey v2.0

;* Remappings
CapsLock::RCtrl                 ; Ctrl commands made easier

RAlt::Home                      ; Move cursor to the start/end of the line
RCtrl::End

RShift::Send "{Shift Up}"       ; Use LShift for capitalization

;* Important Hotkeys
#s::Send "#+s"                  ; Take a screenshot

;* Navigation

; Hold RShift
RShift & e::Send "{Up}"         ; Move cursor up/down/left/right
RShift & d::Send "{Down}"
RShift & s::Send "{Left}"
RShift & f::Send "{Right}"

                                ; Go to the previous/next word
RShift & w::Send "{Ctrl Down}{Left}{Ctrl Up}"
RShift & r::Send "{Ctrl Down}{Right}{Ctrl Up}"  

                                
RShift & g::Send "{Home}"       ; Alternate Keys for home/end
RShift & a::Send "{End}"

;* Simulate Scroll
; Note: You can scroll sideways with mouse while holding shift

LinesPerScroll := 3, CharsPerScroll := 6

                                ; Scroll Up/Down
RShift & c::Send "{WheelUp}{Up " LinesPerScroll "}"
RShift & v::Send "{WheelDown}{Down " LinesPerScroll "}"

                                ; Scroll left/right if CapsLock is held
#HotIf GetKeyState("RCtrl")
    RShift & c::Send "{WheelLeft}{Left " CharsPerScroll "}"
    RShift & v::Send "{WheelRight}{Right " CharsPerScroll "}"
#HotIf

Rshift & t::Send "{PgUp}"
Rshift & b::Send "{PgDn}"

                                ; Jump to previous/next cursor position
RShift & ,::Send "{Alt Down}{Left}{Alt Up}"
RShift & .::Send "{Alt Down}{Right}{Alt Up}"

;* Deletion

RShift & x::Send "{Delete}"     ; Delete next character
#HotIf GetKeyState("RCtrl")
                                ; Delete next word
    RShift & x::Send "{Ctrl Down}{Delete}{Ctrl Up}"
#HotIf

;* Selection and Capitalization

RShift & z::CapsLock            ; Toggle Capslock

#HotIf GetKeyState("RCtrl")
                                ; Select to previous character/word
    RShift & s::Send "{Shift Down}{Left}{Shift Up}"
    RShift & w::Send "{Shift Down}{Ctrl Down}{Left}{Ctrl Up}{Shift Up}"

                                ; Select to next character/word
    RShift & f::Send "{Shift Down}{Right}{Shift Up}"
    RShift & r::Send "{Shift Down}{Ctrl Down}{Right}{Ctrl Up}{Shift Up}"

                                ; Select to line above/below
    RShift & e::Send "{Shift Down}{Up}{Shift Up}"
    RShift & d::Send "{Shift Down}{Down}{Shift Up}"

                                ; Select to the start/end of line
    RShift & g::Send "{Shift Down}{Home}{Shift Up}"
    RShift & a::Send "{Shift Down}{End}{Shift Up}"
#HotIf

RShift & q::Send "{Esc}"        ; Escape suggestion

; To deselect text, move left or right.
; cursor lands where the selection starts/ends

;! Unused Keys, need revision
; some issues with L63,64 in godot
; c, v, t, b

; ----------------------------------------------------------------------------------------------------