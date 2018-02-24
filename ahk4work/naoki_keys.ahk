
#UseHook
SetTitleMatchMode, 2 ;WinActiveの挙動を部分一致検索に変える。

;;----------------------------------------------------
;; モード管理変数
;;----------------------------------------------------
global NOMAL_MAIN_MODE := 0
global NOMAL_SUB_MODE := 1
global APP_MAIN_MODE := 2
global APP_SUB_MODE := 3
global SELECT_APP_MODE := 4

global mode := APP_MAIN_MODE

;;----------------------------------------------------
;; base用変数
;;----------------------------------------------------
global BASE_MOVING_TEXT_MODE := 0
global BASE_SELECTING_TEXT_MODE := 1
global BASE_SELECTING_KUKEI_TEXT_MODE := 2

global base_cursor_mode := BASE_MOVING_TEXT_MODE

;;----------------------------------------------------
;; SublimeTextモード用変数
;;----------------------------------------------------
global SUBLIME_MOVING_TEXT_MODE := 0
global SUBLIME_SELECTING_TEXT_MODE := 1
global SUBLIME_SELECTING_KUKEI_TEXT_MODE := 2

global sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE

global sublime_window_is_tree_view := false

;;----------------------------------------------------
;; ATOMモード用変数
;;----------------------------------------------------
global ATOM_MOVING_TEXT_MODE := 0
global ATOM_SELECTING_TEXT_MODE := 1
global ATOM_SELECTING_KUKEI_TEXT_MODE := 2

global atom_cursor_mode := ATOM_MOVING_TEXT_MODE

global atom_window_is_tree_view := false

;;----------------------------------------------------
;; GoogleChromeモード用変数
;;----------------------------------------------------
global is_bookmark_view := false

;;----------------------------------------------------
;; As/Rモード用変数
;;----------------------------------------------------

;;----------------------------------------------------
;; FreeCommanderモード用変数
;;----------------------------------------------------
global free_commander_is_file_selecting := false

;;----------------------------------------------------
;; ライブラリモジュール
;;----------------------------------------------------
#Include <IME>
;;#Include <WinCap>
#Include <mylib>

;;----------------------------------------------------
;; 各アプリのモジュール
;;----------------------------------------------------
#Include AppAhk\atom.ahk
;;#Include AppAhk\explore.ahk
#Include AppAhk\chrome.ahk
#Include AppAhk\clibor.ahk
;;#Include AppAhk\sublime.ahk
;;#Include AppAhk\hidemaru.ahk
;;#Include AppAhk\excel.ahk
;;#Include AppAhk\explorer.ahk
;;#Include AppAhk\asr.ahk
#Include AppAhk\cygwin.ahk


#Include AppAhk\base.ahk

;;----------------------------------------------------
;; モード変更ルーチン
;;----------------------------------------------------

ChangeNomalMainMode() {
	mode := NOMAL_MAIN_MODE
}

ChangeNomalSubMode() {
	mode := NOMAL_SUB_MODE
}

ChangeAppMainMode() {
	if (WinActive("ahk_exe sublime_text.exe")) {
		Send, {Esc}		
		sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
	}
	else if ((WinActive("ahk_exe atom.exe") || WinActive("ahk_exe Code.exe"))) {
		Send, {Esc}		
		atom_cursor_mode := ATOM_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe chrome.exe")) {
		is_bookmark_view := false
	}
	else if (WinActive("ahk_exe FreeCommander.EXE")) {
		free_commander_is_file_selecting := false
	}
;;	else if (WinActive("ahk_exe Explorer.EXE")) {
;;		Send, {Esc}
;;	}
	else if (WinActive("ahk_exe Clibor.exe")) {
	}
	else if (WinActive("ahk_exe mintty.exe")) {
		Send, {Esc}
		mode := NOMAL_MAIN_MODE
		return
	}
	else {
		Send, {Esc}		
		base_cursor_mode := BASE_MOVING_TEXT_MODE
	}
	mode := APP_MAIN_MODE
}

ChangeAppSubMode() {
	if (WinActive("ahk_exe sublime_text.exe")) {
		Send, {Esc}
		sublime_window_is_tree_view := false
	}
	else if (WinActive("ahk_exe atom.exe")) {
		atom_window_is_tree_view := false
	}
	mode := APP_SUB_MODE
}

ChangeSelectAppMode() {
	mode := SELECT_APP_MODE
}

;;----------------------------------------------------
;; テスト用ルーチン
;;----------------------------------------------------

_Test() {
}

;;----------------------------------------------------
;; 開発補助機能
;;----------------------------------------------------
#if (WinActive("config.py"))

F5::
	MsgBox, 0, Autohotkey Naoki Keys Script, change ahk >> keyhac, 5
	Run, C:\Users\naoki\Downloads\keyhac_176\keyhac\keyhac.exe
	ExitApp
return

#if


#if (WinActive(".ahk"))

F5::
	MsgBox, 0, Autohotkey Naoki Keys Script, make and reload script, 5
	Run, completion_code_maker.py
	Sleep 1000
	Reload
return

F6::
	MsgBox, 0, Autohotkey Naoki Keys Script, suspend script, 5
	Suspend
return

#if

#if (WinActive("make_ahk.py"))

F5::
	Run, make_ahk.py
return

F6::
return

#if

#if (WinActive(".cpp"))

F5::
	;; アクティブウィンドウを記憶して、Cygwinに切り替え
	WinGet, active_win_id, ID, A, , ,
	ActiveApp("ahk_exe cmd.exe", "C:\WINDOWS\system32\cmd.exe")

	;; コマンド実行
	_PasteText("g++ -mwindows test.cpp")
	Send, {Enter}
	_PasteText("a.exe")
	Send, {Enter}

	;; もともとアクティブだったウィンドウに切り替え
	WinActivate, ahk_id %active_win_id%, , ,
return

F6::
return

#if

;;----------------------------------------------------
;; すべてもモードで共通
;;----------------------------------------------------
;;F12::
;;	_Test()
;;return

sc03a::
	Send, !{Tab}
return

~LButton::
	Sleep, 300
	IME_SET(ime_status)
return

sc07B::
	ChangeNomalSubMode()
	while (GetKeyState("sc07B", "P")) {
		Sleep, 100
	}
	ChangeNomalMainMode()
return
sc079::
	ChangeAppSubMode()
	while (GetKeyState("sc079", "P")) {
		Sleep, 100
	}
	ChangeAppMainMode()
return
