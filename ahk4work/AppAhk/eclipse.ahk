
#if (WinActive("ahk_exe javaw.exe"))
^p::
	Send, ^+r
	ChangeNomalMainMode()
return
^+t::
	Send, !{Left}
return
#if

;;----------------------------------------------------
;; アプリメインモード
;;----------------------------------------------------
#if (WinActive("ahk_exe javaw.exe")) && (mode = APP_MAIN_MODE)

;; ブックマーク
m::
	;;Send, ^!{F2}
return
!m::
	;;Send, +^{F2}
return

;; 新規作成、削除
;; n::return
b::
	Send, ^d
return

;; コピー、貼り付け、切り取り、元に戻す
c::
	Send, ^c
	Send, {Esc}
	eclipse_cursor_mode := ECLIPSE_MOVING_TEXT_MODE
return
v::
	Send, ^v
	Send, {Esc}
	eclipse_cursor_mode := ECLIPSE_MOVING_TEXT_MODE
return
x::
	Send, ^x
	Send, {Esc}
	eclipse_cursor_mode := ECLIPSE_MOVING_TEXT_MODE
return
;; z::return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
i::
	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {Up}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Up}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up}
return

k::
	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {Down}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Down}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down}
return

j::
	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {Left}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Left}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left}
return

l::
	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {Right}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Right}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right}
return

;; 大きく移動
e::
	if GetKeyState("m", "P") {
		Send, +{F2}
		return
	}

	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {PgUp}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Up 10}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up 10}
return

d::
	if GetKeyState("m", "P") {
		Send, {F2}
		return
	}

	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {PgDn}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Down 10}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down 10}
return

s::
	if GetKeyState("m", "P") {
		Send, ^!{F2}
		return
	}

	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {Home}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{Home}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left 3}
return

f::
	if GetKeyState("m", "P") {
		Send, +^{F2}
		return
	}

	if (eclipse_cursor_mode = ECLIPSE_MOVING_TEXT_MODE)
		Send, {End}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_TEXT_MODE)
		Send, +{End}
	else if (eclipse_cursor_mode = ECLIPSE_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right 3}
return

;; 探す
o::
	Send, ^o
return
;; p::return

;; 調べる
;; q::return

;; 変更、一つ選択、グループ選択、グループ選択
r::
	Send, !{F3}
	ChangeNomalMainMode()
return
t::
	Send, ^d
;;  Send, ^!t ;;翻訳機能実行
return
+t::
	Send, ^u
return
y::
	Send, {Esc}
	eclipse_cursor_mode := ECLIPSE_SELECTING_KUKEI_TEXT_MODE
return
u::
	Send, {Esc}
	eclipse_cursor_mode := ECLIPSE_SELECTING_TEXT_MODE
return

;;;; 選択モードでは連続してshift + 移動キーを送り続きるが、次のキーを押下したときに
;;;; shiftが入りっぱなしになる問題が発生したため、暫定対応として以下のキーを無視する。
+i::return
+k::return
+j::return
+l::return
+e::return
+d::return
+s::return
+f::return

/::
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
		if (text = "") {
			debug_code = print("Break %incl_num% ") #debug code
		}
		else {
			debug_code = print("Break %incl_num%, %text% = " + str(%text%)) #debug code
		}
	}
	else if (WinActive(".js")) {
		if (text = "") {
			debug_code = console.log("Break_%incl_num%");
		}
		else {
			debug_code = console.log(%text%);
		}
	}
	else {
		if (text = "") {
			debug_code = error_log('Break %incl_num%' . "\n", 3, '/vagrant/cakeapp/logs/debug.log');
		}
		else {
			debug_code = error_log('Break %incl_num% : %text%' . "\n" . print_r(%text%, true) . "\n", 3, '/vagrant/cakeapp/logs/debug.log');
		}
	}

	Send, {End}
	Send, {Enter}

	_PasteText(debug_code)
return

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe javaw.exe")) && (mode = APP_SUB_MODE)

;; 新規作成、削除
n::
	Send, ^n
return
b::
	Send, ^{F4}
return

;; コピー、貼り付け、切り取り、元に戻す
c::
v::
	Send, ^k
	Send, {Left}
return
x::
z::
	Send, ^k
	Send, ^w
return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
i::
	Send, ^+g
return
k::
	Send, {F3}
return
j::
	Send, !{Left}
return
l::
	Send, !{Right}
return

;; 大きく移動
;;e::
;;return
d::
	Send, ^m
return
s::
	Send, ^{PgUp}
return
f::
	Send, ^{PgDn}
return

;; メモ
;; m::return

;; 探す
;; o::return

;; p::return

;; 調べる
;; q::return

;; 変更、一つ選択、グループ選択、グループ選択
;; r::return
;; t::return
;; y::return
;; u::return

#if

;;----------------------------------------------------
;; ノーマルサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe javaw.exe")) && (mode = NOMAL_SUB_MODE)

;; 新規作成、削除
;; n::return
;; b::return

;; コピー、貼り付け、切り取り、元に戻す
;; c::return
;; v::return
;; x::return
;; z::return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
i::
	Send, {Up}
return
k::
	Send, {Down}
return
j::
	Send, {Esc}
return
l::
	Send, {Enter}
return

;; 大きく移動
;; e::return
;; d::return
;; s::return
;; f::return

;; メモ
;; m::return

;; 探す
;; o::return
;; p::return

;; 調べる
;; q::return

;; 変更、一つ選択、グループ選択、グループ選択
;; r::return
;; t::return
;; y::return
;; u::return

#if
