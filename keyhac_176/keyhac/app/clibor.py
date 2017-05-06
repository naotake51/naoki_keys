from app import base
from app.util import *        

class KeyMap(base.KeyMap):
    def __init__(self):
        self.exe_name = "Clibor.exe"
        self.class_name = "TFrm_Clibor"
        
        self.initialize_app_mode()
    
    def initialize_app_mode(self):
        pass

    def clear_app_mode(self):
        pass
    
    def extend_configure(self, app_keymap):
        app_keymap["D-Space"] = self.space

    def put_nomal_mode_key(self):
        pass

    def space(self):
        send("A-Enter")
        
    def w(self):
        send("Esc") # Clibor終了 
        
    # 新規作成、削除
    # def n(self):
    #     send("C-S-N")
    def b(self):
        send("Del")
        send("Enter")

    # コピー、貼り付け、切り取り、元に戻す
    def c(self):
        send("Enter")
    def v(self):
        send("A-Enter")
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
        send("Left")
    def l(self):
        send("Right")

    # 大きく移動
    def e(self):
        send("Up", num = 5)
    def d(self):
        send("Down", num = 5)
    def s(self):
        send("Left")
    def f(self):
        send("Right")

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
    # def y(self):
    # def u(self):



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
