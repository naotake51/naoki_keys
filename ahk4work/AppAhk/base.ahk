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
	PasteText(search_word)
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

a::return

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
return
d::
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

m::
	;; 選択されているテキストをC:\Users\naoki\Documents\memo.txtに書き込む
	MemoSelectingText()
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
#if (mode = SELECT_APP_MODE)

i::
return
j::
	Send, #^{Left}
return
k::
	Send, #{Tab}
return
l::
	Send, #^{Right}
return

e::
return

s::
	;; 変換＋無変換＋ｓはmyキーボードからは命令がいっていいないよう
	Send, #^{Left}
return
d::
	Send, #{Tab}
return
f::
	Send, #^{Right}
return

n::
	Send, #^d
return
b::
	Send, #^{F4}
return


#if
