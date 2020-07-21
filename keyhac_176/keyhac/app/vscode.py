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

    def clear_app_mode(self):
        send("Esc")
        
    # 新規作成、削除
    # def app_n(self):
    def app_b(self):
        send("C-S-K")

    # コピー、貼り付け、切り取り、元に戻す
    def app_c(self):
        send("C-C")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    def app_v(self):
        send("C-V")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    def app_x(self):
        send("C-X")
        send("Esc")
        self.cursor_mode = self.MOVING_TEXT_MODE
    # def app_z(self):

    # 前を消す、後ろを消す
    # def app_g(self):
    # def app_h(self):

    # 移動
    def app_i(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Up")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Up")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Up")
    def app_k(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Down")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Down")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Down")
    def app_j(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Left")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Left")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Left")
    def app_l(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Right")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Right")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Right")

    # 大きく移動
    def app_e(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("PageUp")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Up", num = 10)
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Up", num = 10)
    def app_d(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("PageDown")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Down", num = 10)
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("C-A-Down", num = 10)
    def app_s(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("Home")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-Home")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Left", num = 3)
    def app_f(self):
        if self.cursor_mode == self.MOVING_TEXT_MODE:
            send("End")
        elif self.cursor_mode == self.SELECTING_TEXT_MODE:
            send("S-End")
        elif self.cursor_mode == self.SELECTING_KUKEI_TEXT_MODE:
            send("S-Right", num = 3)

    # メモ
    # def app_m(self):

    # 探す
    def app_o(self):
        send("C-F")
    # def app_p(self):

    # 調べる
    # def app_q(self):
    def app_w(self):
        send("Alt")
        send("Alt")

    # 変更、一つ選択、グループ選択、グループ選択
    def app_r(self):
        send("A-F3")
        self.change_nomal_mode()
    def app_t(self):
        send("C-D")
        # send("C-A-T") #翻訳機能実行
    def app_s_t(self):
        send("C-U")
    def app_y(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_KUKEI_TEXT_MODE
    def app_u(self):
        send("Esc")
        self.cursor_mode = self.SELECTING_TEXT_MODE

    # 新規作成、削除
    def subapp_n(self):
        send("C-N")
    def subapp_b(self):
        send("C-W")

    # コピー、貼り付け、切り取り、元に戻す
    def subapp_c(self):
        send("C-K")
        send("Left")
    def subapp_v(self):
        send("C-K")
        send("Left")
    def subapp_x(self):
        send("C-K")
        send("C-W")
    def subapp_z(self):
        send("C-K")
        send("C-W")

    # 前を消す、後ろを消す
    # def subapp_g(self):
    # def subapp_h(self):

    # 移動
    def subapp_i(self):
        send("Up")            
    def subapp_k(self):
        send("Down")
    def subapp_j(self):
        send("C-PageUp")
    def subapp_l(self):
        send("C-PageDown")

    # 大きく移動
    def subapp_e(self):
        send("Esc")
        send("A-\\")
    def subapp_d(self):
        send("Esc")
    def subapp_s(self):
        send("C-PageUp")
    def subapp_f(self):
        send("C-PageDown")

    # メモ
    # def subapp_m(self):

    # 探す
    # def subapp_o(self):
    # def subapp_p(self):

    # 調べる
    # def subapp_q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def subapp_r(self):
    # def subapp_t(self):
    # def subapp_y(self):
    # def subapp_u(self):

    # 新規作成、削除
    # def nomalsub_n(self):
    # def nomalsub_b(self):

    # コピー、貼り付け、切り取り、元に戻す
    # def nomalsub_c(self):
    # def nomalsub_v(self):
    # def nomalsub_x(self):
    # def nomalsub_z(self):

    # 前を消す、後ろを消す
    # def nomalsub_g(self):
    # def nomalsub_h(self):

    # 移動
    def nomalsub_i(self):
        send("Up")            
    def nomalsub_k(self):
        send("Down")
    def nomalsub_j(self):
        send("Esc")
    def nomalsub_l(self):
        send("Enter")

    # 大きく移動
    # def nomalsub_e(self):
    # def nomalsub_d(self):
    # def nomalsub_s(self):
    # def nomalsub_f(self):

    # メモ
    # def nomalsub_m(self):

    # 探す
    # def nomalsub_o(self):
    # def nomalsub_p(self):

    # 調べる
    # def nomalsub_q(self):

    # 変更、一つ選択、グループ選択、グループ選択
    # def nomalsub_r(self):
    # def nomalsub_t(self):
    # def nomalsub_y(self):
    # def nomalsub_u(self):
