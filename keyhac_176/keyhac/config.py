import sys
import os

import pyauto
from keyhac import *

from app import util

def test():
    pass

def configure(keymap):
            
    keymap.defineModifier( 29, "User0" ) #無変換
    keymap.defineModifier( 28, "User1" ) #変換     

    keymap_global = keymap.defineWindowKeymap()

    #各アプリのキーバインド設定
    from app import base
    from app import vscode

    base.KeyMap().configure(keymap)
    vscode.KeyMap().configure(keymap)

    #開発補助
    keymap_global["F12"] = test
    
