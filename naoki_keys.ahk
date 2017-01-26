
#UseHook
SetTitleMatchMode, 2 ;WinActiveの挙動を部分一致検索に変える。

;;----------------------------------------------------
;; imeの状態
;;----------------------------------------------------
ime_status := 0

;;----------------------------------------------------
;; モード管理変数
;;----------------------------------------------------
global NOMAL_MODE := 0
global APP_MODE := 1
global APP_MODE2 := 2
global APP_MODE3 := 3
global SELECTING_APP_MODE := 4
global MOUSE_MODE := 5

global mode := APP_MODE

;;----------------------------------------------------
;; マウス操作モードの設定値
;;----------------------------------------------------
global TANI_OF_MOVING := 10
global LOOPNUM_OF_MOVING := 10

;;----------------------------------------------------
;; SublimeTextモード用変数
;;----------------------------------------------------
global SUBLIME_MOVING_TEXT_MODE := 0
global SUBLIME_SELECTING_TEXT_MODE := 1
global SUBLIME_SELECTING_KUKEI_TEXT_MODE := 2

global sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
global sublime_window_is_tree_view := false

;;----------------------------------------------------
;; 秀丸モード用変数
;;----------------------------------------------------
global HIDEMARU_MOVING_TEXT_MODE := 0
global HIDEMARU_SELECTING_TEXT_MODE := 1
global HIDEMARU_SELECTING_KUKEI_TEXT_MODE := 2

global hidemaru_cursor_mode := HIDEMARU_MOVING_TEXT_MODE

;;----------------------------------------------------
;; Excelモード用変数
;;----------------------------------------------------
global EXCEL_MOVING_CELL_MODE := 0
global EXCEL_SELECTING_CELL_MODE := 1

global excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE

global EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE := 0
global EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE := 1

global excel_selecting_cell_mode_sub_status := EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE

global EXCEL_MOVING_TEXT_MODE := 0
global EXCEL_SELECTING_TEXT_MODE := 1
global EXCEL_SELECTING_KUKEI_TEXT_MODE := 2

global excel_text_cursor_mode := EXCEL_MOVING_TEXT_MODE

;;----------------------------------------------------
;; includeモジュール
;;----------------------------------------------------
#Include <IME>
#Include <mylib>

;;----------------------------------------------------
;; テスト用ルーチン
;;----------------------------------------------------
_Test() {
	SendLineToCygwin()
}

;;----------------------------------------------------
;; モード変更ルーチン
;;----------------------------------------------------

ChangeNomalMode() {

	if (WinActive("ahk_exe sublime_text.exe")) {
		;;
	}
	else if (WinActive("ahk_exe Hidemaru.exe")) {
		;;
	}
	else if (WinActive("ahk_exe mintty.exe")) {
		;;
	}
	else if (WinActive("ahk_exe chrome.exe")) {
		;;
	}
	else if (WinActive("ahk_exe EXCEL.EXE")) && (WinActive("ahk_class XLMAIN")) {
		ExcelChangeHensyuuMode()
	}
	else if (WinActive("ahk_exe Clibor.exe")) {
		;;
	}
	else if (WinActive("ahk_exe SearchUI.exe")) {
		;;
	}
	else {
		;;
	}
	mode := NOMAL_MODE
}

ChangeAppMode() {
	if (WinActive("ahk_exe sublime_text.exe")) {
		Send, {Esc}
		sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe Hidemaru.exe")) {
		Send, {Esc}
		hidemaru_cursor_mode := HIDEMARU_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe mintty.exe")) {
	}
	else if (WinActive("ahk_exe chrome.exe")) {
	}
	else if (WinActive("ahk_exe EXCEL.EXE")) && (WinActive("ahk_class XLMAIN")) {
		ExcelChangeNyuuryokuMode()
		excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
		excel_selecting_cell_mode_sub_status := EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE
	}
	else if (WinActive("ahk_exe Clibor.exe")) {
	}
	else if (WinActive("ahk_exe SearchUI.exe")) {
	}
	else {
		;;
	}
	mode := APP_MODE
}

ChangeAppMode2() {
	if (WinActive("ahk_exe sublime_text.exe")) {
		Send, {Esc}
		sublime_window_is_tree_view := false
	}
	else if (WinActive("ahk_exe Hidemaru.exe")) {
		;;
	}
	else if (WinActive("ahk_exe mintty.exe")) {
		;;
	}
	else if (WinActive("ahk_exe chrome.exe")) {
		;;
	}
	else if (WinActive("ahk_exe EXCEL.EXE")) && (WinActive("ahk_class XLMAIN")) {
		ExcelChangeHensyuuMode()
		excel_text_cursor_mode := EXCEL_MOVING_TEXT_MODE
	}
	else if (WinActive("ahk_exe Clibor.exe")) {
		;;
	}
	else if (WinActive("ahk_exe SearchUI.exe")) {
		;;
	}
	else {
	;;
	}
	mode := APP_MODE2
}

ChangeAppMode3() {
	if (WinActive("ahk_exe sublime_text.exe")) {
		;;
	}
	else if (WinActive("ahk_exe Hidemaru.exe")) {
		;;
	}
	else if (WinActive("ahk_exe mintty.exe")) {
		;;
	}
	else if (WinActive("ahk_exe chrome.exe")) {
		;;
	}
	else if (WinActive("ahk_exe EXCEL.EXE")) && (WinActive("ahk_class XLMAIN")) {
		;;
	}
	else if (WinActive("ahk_exe Clibor.exe")) {
		;;
	}
	else if (WinActive("ahk_exe SearchUI.exe")) {
		;;
	}
	else {
		;;
	}
	mode := APP_MODE3
}

ChangeSelectingAppMode() {
	mode := SELECTING_APP_MODE
}

ChangeMouseMode() {
	mode := MOUSE_MODE
}

;;----------------------------------------------------
;; カーソル行をCygwinで実行する
;;----------------------------------------------------
SendLineToCygwin() {

	;; テキストエディタの一行を取得
	cmd_line := _GetLineString()

	;; アクティブウィンドウを記憶して、Cygwinに切り替え
	WinGet, active_win_id, ID, A, , ,
	ActiveApp("ahk_exe mintty.exe", "C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -")

	;; コマンド実行
	_PasteText(cmd_line)
	Send, {Enter}

	;; もともとアクティブだったウィンドウに切り替え
	WinActivate, ahk_id %active_win_id%, , ,
}
;;----------------------------------------------------
;; ウィンドウ状態記憶機能
;;----------------------------------------------------

global f9_arrangement
global f10_arrangement
global f11_arrangement
global f12_arrangement

StorageWindowArrangement() {
	window_arrangement := Object()

	;; アクティブウィンドウの記憶
	WinGet active_win_id, ID, A, , ,
	window_arrangement["active_win_id"] := active_win_id

	;; すべてのウィンドウの情報を記憶
	WinGet, win_id_list, List, , , "", ""
	window_number = 1
	Loop, %win_id_list% {
		window_arrangement[window_number] := Object()

		;; ウィンドウのIDを記憶
		win_id := win_id_list%window_number%
		window_arrangement[window_number]["id"] := win_id

		;; ウィンドウのプロセスの名前、パスを記憶
		WinGet, proc_name, ProcessName, ahk_id %win_id%, , ,
		window_arrangement[window_number]["proc_name"] := proc_name
		WinGet, proc_path, ProcessPath, ahk_id %win_id%, , ,
		window_arrangement[window_number]["proc_path"] := proc_path

		;; ウィンドウの最小化、最大化の状態を記憶
		WinGet, minmax, MinMax, ahk_id %win_id%, , ,
		window_arrangement[window_number]["minmax"] := minmax

		;; ウィンドウの位置、サイズを記憶
		WinGetPos, x, y, width, height, ahk_id %win_id%, , ,
		window_arrangement[window_number]["x"] := x
		window_arrangement[window_number]["y"] := y
		window_arrangement[window_number]["width"] := width
		window_arrangement[window_number]["height"] := height

		;;is_visible := DllCall("IsWindowVisible", "UInt", WinExist("ahk_exe sublime_text.exe"))
		;;window_arrangement[window_number]["visible"] := is_visible

		;;MsgBox, %win_id% %x% %y% %width% %height% %minmax% %proc_name%

		window_number := window_number + 1
	}
	window_arrangement["window_count"] := win_id_list

	return window_arrangement
}

RestoreWindowArrangement(window_arrangement) {

	;; すべてのウィンドウを記憶した情報に従って再現する
	window_count := window_arrangement["window_count"]
	window_number := window_count
	Loop, %window_count% {

		;; 記憶してあるウィンドウのID
		win_id := window_arrangement[window_number]["id"]

		;; 記憶してあるウィンドウのプロセスの名前、パス
		proc_name := window_arrangement[window_number]["proc_name"]
		proc_path := window_arrangement[window_number]["proc_path"]

		;; 記憶してあるウィンドウの最小化、最大化の状態を反映
		;; WinRestoreはウィンドウサイズを変更する前にする必要がある
		if (window_arrangement[window_number]["minmax"] = -1) {
			WinMinimize, ahk_id %win_id%, , ,
		}
		else if (window_arrangement[window_number]["minmax"] = 0) {
			WinRestore, ahk_id %win_id%, , ,
		}
		else if (window_arrangement[window_number]["minmax"] = 1) {
			WinMaximize, ahk_id %win_id%, , ,
		}

		;; 記憶してあるウィンドウの位置、サイズを反映
		x := window_arrangement[window_number]["x"]
		y := window_arrangement[window_number]["y"]
		width := window_arrangement[window_number]["width"]
		height := window_arrangement[window_number]["height"]
		WinMove, ahk_id %win_id%, , x, y, width, height, ,

		;; ウィンドウを最前面に出す WinSet, Topは環境によって効かないためAlwaysOnTopで代用
		WinSet, AlwaysOnTop, On, ahk_id %win_id%, , ,
		WinSet, AlwaysOnTop, Off, ahk_id %win_id%, , ,

		;;MsgBox, %win_id% %x% %y% %width% %height% %minmax% %proc_name%

		window_number := window_number - 1
	}

	;; 記憶時、アクティブだったウィンドウをアクティブにする
	active_win_id := window_arrangement["active_win_id"]
	WinActivate, ahk_id %active_win_id%, , ,
}

;;----------------------------------------------------
;; 開発補助機能
;;----------------------------------------------------

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

#if (WinActive(".py"))

F5::
	Run, make_ahk.py
return

F6::
return

#if

;;----------------------------------------------------
;; SubilimeText モード
;;----------------------------------------------------
#Include AppAhk\sublime.ahk

;;----------------------------------------------------
;; 秀丸 モード
;;----------------------------------------------------
#Include AppAhk\hidemaru.ahk

;;----------------------------------------------------
;; EXCEL モード
;;----------------------------------------------------
#Include AppAhk\excel.ahk

;;----------------------------------------------------
;; Google Chrome モード
;;----------------------------------------------------
#Include AppAhk\google.ahk

;;----------------------------------------------------
;; Clibor モード
;;----------------------------------------------------
#Include AppAhk\clibor.ahk

;;----------------------------------------------------
;; Explorer モード
;;----------------------------------------------------
#Include AppAhk\explorer.ahk

;;----------------------------------------------------
;; ステップ記録ツール モード
;;----------------------------------------------------
;; なにを書いても正常に動作しない
;; ステップ記録ルールがアクティブになっている間、Autohotkeyはキーバインドできないのかも。

;;----------------------------------------------------
;; 登録されていないアプリ用
;;----------------------------------------------------
#if (mode = APP_MODE)

~-::
~^::
~\::
~@::
~[::
~;::
~vkE2sc073::	;; :のキーコード
~]::
~,::
~.::
~/::
~vkBAsc028::	;; \のキーコード
~+-::
~+^::
~+\::
~+@::
~+[::
~+;::
~+vkE2sc073::	;; :のキーコード
~+]::
~+,::
~+.::
~+/::
~+vkBAsc028::	;; \のキーコード
~Space::
~!::
~"::
~#::
~$::
~%::
~&::
~'::
~(::
~)::
	Send, {Esc}
	ChangeNomalMode()
return

m::
	;; マーク機能。edsfと組み合わせて使う
return

o::
	Send, ^f
	ChangeNomalMode()
return
p::return

q::
	search_word := ActiveFileType() " " _GetSelectingText()

	ActiveApp("ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
	Send, ^t
	Send, %search_word%
	ChangeNomalMode()
return

w::
	Send, {Ctrl down}
	Send, {Ctrl up}
	Send, {Ctrl down}
	Send, {Ctrl up}
	While (Not WinActive("ahk_exe Clibor.exe")) {
		Sleep, 100
	}
	ChangeAppMode()
return

a::
	ChangeSelectingAppMode()
return

b::return
n::
	Send, {End}
	Send, {Enter}
	ChangeNomalMode()
return

z::Send, ^z
+z::Send, ^y
x::Send, ^x
c::Send, ^c
v::Send, ^v

r::return
t::return
y::return
u::return

g::Send, {Del}
h::Send, {BS}

i::Send, {Up}
k::Send, {Down}
j::Send, {Left}
l::Send, {Right}
e::Send, {Up 5}
d::Send, {Down 5}
s::Send, {Left 5}
f::Send, {Right 5}

#if

;;----------------------------------------------------
;; 通常モード
;;----------------------------------------------------
#if (mode = NOMAL_MODE)

;; オーバーライド
vk1Dsc07B::
return

j::
	If GetKeyState("vk1Dsc07B", "P") {
		IME_SET(1)
		ime_status := 1
	}
	else {
		Send, j
	}
return

e::
	If GetKeyState("vk1Dsc07B", "P") {
		IME_SET(0)
		ime_status := 0
	}
	else {
		Send, e
	}
return

;; 補完機能
#Include completion.def.ahk

#if

;;----------------------------------------------------
;; アプリ選択モード
;;----------------------------------------------------

#if (mode = SELECTING_APP_MODE)

ActiveApp(app, run_code)
{
	if WinActive(app) {
		ActiveNextSameApplication()
	}
	else if WinExist(app) {
		WinActivate
	}
	else {
		Run, %run_code%
	}

	While (Not WinActive(app)) {
		Sleep, 100
	}

	ChangeAppMode()

	IME_SET(ime_status)
}

ActiveNextSameApplication(back := false) {
	WinGet, activate_process_name, ProcessName, A, , ,
	same_application_id_list := _GetWinList("ahk_exe " activate_process_name, "", "", "")

	same_application_id_sort_list := _SortNum(same_application_id_list)

	WinGet, activate_win_id, ID, A, , ,
	activate_win_index := _FindIndex(same_application_id_sort_list, activate_win_id)

	if (back) {
		next_activate_win_index := _Mod(activate_win_index - 1,same_application_id_sort_list.length)
	}
	else {
		next_activate_win_index := _Mod(activate_win_index + 1,same_application_id_sort_list.length)
	}

	ahk_id := "ahk_id " same_application_id_sort_list[next_activate_win_index]

	WinActivate, %ahk_id%, , ,
}

a::return
b::return
c::return
d::return
e::
	ActiveApp("ahk_exe EXCEL.EXE", "C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
return
f::
return
g::
	ActiveApp("ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
return
h::
	ActiveApp("ahk_exe Hidemaru.exe", "C:\Program Files\Hidemaru\Hidemaru.exe")
return
i::return
j::return
k::return
l::return
n::return
m::
	ActiveApp("ahk_exe mintty.exe", "C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -")
return
o::return
p::return
q::return
r::
	ActiveApp("ahk_exe psr.exe", "C:\WINDOWS\system32\psr.exe")
return
s::
	ActiveApp("ahk_exe sublime_text.exe", "C:\Program Files\Sublime Text 3\sublime_text.exe")
return
t::return
u::return
v::return
w::return
x::return
y::return
z::return

,::
	ActiveNextSameApplication()
return
.::
	ActiveNextSameApplication(back := true)
return

#if

;;----------------------------------------------------
;; マウス操作 モード
;;----------------------------------------------------
#if (mode = MOUSE_MODE)

i::
	TANI_OF_MOVING := 10
	MouseMove, 0, -TANI_OF_MOVING, 0, R
return
k::
	MouseMove, 0, TANI_OF_MOVING, 0, R
return

j::
	MouseMove, -TANI_OF_MOVING, 0, 0, R
return

l::
	MouseMove, TANI_OF_MOVING, 0, 0, R
return

e::
	Loop, %LOOPNUM_OF_MOVING% {
		MouseMove, 0, -TANI_OF_MOVING, 0, R
	}
return

d::
	Loop, %LOOPNUM_OF_MOVING% {
		MouseMove, 0, TANI_OF_MOVING, 0, R
	}
return

s::
	Loop, %LOOPNUM_OF_MOVING% {
		MouseMove, -TANI_OF_MOVING, 0, 0, R
	}
return

f::
	Loop, %LOOPNUM_OF_MOVING% {
		MouseMove, TANI_OF_MOVING, 0, 0, R
	}
return

u::
	MouseClick, Left, 0, 0, 1, 0,, R
return

o::
	MouseClick, Right, 0, 0, 1, 0,, R
return

#if

;;----------------------------------------------------
;; すべてもモードで共通
;;----------------------------------------------------
sc03a::
	Send, {BS}
return

LButton::
	Click, Left, down, , , ,
	While (GetKeyState("LButton", "P")) {
		Sleep, 10
	}
	Click, Left, up, , , ,

	IME_SET(ime_status)
return

F1::
	Send, +#{Right}
return
F2::
	Send, +#{Left}
return
F3::
	ChangeSelectingAppMode()
return
F4::
	Send, !{F4}
return

^F9::
	f9_arrangement := StorageWindowArrangement()
return
F9::
	RestoreWindowArrangement(f9_arrangement)
return
^F10::
	f10_arrangement := StorageWindowArrangement()
return
F10::
	RestoreWindowArrangement(f10_arrangement)
return
^F11::
	f11_arrangement := StorageWindowArrangement()
return
F11::
	RestoreWindowArrangement(f11_arrangement)
return
F12::
	_Test()
return


vk1Dsc07B::
	ChangeNomalMode()
return
sc079::
	ChangeAppMode()
return
sc070::
	ChangeAppMode2()
return
RAlt::
	ChangeAppMode3()
return

RCtrl::
	ChangeMouseMode()
return

^d::
	text := _GetSelectingText()
	esc_text := _EscapeString(text)
	incl_num := _InclementNum()

	if (WinActive(".ahk")) {
		if (text = "") {
			debug_code = MsgBox, `% "Break %incl_num%" `;`;debug code
		}
		else {
			debug_code = MsgBox, `% "Break %incl_num% ``n %esc_text% = " %text% `;`;debug code
		}
	}
	else if (WinActive(".py")) {
		debug_code = 
	}
	else {
		debug_code = 
	}

	Send, {End}
	Send, {Enter}

	_PasteText(debug_code)
return

^m::
	;; この待つ処理を入れないとCtrl二回押しになりCliborが起動する
	while (GetKeyState("Ctrl", "P")) {
		Sleep, 100
	}

	SendLineToCygwin()
return
