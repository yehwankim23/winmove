#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

<#n::
WinGetClass, class, A

if class contains ConsoleWindowClass,mintty,Notepad,TaskManagerWindow
{
    WinMove, A, , 480, 180, 960, 720
}
else if class contains EVA_Window_Dblclk
{
    WinMove, A, , 764, 199, 392, 642
}
else if class contains #32770
{
    WinMove, A, , 1164, 199, 350, 600
}
else if class contains WindowsForms10.Window.8.app.0.3becb76_r6_ad1
{
    WinMove, A, , 1255, 562, 660, 473
}
else
{
    WinMove, A, , 360, 90, 1200, 900
}

return
