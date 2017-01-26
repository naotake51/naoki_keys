
#if (WinActive(".ahk"))

::@if::

	;; 補完テキスト
	completion_text := "if () {`n	`n}`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 3}
	Send, {End}
	Send, {Left 3}

return

::@for::

	;; 補完テキスト
	completion_text := "loop_count_&i := 0`nLoop, %loop_num_&i% {`n	`n	loop_count_&i := loop_count_&i + 1`n}`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 5}
	Send, {End}
	Send, {Left 5}

return

::@fe::

	;; 補完テキスト
	completion_text := "list_&i_index := 0`nlist_&i_length := list_&i[""length""]`nLoop, %list_&i_length% {`n	obj_&i := list_&i[list_&i_index]`n`n	list_&i_index := list_&i_index + 1`n}`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 7}
	Send, {End}
	Send, {Left 5}

return

#if

#if (WinActive(".py"))

::@if::

	;; 補完テキスト
	completion_text := "if  :`n	`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 2}
	Send, {End}
	Send, {Left 2}

return

::@for::

	;; 補完テキスト
	completion_text := "for obj_H in list_H :`n	`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 2}
	Send, {End}
	Send, {Left 12}

return

::@fe::

	;; 補完テキスト
	completion_text := "for obj_&i in list_&i :`n	`n"

	;; インデントを追加
	indent_tabs := _GetLineString()
	indent_tabs_num := StrLen(indent_tabs)
	StringReplace, completion_text, completion_text, `n, `n%indent_tabs%, All

	;; &iにインクリメント数を埋める
	inclement_num := _InclementNum()
	StringReplace, completion_text, completion_text, &i, %inclement_num%, All

	;; 貼り付け
	_PasteText(completion_text)

	;; カーソル位置移動
	Send, {Up 2}
	Send, {End}
	Send, {Left 13}

return

#if