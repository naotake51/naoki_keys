ExcelChangeHensyuuMode() {
	Send, ^{Enter}
	Send, ^{Enter}
	Send, {F2}
	excel_mode := EXCEL_HENSYUU_MODE
}
ExcelChangeNyuuryokuMode() {
	Send, ^{Enter}
	Send, ^{Enter}
	excel_mode := EXCEL_NYUURYOKU_MODE
}

#if (WinActive("ahk_exe EXCEL.EXE") && WinActive("ahk_class XLMAIN")) && (mode = APP_MODE) && (app_mode_ = APP_MAIN_MODE)

q::return

m::
return
.::
return
,::
return
/::
return

o::
	Send, ^f
	ChangeNomalMode()
return

b::
	Send, +{Space}
	Send, ^-
return
n::
	Send, {Down}
	Send, +{Space}
	Send, ^+;
return
+b::
	Send, ^{Space}
	Send, ^-
return
+n::
	Send, {Right}
	Send, ^{Space}
	Send, ^+;
return

z::^z
+z::^+z
x::
	Send, ^x
	excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return
c::
	Send, ^c
	excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return
v::
	Send, ^v
	excell_cell_cursor_mode := EXCEL_MOVING_CELL_MODE
return

g::
	Send, {BS}
	Send, {Esc}
return
h::
	Send, {Del}
	Send, {Esc}
return

i::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Up}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Up}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Up}
return

k::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Down}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Down}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Down}
return

j::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Left}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Left}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Left}
return

l::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Right}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Right}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Right}
return


e::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Up 5}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Up 5}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Up 5}
return

d::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Down 5}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Down 5}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Down 5}
return

s::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Left 5}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Left 5}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Left 5}
return

f::
	if (excell_cell_cursor_mode = EXCEL_MOVING_CELL_MODE)
		Send, {Right 5}
	else if (excell_cell_cursor_mode = EXCEL_SELECTING_CELL_MODE)
		if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE)
			Send, {Right 5}
		else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE)
			Send, +{Right 5}
return

r::
	Send, ^h
	ChangeNomalMode()
return
t::
	if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE) {
		Send, +{Down}
		Send, +{Up}
		Send, +{F8}
	}
return
y::
u::
	if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE) {
		Send, +{Down}
		Send, +{Up}
		excel_selecting_cell_mode_sub_status := EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE
	}
	else if (excel_selecting_cell_mode_sub_status = EXCEL_SELECTING_CELL_MODE_USER_MOVING_CELL_STATE) {
		Send, +{F8}
		excel_selecting_cell_mode_sub_status := EXCEL_SELECTING_CELL_MODE_USER_SELECTING_CELL_STATE
	}
	excell_cell_cursor_mode := EXCEL_SELECTING_CELL_MODE
return

;; オーバーライド
sc079::
	Send, {Esc} ;;編集モードから入力モードに繊維するときESCをするとセルの編集内容が消えてしまうため、ChangeAppMode()にSend, {Esc}を含むことはできない
	ChangeAppMainMode()
return

#if

#if (WinActive("ahk_exe EXCEL.EXE")) && (WinActive("ahk_class XLMAIN")) && (mode = APP_MODE3)

~Space::
	ChangeNomalMode()
return

b::return
p::return

m::
return

o::
return

n::
return

x::
	Send, ^x
	excel_text_cursor_mode := EXCEL_MOVING_TEXT_MODE
return
c::
	Send, ^c
	excel_text_cursor_mode := EXCEL_MOVING_TEXT_MODE
return
v::
	Send, ^v
	excel_text_cursor_mode := EXCEL_MOVING_TEXT_MODE
return

g::
	Send, {BS}
return
h::
	Send, {Del}
return

i::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Up}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Up}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Up}
return

k::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Down}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Down}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Down}
return

j::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Left}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Left}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left}
return

l::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Right}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Right}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right}
return


e::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Up 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Up 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Up 5}
return

d::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Down 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Down 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Down 5}
return

s::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Left 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Left 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Left 5}
return

f::
	if (excel_text_cursor_mode = EXCEL_MOVING_TEXT_MODE)
		Send, {Right 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_TEXT_MODE)
		Send, +{Right 5}
	else if (excel_text_cursor_mode = EXCEL_SELECTING_KUKEI_TEXT_MODE)
		Send, +{Right 5}
return

r::
return
t::
	Send, {Home}
	Send, +{End}
return
y::
u::
	excel_text_cursor_mode := EXCEL_SELECTING_TEXT_MODE
return

;; オーバーライド
;; 編集モードへの遷移ルーチンを実行するとカーソル位置が変わる
vk1Dsc07B::
	mode := NOMAL_MODE
return

#if
