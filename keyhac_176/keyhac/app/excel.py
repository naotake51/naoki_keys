from app import editor
from app.util import *        

class KeyMap(editor.KeyMap):
    MOVING_TEXT_MODE = 0
    SELECTING_TEXT_MODE = 1
    SELECTING_KUKEI_TEXT_MODE = 2

    def __init__(self):
        self.exe_name = "excel.exe"
        self.class_name = "EXCEL*"

    def initialize_app_mode(self):
        print("initialize_app_mode")
        self.cursor_mode = self.MOVING_TEXT_MODE
        
    def initialize_nomal_mode(self):
        print("initialize_nomal_mode")
    
    def initialize_u0_mode(self):
        print("initialize_u0_mode")
    
    def initialize_u1_mode(self):
        print("initialize_u1_mode")
        send("C-Enter")
        send("C-Enter")

    # 新規作成、削除
    # def n(self):
    # def b(self):

    # コピー、貼り付け、切り取り、元に戻す
    # def c(self):
    # def v(self):
    # def x(self):
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
            send("S-Up")
    def k(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Down")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Down")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Down")
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
    # def e(self):
    # def d(self):
    # def s(self):
    # def f(self):

    # メモ
    # def m(self):
    # def m_e(self):
    # def m_d(self):
    # def m_s(self):
    # def m_f(self):

    # 探す
    # def o(self):
    # def p(self):

    # 調べる
    # def q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def r(self):
    # def t(self):
    def y(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_KUKEI_TEXT_MODE
    def u(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_TEXT_MODE


    # 新規作成、削除
    # def u1_n(self):
    # def u1_b(self):

    # コピー、貼り付け、切り取り、元に戻す
    # def u1_c(self):
    # def u1_v(self):
    # def u1_x(self):
    # def u1_z(self):

    # 前を消す、後ろを消す
    # def u1_g(self):
    # def u1_h(self):

    # 移動
    # def u1_i(self):
    # def u1_k(self):
    # def u1_j(self):
    # def u1_l(self):

    # 大きく移動
    # def u1_e(self):
    # def u1_d(self):
    # def u1_s(self):
    # def u1_f(self):

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
    # def u0_e(self): 半角切り替えにかぶる
    #     send("C-Home")
    def u0_d(self):
        send("C=End")
    def u0_s(self):
        send("C-Up")
    def u0_f(self):
        send("C-Down")

    # メモ
    # def u0_m(self):

    # 探す
    # def u0_o(self):
    # def u0_p(self):

    # 調べる
    # def u0_q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    def u0_r(self):
        send("C-Enter")
        send("C-Enter")
        send("F2")
    # def u0_t(self):
    # def u0_y(self):
    # def u0_u(self):
