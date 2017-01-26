AddLastCopyToTeikeibun(){
	Send, {Right}
	Send, {Down}
	Send, ^+n
	Send, ^v
	Send, !i
}

ActivateClibor() {
	Send, {Ctrl}
	Send, {Ctrl}
}

#if (WinActive("ahk_exe Clibor.exe")) && ((mode = APP_MODE) || (mode = APP_MODE2) || (mode = APP_MODE3))

p::return
q::return
w::
	Send, {Esc}
	While (WinActive("ahk_exe Clibor.exe")) {
		Sleep, 100
	}
	ChangeAppMode()
return

o::
	Send, ^+f
	ChangeNomalMode()
return

m::
	Send, {Enter}
	Sleep, 200
	ActivateClibor()
	Sleep, 200
	AddLastCopyToTeikeibun()
return
b::
	Send, {Del}
	Send, {Enter}
return
n::
	Send, ^+n
return

z::
return
x::
return
c::
return
v::
return

r::
return
t::
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
	Send, {Left}
return
l::
	Send, {Right}
return

e::
	Send, {Up 5}
return
d::
	Send, {Down 5}
return
s::
	Send, {Left}
return
f::
	Send, {Right}
return

Enter::
	Send, {Enter}
	if (WinActive("ahk_exe Clibor.exe")) {
		Sleep, 100
	}
	ChangeAppMode()
return

Space::
	Send, !{Enter}
	if (WinActive("ahk_exe Clibor.exe")) {
		Sleep, 100
	}
	ChangeAppMode()
return

#if

