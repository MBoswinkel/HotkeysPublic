; Forces only one instance of this script to run
#SingleInstance Force

; Duration of standard pause between actions
StandardPauseDuration := 50

; Function for navigating to quick access folders in Windows File Explorer
FolderNavigator(Num) {
	Send('+{Tab}')
	Sleep(2*StandardPauseDuration)
	Send('{Home}')
	Sleep(2*StandardPauseDuration)
	Loop (Num+2) {
		Send('{Down}')
		Sleep(2*StandardPauseDuration)
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

; System-wide music hotkeys
#Numpad0:: {
	Send('{Volume_Mute}')
}
#Numpad8:: {
	Send('{Volume_Up}')
}
#Numpad2:: {
	Send('{Volume_Down}')
}
#Numpad5:: {
	Send('{Media_Play_Pause}')
}
#Numpad6:: {
	Send('{Media_Next}')
}
#Numpad4:: {
	Send('{Media_Prev}')
}

; System-wide hotkey for pairing with headphones
#h:: {
	Send('#a')
	Sleep(20*StandardPauseDuration)
	Send('{Right}')
	Sleep(StandardPauseDuration)
	Send('{Tab}')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
	Sleep(20*StandardPauseDuration)
	Send('+{Tab}')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
	Sleep(StandardPauseDuration)
	Send('{Esc}')
}

; System-wide hotkey for checking/doing updates
#u:: {
	Run('ms-settings:windowsupdate')
	Sleep(20*StandardPauseDuration)
	WinActivate('Settings')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
}

; The following hotkeys are meant to work only in Windows File Explorer
#HotIf WinActive('ahk_class CabinetWClass')

; Quick access hotkeys
^Numpad1:: {
	FolderNavigator(1)
}
^Numpad2:: {
	FolderNavigator(2)
}
^Numpad3:: {
	FolderNavigator(3)
}
^Numpad4:: {
	FolderNavigator(4)
}
^Numpad5:: {
	FolderNavigator(5)
}
^Numpad6:: {
	FolderNavigator(6)
}
^Numpad7:: {
	FolderNavigator(7)
}
^Numpad8:: {
	FolderNavigator(8)
}
^Numpad9:: {
	FolderNavigator(9)
}

; The following hotkeys are meant to work only in Google Chrome
#HotIf WinActive('ahk_exe chrome.exe')

; Bookmark bar hotkeys
^Numpad1:: {
	BookmarkNavigator(1)
}
^Numpad2:: {
	BookmarkNavigator(2)
}
^Numpad3:: {
	BookmarkNavigator(3)
}
^Numpad4:: {
	BookmarkNavigator(4)
}
^Numpad5:: {
	BookmarkNavigator(5)
}
^Numpad6:: {
	BookmarkNavigator(6)
}
^Numpad7:: {
	BookmarkNavigator(7)
}
^Numpad8:: {
	BookmarkNavigator(8)
}
^Numpad9:: {
	BookmarkNavigator(9)
}

; Hotkey for checking/doing updates
^u:: {
	Send('^l')
	Sleep(StandardPauseDuration)
	Send('chrome://settings/help')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
}

; The following hotkeys are meant to work only in Visual Studio Code
#HotIf WinActive('ahk_exe Code.exe')

; Hotkey for checking/doing updates
^u:: {
	Send('{F1}')
	Sleep(StandardPauseDuration)
	Send('Code: check for updates')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
}
