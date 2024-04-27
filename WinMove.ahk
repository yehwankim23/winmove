#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

Menu, Tray, Tip, WinMove

#n::
WinGet, process_name, ProcessName, A
WinGetClass, class, A

switch process_name
{
    case "KakaoTalk.exe":
        if class = EVA_Window_Dblclk
        {
            WinMove, A, , 764, 199, 392, 642
        }
        else
        {
            WinMove, A, , 1164, 199, 380, 640
        }
    case "Screenpresso.exe":
        WinMove, A, , 1255, 562, 660, 473
    case "fraps.exe":
        WinMove, A, , 657, 335, 606, 369
    default:
        if class in ConsoleWindowClass,mintty,Notepad,TaskManagerWindow
        {
            WinMove, A, , 480, 180, 960, 720
        }
        else
        {
            WinMove, A, , 360, 90, 1200, 900
        }
}

return

#+n::
if not A_IsAdmin
{
    try
    {
        Run, *RunAs "%A_ScriptFullPath%" /restart
    }

    MsgBox, Failed to run as administrator.
}

#y::
WinGetClass, class, A
WinGet, process_name, ProcessName, A
WinGetPos, x, y, width, height, A
MsgBox, %class% > %process_name%`n`nPosition : %x%, %y%`nSize : %width% x %height%
return
