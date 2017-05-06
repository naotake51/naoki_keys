;;----------------------------------------------------
;; アプリメインモード
;;----------------------------------------------------
#if (WinActive("ahk_exe atom.exe")) && (mode = APP_MAIN_MODE)

;; 新規作成、削除
;; n::return
b::
	Send, ^+k
return

;; コピー、貼り付け、切り取り、元に戻す
c::
	Send, ^c
	Send, {Esc}
	atom_cursor_mode := ATOM_MOVING_TEXT_MODE
return
v::
	Send, ^v
	Send, {Esc}
	atom_cursor_mode := ATOM_MOVING_TEXT_MODE
return
x::
	Send, ^x
	Send, {Esc}
	atom_cursor_mode := ATOM_MOVING_TEXT_MODE
return
;; z::return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
i::
	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {Up}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Up}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up}
return

k::
	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {Down}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Down}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down}
return

j::
	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {Left}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Left}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left}
return

l::
	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {Right}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Right}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right}
return

;; 大きく移動
e::
	if GetKeyState("m", "P") {
		Send, +{F2}
		return
	}

	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {PgUp}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Up 10}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Up 10}
return

d::
	if GetKeyState("m", "P") {
		Send, {F2}
		return
	}

	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {PgDn}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Down 10}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, ^!{Down 10}
return

s::
	if GetKeyState("m", "P") {
		Send, ^!{F2}
		return
	}

	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {Home}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{Home}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left 3}
return

f::
	if GetKeyState("m", "P") {
		Send, +^{F2}
		return
	}

	if (atom_cursor_mode = ATOM_MOVING_TEXT_MODE)
		Send, {End}
	else if (atom_cursor_mode = ATOM_SELECTING_TEXT_MODE)
		Send, +{End}
	else if (atom_cursor_mode = ATOM_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right 3}
return

;; 探す
o::
	Send, ^f
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
  Send, ^!t ;;翻訳機能実行
return
+t::
	Send, ^u
return
y::
	Send, {Esc}
	atom_cursor_mode := ATOM_SELECTING_KUKEI_TEXT_MODE
return
u::
	Send, {Esc}
	atom_cursor_mode := ATOM_SELECTING_TEXT_MODE
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

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe atom.exe")) && (mode = APP_SUB_MODE)

;; 新規作成、削除
n::
	Send, ^n
return
b::
	Send, ^w
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
	Send, {Up}
return
k::
	Send, {Down}
return
j::
	Send, ^{PgUp}
return
l::
	Send, ^{PgDn}
return

;; 大きく移動
e::
	Send, {Esc}
	Send, \
return
d::
	Send, {Esc}
return
s::
	Send, {Esc}
	Send, ^k
	Send, ^p
return
f::
	Send, {Esc}
	Send, ^k
	Send, ^n
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
#if (WinActive("ahk_exe atom.exe")) && (mode = NOMAL_SUB_MODE)

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
