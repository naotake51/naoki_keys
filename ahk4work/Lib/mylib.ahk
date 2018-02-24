;;----------------------------------------------------
;; アプリを有効にする
;;----------------------------------------------------
ActiveApp(app, run_code)
{
	if WinActive(app) {
		WinGet, activate_id, ID, A, , ,
		next_activate_id := _GetNextSameApplication(activate_id)
		WinActivate, ahk_id %next_activate_id%, , ,
	}
	else if WinExist(app) {
		WinActivate
	}
	else {
		Run, %run_code%
	}
	
	While (Not WinActive(app)) {
		Sleep, 100
	}
}

;;----------------------------------------------------
;; カーソル行をCygwinで実行する
;;----------------------------------------------------
SendLineToCygwin() {

	;; テキストエディタの一行を取得
	cmd_line := _GetLineString()

	;; アクティブウィンドウを記憶して、Cygwinに切り替え
	WinGet, active_win_id, ID, A, , ,
	ActiveApp("ahk_exe mintty.exe", "C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -")

	;; コマンド実行
	_PasteText(cmd_line)
	Send, {Enter}

	;; もともとアクティブだったウィンドウに切り替え
	WinActivate, ahk_id %active_win_id%, , ,
}

;;----------------------------------------------------
;; 指定されたプロセスと同じ種類の次プロセスを返す
;;----------------------------------------------------
_GetNextSameApplication(id, back := false) {
	WinGet, activate_process_name, ProcessName, ahk_id %id%, , ,
	same_application_id_list := _GetWinList("ahk_exe " activate_process_name, "", "", "")

	same_application_id_sort_list := _SortNum(same_application_id_list)

	WinGet, activate_win_id, ID, A, , ,
	id_index := _FindIndex(same_application_id_sort_list, id)

	if (back) {
		next_activate_win_index := _Mod(id_index - 1,same_application_id_sort_list.length)
	}
	else {
		next_activate_win_index := _Mod(id_index + 1,same_application_id_sort_list.length)
	}

	next_id := same_application_id_sort_list[next_activate_win_index]

	return next_id
}

;;----------------------------------------------------
;; 呼び出しごとにインクリメントされる数字を返す
;;----------------------------------------------------
global incl_num := 0
_InclementNum() {
	incl_num := incl_num + 1
	return incl_num
}

;;----------------------------------------------------
;; アクティブなウィンドウが表示しているファイルの種類を返す
;;----------------------------------------------------
ActiveFileType() {
	if (WinActive(".ahk")) {
		file_type := "autohotkey"
	}
	else if (WinActive(".py")) {
		file_type := "python"
	}
	else {
		file_type := ""
	}
	return file_type
}

;;----------------------------------------------------
;; カーソル位置の行を取得する
;;----------------------------------------------------
_GetLineString() {
	Send, {Home}
	Send, +{End}
	line := _GetSelectingText()
	Send, {End}
	if (line = "`r`n") || (line = "`n") {
		line := ""
	}
	return line
}

;;----------------------------------------------------
;; セレクト範囲の文字列を返す
;;----------------------------------------------------
_GetSelectingText() {
	cb_bk := ClipboardAll
	Clipboard :=
	Send, ^c
	ClipWait, 2
	if (ErrorLevel <> 0) {
		; Error
		selecting_word := ""
	}
	else
	{
		selecting_word := Clipboard
	}
	Clipboard := cb_bk

	;; SublimeText,Atomは、何も選択していない状態でコピーをすると一行コピーするため、
	;; 最後の文字が改行であれば何も選択していないと推測する
	if (WinActive("ahk_exe sublime_text.exe") || WinActive("ahk_exe atom.exe") || WinActive("ahk_exe Code.exe")) && (_GetLastChar(selecting_word) == "`n") {
		selecting_word := ""
	}

	return %selecting_word%
}

;;----------------------------------------------------
;; 最後の文字を取得する
;;----------------------------------------------------
_GetLastChar(string_text) {
	StringRight, last_char, string_text, 1
	return last_char
}

;;----------------------------------------------------
;; テキストを貼り付ける
;;----------------------------------------------------
_PasteText(text) {
	cb_bk := ClipboardAll
	Clipboard :=
	Clipboard := text
	ClipWait, 2
	if (ErrorLevel <> 0) {
		MsgBox, "FAIL PasteText()"
	}
	if ("ahk_exe mintty.exe") {
		Send, +{Ins}
	}
	else {
		Send, ^v
	}
	Sleep, 500
	Clipboard := cb_bk
}

;;----------------------------------------------------
;; 複数の文字列を結合する
;;----------------------------------------------------
_StringJoin(array_obj, delimiter)
{
	joined_string := ""

	index := 0
	length := array_obj.length
	Loop, %length% {
		joined_string := joined_string array_obj[index] delimiter
		index := index + 1
	}

	joined_string := RTrim(joined_string, OmitChars := delimiter)

	return %joined_string%
}

;;----------------------------------------------------
;; 文字列を分割する
;;----------------------------------------------------
_StringSplit(text, delimiter) {
	StringSplit, subtext_list, text, %delimiter%,

	subtext_list_obj := Object()
	subtext_list_obj_index := 0
	subtext_list_index := 1
	Loop, %subtext_list0% {
		subtext_list_obj[subtext_list_obj_index] := subtext_list%subtext_list_index%
		subtext_list_index := subtext_list_index + 1
		subtext_list_obj_index := subtext_list_obj_index + 1
	}
	subtext_list_obj.length := subtext_list_obj_index

	return subtext_list_obj
}

;;----------------------------------------------------
;; 数値の大小でソートする
;;----------------------------------------------------
_SortNum(array_obj) {
	joined_array_text := _StringJoin(array_obj, ",")

	Sort joined_array_text, N D,

	sort_array_obj := _StringSplit(joined_array_text, ",")

	return sort_array_obj

}

;;----------------------------------------------------
;; AHKでエスケープが必要な文字をエスケープする
;;----------------------------------------------------
_EscapeString(text) {
	StringReplace, text, text, ", "", ALL
	return text
}

;;----------------------------------------------------
;; すべてのウィンドウを取得する
;;----------------------------------------------------
_GetWinList(win_title, win_text, exclude_title, exclude_text) {

	WinGet, win_list, List, %win_title%, %win_text%, %exclude_title%, %exclude_text%

	win_list_obj := Object()
	win_list_obj_index := 0
	win_list_index := 1
	Loop, %win_list% {
		win_list_obj[win_list_obj_index] := win_list%win_list_index%
		win_list_index := win_list_index + 1
		win_list_obj_index := win_list_obj_index + 1
	}
	win_list_obj.length := win_list_obj_index

	return win_list_obj
}

;;----------------------------------------------------
;; オブジェクトを探してインデックスを返す
;;----------------------------------------------------
_FindIndex(array, search_obj) {
	find_index := -1
	index := 0
	loop_num := array.length
	Loop, %loop_num% {
		if (array[index] = search_obj) {
			find_index := index
		}
		index := index + 1
	}
	return find_index
}

;;----------------------------------------------------
;; 剰余を返す
;;----------------------------------------------------
_Mod(n, divisor) {
	ret := Mod(n, divisor)

	; Mod(-1, 3)は2にならなければおかしいが、-1を返す。
	; なので、_Modで調整
	if ((0 <= divisor) && (ret < 0)) || ((divisor < 0) && (0 < ret)) {
		ret := ret + divisor
	}

	return ret
}

;;_LockWindowUpdate(win_title) {
;;	WinGet, win_id, ID, %win_title%, , ,
;;	DllCall("LockWindowUpdate", Uint, win_id)
;;}
;;
;;_RestartAllWindowUpdate() {
;;	DllCall("LockWindowUpdate", Uint, 0)
;;}

;;_HideAllWindow() {
;;	WinGet, win_id_list, List, , , "", ""
;;
;;	window_number := win_id_list
;;	Loop, %win_id_list% {
;;		win_id := win_id_list%window_number%
;;		MsgBox, Break 1`nwin_id = %win_id% ;;debug code
;;		WinHide, ahk_id %win_id%, , ,
;;		window_number := window_number - 1
;;	}
;;}
;;
;;_ShowAllWindow() {
;;	WinGet, win_id_list, List, , , "", ""
;;
;;	window_number := win_id_list
;;	Loop, %win_id_list% {
;;		win_id := win_id_list%window_number%
;;		MsgBox, Break 2`nwin_id = %win_id% ;;debug code
;;		WinShow, ahk_id %win_id%, , ,
;;		window_number := window_number - 1
;;	}
;;}
