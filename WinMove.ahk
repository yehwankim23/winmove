#Requires AutoHotkey v2.0
#SingleInstance Force

A_IconTip := "WinMove 2025.1"

; Alt + w
!w:: {
    process_name := WinGetProcessName("A")
    title := WinGetTitle("A")

    switch (process_name) {
        case "KakaoTalk.exe":
            switch (title) {
                case "카카오톡":
                    WinMove(764, 199, 392, 642, "A")
                case "":
                    WinMove(1160, 199, 510, 640, "A")
                default:
                    WinMove(1164, 199, 380, 640, "A")
            }
        case "Screenpresso.exe":
            WinMove(1255, 562, 660, 473, "A")
        case "fraps.exe":
            WinMove(657, 335, 606, 369, "A")
        default:
            horizontal_scale := A_ScreenWidth / 1920
            vertical_scale := A_ScreenHeight / 1080

            if (process_name ~= "i)cmd.exe|mintty.exe|notepad.exe|powershell.exe|Taskmgr.exe") {
                WinMove(
                    horizontal_scale * 480,
                    vertical_scale * 180,
                    horizontal_scale * 960,
                    vertical_scale * 720,
                    "A"
                )
            } else {
                WinMove(
                    horizontal_scale * 360,
                    vertical_scale * 90,
                    horizontal_scale * 1200,
                    vertical_scale * 900,
                    "A"
                )

                WinGetPos(, , &width, &height, "A")
                WinMove((A_ScreenWidth - width) / 2, (A_ScreenHeight - height) / 2, , , "A")
            }
    }
}

; Shift + Alt + w
+!w:: {
    if not (A_IsAdmin) {
        try {
            Run '*RunAs "' A_ScriptFullPath '" / restart'
        }
    }
}

; Ctrl + Alt + w
^!w:: {
    process_name := WinGetProcessName("A")
    title := WinGetTitle("A")
    WinGetPos(&x, &y, &width, &height, "A")

    MsgBox(
        "Process Name : " process_name "`n"
        "Title : " title "`n"
        "Position : " x ", " y "`n"
        "Size : " width " x " height,
        "WinMove"
    )
}
