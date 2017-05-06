
#if (WinActive("ahk_exe FileRename.exe") || WinActive("ahk_exe MkDir.exe")) && (mode = APP_MODE) && (app_mode_ = APP_MAIN_MODE)

~Enter::
	ChangeAppMainMode()
	;; リネームした後、Asr.exeに制御が戻らない問題が発生したため下記コードを追加
	Sleep, 500
	WinActivate, ahk_exe Asr.exe, , ,
return

#if

#if (WinActive("ahk_exe Asr.exe")) && (mode = APP_MODE)

p::
return

^n::
	Send, k
	ChangeNomalMode()
return
n::
	Send, !f
	Send, n
	Send, n
	Send, i
return
b::
	Send, {Del}
return

r::
	Send, r
	ChangeNomalMode()
return
t::
return
+t::
return
y::
return
u::
return

g::
return
h::
return

i::
	Send, {Up}
return
k::
	Send, {Down}
return
j::
	Send, {Bs}
return
l::
	Send, {Enter}
return

e::
	Send, n
return

d::
return

s::
return

f::
return

#if

#if (WinActive("ahk_exe Asr.exe")) && (mode = APP_MODE) && (app_mode_ = APP_SUB_MODE)

p::
return

^n::
return
n::
return
b::
return

r::
return
t::
return
+t::
return
y::
return
u::
return

g::
return
h::
return

i::
	Send, {Up}
return
k::
	Send, {Down}
return
j::
	Send, ^+{Tab}
return
l::
	Send, ^{Tab}
return

e::
return

d::
return

s::
return

f::
return

#if
