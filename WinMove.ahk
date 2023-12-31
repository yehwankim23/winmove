﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

Menu, Tray, Tip, WinMove

<#n::
if not A_IsAdmin
{
    try
    {
        Run *RunAs "%A_ScriptFullPath%" /restart
    }

    MsgBox Failed to run as administrator.
}

WinGet, process_name, ProcessName, A
WinGetClass, class, A

if class in ConsoleWindowClass,mintty,Notepad,TaskManagerWindow
{
    WinMove, A, , 480, 180, 960, 720
}
else if process_name = KakaoTalk.exe
{
    if class = EVA_Window_Dblclk
    {
        WinMove, A, , 764, 199, 392, 642
    }
    else
    {
        WinMove, A, , 1164, 199, 350, 600
    }
}
else if process_name = Screenpresso.exe
{
    WinMove, A, , 1255, 562, 660, 473
}
else
{
    WinMove, A, , 360, 90, 1200, 900
}

return
