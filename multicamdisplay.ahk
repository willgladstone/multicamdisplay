#Requires AutoHotkey v2.0
#SingleInstance Force

; init
DetectHiddenWindows(0)

; get all monitors (excl. hidden/virtual)
MonitorCount := MonitorGetCount()
Loop MonitorCount {
    ; monitor boundaries
    MonitorGet(A_Index, &L, &T, &R, &B)

    Run(".\tCamView\tCamView.exe")
    WinWait("tCamView")
    WinSetTitle("Display " A_Index " Camera", "tCamView")
    WinMove(L, T,,,"Display " A_Index " Camera")
    Send("{f down}{f up}")
}

ExitApp