from app import editor
from app.util import *        

class KeyMap(editor.KeyMap):
    def __init__(self):
        self.exe_name = "Code.exe"
        self.class_name = "Chrome_WidgetWin_1"
    
    def initialize_app_mode(self):
        self.MOVING_TEXT_MODE = 0
        self.SELECTING_TEXT_MODE = 1
        self.SELECTING_KUKEI_TEXT_MODE = 2
        self.cursor_mode = self.MOVING_TEXT_MODE
        send("Esc")

    # def extend_configure(self, app_keymap):
        # #Jumpy用
        # def activate_jumpy():
        #     send("S-Enter")
        #     set_ime_status(False)
        #     self.change_nomal_mode()
        # app_keymap["S-Enter"] = activate_jumpy
        # app_keymap["242"] = activate_jumpy #カタカナ・ひらがな・ローマ字

    def clear_app_mode(self):
        send("Esc")
        
    # 新規作成、削除
    # def n(self):
    def b(self):
        send("C-S-K")

    # コピー、貼り付け、切り取り、元に戻す
    def c(self):
        send("C-C")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    def v(self):
        send("C-V")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    def x(self):
        send("C-X")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    # def z(self):

    # 前を消す、後ろを消す
    # def g(self):
    # def h(self):

    # 移動
    def i(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Up")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Up")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Up")
    def k(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Down")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Down")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Down")
    def j(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Left")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Left")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Left")
    def l(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Right")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Right")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Right")

    # 大きく移動
    def e(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("PageUp")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Up", num = 10)
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Up", num = 10)
    def d(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("PageDown")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Down", num = 10)
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Down", num = 10)
    def s(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Home")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Home")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Left", num = 3)
    def f(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("End")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-End")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Right", num = 3)

    # メモ
    # def m(self):
    def m_e(self):
        send("S-F2")
    def m_d(self):
        send("F2")
    def m_s(self):
        send("C-A-F2")
    def m_f(self):
        send("C-S-F2")

    # 探す
    def o(self):
        send("C-F")
    # def p(self):

    # 調べる
    # def q(self):

    def w(self):
        send("Alt")
        send("Alt")

    # 変更、一つ選択、グループ選択、グループ選択
    def r(self):
        send("A-F3")
        self.change_nomal_mode()
    def t(self):
        send("C-D")
        send("C-A-T") #翻訳機能実行
    def s_t(self):
        send("C-U")
    def y(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_KUKEI_TEXT_MODE
    def u(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_TEXT_MODE

    # 新規作成、削除
    def u1_n(self):
        send("C-N")
    def u1_b(self):
        send("C-W")

    # コピー、貼り付け、切り取り、元に戻す
    def u1_c(self):
        send("C-K")
        send("Left")
    def u1_v(self):
        send("C-K")
        send("Left")
    def u1_x(self):
        send("C-K")
        send("C-W")
    def u1_z(self):
        send("C-K")
        send("C-W")

    # 前を消す、後ろを消す
    # def u1_g(self):
    # def u1_h(self):

    # 移動
    def u1_i(self):
        send("Up")            
    def u1_k(self):
        send("Down")
    def u1_j(self):
        send("C-PageUp")
    def u1_l(self):
        send("C-PageDown")

    # 大きく移動
    def u1_e(self):
        send("Esc")
        send("A-\\")
    def u1_d(self):
        send("Esc")
    def u1_s(self):
        send("C-PageUp")
    def u1_f(self):
        send("C-PageDown")

    # メモ
    # def u1_m(self):

    # 探す
    # def u1_o(self):
    # def u1_p(self):

    # 調べる
    # def u1_q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def u1_r(self):
    # def u1_t(self):
    # def u1_y(self):
    # def u1_u(self):

    # 新規作成、削除
    # def u0_n(self):
    # def u0_b(self):

    # コピー、貼り付け、切り取り、元に戻す
    # def u0_c(self):
    # def u0_v(self):
    # def u0_x(self):
    # def u0_z(self):

    # 前を消す、後ろを消す
    # def u0_g(self):
    # def u0_h(self):

    # 移動
    def u0_i(self):
        send("Up")            
    def u0_k(self):
        send("Down")
    def u0_j(self):
        send("Esc")
    def u0_l(self):
        send("Enter")

    # 大きく移動
    # def u0_e(self):
    # def u0_d(self):
    # def u0_s(self):
    # def u0_f(self):

    # メモ
    # def u0_m(self):

    # 探す
    # def u0_o(self):
    # def u0_p(self):

    # 調べる
    # def u0_q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def u0_r(self):
    # def u0_t(self):
    # def u0_y(self):
    # def u0_u(self):
