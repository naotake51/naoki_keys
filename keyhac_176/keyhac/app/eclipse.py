from app import editor
from app.util import *        

class KeyMap(editor.KeyMap):
    def __init__(self):
        self.exe_name = "eclipse.exe"
        self.class_name = "SWT_Window0"
        
        self.initialize_app_mode()
    
    def initialize_app_mode(self):
        self.MOVING_TEXT_MODE = 0
        self.SELECTING_TEXT_MODE = 1
        self.SELECTING_KUKEI_TEXT_MODE = 2
        self.cursor_mode = self.MOVING_TEXT_MODE

    def clear_app_mode(self):
        send("Esc")
        
    # 新規作成、削除
    # def n(self):
    def b(self):
        send("C-D")

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
        pass
    def m_d(self):
        pass
    def m_s(self):
        pass
    def m_f(self):
        pass

    # 探す
    def o(self):
        pass
    # def p(self):

    # 調べる
    # def q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    def r(self):
        pass
    def t(self):
        send("S-A-Up")
    def s_t(self):
        pass
    def y(self):
        pass
        # print("atom_y")
        # send("Esc")
        # self.cursor_mode = self.SELECTING_KUKEI_TEXT_MODE
    def u(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_TEXT_MODE

    # 新規作成、削除
    def u1_n(self):
        pass
        # send("C-N")
    def u1_b(self):
        pass
        # send("C-W")

    # コピー、貼り付け、切り取り、元に戻す
    def u1_c(self):
        pass
    def u1_v(self):
        pass
    def u1_x(self):
        pass
    def u1_z(self):
        pass

    # 前を消す、後ろを消す
    # def u1_g(self):
    # def u1_h(self):

    # 移動
    def u1_i(self):
        pass
    def u1_k(self):
        pass
    def u1_j(self):
        pass
    def u1_l(self):
        pass

    # 大きく移動
    def u1_e(self):
        pass
    def u1_d(self):
        pass
    def u1_s(self):
        pass
    def u1_f(self):
        pass

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
        send("Left")
    def u0_l(self):
        send("Right")

    # 大きく移動
    # def u0_e(self):
    def u0_d(self):
        send("F11") #デバッグ
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
    def u0_r(self):
        send("C-F11") #実行
    # def u0_t(self):
    # def u0_y(self):
    # def u0_u(self):
