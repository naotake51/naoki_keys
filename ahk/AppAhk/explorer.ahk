#if (WinActive("ahk_exe Explorer.EXE")) && (mode = APP_MODE) && (app_mode_ = APP_MAIN_MODE)
m::return
o::return
p::return
q::return

r::Send, {F2}

n::
	Send, ^+n
	ChangeNomalMode()
return
b::Send, {Del}

t::return
y::return
u::return

g::Send, {Del}
h::Send, {BS}

i::Send, {Up}
k::Send, {Down}
j::Send, !{Up}
l::Send, !{Left}
e::Send, {Up 3}
d::Send, {Down 3}
s::Send, !{Up 3}
f::Send, !{Left 3}

#if
