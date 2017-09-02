;;----------------------------------------------------
;; アプリメインモード
;;----------------------------------------------------
#if (WinActive("ahk_exe chrome.exe")) && (mode = APP_MAIN_MODE)

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
	Send, !{Left}
return
l::
	Send, !{Right}
return

;; 大きく移動
e::
	Send, ^l
return
d::
	Send, ^l
	Send, ^a
	Sleep, 100
	Send, javascript:body.focus();
	Send, {Enter}
return
;; s::return
;; f::return

;; メモ
;; m::return

;; 探す
o::
	Send, ^f
	ChangeNomalMainMode()
return
p::
	Send, ^e
	ChangeNomalMainMode()
return

;; 調べる
;; q::return

;; 変更、一つ選択、グループ選択、グループ選択
;; r::return
t::
	Send, !l
	ChangeNomalMainMode()
return
;; y::return
;; u::return

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe chrome.exe")) && (mode = APP_SUB_MODE)

;; 新規作成、削除
n::
	Send, ^t
return
b::
	Send, ^w
return

;; コピー、貼り付け、切り取り、元に戻す
;; c::return
;; v::return
;; x::return
;; z::return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
;; i::return
;; k::return
j::
return
l::
return

;; 大きく移動
;; e::return
;; d::return
s::
	Send, ^+{Tab}
return
f::
	Send, ^{Tab}
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
#if (WinActive("ahk_exe chrome.exe")) && (mode = NOMAL_SUB_MODE)

;; 新規作成、削除
;; n::return
;; b::return

;; コピー、貼り付け、切り取り、元に戻す
;; c::return
;; v::return
;; x::return
;; z::return

;; 前を消す、後ろを消す
g::
	Send, {Bs}
return
h::
	Send, {Del}
return

;; 移動
;; i::return
;; k::return
;; j::return
;; l::return

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
