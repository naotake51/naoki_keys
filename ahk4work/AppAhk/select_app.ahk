
;;----------------------------------------------------
;; アプリ選択モード
;;----------------------------------------------------
#if (mode = SELECT_APP_MODE)

i::
return
j::
	Send, #^{Left}
return
k::
	Send, #{Tab}
return
l::
	Send, #^{Right}
return
e::
return

s::
	;; 変換＋無変換＋ｓは、Myキーボードからは命令がいっていいない
	;; PC本体のキーボードからは入力できる。
return
d::
return
f::
return

n::
	Send, #^d
return
b::
	Send, #^{F4}
return


#if
