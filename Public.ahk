; Forces only one instance of this script to run
#SingleInstance Force

; Duration of standard pause between actions
StandardPauseDuration := 50

; Number of pins to the Windows Taskbar
NumberOfPins := 4

; Number of bookmarks on the Google Chrome bookmark bar
NumberOfBookmarks := 3

; Function for navigating to quick access folders in Windows File Explorer
FolderNavigator(Num) {
	Send('+{Tab}')
	Sleep(StandardPauseDuration)
	Send('{Home}')
	Sleep(StandardPauseDuration)
	Loop (Num+2) {
		Send('{Down}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
	Sleep(5*StandardPauseDuration)
	Send('{Tab}')
}

; Function for navigating to bookmarks on the Google Chrome bookmark bar
BookmarkNavigator(Num) {
	Send('!B')
	Sleep(StandardPauseDuration)
	Loop (Num-1) {
		Send('{Tab}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
}

; Function for moving the window with the given identifier to the right screen (maximized)
MoveWindowRight(ID) {
	WinWait(ID)
	WinActivate(ID)
	WinMove(10, 10, 1000, 500, ID)
	WinMaximize(ID)
}

; Function for moving the window with the given identifier to the left screen (maximized)
MoveWindowLeft(ID) {
	MoveWindowRight(ID)
	Send('{LWin down}+{Left}{LWin up}')
}

; Function for arranging a general setup
GeneralSetup() {
	Loop (NumberOfPins) {
		Send('#' . A_Index)
		Sleep(StandardPauseDuration)
	}
	Send('#e')
	Sleep(100*StandardPauseDuration)
	MoveWindowRight('ahk_exe chrome.exe')
	Loop (NumberOfBookmarks) {
		BookmarkNavigator(A_Index)
		Sleep(StandardPauseDuration)
		Send('^t')
		Sleep(StandardPauseDuration)
	}
	Send('^w')
	Sleep(StandardPauseDuration)
	MoveWindowLeft('ahk_exe OUTLOOK.EXE')
	Sleep(StandardPauseDuration)
	MoveWindowLeft('Microsoft To Do')
	Sleep(StandardPauseDuration)
	MoveWindowLeft('ahk_exe Spotify.exe')
	Sleep(StandardPauseDuration)
	MoveWindowLeft('ahk_class CabinetWClass')
}

; System-wide music hotkeys
^Numpad0:: {
	Send('{Volume_Mute}')
}
^Numpad8:: {
	Send('{Volume_Up}')
}
^Numpad2:: {
	Send('{Volume_Down}')
}
^Numpad5:: {
	Send('{Media_Play_Pause}')
}
^Numpad6:: {
	Send('{Media_Next}')
}
^Numpad4:: {
	Send('{Media_Prev}')
}

; System-wide hotkey to trigger GeneralSetup function
^Numpad1:: {
	GeneralSetup()
}

; Windows File Explorer quick access and open selected file in Visual Studio Code hotkeys
#HotIf WinActive('ahk_class CabinetWClass')
^1:: {
	FolderNavigator(1)
}
^2:: {
	FolderNavigator(2)
}
^3:: {
	FolderNavigator(3)
}
^4:: {
	FolderNavigator(4)
}
^5:: {
	FolderNavigator(5)
}
^6:: {
	FolderNavigator(6)
}
^7:: {
	FolderNavigator(7)
}
^o:: {
	A_Clipboard := ''
	Send('^C')
	ClipWait()
	Run('C:\Users\Maarten lokaal\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk ' . A_Clipboard)
}

; Google Chrome bookmark bar hotkeys
#HotIf WinActive('ahk_exe chrome.exe')
^1:: {
	BookmarkNavigator(1)
}
^2:: {
	BookmarkNavigator(2)
}
^3:: {
	BookmarkNavigator(3)
}

; Triggers GeneralSetup function upon script start
GeneralSetup()
