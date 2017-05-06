import sys
import os

import pyauto
from keyhac import *

from app.util import *

def reload_():
    print("reload")
    ckit.ckit_userconfig.reloadConfigScript("config.py")	

def test():
    pass

def configure(keymap):
            
    keymap.defineModifier( 29, "User0" ) #無変換
    keymap.defineModifier( 28, "User1" ) #変換     
    keymap.defineModifier( "A", "User2" ) #
    keymap.defineModifier( "M", "User3" ) #

    keymap_global = keymap.defineWindowKeymap()

    def send_a():send("A")
    keymap_global["A"] = send_a

    def send_m():send("M")
    keymap_global["M"] = send_m

    #CapsLockをBackSpaceに置き換える
    def send_bs():send("BackSpace")
    keymap_global["240"] = send_bs #"CapsLock"では置き換えられなかったため"240"

    #各アプリのキーバインド設定
    from app import base
    from app import atom
    from app import hidemaru
    from app import chrome
    from app import clibor
    from app import free_commander
    from app import eclipse
    from app import android_studio

    base.KeyMap().configure(keymap)
    atom.KeyMap().configure(keymap)
    hidemaru.KeyMap().configure(keymap)
    chrome.KeyMap().configure(keymap)
    clibor.KeyMap().configure(keymap)
    free_commander.KeyMap().configure(keymap)
    eclipse.KeyMap().configure(keymap)
    android_studio.KeyMap().configure(keymap)

    #開発補助
    keymap_global["F5"] = keymap.command_ReloadConfig
    keymap_global["F12"] = test
    
