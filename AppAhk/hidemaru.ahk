;;デフォルトで設定されていないショートカットを自分で設定する必要がある
;;Alt+Ctrl+F1 = BOX選択開始
;;Alt+F2 = マーク行の下検索
;;Alt+Shift+F2 = マーク行の上検索
;;Alt+Ctrl+F2 = 現在行をマーク/マーク解除

#if (WinActive("ahk_exe Hidemaru.exe")) && (mode = APP_MODE)

p::
	;未実装
return

b::
	Send, ^{Enter}
return

x::
	Send, ^x
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_SELECTING_TEXT_MODE
return
c::
	Send, ^c
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_SELECTING_TEXT_MODE
return
v::
	Send, ^v
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_MOVING_TEXT_MODE
return

r::
	Send, ^r
	ChangeNomalMode()
return
t::
	Send, {F1}
	ChangeNomalMode()
return
^t::
	Send, {F1}
return

y::
	Send, {Esc}
	Send, !^{F1}
	hidemaru_cursor_mode := HIDEMARU_SELECTING_KUKEI_TEXT_MODE
return
u::
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_SELECTING_TEXT_MODE
return

g::
	Send, {BS}
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_MOVING_TEXT_MODE
return
h::
	Send, {Del}
	Send, {Esc}
	hidemaru_cursor_mode := HIDEMARU_MOVING_TEXT_MODE
return

i::
	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Up}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Up}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Up}
return

k::
	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Down}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Down}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Down}
return

j::
	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Left}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Left}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left}
return

l::
	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Right}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Right}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right}
return

e::
	if GetKeyState("m", "P") {
		Send, +!{F2}
		return
	}

	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, ^{Up}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +^{Up}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +^{Up}
return

d::
	if GetKeyState("m", "P") {
		Send, !{F2}
		return
	}

	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, ^{Down}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +^{Down}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +^{Down}
return

s::
	if GetKeyState("m", "P") {
		Send, ^!{F2}
		return
	}

	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Left 5}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Left 5}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left 5}
return

f::
	if GetKeyState("m", "P") {
		;; 未実装
		return
	}

	if (hidemaru_cursor_mode = HIDEMARU_MOVING_TEXT_MODE)
		Send, {Right 5}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_TEXT_MODE)
		Send, +{Right 5}
	else if (hidemaru_cursor_mode = HIDEMARU_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right 5}
return

#if
