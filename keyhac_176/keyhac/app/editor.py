from app import base
from app.util import *        

class KeyMap(base.KeyMap):

    # 新規作成、削除
    def n(self):
        send("End")
        send("Enter")
        self.change_nomal_mode()
    def b(self):
        send("Up")
        send("End")
        send("S-Down")
        send("S-End")
        send("Del")

    # コピー、貼り付け、切り取り、元に戻す
    def c(self):
        send("C-C")
    def v(self):
        send("C-V")
    def x(self):
        send("C-X")
    def z(self):
        send("C-Z")

    # 前を消す、後ろを消す
    def g(self):
        send("BackSpace")
    def h(self):
        send("Del")

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
        send("PageUp")
    def d(self):
        send("PageDown")
    def s(self):
        send("Home")
    def f(self):
        send("End")

    # メモ
    # def m(self):

    # 探す
    def o(self):
        send("C-F")
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
