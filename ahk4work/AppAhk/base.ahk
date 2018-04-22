
;;----------------------------------------------------
;; 通常モード
;;----------------------------------------------------
#if (mode = NOMAL_MAIN_MODE)

#if

;;----------------------------------------------------
;; 通常補助モード
;;----------------------------------------------------
#if (mode = NOMAL_SUB_MODE)

n::
	If GetKeyState("sc07B", "P") {
		IME_SET(1)
	}
	else {
		Send, n
	}
return

e::
	If GetKeyState("sc07B", "P") {
		IME_SET(0)
	}
	else {
		Send, e
	}
return

#if

;;----------------------------------------------------
;; アプリモード
;;----------------------------------------------------
#if (mode = APP_MAIN_MODE)

~Backspace::
~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~0::
~-::
~^::
~\::
~@::
~[::
~;::
~sc073::	;; :のキーコード
~]::
~,::
~.::
~/::
~sc028::	;; \のキーコード
~+-::
~+^::
~+\::
~+@::
~+[::
~+;::
~+sc073::	;; :のキーコード
~+]::
~+,::
~+.::
~+/::
~+sc028::	;; \のキーコード
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
~+a::
~+b::
~+c::
~+d::
~+e::
~+f::
~+g::
~+h::
~+i::
~+j::
~+k::
~+l::
~+m::
~+n::
~+o::
~+p::
~+q::
~+r::
~+s::
~+t::
~+u::
~+v::
~+w::
~+x::
~+y::
;;	Send, {Esc}
	ChangeNomalMainMode()
return

m::
	;; マーク機能。edsfと組み合わせて使う
return

o::
	Send, ^f
	ChangeNomalMainMode()
return
p::return

q::
	search_word := ActiveFileType() " " _GetSelectingText()
	ActiveApp("ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
	Send, ^t
	_PasteText(search_word)
	ChangeNomalMainMode()
return

w::
	Send, {Alt down}
	Send, {Alt up}
	Send, {Alt down}
	Send, {Alt up}
	While (Not WinActive("ahk_exe Clibor.exe")) {
		Sleep, 100
	}
	ChangeAppMainMode()
return

a::
	SelectAppRoutine()
return

b::return

n::
	Send, {End}
	Send, {Enter}
	ChangeNomalMainMode()
return

z::Send, ^z
+z::Send, ^y
x::Send, ^x
c::Send, ^c
v::Send, ^v

r::return
t::return
y::return

u::
	Send, {Esc}
	base_cursor_mode := BASE_SELECTING_TEXT_MODE
return


g::Send, {Bs}
h::Send, {Del}

;; 移動
i::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {Up}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Up}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, ^!{Up}
return

k::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {Down}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Down}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, ^!{Down}
return

j::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {Left}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Left}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, +{Left}
return

l::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {Right}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Right}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, +{Right}
return

;; 大きく移動
e::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {PgUp}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Up 10}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, ^!{Up 10}
return

d::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {PgDn}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Down 10}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, ^!{Down 10}
return

s::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {Home}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{Home}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, +{Left 3}
return

f::
	if (base_cursor_mode = BASE_MOVING_TEXT_MODE)
		Send, {End}
	else if (base_cursor_mode = BASE_SELECTING_TEXT_MODE)
		Send, +{End}
;;	else if (base_cursor_mode = BASE_SELECTING_KUKEI_TEXT_MODE)
;;		Send, +{Right 3}
return

~Shift::
	ChangeNomalMainMode()
return

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (mode = APP_SUB_MODE)

e::
	Send, !{Esc}
return
d::
	Send, !+{Esc}
return
f::
return
s::
return

i::
	Send, {Up}
return
k::
	Send, {Down}
return
j::
	Send, {Left}
return
l::
	Send, {Right}
return

1::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 1
	Send, %select_app_number%
return
2::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 2
	Send, %select_app_number%
return
3::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 3
	Send, %select_app_number%
return
4::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 4
	Send, %select_app_number%
return
5::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 5
	Send, %select_app_number%
return
6::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 6
	Send, %select_app_number%
return
7::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 7
	Send, %select_app_number%
return
8::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 8
	Send, %select_app_number%
return
9::
	if (select_app_number = 0) {
		Send, {LWin down}
	}
	select_app_number = 9
	Send, %select_app_number%
return
0::
	Send, #+{Right} ;;ウィンドウを反対側画面へ移動
	Sleep, 100 ;; ウィンドウが反対側に移るまで待つ
	Send, #{Up} ;;ウィンドウ最大化
return

#if

;;----------------------------------------------------
;; アプリ選択モード
;;----------------------------------------------------
SelectAppRoutine() {

	_ime_status := IME_GET()
	
	ChangeSelectAppMode()

	while GetKeyState("a", "P") {
		if GetKeyState("b", "P") {
			ActiveApp("ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
		}
		else if GetKeyState("c", "P") {
			ActiveApp("ahk_exe cmd.exe", "C:\WINDOWS\system32\cmd.exe")
		}
		else if GetKeyState("d", "P") {
		}
		else if GetKeyState("e", "P") {
			ActiveApp("ahk_exe atom.exe", "C:\Users\naoki\AppData\Local\atom\Update.exe --processStart ""atom.exe""")
			;;ActiveApp("ahk_exe sublime_text.exe", "C:\Program Files\Sublime Text 3\sublime_text.exe")
			;;ActiveApp("ahk_exe Hidemaru.exe", "C:\Program Files\Hidemaru\Hidemaru.exe")
		}
		else if GetKeyState("f", "P") {
			ActiveApp("ahk_exe FreeCommander.exe", "C:\Program Files\FreeCommander\FreeCommander.exe")
		}
		else if GetKeyState("g", "P") {
		}
		else if GetKeyState("h", "P") {
		}
		else if GetKeyState("i", "P") {
		}
		else if GetKeyState("j", "P") {
		}
		else if GetKeyState("k", "P") {
		}
		else if GetKeyState("l", "P") {
		}
		else if GetKeyState("m", "P") {
		}
		else if GetKeyState("n", "P") {
		}
		else if GetKeyState("o", "P") {
		}
		else if GetKeyState("p", "P") {
		}
		else if GetKeyState("q", "P") {
		}
		else if GetKeyState("r", "P") {
			ActiveApp("ahk_exe psr.exe", "C:\WINDOWS\system32\psr.exe")
		}
		else if GetKeyState("s", "P") {
			ActiveApp("ahk_exe EXCEL.EXE", "C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
		}
		else if GetKeyState("t", "P") {
			ActiveApp("ahk_exe mintty.exe", "C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -")
		}
		else if GetKeyState("u", "P") {
		}
		else if GetKeyState("v", "P") {
		}
		else if GetKeyState("w", "P") {
		}
		else if GetKeyState("x", "P") {
		}
		else if GetKeyState("w", "P") {
		}
		else if GetKeyState("z", "P") {
		}
		else if GetKeyState(",", "P") {
			WinGet, activate_id, ID, A, , ,
			next_activate_id := _GetNextSameApplication(activate_id)
			WinActivate, ahk_id %next_activate_id%, , ,
		}
		else if GetKeyState(".", "P") {
			WinGet, activate_id, ID, A, , ,
			next_activate_id := _GetNextSameApplication(activate_id, back := true)
			WinActivate, ahk_id %next_activate_id%, , ,
		}
		else if GetKeyState("+", "P") {
			Send, +{Tab}
		}
		else if GetKeyState("1", "P") {
			Send, +#{Right}
		}
		else if GetKeyState("4", "P") {
			Send, !{F4}
		}
		else {
		}
		Sleep, 100
	}

	ChangeAppMainMode()

	IME_SET(_ime_status)
	
}

#if (mode = SELECT_APP_MODE)
a::
	;; 何個もアプリ選択ルーチンが起動しないように
return

b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
return

#if
