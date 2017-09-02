;;----------------------------------------------------
;; アプリメインモード
;;----------------------------------------------------
#if (WinActive("ahk_exe Explorer.EXE")) && (mode = APP_MAIN_MODE)

;; 新規作成、削除
n::
	Send, ^+n ;;ディレクトリ作成
	ChangeNomalMainMode()
return
b::
	Send, {Del}
return

;; コピー、貼り付け、切り取り、元に戻す
c::
	Send, ^c
return
v::
	Send, ^v
return
x::
	Send, ^x
return
z::
	Send, ^z
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
	Send, !{Up}
return
l::
	Send, {Enter}
return

;; 大きく移動
e::
	Send, {Up 5}
return
d::
	Send, {Down 5}
return
s::
	Send, !{Left} ;;戻る
return
f::
	Send, !{Right} ;;進む
return

;; メモ
m::
return

;; 探す
o::
	Send, ^f
return
p::
return

;; 調べる
;; q::return

;; 変更、一つ選択、グループ選択、グループ選択
r::
	Send, {F2}
	ChangeNomalMainMode()
return
t::
	Send, +{F10}
return
y::
u::
return

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe Explorer.EXE")) && (mode = APP_SUB_MODE)

;; 新規作成、削除
n::
return
b::
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
return
f::
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
#if (WinActive("ahk_exe Explorer.EXE")) && (mode = NOMAL_SUB_MODE)

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
return
h::
return

;; 移動
i::
return
k::
return
j::
return
l::
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
