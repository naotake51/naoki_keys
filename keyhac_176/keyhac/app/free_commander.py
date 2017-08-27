from app import base
from app.util import *        

class KeyMap(base.KeyMap):
    def __init__(self):
        self.exe_name = "FreeCommander.exe"
        self.class_name = "" #TfcFormを設定すると設定が反映されない
                
    def initialize_app_mode(self):
        self.is_file_selecting = False
        
    def initialize_nomal_mode(self):
        pass
    
    def initialize_u0_mode(self):
        pass
    
    def initialize_u1_mode(self):
        pass

    def extend_configure(self, app_keymap):
        app_keymap["D-Enter"] = self.put_enter
        
    def put_enter(self):
        send("D-Enter")
        self.change_app_mode()

    # 新規作成、削除
    def ctrl_n(self):
        send("C-S-N") #ファイル作成
        self.change_nomal_mode()
    def n(self):
        send("F7") #ディレクトリ作成
        self.change_nomal_mode()
    def b(self):
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
    # def g(self):
    # def h(self):

    # 移動
    def i(self):
        if self.is_file_selecting:
            send("S-Up")
        else:
            send("Up")
    def k(self):
        if self.is_file_selecting:
            send("S-Down")
        else:
            send("Down")
    def j(self):
        send("BackSpace")
    def l(self):
        send("Enter")

    # 大きく移動
    def e(self):
        send("Up", num = 5)
    def d(self):
        send("Down", num = 5)
    def s(self):
        send("A-Left") #戻る
    def f(self):
        send("A-Right") #進む

    # メモ
    def m(self):
        send("A-Ins") #パスをコピー
    # def m_e(self):
    # def m_d(self):
    # def m_s(self):
    # def m_f(self):

    # 探す
    def o(self):
        send("A-F7")
        # self.change_nomal_mode() #入れるか検討。入れた場合、NOMAL_MODEのEnterにchange_app_mode()をいれるべき？
    def p(self):
        send("A-D")
        send("W")

    # 調べる
    # def q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    def r(self):
        send("F2")
        self.change_nomal_mode()
    def t(self):
        send("Ins")
    def y(self):
        self.is_file_selecting = not self.is_file_selecting
    def u(self):
        self.is_file_selecting = not self.is_file_selecting


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
    def u1_s(self):
        send("Tab")
    def u1_f(self):
        send("Tab")

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
