;;----------------------------------------------------
;; アプリメインモード
;;----------------------------------------------------
#if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) && (mode = APP_MAIN_MODE)

;; 新規作成、削除
n::
    Send, ^+;
return
b::
    Send, ^-
return

;; コピー、貼り付け、切り取り、元に戻す
c::
    Send, ^c
    excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return
v::
    Send, ^!v ;; 形式を選択して貼り付けウィンドウを表示
    Send, !f ;; 数式(F)を選択
    Send, {Enter} ;; 貼り付け

    excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return
x::
    Send, ^x
    excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return
z::
    Send, ^z
    excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
i::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Up}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Up}
return
k::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Down}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Down}
return
j::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Left}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Left}
return
l::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Right}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Right}
return

;; 大きく移動
e::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
        Send, {PgUp}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
        Send, ^{Space}
return
d::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
        Send, {PgDn}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
        Send, ^{Space}
return
s::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
        Send, {Home}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
        Send, +{Space}
return
f::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE) {
        Send, {End}
        Send, {Right}
    }
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE) {
        Send, +{Space}
    }
return

;; メモ
;; m::return

;; 探す
;; o::return
;; p::return

;; 調べる
q::
    Send, ^+@ ;; ワークシートのセルの値と数式の表示を切り替えます
return

;; 変更、一つ選択、グループ選択、グループ選択
;; r::return
;; t::return

y::
u::
	excell_cell_cursor_mode := EXCEL_SELECTING_CELL_MODE
return

#if

;;----------------------------------------------------
;; アプリサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) && (mode = APP_SUB_MODE)

;; 新規作成、削除
n::
    Send, +{F11} ;;シート挿入
return

;; b::return

;; コピー、貼り付け、切り取り、元に戻す
;; c::return
v::
    Send, ^!v ;; 形式を選択して貼り付けウィンドウを表示
return
;; x::return
;; z::return

;; 前を消す、後ろを消す
;; g::return
;; h::return

;; 移動
;; i::return
;; k::return
;; j::return
;; l::return

;; 大きく移動
;; e::return
;; d::return
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
q::
    Send, ^+@ ;; ワークシートのセルの値と数式の表示を切り替えます
return

;; 変更、一つ選択、グループ選択、グループ選択
;; r::return
;; t::return
;; y::return
;; u::return

#if

;;----------------------------------------------------
;; ノーマルサブモード
;;----------------------------------------------------
#if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) && (mode = NOMAL_SUB_MODE)

Enter::
    Send, !{Enter}
return

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
h::
    Send, {BackSpace}
return

;; 移動
i::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Up}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Up}
return
k::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Down}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Down}
return
j::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Left}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Left}
return
l::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Right}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		Send, +{Right}
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
y::
u::
	excell_cell_cursor_mode := EXCEL_SELECTING_CELL_MODE
return

#if
