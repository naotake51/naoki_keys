from app.util import *        

class KeyMap():
    
    NOMAL_MODE = 0
    APP_MODE = 1
    mode = APP_MODE
    
    def __init__(self):
        self.exe_name = ""
        self.class_name = ""

    def initialize_app_mode(self):
        pass
        
    def clear_app_mode(self):
        pass
        
    def extend_configure(self, keymap):
        pass

    def change_nomal_mode(self):
        self.mode = self.NOMAL_MODE
    
    def change_app_mode(self):
        self.mode = self.APP_MODE
        self.initialize_app_mode()

    def put_nomal_mode_key(self):
        if self.mode != self.NOMAL_MODE:
            self.change_nomal_mode()
    
    def down_app_mode_key(self):
        if self.mode != self.APP_MODE:
            self.change_app_mode()
        
    def up_app_mode_key(self):
        self.change_app_mode()
        self.clear_app_mode()
                    
    def a(self):pass
    def b(self):pass
    def c(self):pass
    def d(self):pass
    def e(self):pass
    def f(self):pass
    def g(self):pass
    def h(self):pass
    def i(self):pass
    def j(self):pass
    def k(self):pass
    def l(self):pass
    def m(self):pass
    def n(self):pass
    def o(self):pass
    def p(self):pass
    def q(self):pass
    def r(self):pass
    def s(self):pass
    def t(self):pass
    def u(self):pass
    def v(self):pass
    def w(self):send("Ctrl", num = 2) #Cliobor
    def x(self):pass
    def y(self):pass
    def z(self):pass    
    
    def put_a(self):send("D-A") if self.mode == self.NOMAL_MODE else self.a()
    def put_b(self):send("D-B") if self.mode == self.NOMAL_MODE else self.b()
    def put_c(self):send("D-C") if self.mode == self.NOMAL_MODE else self.c()
    def put_d(self):send("D-D") if self.mode == self.NOMAL_MODE else self.d()
    def put_e(self):send("D-E") if self.mode == self.NOMAL_MODE else self.e()
    def put_f(self):send("D-F") if self.mode == self.NOMAL_MODE else self.f()
    def put_g(self):send("D-G") if self.mode == self.NOMAL_MODE else self.g()
    def put_h(self):send("D-H") if self.mode == self.NOMAL_MODE else self.h()
    def put_i(self):send("D-I") if self.mode == self.NOMAL_MODE else self.i()
    def put_j(self):send("D-J") if self.mode == self.NOMAL_MODE else self.j()
    def put_k(self):send("D-K") if self.mode == self.NOMAL_MODE else self.k()
    def put_l(self):send("D-L") if self.mode == self.NOMAL_MODE else self.l()
    def put_m(self):send("D-M") if self.mode == self.NOMAL_MODE else self.m()
    def put_n(self):send("D-N") if self.mode == self.NOMAL_MODE else self.n()
    def put_o(self):send("D-O") if self.mode == self.NOMAL_MODE else self.o()
    def put_p(self):send("D-P") if self.mode == self.NOMAL_MODE else self.p()
    def put_q(self):send("D-Q") if self.mode == self.NOMAL_MODE else self.q()
    def put_r(self):send("D-R") if self.mode == self.NOMAL_MODE else self.r()
    def put_s(self):send("D-S") if self.mode == self.NOMAL_MODE else self.s()
    def put_t(self):send("D-T") if self.mode == self.NOMAL_MODE else self.t()
    def put_u(self):send("D-U") if self.mode == self.NOMAL_MODE else self.u()
    def put_v(self):send("D-V") if self.mode == self.NOMAL_MODE else self.v()
    def put_w(self):send("D-W") if self.mode == self.NOMAL_MODE else self.w()
    def put_x(self):send("D-X") if self.mode == self.NOMAL_MODE else self.x()
    def put_y(self):send("D-Y") if self.mode == self.NOMAL_MODE else self.y()
    def put_z(self):send("D-Z") if self.mode == self.NOMAL_MODE else self.z()

    def u0_a(self):pass
    def u0_b(self):pass
    def u0_c(self):pass
    def u0_d(self):pass
    def u0_e(self):set_ime_status(False)
    def u0_f(self):pass
    def u0_g(self):pass
    def u0_h(self):pass
    def u0_i(self):pass
    def u0_j(self):pass
    def u0_k(self):pass
    def u0_l(self):pass
    def u0_m(self):pass
    def u0_n(self):set_ime_status(True)
    def u0_o(self):pass
    def u0_p(self):pass
    def u0_q(self):pass
    def u0_r(self):pass
    def u0_s(self):pass
    def u0_t(self):pass
    def u0_u(self):pass
    def u0_v(self):pass
    def u0_w(self):pass
    def u0_x(self):pass
    def u0_y(self):pass
    def u0_z(self):pass

    def put_u0_a(self):self.u0_a()
    def put_u0_b(self):self.u0_b()
    def put_u0_c(self):self.u0_c()
    def put_u0_d(self):self.u0_d()
    def put_u0_e(self):self.u0_e()
    def put_u0_f(self):self.u0_f()
    def put_u0_g(self):self.u0_g()
    def put_u0_h(self):self.u0_h()
    def put_u0_i(self):self.u0_i()
    def put_u0_j(self):self.u0_j()
    def put_u0_k(self):self.u0_k()
    def put_u0_l(self):self.u0_l()
    def put_u0_m(self):self.u0_m()
    def put_u0_n(self):self.u0_n()
    def put_u0_o(self):self.u0_o()
    def put_u0_p(self):self.u0_p()
    def put_u0_q(self):self.u0_q()
    def put_u0_r(self):self.u0_r()
    def put_u0_s(self):self.u0_s()
    def put_u0_t(self):self.u0_t()
    def put_u0_u(self):self.u0_u()
    def put_u0_v(self):self.u0_v()
    def put_u0_w(self):self.u0_w()
    def put_u0_x(self):self.u0_x()
    def put_u0_y(self):self.u0_y()
    def put_u0_z(self):self.u0_z()

    def u1_a(self):pass
    def u1_b(self):pass
    def u1_c(self):pass
    def u1_d(self):pass
    def u1_e(self):pass
    def u1_f(self):pass
    def u1_g(self):pass
    def u1_h(self):pass
    def u1_i(self):pass
    def u1_j(self):pass
    def u1_k(self):pass
    def u1_l(self):pass
    def u1_m(self):pass
    def u1_n(self):pass
    def u1_o(self):pass
    def u1_p(self):pass
    def u1_q(self):pass
    def u1_r(self):pass
    def u1_s(self):pass
    def u1_t(self):pass
    def u1_u(self):pass
    def u1_v(self):pass
    def u1_w(self):pass
    def u1_x(self):pass
    def u1_y(self):pass
    def u1_z(self):pass

    def put_u1_a(self):self.u1_a()
    def put_u1_b(self):self.u1_b()
    def put_u1_c(self):self.u1_c()
    def put_u1_d(self):self.u1_d()
    def put_u1_e(self):self.u1_e()
    def put_u1_f(self):self.u1_f()
    def put_u1_g(self):self.u1_g()
    def put_u1_h(self):self.u1_h()
    def put_u1_i(self):self.u1_i()
    def put_u1_j(self):self.u1_j()
    def put_u1_k(self):self.u1_k()
    def put_u1_l(self):self.u1_l()
    def put_u1_m(self):self.u1_m()
    def put_u1_n(self):self.u1_n()
    def put_u1_o(self):self.u1_o()
    def put_u1_p(self):self.u1_p()
    def put_u1_q(self):self.u1_q()
    def put_u1_r(self):self.u1_r()
    def put_u1_s(self):self.u1_s()
    def put_u1_t(self):self.u1_t()
    def put_u1_u(self):self.u1_u()
    def put_u1_v(self):self.u1_v()
    def put_u1_w(self):self.u1_w()
    def put_u1_x(self):self.u1_x()
    def put_u1_y(self):self.u1_y()
    def put_u1_z(self):self.u1_z()

    # def u2_oneshot(self):
    #     print("onshot")
    #     send("A-Tab")
    def u2_a(self):pass
    def u2_b(self):
        activate_window("chrome.exe", "Chrome_WidgetWin_1", "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe")
    def u2_c(self):
        activate_window("cmd.exe", "ConsoleWindowClass", "C:\\Users\\naoki\\AppData\\Roaming\\MICROS~1\\Windows\\STARTM~1\\Programs\\SYSTEM~1\\Command Prompt.lnk")
    def u2_d(self):pass
    def u2_e(self):
        activate_window("atom.exe", "Chrome_WidgetWin_1", "C:\\Users\\naoki\\AppData\\Local\\atom\\Update.exe --processStart \"atom.exe\"")
    def u2_f(self):
        activate_window("FreeCommander.exe", "TfcForm", "C:\\Program Files\\FreeCommander\\FreeCommander.exe")
    def u2_g(self):pass
    def u2_h(self):
        activate_window("HIDEMARU.EXE", "Hidemaru32Class", "C:\\PROGRA~2\\MICROS~1\\Windows\\STARTM~1\\Programs\\ç§€ä¸¸.lnk")
    def u2_i(self):pass
    def u2_j(self):pass
    def u2_k(self):pass
    def u2_l(self):pass
    def u2_m(self):pass
    def u2_n(self):pass
    def u2_o(self):pass
    def u2_p(self):pass
    def u2_q(self):pass
    def u2_r(self):
        activate_window("psr.exe", "UARWnd", "C:\\WINDOWS\\system32\\psr.exe")
    def u2_s(self):pass
    def u2_t(self):pass
    def u2_u(self):pass
    def u2_v(self):pass
    def u2_w(self):pass
    def u2_x(self):pass
    def u2_y(self):pass
    def u2_z(self):pass

    def up_u2(self):
        print("ddd")
        send("U-カタカナひらがな")
    def put_u2(self):self.up_u2()
    def put_u2_a(self):self.u2_a(); self.up_u2()
    def put_u2_b(self):self.u2_b(); self.up_u2()
    def put_u2_c(self):self.u2_c(); self.up_u2()
    def put_u2_d(self):self.u2_d(); self.up_u2()
    def put_u2_e(self):self.u2_e(); self.up_u2()
    def put_u2_f(self):self.u2_f(); self.up_u2()
    def put_u2_g(self):self.u2_g(); self.up_u2()
    def put_u2_h(self):self.u2_h(); self.up_u2()
    def put_u2_i(self):self.u2_i(); self.up_u2()
    def put_u2_j(self):self.u2_j(); self.up_u2()
    def put_u2_k(self):self.u2_k(); self.up_u2()
    def put_u2_l(self):self.u2_l(); self.up_u2()
    def put_u2_m(self):self.u2_m(); self.up_u2()
    def put_u2_n(self):self.u2_n(); self.up_u2()
    def put_u2_o(self):self.u2_o(); self.up_u2()
    def put_u2_p(self):self.u2_p(); self.up_u2()
    def put_u2_q(self):self.u2_q(); self.up_u2()
    def put_u2_r(self):self.u2_r(); self.up_u2()
    def put_u2_s(self):self.u2_s(); self.up_u2()
    def put_u2_t(self):self.u2_t(); self.up_u2()
    def put_u2_u(self):self.u2_u(); self.up_u2()
    def put_u2_v(self):self.u2_v(); self.up_u2()
    def put_u2_w(self):self.u2_w(); self.up_u2()
    def put_u2_x(self):self.u2_x(); self.up_u2()
    def put_u2_y(self):self.u2_y(); self.up_u2()
    def put_u2_z(self):self.u2_z(); self.up_u2()
    
    def m_a(self):pass
    def m_b(self):pass
    def m_c(self):pass
    def m_d(self):pass
    def m_e(self):pass
    def m_f(self):pass
    def m_g(self):pass
    def m_h(self):pass
    def m_i(self):pass
    def m_j(self):pass
    def m_k(self):pass
    def m_l(self):pass
    # def m_m(self):pass
    def m_n(self):pass
    def m_o(self):pass
    def m_p(self):pass
    def m_q(self):pass
    def m_r(self):pass
    def m_s(self):pass
    def m_t(self):pass
    def m_u(self):pass
    def m_v(self):pass
    def m_w(self):pass
    def m_x(self):pass
    def m_y(self):pass
    def m_z(self):pass    

    def put_u3_a(self):send("D-A") if self.mode == self.NOMAL_MODE else self.m_a()
    def put_u3_b(self):send("D-B") if self.mode == self.NOMAL_MODE else self.m_b()
    def put_u3_c(self):send("D-C") if self.mode == self.NOMAL_MODE else self.m_c()
    def put_u3_d(self):send("D-D") if self.mode == self.NOMAL_MODE else self.m_d()
    def put_u3_e(self):send("D-E") if self.mode == self.NOMAL_MODE else self.m_e()
    def put_u3_f(self):send("D-F") if self.mode == self.NOMAL_MODE else self.m_f()
    def put_u3_g(self):send("D-G") if self.mode == self.NOMAL_MODE else self.m_g()
    def put_u3_h(self):send("D-H") if self.mode == self.NOMAL_MODE else self.m_h()
    def put_u3_i(self):send("D-I") if self.mode == self.NOMAL_MODE else self.m_i()
    def put_u3_j(self):send("D-J") if self.mode == self.NOMAL_MODE else self.m_j()
    def put_u3_k(self):send("D-K") if self.mode == self.NOMAL_MODE else self.m_k()
    def put_u3_l(self):send("D-L") if self.mode == self.NOMAL_MODE else self.m_l()
    def put_u3_m(self):send("D-M") if self.mode == self.NOMAL_MODE else self.m_m()
    def put_u3_n(self):send("D-N") if self.mode == self.NOMAL_MODE else self.m_n()
    def put_u3_o(self):send("D-O") if self.mode == self.NOMAL_MODE else self.m_o()
    def put_u3_p(self):send("D-P") if self.mode == self.NOMAL_MODE else self.m_p()
    def put_u3_q(self):send("D-Q") if self.mode == self.NOMAL_MODE else self.m_q()
    def put_u3_r(self):send("D-R") if self.mode == self.NOMAL_MODE else self.m_r()
    def put_u3_s(self):send("D-S") if self.mode == self.NOMAL_MODE else self.m_s()
    def put_u3_t(self):send("D-T") if self.mode == self.NOMAL_MODE else self.m_t()
    def put_u3_u(self):send("D-U") if self.mode == self.NOMAL_MODE else self.m_u()
    def put_u3_v(self):send("D-V") if self.mode == self.NOMAL_MODE else self.m_v()
    def put_u3_w(self):send("D-W") if self.mode == self.NOMAL_MODE else self.m_w()
    def put_u3_x(self):send("D-X") if self.mode == self.NOMAL_MODE else self.m_x()
    def put_u3_y(self):send("D-W") if self.mode == self.NOMAL_MODE else self.m_y()
    def put_u3_z(self):send("D-Z") if self.mode == self.NOMAL_MODE else self.m_z()

    def ctrl_a(self):send("D-C-A")
    def ctrl_b(self):send("D-C-B")
    def ctrl_c(self):send("D-C-C")
    def ctrl_d(self):send("D-C-D")
    def ctrl_e(self):send("D-C-E")
    def ctrl_f(self):send("D-C-F")
    def ctrl_g(self):send("D-C-G")
    def ctrl_h(self):send("D-C-H")
    def ctrl_i(self):send("D-C-I")
    def ctrl_j(self):send("D-C-J")
    def ctrl_k(self):send("D-C-K")
    def ctrl_l(self):send("D-C-L")
    def ctrl_m(self):send("D-C-M")
    def ctrl_n(self):send("D-C-N")
    def ctrl_o(self):send("D-C-O")
    def ctrl_p(self):send("D-C-P")
    def ctrl_q(self):send("D-C-Q")
    def ctrl_r(self):send("D-C-R")
    def ctrl_s(self):send("D-C-S")
    def ctrl_t(self):send("D-C-T")
    def ctrl_u(self):send("D-C-U")
    def ctrl_v(self):send("D-C-V")
    def ctrl_w(self):send("D-C-W")
    def ctrl_x(self):send("D-C-X")
    def ctrl_y(self):send("D-C-Y")
    def ctrl_z(self):send("D-C-Z")    
    
    def put_cntl_a(self):send("D-C-A") if self.mode == self.NOMAL_MODE else self.ctrl_a()
    def put_cntl_b(self):send("D-C-B") if self.mode == self.NOMAL_MODE else self.ctrl_b()
    def put_cntl_c(self):send("D-C-C") if self.mode == self.NOMAL_MODE else self.ctrl_c()
    def put_cntl_d(self):send("D-C-D") if self.mode == self.NOMAL_MODE else self.ctrl_d()
    def put_cntl_e(self):send("D-C-E") if self.mode == self.NOMAL_MODE else self.ctrl_e()
    def put_cntl_f(self):send("D-C-F") if self.mode == self.NOMAL_MODE else self.ctrl_f()
    def put_cntl_g(self):send("D-C-G") if self.mode == self.NOMAL_MODE else self.ctrl_g()
    def put_cntl_h(self):send("D-C-H") if self.mode == self.NOMAL_MODE else self.ctrl_h()
    def put_cntl_i(self):send("D-C-I") if self.mode == self.NOMAL_MODE else self.ctrl_i()
    def put_cntl_j(self):send("D-C-J") if self.mode == self.NOMAL_MODE else self.ctrl_j()
    def put_cntl_k(self):send("D-C-K") if self.mode == self.NOMAL_MODE else self.ctrl_k()
    def put_cntl_l(self):send("D-C-L") if self.mode == self.NOMAL_MODE else self.ctrl_l()
    def put_cntl_m(self):send("D-C-M") if self.mode == self.NOMAL_MODE else self.ctrl_m()
    def put_cntl_n(self):send("D-C-N") if self.mode == self.NOMAL_MODE else self.ctrl_n()
    def put_cntl_o(self):send("D-C-O") if self.mode == self.NOMAL_MODE else self.ctrl_o()
    def put_cntl_p(self):send("D-C-P") if self.mode == self.NOMAL_MODE else self.ctrl_p()
    def put_cntl_q(self):send("D-C-Q") if self.mode == self.NOMAL_MODE else self.ctrl_q()
    def put_cntl_r(self):send("D-C-R") if self.mode == self.NOMAL_MODE else self.ctrl_r()
    def put_cntl_s(self):send("D-C-S") if self.mode == self.NOMAL_MODE else self.ctrl_s()
    def put_cntl_t(self):send("D-C-T") if self.mode == self.NOMAL_MODE else self.ctrl_t()
    def put_cntl_u(self):send("D-C-U") if self.mode == self.NOMAL_MODE else self.ctrl_u()
    def put_cntl_v(self):send("D-C-V") if self.mode == self.NOMAL_MODE else self.ctrl_v()
    def put_cntl_w(self):send("D-C-W") if self.mode == self.NOMAL_MODE else self.ctrl_w()
    def put_cntl_x(self):send("D-C-X") if self.mode == self.NOMAL_MODE else self.ctrl_x()
    def put_cntl_y(self):send("D-C-Y") if self.mode == self.NOMAL_MODE else self.ctrl_y()
    def put_cntl_z(self):send("D-C-Z") if self.mode == self.NOMAL_MODE else self.ctrl_z()

    def shift_a(self):send("D-S-A"); self.change_nomal_mode()
    def shift_b(self):send("D-S-B"); self.change_nomal_mode()
    def shift_c(self):send("D-S-C"); self.change_nomal_mode()
    def shift_d(self):send("D-S-D"); self.change_nomal_mode()
    def shift_e(self):send("D-S-E"); self.change_nomal_mode()
    def shift_f(self):send("D-S-F"); self.change_nomal_mode()
    def shift_g(self):send("D-S-G"); self.change_nomal_mode()
    def shift_h(self):send("D-S-H"); self.change_nomal_mode()
    def shift_i(self):send("D-S-I"); self.change_nomal_mode()
    def shift_j(self):send("D-S-J"); self.change_nomal_mode()
    def shift_k(self):send("D-S-K"); self.change_nomal_mode()
    def shift_l(self):send("D-S-L"); self.change_nomal_mode()
    def shift_m(self):send("D-S-M"); self.change_nomal_mode()
    def shift_n(self):send("D-S-N"); self.change_nomal_mode()
    def shift_o(self):send("D-S-O"); self.change_nomal_mode()
    def shift_p(self):send("D-S-P"); self.change_nomal_mode()
    def shift_q(self):send("D-S-Q"); self.change_nomal_mode()
    def shift_r(self):send("D-S-R"); self.change_nomal_mode()
    def shift_s(self):send("D-S-S"); self.change_nomal_mode()
    def shift_t(self):send("D-S-T"); self.change_nomal_mode()
    def shift_u(self):send("D-S-U"); self.change_nomal_mode()
    def shift_v(self):send("D-S-V"); self.change_nomal_mode()
    def shift_w(self):send("D-S-W"); self.change_nomal_mode()
    def shift_x(self):send("D-S-X"); self.change_nomal_mode()
    def shift_y(self):send("D-S-Y"); self.change_nomal_mode()
    def shift_z(self):send("D-S-Z"); self.change_nomal_mode()    
    
    def put_shift_a(self):send("D-S-A") if self.mode == self.NOMAL_MODE else self.shift_a()
    def put_shift_b(self):send("D-S-B") if self.mode == self.NOMAL_MODE else self.shift_b()
    def put_shift_c(self):send("D-S-C") if self.mode == self.NOMAL_MODE else self.shift_c()
    def put_shift_d(self):send("D-S-D") if self.mode == self.NOMAL_MODE else self.shift_d()
    def put_shift_e(self):send("D-S-E") if self.mode == self.NOMAL_MODE else self.shift_e()
    def put_shift_f(self):send("D-S-F") if self.mode == self.NOMAL_MODE else self.shift_f()
    def put_shift_g(self):send("D-S-G") if self.mode == self.NOMAL_MODE else self.shift_g()
    def put_shift_h(self):send("D-S-H") if self.mode == self.NOMAL_MODE else self.shift_h()
    def put_shift_i(self):send("D-S-I") if self.mode == self.NOMAL_MODE else self.shift_i()
    def put_shift_j(self):send("D-S-J") if self.mode == self.NOMAL_MODE else self.shift_j()
    def put_shift_k(self):send("D-S-K") if self.mode == self.NOMAL_MODE else self.shift_k()
    def put_shift_l(self):send("D-S-L") if self.mode == self.NOMAL_MODE else self.shift_l()
    def put_shift_m(self):send("D-S-M") if self.mode == self.NOMAL_MODE else self.shift_m()
    def put_shift_n(self):send("D-S-N") if self.mode == self.NOMAL_MODE else self.shift_n()
    def put_shift_o(self):send("D-S-O") if self.mode == self.NOMAL_MODE else self.shift_o()
    def put_shift_p(self):send("D-S-P") if self.mode == self.NOMAL_MODE else self.shift_p()
    def put_shift_q(self):send("D-S-Q") if self.mode == self.NOMAL_MODE else self.shift_q()
    def put_shift_r(self):send("D-S-R") if self.mode == self.NOMAL_MODE else self.shift_r()
    def put_shift_s(self):send("D-S-S") if self.mode == self.NOMAL_MODE else self.shift_s()
    def put_shift_t(self):send("D-S-T") if self.mode == self.NOMAL_MODE else self.shift_t()
    def put_shift_u(self):send("D-S-U") if self.mode == self.NOMAL_MODE else self.shift_u()
    def put_shift_v(self):send("D-S-V") if self.mode == self.NOMAL_MODE else self.shift_v()
    def put_shift_w(self):send("D-S-W") if self.mode == self.NOMAL_MODE else self.shift_w()
    def put_shift_x(self):send("D-S-X") if self.mode == self.NOMAL_MODE else self.shift_x()
    def put_shift_y(self):send("D-S-Y") if self.mode == self.NOMAL_MODE else self.shift_y()
    def put_shift_z(self):send("D-S-Z") if self.mode == self.NOMAL_MODE else self.shift_z()

    def alt_a(self):send("D-A-A")
    def alt_b(self):send("D-A-B")
    def alt_c(self):send("D-A-C")
    def alt_d(self):send("D-A-D")
    def alt_e(self):send("D-A-E")
    def alt_f(self):send("D-A-F")
    def alt_g(self):send("D-A-G")
    def alt_h(self):send("D-A-H")
    def alt_i(self):send("D-A-I")
    def alt_j(self):send("D-A-J")
    def alt_k(self):send("D-A-K")
    def alt_l(self):send("D-A-L")
    def alt_m(self):send("D-A-M")
    def alt_n(self):send("D-A-N")
    def alt_o(self):send("D-A-O")
    def alt_p(self):send("D-A-P")
    def alt_q(self):send("D-A-Q")
    def alt_r(self):send("D-A-R")
    def alt_s(self):send("D-A-S")
    def alt_t(self):send("D-A-T")
    def alt_u(self):send("D-A-U")
    def alt_v(self):send("D-A-V")
    def alt_w(self):send("D-A-W")
    def alt_x(self):send("D-A-X")
    def alt_y(self):send("D-A-Y")
    def alt_z(self):send("D-A-Z")    
    
    def put_alt_a(self):send("D-A-A") if self.mode == self.NOMAL_MODE else self.alt_a()
    def put_alt_b(self):send("D-A-B") if self.mode == self.NOMAL_MODE else self.alt_b()
    def put_alt_c(self):send("D-A-C") if self.mode == self.NOMAL_MODE else self.alt_c()
    def put_alt_d(self):send("D-A-D") if self.mode == self.NOMAL_MODE else self.alt_d()
    def put_alt_e(self):send("D-A-E") if self.mode == self.NOMAL_MODE else self.alt_e()
    def put_alt_f(self):send("D-A-F") if self.mode == self.NOMAL_MODE else self.alt_f()
    def put_alt_g(self):send("D-A-G") if self.mode == self.NOMAL_MODE else self.alt_g()
    def put_alt_h(self):send("D-A-H") if self.mode == self.NOMAL_MODE else self.alt_h()
    def put_alt_i(self):send("D-A-I") if self.mode == self.NOMAL_MODE else self.alt_i()
    def put_alt_j(self):send("D-A-J") if self.mode == self.NOMAL_MODE else self.alt_j()
    def put_alt_k(self):send("D-A-K") if self.mode == self.NOMAL_MODE else self.alt_k()
    def put_alt_l(self):send("D-A-L") if self.mode == self.NOMAL_MODE else self.alt_l()
    def put_alt_m(self):send("D-A-M") if self.mode == self.NOMAL_MODE else self.alt_m()
    def put_alt_n(self):send("D-A-N") if self.mode == self.NOMAL_MODE else self.alt_n()
    def put_alt_o(self):send("D-A-O") if self.mode == self.NOMAL_MODE else self.alt_o()
    def put_alt_p(self):send("D-A-P") if self.mode == self.NOMAL_MODE else self.alt_p()
    def put_alt_q(self):send("D-A-Q") if self.mode == self.NOMAL_MODE else self.alt_q()
    def put_alt_r(self):send("D-A-R") if self.mode == self.NOMAL_MODE else self.alt_r()
    def put_alt_s(self):send("D-A-S") if self.mode == self.NOMAL_MODE else self.alt_s()
    def put_alt_t(self):send("D-A-T") if self.mode == self.NOMAL_MODE else self.alt_t()
    def put_alt_u(self):send("D-A-U") if self.mode == self.NOMAL_MODE else self.alt_u()
    def put_alt_v(self):send("D-A-V") if self.mode == self.NOMAL_MODE else self.alt_v()
    def put_alt_w(self):send("D-A-W") if self.mode == self.NOMAL_MODE else self.alt_w()
    def put_alt_x(self):send("D-A-X") if self.mode == self.NOMAL_MODE else self.alt_x()
    def put_alt_y(self):send("D-A-Y") if self.mode == self.NOMAL_MODE else self.alt_y()
    def put_alt_z(self):send("D-A-Z") if self.mode == self.NOMAL_MODE else self.alt_z()

    def put_1(self):send("D-1"); self.change_nomal_mode() #1
    def put_2(self):send("D-2"); self.change_nomal_mode() #2
    def put_3(self):send("D-3"); self.change_nomal_mode() #3
    def put_4(self):send("D-4"); self.change_nomal_mode() #4
    def put_5(self):send("D-5"); self.change_nomal_mode() #5
    def put_6(self):send("D-6"); self.change_nomal_mode() #6
    def put_7(self):send("D-7"); self.change_nomal_mode() #7
    def put_8(self):send("D-8"); self.change_nomal_mode() #8
    def put_9(self):send("D-9"); self.change_nomal_mode() #9
    def put_0(self):send("D-0"); self.change_nomal_mode() #0
    def put_minus(self):send("D-Minus"); self.change_nomal_mode() #-
    def put_caret(self):send("D-^"); self.change_nomal_mode() #^
    def put_yen(self):send("D-Yen"); self.change_nomal_mode() #\
    def put_atmark(self):send("D-@"); self.change_nomal_mode() #@
    def put_open_bracket(self):send("D-["); self.change_nomal_mode() #[
    def put_semicolon(self):send("D-;"); self.change_nomal_mode() #;
    def put_colon(self):send("D-:"); self.change_nomal_mode() #:
    def put_close_bracket(self):send("D-]"); self.change_nomal_mode() #]
    def put_comma(self):send("D-,"); self.change_nomal_mode() #,
    def put_period(self):send("D-."); self.change_nomal_mode() #.
    def put_slash(self):send("D-/"); self.change_nomal_mode() #/
    def put_back_slash(self):send("D-\\"); self.change_nomal_mode() #\
    
    def put_shift_1(self):send("D-S-1"); self.change_nomal_mode() #1
    def put_shift_2(self):send("D-S-2"); self.change_nomal_mode() #2
    def put_shift_3(self):send("D-S-3"); self.change_nomal_mode() #3
    def put_shift_4(self):send("D-S-4"); self.change_nomal_mode() #4
    def put_shift_5(self):send("D-S-5"); self.change_nomal_mode() #5
    def put_shift_6(self):send("D-S-6"); self.change_nomal_mode() #6
    def put_shift_7(self):send("D-S-7"); self.change_nomal_mode() #7
    def put_shift_8(self):send("D-S-8"); self.change_nomal_mode() #8
    def put_shift_9(self):send("D-S-9"); self.change_nomal_mode() #9
    def put_shift_0(self):send("D-S-0"); self.change_nomal_mode() #0
    def put_shift_minus(self):send("D-S-Minus"); self.change_nomal_mode() #-
    def put_shift_caret(self):send("D-S-^"); self.change_nomal_mode() #^
    def put_shift_yen(self):send("D-S-Yen"); self.change_nomal_mode() #\
    def put_shift_atmark(self):send("D-S-@"); self.change_nomal_mode() #@
    def put_shift_open_bracket(self):send("D-S-["); self.change_nomal_mode() #[
    def put_shift_semicolon(self):send("D-S-;"); self.change_nomal_mode() #;
    def put_shift_colon(self):send("D-S-:"); self.change_nomal_mode() #:
    def put_shift_close_bracket(self):send("D-S-]"); self.change_nomal_mode() #]
    def put_shift_comma(self):send("D-S-,"); self.change_nomal_mode() #,
    def put_shift_period(self):send("D-S-."); self.change_nomal_mode() #.
    def put_shift_slash(self):send("D-S-/"); self.change_nomal_mode() #/
    def put_shift_back_slash(self):send("D-S-\\"); self.change_nomal_mode() #\

    def configure(self, keymap):
        if self.exe_name:
            app_keymap = keymap.defineWindowKeymap(exe_name=self.exe_name, class_name=self.class_name)
        else:
            app_keymap = keymap.defineWindowKeymap()
    
        app_keymap["29"] = self.put_nomal_mode_key
        app_keymap["D-28"] = self.down_app_mode_key
        app_keymap["U-28"] = self.up_app_mode_key
        # def notdoing():pass
        # app_keymap["165"] = notdoing
        
        app_keymap["D-A"] = self.put_a
        app_keymap["D-B"] = self.put_b
        app_keymap["D-C"] = self.put_c
        app_keymap["D-D"] = self.put_d
        app_keymap["D-E"] = self.put_e
        app_keymap["D-F"] = self.put_f
        app_keymap["D-G"] = self.put_g
        app_keymap["D-H"] = self.put_h
        app_keymap["D-I"] = self.put_i
        app_keymap["D-J"] = self.put_j
        app_keymap["D-K"] = self.put_k
        app_keymap["D-L"] = self.put_l
        app_keymap["D-M"] = self.put_m
        app_keymap["D-N"] = self.put_n
        app_keymap["D-O"] = self.put_o
        app_keymap["D-P"] = self.put_p
        app_keymap["D-Q"] = self.put_q
        app_keymap["D-R"] = self.put_r
        app_keymap["D-S"] = self.put_s
        app_keymap["D-T"] = self.put_t
        app_keymap["D-U"] = self.put_u
        app_keymap["D-V"] = self.put_v
        app_keymap["D-W"] = self.put_w
        app_keymap["D-X"] = self.put_x
        app_keymap["D-Y"] = self.put_y
        app_keymap["D-Z"] = self.put_z
        
        app_keymap["D-U0-A"] = self.put_u0_a
        app_keymap["D-U0-B"] = self.put_u0_b
        app_keymap["D-U0-C"] = self.put_u0_c
        app_keymap["D-U0-D"] = self.put_u0_d
        app_keymap["D-U0-E"] = self.put_u0_e
        app_keymap["D-U0-F"] = self.put_u0_f
        app_keymap["D-U0-G"] = self.put_u0_g
        app_keymap["D-U0-H"] = self.put_u0_h
        app_keymap["D-U0-I"] = self.put_u0_i
        app_keymap["D-U0-J"] = self.put_u0_j
        app_keymap["D-U0-K"] = self.put_u0_k
        app_keymap["D-U0-L"] = self.put_u0_l
        app_keymap["D-U0-M"] = self.put_u0_m
        app_keymap["D-U0-N"] = self.put_u0_n
        app_keymap["D-U0-O"] = self.put_u0_o
        app_keymap["D-U0-P"] = self.put_u0_p
        app_keymap["D-U0-Q"] = self.put_u0_q
        app_keymap["D-U0-R"] = self.put_u0_r
        app_keymap["D-U0-S"] = self.put_u0_s
        app_keymap["D-U0-T"] = self.put_u0_t
        app_keymap["D-U0-U"] = self.put_u0_u
        app_keymap["D-U0-V"] = self.put_u0_v
        app_keymap["D-U0-W"] = self.put_u0_w
        app_keymap["D-U0-X"] = self.put_u0_x
        app_keymap["D-U0-Y"] = self.put_u0_y
        app_keymap["D-U0-Z"] = self.put_u0_z

        app_keymap["D-U1-A"] = self.put_u1_a
        app_keymap["D-U1-B"] = self.put_u1_b
        app_keymap["D-U1-C"] = self.put_u1_c
        app_keymap["D-U1-D"] = self.put_u1_d
        app_keymap["D-U1-E"] = self.put_u1_e
        app_keymap["D-U1-F"] = self.put_u1_f
        app_keymap["D-U1-G"] = self.put_u1_g
        app_keymap["D-U1-H"] = self.put_u1_h
        app_keymap["D-U1-I"] = self.put_u1_i
        app_keymap["D-U1-J"] = self.put_u1_j
        app_keymap["D-U1-K"] = self.put_u1_k
        app_keymap["D-U1-L"] = self.put_u1_l
        app_keymap["D-U1-M"] = self.put_u1_m
        app_keymap["D-U1-N"] = self.put_u1_n
        app_keymap["D-U1-O"] = self.put_u1_o
        app_keymap["D-U1-P"] = self.put_u1_p
        app_keymap["D-U1-Q"] = self.put_u1_q
        app_keymap["D-U1-R"] = self.put_u1_r
        app_keymap["D-U1-S"] = self.put_u1_s
        app_keymap["D-U1-T"] = self.put_u1_t
        app_keymap["D-U1-U"] = self.put_u1_u
        app_keymap["D-U1-V"] = self.put_u1_v
        app_keymap["D-U1-W"] = self.put_u1_w
        app_keymap["D-U1-X"] = self.put_u1_x
        app_keymap["D-U1-Y"] = self.put_u1_y
        app_keymap["D-U1-Z"] = self.put_u1_z
        
        # app_keymap["O-242"] = self.put_u2_oneshot
        # app_keymap["D-242"] = self.put_u2
        app_keymap["D-U2-A"] = self.put_u2_a
        app_keymap["D-U2-B"] = self.put_u2_b
        app_keymap["D-U2-C"] = self.put_u2_c
        app_keymap["D-U2-D"] = self.put_u2_d
        app_keymap["D-U2-E"] = self.put_u2_e
        app_keymap["D-U2-F"] = self.put_u2_f
        app_keymap["D-U2-G"] = self.put_u2_g
        app_keymap["D-U2-H"] = self.put_u2_h
        app_keymap["D-U2-I"] = self.put_u2_i
        app_keymap["D-U2-J"] = self.put_u2_j
        app_keymap["D-U2-K"] = self.put_u2_k
        app_keymap["D-U2-L"] = self.put_u2_l
        app_keymap["D-U2-M"] = self.put_u2_m
        app_keymap["D-U2-N"] = self.put_u2_n
        app_keymap["D-U2-O"] = self.put_u2_o
        app_keymap["D-U2-P"] = self.put_u2_p
        app_keymap["D-U2-Q"] = self.put_u2_q
        app_keymap["D-U2-R"] = self.put_u2_r
        app_keymap["D-U2-S"] = self.put_u2_s
        app_keymap["D-U2-T"] = self.put_u2_t
        app_keymap["D-U2-U"] = self.put_u2_u
        app_keymap["D-U2-V"] = self.put_u2_v
        app_keymap["D-U2-W"] = self.put_u2_w
        app_keymap["D-U2-X"] = self.put_u2_x
        app_keymap["D-U2-Y"] = self.put_u2_y
        app_keymap["D-U2-Z"] = self.put_u2_z

        app_keymap["D-U3-A"] = self.put_u3_a
        app_keymap["D-U3-B"] = self.put_u3_b
        app_keymap["D-U3-C"] = self.put_u3_c
        app_keymap["D-U3-D"] = self.put_u3_d
        app_keymap["D-U3-E"] = self.put_u3_e
        app_keymap["D-U3-F"] = self.put_u3_f
        app_keymap["D-U3-G"] = self.put_u3_g
        app_keymap["D-U3-H"] = self.put_u3_h
        app_keymap["D-U3-I"] = self.put_u3_i
        app_keymap["D-U3-J"] = self.put_u3_j
        app_keymap["D-U3-K"] = self.put_u3_k
        app_keymap["D-U3-L"] = self.put_u3_l
        # app_keymap["D-U3-M"] = self.put_u3_m
        app_keymap["D-U3-N"] = self.put_u3_n
        app_keymap["D-U3-O"] = self.put_u3_o
        app_keymap["D-U3-P"] = self.put_u3_p
        app_keymap["D-U3-Q"] = self.put_u3_q
        app_keymap["D-U3-R"] = self.put_u3_r
        app_keymap["D-U3-S"] = self.put_u3_s
        app_keymap["D-U3-T"] = self.put_u3_t
        app_keymap["D-U3-U"] = self.put_u3_u
        app_keymap["D-U3-V"] = self.put_u3_v
        app_keymap["D-U3-W"] = self.put_u3_w
        app_keymap["D-U3-X"] = self.put_u3_x
        app_keymap["D-U3-Y"] = self.put_u3_y
        app_keymap["D-U3-Z"] = self.put_u3_z
        
        app_keymap["D-C-A"] = self.put_cntl_a
        app_keymap["D-C-B"] = self.put_cntl_b
        app_keymap["D-C-C"] = self.put_cntl_c
        app_keymap["D-C-D"] = self.put_cntl_d
        app_keymap["D-C-E"] = self.put_cntl_e
        app_keymap["D-C-F"] = self.put_cntl_f
        app_keymap["D-C-G"] = self.put_cntl_g
        app_keymap["D-C-H"] = self.put_cntl_h
        app_keymap["D-C-I"] = self.put_cntl_i
        app_keymap["D-C-J"] = self.put_cntl_j
        app_keymap["D-C-K"] = self.put_cntl_k
        app_keymap["D-C-L"] = self.put_cntl_l
        app_keymap["D-C-M"] = self.put_cntl_m
        app_keymap["D-C-N"] = self.put_cntl_n
        app_keymap["D-C-O"] = self.put_cntl_o
        app_keymap["D-C-P"] = self.put_cntl_p
        app_keymap["D-C-Q"] = self.put_cntl_q
        app_keymap["D-C-R"] = self.put_cntl_r
        app_keymap["D-C-S"] = self.put_cntl_s
        app_keymap["D-C-T"] = self.put_cntl_t
        app_keymap["D-C-U"] = self.put_cntl_u
        app_keymap["D-C-V"] = self.put_cntl_v
        app_keymap["D-C-W"] = self.put_cntl_w
        app_keymap["D-C-X"] = self.put_cntl_x
        app_keymap["D-C-Y"] = self.put_cntl_y
        app_keymap["D-C-Z"] = self.put_cntl_z
        
        app_keymap["D-S-A"] = self.put_shift_a
        app_keymap["D-S-B"] = self.put_shift_b
        app_keymap["D-S-C"] = self.put_shift_c
        app_keymap["D-S-D"] = self.put_shift_d
        app_keymap["D-S-E"] = self.put_shift_e
        app_keymap["D-S-F"] = self.put_shift_f
        app_keymap["D-S-G"] = self.put_shift_g
        app_keymap["D-S-H"] = self.put_shift_h
        app_keymap["D-S-I"] = self.put_shift_i
        app_keymap["D-S-J"] = self.put_shift_j
        app_keymap["D-S-K"] = self.put_shift_k
        app_keymap["D-S-L"] = self.put_shift_l
        app_keymap["D-S-M"] = self.put_shift_m
        app_keymap["D-S-N"] = self.put_shift_n
        app_keymap["D-S-O"] = self.put_shift_o
        app_keymap["D-S-P"] = self.put_shift_p
        app_keymap["D-S-Q"] = self.put_shift_q
        app_keymap["D-S-R"] = self.put_shift_r
        app_keymap["D-S-S"] = self.put_shift_s
        app_keymap["D-S-T"] = self.put_shift_t
        app_keymap["D-S-U"] = self.put_shift_u
        app_keymap["D-S-V"] = self.put_shift_v
        app_keymap["D-S-W"] = self.put_shift_w
        app_keymap["D-S-X"] = self.put_shift_x
        app_keymap["D-S-Y"] = self.put_shift_y
        app_keymap["D-S-Z"] = self.put_shift_z
        
        app_keymap["D-A-A"] = self.put_alt_a
        app_keymap["D-A-B"] = self.put_alt_b
        app_keymap["D-A-C"] = self.put_alt_c
        app_keymap["D-A-D"] = self.put_alt_d
        app_keymap["D-A-E"] = self.put_alt_e
        app_keymap["D-A-F"] = self.put_alt_f
        app_keymap["D-A-G"] = self.put_alt_g
        app_keymap["D-A-H"] = self.put_alt_h
        app_keymap["D-A-I"] = self.put_alt_i
        app_keymap["D-A-J"] = self.put_alt_j
        app_keymap["D-A-K"] = self.put_alt_k
        app_keymap["D-A-L"] = self.put_alt_l
        app_keymap["D-A-M"] = self.put_alt_m
        app_keymap["D-A-N"] = self.put_alt_n
        app_keymap["D-A-O"] = self.put_alt_o
        app_keymap["D-A-P"] = self.put_alt_p
        app_keymap["D-A-Q"] = self.put_alt_q
        app_keymap["D-A-R"] = self.put_alt_r
        app_keymap["D-A-S"] = self.put_alt_s
        app_keymap["D-A-T"] = self.put_alt_t
        app_keymap["D-A-U"] = self.put_alt_u
        app_keymap["D-A-V"] = self.put_alt_v
        app_keymap["D-A-W"] = self.put_alt_w
        app_keymap["D-A-X"] = self.put_alt_x
        app_keymap["D-A-Y"] = self.put_alt_y
        app_keymap["D-A-Z"] = self.put_alt_z
                
        app_keymap["D-1"] = self.put_1
        app_keymap["D-2"] = self.put_2
        app_keymap["D-3"] = self.put_3
        app_keymap["D-4"] = self.put_4
        app_keymap["D-5"] = self.put_5
        app_keymap["D-6"] = self.put_6
        app_keymap["D-7"] = self.put_7
        app_keymap["D-8"] = self.put_8
        app_keymap["D-9"] = self.put_9
        app_keymap["D-0"] = self.put_0
        app_keymap["D-Minus"] = self.put_minus
        app_keymap["D-Caret"] = self.put_caret
        app_keymap["D-Yen"] = self.put_yen
        app_keymap["D-Atmark"] = self.put_atmark
        app_keymap["D-OpenBracket"] = self.put_open_bracket
        app_keymap["D-SemiColon"] = self.put_semicolon
        app_keymap["D-Colon"] = self.put_colon
        app_keymap["D-CloseBracket"] = self.put_close_bracket 
        app_keymap["D-Comma"] = self.put_comma
        app_keymap["D-Period"] = self.put_period
        app_keymap["D-Slash"] = self.put_slash
        app_keymap["D-BackSlash"] = self.put_back_slash

        app_keymap["D-S-1"] = self.put_shift_1
        app_keymap["D-S-2"] = self.put_shift_2
        app_keymap["D-S-3"] = self.put_shift_3
        app_keymap["D-S-4"] = self.put_shift_4
        app_keymap["D-S-5"] = self.put_shift_5
        app_keymap["D-S-6"] = self.put_shift_6
        app_keymap["D-S-7"] = self.put_shift_7
        app_keymap["D-S-8"] = self.put_shift_8
        app_keymap["D-S-9"] = self.put_shift_9
        app_keymap["D-S-0"] = self.put_shift_0
        app_keymap["D-S-Minus"] = self.put_shift_minus
        app_keymap["D-S-Caret"] = self.put_shift_caret
        app_keymap["D-S-Yen"] = self.put_shift_yen
        app_keymap["D-S-Atmark"] = self.put_shift_atmark
        app_keymap["D-S-OpenBracket"] = self.put_shift_open_bracket
        app_keymap["D-S-SemiColon"] = self.put_shift_semicolon
        app_keymap["D-S-Colon"] = self.put_shift_colon
        app_keymap["D-S-CloseBracket"] = self.put_shift_close_bracket 
        app_keymap["D-S-Comma"] = self.put_shift_comma
        app_keymap["D-S-Period"] = self.put_shift_period
        app_keymap["D-S-Slash"] = self.put_shift_slash
        app_keymap["D-S-BackSlash"] = self.put_shift_back_slash
        
        self.extend_configure(app_keymap)
