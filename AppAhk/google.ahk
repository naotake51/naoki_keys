#if (WinActive("ahk_exe chrome.exe")) && (mode = APP_MODE)

m::return
p::return
q::return
w::return

o::
	Send, ^f
	ChangeNomalMode()
return

b::
	Send, ^w
return
n::
	Send, ^t
	ChangeNomalMode()
return

z::return
x::return
c::return
v::return

r::
	Send, ^e
	ChangeNomalMode()
return
t::return
y::return
u::return

g::Send, {Del}
h::Send, {BS}

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
	Send, {Up 4}
return

d::
	Send, {Down 4}
return

s::
	Send, ^+{Tab 4}
return

f::
	Send, ^{Tab 4}
return

Space::
	Send, {Esc}
	Send, {Space}
	ChangeNomalMode()
return

#if

