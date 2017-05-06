import pyauto
from keyhac import *

import ctypes
import threading
import subprocess

char_to_vk = {
    "BackSpace" : 8,
    "Tab" : 9,
    "Clear" : 12,
    "Enter" : 13,
    "Shift" : 16,
    "Ctrl" : 17,
    "Alt" : 18,
    "Pause" : 19,
    "Capital" : 20, #Shift+CapsLock
    "Esc" : 27,
    "変換" : 28,
    "無変換" : 29,
    "Space" : 32,
    "PageUp" : 33,
    "PageDown" : 34,
    "End" : 35,
    "Home" : 36,
    "Left" : 37,
    "Up" : 38,
    "Right" : 39,
    "Down" : 40,
    "PrintScreen" : 44,
    "Ins" : 45,
    "Del" : 46,
    "0" : 48,
    "1" : 49,
    "2" : 50,
    "3" : 51,
    "4" : 52,
    "5" : 53,
    "6" : 54,
    "7" : 55,
    "8" : 56,
    "9" : 57,
    "A" : 65,
    "B" : 66,
    "C" : 67,
    "D" : 68,
    "E" : 69,
    "F" : 70,
    "G" : 71,
    "H" : 72,
    "I" : 73,
    "J" : 74,
    "K" : 75,
    "L" : 76,
    "M" : 77,
    "N" : 78,
    "O" : 79,
    "P" : 80,
    "Q" : 81,
    "R" : 82,
    "S" : 83,
    "T" : 84,
    "U" : 85,
    "V" : 86,
    "W" : 87,
    "X" : 88,
    "Y" : 89,
    "Z" : 90,
    "LWin" : 91,
    "RWin" : 92,
    "Apps" : 93,
    "Num0" : 96,
    "Num1" : 97,
    "Num2" : 98,
    "Num3" : 99,
    "Num4" : 100,
    "Num5" : 101,
    "Num6" : 102,
    "Num7" : 103,
    "Num8" : 104,
    "Num9" : 105,
    "Tenkey *" : 106,
    "Tenkey +" : 107,
    "Tenkey -" : 109,
    "Tenkey ." : 110,
    "Tenkey /" : 111,
    "F1" : 112,
    "F2" : 113,
    "F3" : 114,
    "F4" : 115,
    "F5" : 116,
    "F6" : 117,
    "F7" : 118,
    "F8" : 119,
    "F9" : 120,
    "F10" : 121,
    "F11" : 122,
    "F12" : 123,
    "NumLock" : 144,
    "ScrollLock" : 145,
    ":" : 186,
    ";" : 187,
    "," : 188,
    "Minus" : 189, #-をセパレーターとして使っているので使用できない
    "." : 190,
    "/" : 191,
    "@" : 192,
    "[" : 219,
    "Yen" : 220,
    "]" : 221,
    "^" : 222,
    "\\" : 226,
    "半角/全角" : 229,
    "前候補" : 229,
    "CapsLock" : 240,
    "カタカナひらがな" : 242,
}

def get_focus_window_name():
    focus_window = Window.getFocus()
    window_name = focus_window.getProcessName()
    return window_name
    
def send(key, num = 1):
    # alt_state = get_key_state("Alt")
    # shift_state = get_key_state("Shift")
    # ctrl_state = get_key_state("Ctrl")
    
    vk_alt = char_to_vk["Alt"]
    vk_shift = char_to_vk["Shift"]
    vk_ctrl = char_to_vk["Ctrl"]

    token_list = key.split("-")
    
    modifier_list = token_list[:-1]
    char = token_list[-1]
    vk = char_to_vk[char]
    
    if "D" in modifier_list:
        key_command_list = [KeyDown(vk) for i in range(0, num)]
        if "A" in modifier_list:
            key_command_list = [KeyDown(vk_alt)] + key_command_list
        if "S" in modifier_list:
            key_command_list = [KeyDown(vk_shift)] + key_command_list
        if "C" in modifier_list:
            key_command_list = [KeyDown(vk_ctrl)] + key_command_list
    elif "U" in modifier_list:
        key_command_list = [KeyUp(vk) for i in range(0, num)]
        if "A" in modifier_list:
            key_command_list = key_command_list + [KeyUp(vk_alt)]
        if "S" in modifier_list:
            key_command_list = key_command_list + [KeyUp(vk_shift)]
        if "C" in modifier_list:
            key_command_list = key_command_list + [KeyUp(vk_ctrl)]
    else:
        key_command_list = [Key(vk) for i in range(0, num)]
        if "A" in modifier_list:
            key_command_list = [KeyDown(vk_alt)] + key_command_list + [KeyUp(vk_alt)]
        if "S" in modifier_list:
            key_command_list = [KeyDown(vk_shift)] + key_command_list + [KeyUp(vk_shift)]
        if "C" in modifier_list:
            key_command_list = [KeyDown(vk_ctrl)] + key_command_list + [KeyUp(vk_ctrl)]
    
    # if alt_state:
    #     key_command_list += [KeyDown(vk_alt)]
    # else:
    #     key_command_list += [KeyUp(vk_alt)]
    # 
    # if shift_state:
    #     key_command_list += [KeyDown(vk_shift)]
    # else:
    #     key_command_list += [KeyUp(vk_shift)]
    # 
    # if ctrl_state:
    #     key_command_list += [KeyDown(vk_ctrl)]
    # else:
    #     key_command_list += [KeyUp(vk_ctrl)]
    
    Input.send(key_command_list)
    
def send_string(string):
    key_command_list = []
    for c in string:
        key_command_list.append(Char(c))
    Input.send(key_command_list)

def activate_window(exe_name, class_name, exe_command):    
    def _activate_window_later():
        _activate_window_later.find_target_window = False
        def _if_tartget_window_then_activate(window, not_use):
            if window.getProcessName() == exe_name and window.getClassName() == class_name:
                window.setForeground()
                window.maximize()
                _activate_window_later.find_target_window = True
                # return False
            return True
        
        Window.enum(_if_tartget_window_then_activate, None)
        
        #アクティブにするウィンドがなかった場合、exe_commandを実行
        # if not _activate_window_later.find_target_window:
        #     subprocess.call(exe_command, shell = True)
            
    #この関数でウィンドウ切り替え処理を行うと、バインドされる前のキーが削除されない現象がおこる。そのため、この関数を抜けたあとにウィンドウを切り替える必要がある
    t = threading.Timer(0.1, _activate_window_later)
    t.start()
    

def is_ime_opened(hnd_window = None):
    if not hnd_window:
        hnd_window = get_focus_window_handle()
        hnd_window = ctypes.wintypes.HWND(hnd_window)
        print(hnd_window)
        
        hnd_ime_window = ctypes.windll.imm32.ImmGetDefaultIMEWnd(hnd_window)
        hnd_ime_window = ctypes.wintypes.HWND(hnd_ime_window)
        print(hnd_ime_window)

        status = 1 if status else 0
        ime_open_status = ctypes.windll.user32.SendMessageW(hnd_ime_window, ctypes.c_uint(0x0283), ctypes.c_int(0x0005), ctypes.c_int(0))
    
        return ime_open_status
        
def set_ime_status(status, hnd_window = None):
    if not hnd_window:
        hnd_window = get_focus_window_handle()
        hnd_window = ctypes.wintypes.HWND(hnd_window)
        
        hnd_ime_window = ctypes.windll.imm32.ImmGetDefaultIMEWnd(hnd_window)
        hnd_ime_window = ctypes.wintypes.HWND(hnd_ime_window)

        status = 1 if status else 0
        errot_status = ctypes.windll.user32.SendMessageW(hnd_ime_window, ctypes.c_uint(0x0283), ctypes.c_int(0x0006), ctypes.c_int(status))
        
        is_error = errot_status != 0 #0:成功
        return is_error
         
class RECT(ctypes.Structure):
     _fields_ = [
         ("left", ctypes.c_ulong),
         ("top", ctypes.c_ulong),
         ("right", ctypes.c_ulong),
         ("bottom", ctypes.c_ulong)
    ]
    
class GUITHREADINFO(ctypes.Structure):
    _fields_ = [
        ("cbSize", ctypes.c_ulong),
        ("flags", ctypes.c_ulong),
        ("hwndActive", ctypes.wintypes.HWND),
        ("hwndFocus", ctypes.wintypes.HWND),
        ("hwndCapture", ctypes.wintypes.HWND),
        ("hwndMenuOwner", ctypes.wintypes.HWND),
        ("hwndMoveSize", ctypes.wintypes.HWND),
        ("hwndCaret", ctypes.wintypes.HWND),
        ("rcCaret", RECT)
    ]

def get_focus_window_handle():
    # Find the focussed window.
    guiThreadInfo = GUITHREADINFO(cbSize=ctypes.sizeof(GUITHREADINFO))
    ctypes.windll.user32.GetGUIThreadInfo(0, ctypes.byref(guiThreadInfo))
    focussedWindow = guiThreadInfo.hwndFocus
    return focussedWindow

# def print_foucus_window_info():
#     foucus_window_handle = get_focus_window_handle()
#     ctype.windll.user32.GetClassName(foucus_window_handle, byref(), 256)
#     foucus_window_handle
