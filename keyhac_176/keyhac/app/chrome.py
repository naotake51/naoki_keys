from app import base
from app.util import *        

class KeyMap(base.KeyMap):
    def __init__(self):
        self.exe_name = "chrome.exe"
        self.class_name = "Chrome_WidgetWin_1"
        
        self.initialize_app_mode()
    
    def initialize_app_mode(self):
        pass

    def clear_app_mode(self):
        pass

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
        send("Up")
    def k(self):
        send("Down")
    def j(self):
        send("A-Left")
    def l(self):
        send("A-Right")

    # 大きく移動
    def e(self):
        send("C-L")
    def d(self):
        send("C-L")
        time.sleep(0.1)
        send_string("javascript:")
        time.sleep(0.1)
        send("Enter")
        send("Tab")
    # def s(self):
    # def f(self):

    # メモ
    # def m(self):

    # 探す
    def o(self):
        send("C-F")
        self.change_nomal_mode()
    def p(self):
        send("C-E")
        self.change_nomal_mode()

    # 調べる
    # def q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def r(self):
    def t(self):
        send("A-L")
        self.change_nomal_mode()
    # def y(self):
    # def u(self):



    # 新規作成、削除
    def u1_n(self):
        send("C-T")
    def u1_b(self):
        send("C-W")

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
    def u1_j(self):
        send("C-S-Tab")
    def u1_l(self):
        send("C-Tab")

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
    def u0_g(self):
        send("BackSpace")
    def u0_h(self):
        send("Del")

    # 移動
    # def u0_i(self):
    # def u0_k(self):
    # def u0_j(self):
    # def u0_l(self):

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
