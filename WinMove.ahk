#Requires AutoHotkey v2.0
#SingleInstance Force

A_IconTip := "WinMove 2025.9.0.0"

; Win + Down
#Down:: {
    try {
        WinGetPos(, , &width, &height, "A")

        if (height >= A_ScreenHeight) {
            return
        }

        WinRestore("A", , ,)

        process_name := WinGetProcessName("A")

        switch (process_name) {
            case "fraps.exe":
                WinMove((A_ScreenWidth - width) / 2, (A_ScreenHeight - height) / 2, , , "A")
            case "KakaoTalk.exe":
                title := WinGetTitle("A")

                width_scale := 0.2
                height_scale := 0.6

                switch (title) {
                    case "카카오톡":
                        WinMove(
                            A_ScreenWidth * (1 - width_scale) / 2,
                            A_ScreenHeight * (1 - height_scale) / 2,
                            A_ScreenWidth * width_scale,
                            A_ScreenHeight * height_scale,
                            "A"
                        )

                        WinGetPos(, , &width, &height, "A")
                        WinMove((A_ScreenWidth - width) / 2, (A_ScreenHeight - height) / 2, , , "A")
                    case "":
                        WinMove(
                            (0.5 * A_ScreenWidth - width) / 2,
                            (A_ScreenHeight - height) / 2,
                            ,
                            ,
                            "A")
                    default:
                        WinMove(
                            A_ScreenWidth * (1 - width_scale) / 2,
                            A_ScreenHeight * (1 - height_scale) / 2,
                            A_ScreenWidth * width_scale,
                            A_ScreenHeight * height_scale,
                            "A"
                        )

                        WinGetPos(, , &width, &height, "A")

                        WinMove(
                            (1.5 * A_ScreenWidth - width) / 2,
                            (A_ScreenHeight - height) / 2,
                            ,
                            ,
                            "A")
                }
            case "Screenpresso.exe":
                width_scale := 0.3
                height_scale := 0.4

                WinMove(
                    A_ScreenWidth * (1 - width_scale) / 2,
                    A_ScreenHeight * (1 - height_scale) / 2,
                    A_ScreenWidth * width_scale,
                    A_ScreenHeight * height_scale,
                    "A"
                )
            default:
                width_scale := 0.6
                height_scale := 0.8

                if (process_name ~= "i)cmd.exe|mintty.exe|notepad.exe|powershell.exe|Taskmgr.exe") {
                    width_scale := 0.5
                    height_scale := 0.7
                }

                WinMove(
                    A_ScreenWidth * (1 - width_scale) / 2,
                    A_ScreenHeight * (1 - height_scale) / 2,
                    A_ScreenWidth * width_scale,
                    A_ScreenHeight * height_scale,
                    "A"
                )

                WinGetPos(, , &width, &height, "A")
                WinMove((A_ScreenWidth - width) / 2, (A_ScreenHeight - height) / 2, , , "A")
        }
    }
}

; Shift + Win + Down
+#Down:: {
    if not (A_IsAdmin) {
        try {
            Run '*RunAs "' A_ScriptFullPath '" / restart'
        }
    }
}

; Ctrl + Win + Down
^#Down:: {
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
