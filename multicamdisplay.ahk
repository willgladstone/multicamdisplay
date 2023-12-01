#Requires AutoHotkey v2.0
#SingleInstance Force

; init
DetectHiddenWindows(0)
LeftMost := 0
Center := 0
RightMost := 0
Displays := Array()

; get all monitors (excl. hidden/virtual)
MonitorCount := MonitorGetCount()
Loop MonitorCount {
    ; monitor boundaries
    MonitorGet(A_Index, &L, &T, &R, &B)
    MonitorGetWorkArea(A_Index, &WL, &WT, &WR, &WB)

    ;; determine if left or right display
    if(L <= LeftMost){
        LeftMost := L
        Displays.InsertAt(1, [L,T,R,B])
    } else {
        RightMost:= L
        Displays.InsertAt(2, [L,T,R,B])
    }

    Run(".\tCamView\tCamView.exe")
    WinWait("tCamView")
    WinSetTitle("Display " A_Index " Camera", "tCamView")
    WinMove(Displays[A_Index][1], Displays[A_Index][2],,,"Display " A_Index " Camera")
    Send("{f down}{f up}")
}

ExitApp