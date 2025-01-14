@ECHO OFF

TASKKILL /IM "WinMove.exe" /F
MOVE /Y "WinMove.exe" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
START "" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\WinMove.exe"
