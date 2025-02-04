#Requires AutoHotkey v2.0
#SingleInstance Force

A_IconTip := "WinMove 2025.2"

; Alt + w
!w:: {
    try {
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
                x := 20
                y := 10
                width := 60
                height := 80

                if (process_name ~= "i)cmd.exe|mintty.exe|notepad.exe|powershell.exe|Taskmgr.exe") {
                    x := 25
                    y := 15
                    width := 50
                    height := 70
                }

                screen_width := A_ScreenWidth / 100
                screen_height := A_ScreenHeight / 100

                WinMove(
                    screen_width * x,
                    screen_height * y,
                    screen_width * width,
                    screen_height * height,
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
