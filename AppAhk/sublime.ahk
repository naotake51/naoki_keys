


#if (WinActive("ahk_exe sublime_text.exe")) && (mode = APP_MODE)

p::
	Send, ^p
	ChangeNomalMode()
return

b::
	Send, ^+k
return

x::
	Send, ^x
	Send, {Esc}
	sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
return
c::
	Send, ^c
	Send, {Esc}
	sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
return
v::
	Send, ^v
	Send, {Esc}
	sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
return

r::
	Send, !{F3}
	ChangeNomalMode()
return
t::
	Send, ^d
return
+t::
	Send, ^u
return
y::
	Send, {Esc}
	if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
	else
		sublime_cursor_mode := SUBLIME_SELECTING_KUKEI_TEXT_MODE
return
u::
	Send, {Esc}
	if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
	else
		sublime_cursor_mode := SUBLIME_SELECTING_TEXT_MODE
return

g::
	Send, {BS}
	Send, {Esc}
	sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
return
h::
	Send, {Del}
	Send, {Esc}
	sublime_cursor_mode := SUBLIME_MOVING_TEXT_MODE
return

i::
	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {Up}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Up}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up}
return

k::
	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {Down}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Down}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down}
return

j::
	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {Left}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Left}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left}
return

l::

	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {Right}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Right}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right}
return

e::
	if GetKeyState("m", "P") {
		Send, +{F2}
		return
	}

	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {PgUp}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Up 10}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up 10}
return

d::
	if GetKeyState("m", "P") {
		Send, {F2}
		return
	}

	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, {PgDn}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +{Down 10}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down 10}
return

s::
	if GetKeyState("m", "P") {
		Send, ^{F2}
		return
	}

	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, ^{Left}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +^{Left}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, +^{Left}
return

f::
	if GetKeyState("m", "P") {
		Send, +^{F2}
		return
	}

	if (sublime_cursor_mode = SUBLIME_MOVING_TEXT_MODE)
		Send, ^{Right}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_TEXT_MODE)
		Send, +^{Right}
	else if (sublime_cursor_mode = SUBLIME_SELECTING_KUKEI_TEXT_MODE)
		Send, +^{Right}
return

;;;; 選択モードでは連続してshift + 移動キーを送り続きるが、次のキーを押下したときに
;;;; shiftが入りっぱなしになる問題が発生したため、暫定対応として以下のキーを無視する。
;;+i::return
;;+k::return
;;+j::return
;;+l::return
;;+e::return
;;+d::return
;;+s::return
;;+f::return

#if

#if (WinActive("ahk_exe sublime_text.exe")) && (mode = APP_MODE2)

w::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	Send, {Esc}
	mode := APP_MODE
return

b::
	Send, ^w
return
n::
	Send, ^n
	mode := 0
return

1::
	Send, !+{1}
return
2::
	Send, !+{2}
return
3::
	Send, !+{3}
return
4::
	Send, !+{4}
return

+1::
	Send, !+{1}
return
+2::
	Send, !+{8}
return
+3::
	Send, !+{9}
return


e::
return
d::
	Send, ^1
	sublime_window_is_tree_view := false
return
s::
	Send, ^0
	sublime_window_is_tree_view := true
return
f::
	Send, ^2
	sublime_window_is_tree_view := false
return

^e::
return
^d::
	Send, ^+1
^s::
return
^f::
	Send, ^+2
return

i::
	if (sublime_window_is_tree_view) {
		Send, {Up}
	}
	else {
		if (sublime_window_is_tree_view) {
			Send, ^1
		}
		Send, {Up}
		mode := APP_MODE
	}
return
k::
	if (sublime_window_is_tree_view) {
		Send, {Down}
	}
	else {
		if (sublime_window_is_tree_view) {
			Send, ^1
		}
		Send, {Down}
		mode := APP_MODE
	}
return
j::
	if (sublime_window_is_tree_view) {
		Send, {Left}
	}
	else {
		Send, ^{PgUp}
	}
return
l::
	if (sublime_window_is_tree_view) {
		Send, {Right}
	}
	else {
		Send, ^{PgDn}
	}
return

Enter::
	sublime_window_is_tree_view := false
	Send, {Enter}
return

;; オーバーライド
vk1Dsc07B::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeNomalMode()
return
sc079::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeAppMode()
return
sc070::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeAppMode2()
return
RAlt::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeAppMode3()
return
AppsKey::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeSelectingAppMode()
return
RCtrl::
	if (sublime_window_is_tree_view) {
		Send, ^1
	}
	ChangeMouseMode()
return

#if
