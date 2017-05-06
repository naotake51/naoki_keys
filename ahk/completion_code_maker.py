# coding: utf-8

from enum import Enum
import os

INPUT_TEXT_READING_MODE = Enum('INPUT_TEXT_READING_MODE', 'PART_REPLACE_IN_COMOLETION_CODE WITHOUT_CHANGE_OUTPUT_PART')
INPUT_TEXT_READING_MODE = INPUT_TEXT_READING_MODE.WITHOUT_CHANGE_OUTPUT_PART

COMPLETION_CODE_TEMPLATE = """
	;; 補完テキスト
	completion_text := "[::completion_text_ahk_string::]"

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
	[::move_cursor_comment_out::]Send, {Up [::cursor_up_count::]}
	[::move_cursor_comment_out::]Send, {End}
	[::move_cursor_comment_out::]Send, {Left [::cursor_left_count::]}

"""

def make_comletion_code(completion_text):
	completion_code = COMPLETION_CODE_TEMPLATE
	
	completion_text_ahk_string = delete_cursor_symbol(relpace_ahk_escape_char(completion_text))
	completion_code = completion_code.replace("[::completion_text_ahk_string::]", completion_text_ahk_string)

	if "@" in completion_text:
		text_after_symbol = completion_text.split("@", 1)[1]
		text_bettween_symbol_lf = text_after_symbol.split("\n", 1)[0]
		
		completion_code = completion_code\
		.replace("[::move_cursor_comment_out::]", "")\
		.replace("[::cursor_up_count::]", str(text_after_symbol.count("\n")))\
		.replace("[::cursor_left_count::]", str(len(text_bettween_symbol_lf)))
	else:
		completion_code = completion_code.replace("[::move_cursor_comment_out::]", ";;")

	return completion_code

def delete_cursor_symbol(text):
	return text.replace("@", "")

def relpace_ahk_escape_char(text):
	text = text\
	.replace("\n", "`n")\
	.replace("\"", "\"\"")
	return text

if __name__ == "__main__":
	
	base = os.path.dirname(os.path.abspath(__file__))
	input_completion_def_file = base + '\\completion.def'
	output_completion_ahk_file = base + '\\completion.def.ahk'
	
	output_ahk_code = ""

	with open(input_completion_def_file,'r', encoding='utf-8') as f:
		
		part_replace_in_completion_code = ""
		
		line = f.readline()
		while line:
			if line == ">>>\n":
				INPUT_TEXT_READING_MODE = INPUT_TEXT_READING_MODE.PART_REPLACE_IN_COMOLETION_CODE
			elif line == "<<<\n":
				INPUT_TEXT_READING_MODE = INPUT_TEXT_READING_MODE.WITHOUT_CHANGE_OUTPUT_PART
				output_ahk_code += make_comletion_code(part_replace_in_completion_code)
				part_replace_in_completion_code = ""
			else:
				if INPUT_TEXT_READING_MODE == INPUT_TEXT_READING_MODE.WITHOUT_CHANGE_OUTPUT_PART:
					output_ahk_code += line
				elif INPUT_TEXT_READING_MODE == INPUT_TEXT_READING_MODE.PART_REPLACE_IN_COMOLETION_CODE:
					part_replace_in_completion_code += line
			line = f.readline()

	with open(output_completion_ahk_file,'w', encoding='utf-8') as f:
		f.write(output_ahk_code)
