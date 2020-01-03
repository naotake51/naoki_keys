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

global changing := FALSE

;;----------------------------------------------------
;; base用変数
;;----------------------------------------------------
global BASE_MOVING_TEXT_MODE := 0
global BASE_SELECTING_TEXT_MODE := 1
global BASE_SELECTING_KUKEI_TEXT_MODE := 2

global base_cursor_mode := BASE_MOVING_TEXT_MODE

global select_app_number := 0 ;;

;;----------------------------------------------------
;; SublimeTextモード用変数
;;----------------------------------------------------
global SUBLIME_MOVING_TEXT_MODE := 0
global SUBLIME_SELECTING_TEXT_MODE := 1
global SUBLIME_SELECTING_KUKEI_TEXT_MODE := 2

global sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE

global sublime_window_is_tree_view := false

;;----------------------------------------------------
;; Atomモード用変数
;;----------------------------------------------------
global ATOM_MOVING_TEXT_MODE := 0
global ATOM_SELECTING_TEXT_MODE := 1
global ATOM_SELECTING_KUKEI_TEXT_MODE := 2

global atom_cursor_mode := ATOM_MOVING_TEXT_MODE

;;----------------------------------------------------
;; Vscodeモード用変数
;;----------------------------------------------------
global VSCODE_MOVING_TEXT_MODE := 0
global VSCODE_SELECTING_TEXT_MODE := 1
global VSCODE_SELECTING_KUKEI_TEXT_MODE := 2

global vscode_cursor_mode := VSCODE_MOVING_TEXT_MODE

;;----------------------------------------------------
;; IntelliJモード用変数
;;----------------------------------------------------
global INTELLIJ_MOVING_TEXT_MODE := 0
global INTELLIJ_SELECTING_TEXT_MODE := 1
global INTELLIJ_SELECTING_KUKEI_TEXT_MODE := 2

global intellij_cursor_mode := INTELLIJ_MOVING_TEXT_MODE

;;----------------------------------------------------
;; Eclipseモード用変数
;;----------------------------------------------------
global ECLIPSE_MOVING_TEXT_MODE := 0
global ECLIPSE_SELECTING_TEXT_MODE := 1
global ECLIPSE_SELECTING_KUKEI_TEXT_MODE := 2

global eclipse_cursor_mode := ECLIPSE_MOVING_TEXT_MODE

;;----------------------------------------------------
;; GoogleChromeモード用変数
;;----------------------------------------------------
global is_bookmark_view := false

;;----------------------------------------------------
;; Excelモード用変数
;;----------------------------------------------------
global EXCEL_HUMEI_MODE := 0
global EXCEL_HENSYUU_MODE := 1
global EXCEL_NYUURYOKU_MODE := 2

global excel_mode := EXCEL_HUMEI_MODE

global EXCEL_MOVING_CELL_MODE := 0
global EXCEL_SELECTING_CELL_MODE := 1

global excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE

;;----------------------------------------------------
;; ライブラリモジュール
;;----------------------------------------------------
#Include <IME>
;;#Include <WinCap>
#Include <mylib>

;;----------------------------------------------------
;; 各アプリのモジュール
;;----------------------------------------------------
;;#Include AppAhk\atom.ahk
#Include AppAhk\vscode.ahk
#Include AppAhk\intellij.ahk
#Include AppAhk\clibor.ahk
#Include AppAhk\explore.ahk
#Include AppAhk\chrome.ahk
#Include AppAhk\excel.ahk
#Include AppAhk\eclipse.ahk

;;#Include AppAhk\sublime.ahk
;;#Include AppAhk\hidemaru.ahk
;;#Include AppAhk\asr.ahk
;;#Include AppAhk\cygwin.ahk


#Include AppAhk\base.ahk
#Include AppAhk\select_app.ahk

;;----------------------------------------------------
;; モード変更ルーチン
;;----------------------------------------------------

ChangeNomalMainMode() {
	mode := NOMAL_MAIN_MODE
}

ChangeNomalSubMode() {
	if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) {
		;; Excel
		if (excel_mode != EXCEL_NYUURYOKU_MODE) {
			Send, ^{Enter}
			Send, ^{Enter}
			Send, {Esc} ;;
			Send, {F2}
			excel_mode := EXCEL_NYUURYOKU_MODE
		}
		excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
	}

	mode := NOMAL_SUB_MODE
}

ChangeAppMainMode() {
	if (select_app_number != 0) {
		Send, {LWin up}
		select_app_number := 0
	}

	if (WinActive("ahk_exe sublime_text.exe")) {
		Send, {Esc}
		sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe atom.exe")) {
		Send, {Esc}
		atom_cursor_mode := ATOM_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe idea64.exe")) {
		Send, {Esc}
		intellij_cursor_mode := INTELLIJ_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe Code.exe")) {
		Send, {Esc}
		vscode_cursor_mode := VSCODE_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe javaw.exe")) {
		Send, {Esc}
		Send, {F12}
		Send, {Esc}
		eclipse_cursor_mode := ECLIPSE_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe chrome.exe")) {
		is_bookmark_view := false
	}
	else if (WinActive("ahk_exe Clibor.exe")) {
	}
	else if (WinActive("ahk_exe Explorer.EXE") && WinActive("ahk_class CabinetWClass")) {
		;; エクスプローラー
	}
	else if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) {
		;; Excel
		if (excel_mode != EXCEL_HENSYUU_MODE) {
			Send, ^{Enter}
			Send, ^{Enter}
			Send, {Esc} ;;
			excel_mode := EXCEL_HENSYUU_MODE
		}
		excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
	}
	else {
		Send, {Esc}
		base_cursor_mode := BASE_MOVING_TEXT_MODE
	}

	mode := APP_MAIN_MODE
}

ChangeAppSubMode() {
	if (WinActive("ahk_exe sublime_text.exe")) {
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

;; リロード
!r::
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
	PasteText("g++ -mwindows test.cpp")
	Send, {Enter}
	PasteText("a.exe")
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


SelctAppModeLoop() {
	ChangeSelectAppMode()
	while (GetKeyState("sc07B", "P")) {
		Sleep, 100
	}
	ChangeNomalMainMode()
	Sleep, 100
}

sc07B::
	if (changing = TRUE) {
		return
	}
	changing := TRUE

	ChangeNomalSubMode()
	while (GetKeyState("sc07B", "P")) {
		if (GetKeyState("sc079", "P")) {
			SelctAppModeLoop()
			changing := FALSE
			return
		}
		Sleep, 100
	}
	ChangeNomalMainMode()
	changing := FALSE
return

sc079::
	if (changing = TRUE) {
		return
	}
	changing := TRUE

	ChangeAppSubMode()
	while (GetKeyState("sc079", "P")) {
		if (GetKeyState("sc07B", "P")) {
			SelctAppModeLoop()
			changing := FALSE
			return
		}
		Sleep, 100
	}
	ChangeAppMainMode()
	changing := FALSE
return
