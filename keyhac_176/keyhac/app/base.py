from app.util import *        
from app.ime import *        

class KeyMap():
    
    NOMAL_MODE = 0
    APP_MODE = 1
    mode = APP_MODE
    
    nomal_key_is_down = False
    app_key_is_down = False

    def __init__(self):
        self.exe_name = ""
        self.class_name = ""

    def initialize_app_mode(self):
        pass
        
    def initialize_nomal_mode(self):
        pass
    
    def initialize_subapp_mode(self):
        pass
    
    def initialize_subnomal_mode(self):
        pass
    
    def down_nomal_mode_key(self):
        if not self.nomal_key_is_down:
            self.mode = self.NOMAL_MODE
            self.initialize_subapp_mode()
            self.nomal_key_is_down = True
    
    def up_nomal_mode_key(self):
        self.nomal_key_is_down = False
        self.initialize_nomal_mode()        

    def down_app_mode_key(self):
        if not self.app_key_is_down:
            self.mode = self.APP_MODE
            self.initialize_subnomal_mode()
            self.app_key_is_down = True
    
    def up_app_mode_key(self):
        self.app_key_is_down = False
        self.initialize_app_mode()        

    def app_a(self):pass
    def app_b(self):pass
    def app_c(self):pass
    def app_d(self):pass
    def app_e(self):pass
    def app_f(self):pass
    def app_g(self):pass
    def app_h(self):pass
    def app_i(self):pass
    def app_j(self):pass
    def app_k(self):pass
    def app_l(self):pass
    def app_m(self):pass
    def app_n(self):pass
    def app_o(self):pass
    def app_p(self):pass
    def app_q(self):pass
    def app_r(self):pass
    def app_s(self):pass
    def app_t(self):pass
    def app_u(self):pass
    def app_v(self):pass
    def app_w(self):send("Ctrl", num = 2) #Cliobor
    def app_x(self):pass
    def app_y(self):pass
    def app_z(self):pass    
    
    def subnomal_a(self):pass
    def subnomal_b(self):pass
    def subnomal_c(self):pass
    def subnomal_d(self):pass
    def subnomal_e(self):set_ime_status(False)
    def subnomal_f(self):pass
    def subnomal_g(self):pass
    def subnomal_h(self):pass
    def subnomal_i(self):pass
    def subnomal_j(self):pass
    def subnomal_k(self):pass
    def subnomal_l(self):pass
    def subnomal_m(self):pass
    def subnomal_n(self):set_ime_status(True)
    def subnomal_o(self):pass
    def subnomal_p(self):pass
    def subnomal_q(self):pass
    def subnomal_r(self):pass
    def subnomal_s(self):pass
    def subnomal_t(self):pass
    def subnomal_u(self):pass
    def subnomal_v(self):pass
    def subnomal_w(self):pass
    def subnomal_x(self):pass
    def subnomal_y(self):pass
    def subnomal_z(self):pass

    def subapp_a(self):pass
    def subapp_b(self):pass
    def subapp_c(self):pass
    def subapp_d(self):pass
    def subapp_e(self):pass
    def subapp_f(self):pass
    def subapp_g(self):pass
    def subapp_h(self):pass
    def subapp_i(self):pass
    def subapp_j(self):pass
    def subapp_k(self):pass
    def subapp_l(self):pass
    def subapp_m(self):pass
    def subapp_n(self):pass
    def subapp_o(self):pass
    def subapp_p(self):pass
    def subapp_q(self):pass
    def subapp_r(self):pass
    def subapp_s(self):pass
    def subapp_t(self):pass
    def subapp_u(self):pass
    def subapp_v(self):pass
    def subapp_w(self):pass
    def subapp_x(self):pass
    def subapp_y(self):pass
    def subapp_z(self):pass

    def put_a(self):send("D-A") if self.mode == self.NOMAL_MODE else self.app_a()
    def put_b(self):send("D-B") if self.mode == self.NOMAL_MODE else self.app_b()
    def put_c(self):send("D-C") if self.mode == self.NOMAL_MODE else self.app_c()
    def put_d(self):send("D-D") if self.mode == self.NOMAL_MODE else self.app_d()
    def put_e(self):send("D-E") if self.mode == self.NOMAL_MODE else self.app_e()
    def put_f(self):send("D-F") if self.mode == self.NOMAL_MODE else self.app_f()
    def put_g(self):send("D-G") if self.mode == self.NOMAL_MODE else self.app_g()
    def put_h(self):send("D-H") if self.mode == self.NOMAL_MODE else self.app_h()
    def put_i(self):send("D-I") if self.mode == self.NOMAL_MODE else self.app_i()
    def put_j(self):send("D-J") if self.mode == self.NOMAL_MODE else self.app_j()
    def put_k(self):send("D-K") if self.mode == self.NOMAL_MODE else self.app_k()
    def put_l(self):send("D-L") if self.mode == self.NOMAL_MODE else self.app_l()
    def put_m(self):send("D-M") if self.mode == self.NOMAL_MODE else self.app_m()
    def put_n(self):send("D-N") if self.mode == self.NOMAL_MODE else self.app_n()
    def put_o(self):send("D-O") if self.mode == self.NOMAL_MODE else self.app_o()
    def put_p(self):send("D-P") if self.mode == self.NOMAL_MODE else self.app_p()
    def put_q(self):send("D-Q") if self.mode == self.NOMAL_MODE else self.app_q()
    def put_r(self):send("D-R") if self.mode == self.NOMAL_MODE else self.app_r()
    def put_s(self):send("D-S") if self.mode == self.NOMAL_MODE else self.app_s()
    def put_t(self):send("D-T") if self.mode == self.NOMAL_MODE else self.app_t()
    def put_u(self):send("D-U") if self.mode == self.NOMAL_MODE else self.app_u()
    def put_v(self):send("D-V") if self.mode == self.NOMAL_MODE else self.app_v()
    def put_w(self):send("D-W") if self.mode == self.NOMAL_MODE else self.app_w()
    def put_x(self):send("D-X") if self.mode == self.NOMAL_MODE else self.app_x()
    def put_y(self):send("D-Y") if self.mode == self.NOMAL_MODE else self.app_y()
    def put_z(self):send("D-Z") if self.mode == self.NOMAL_MODE else self.app_z()

    def configure(self, keymap):
        if self.exe_name:
            app_keymap = keymap.defineWindowKeymap(exe_name=self.exe_name, class_name=self.class_name)
        else:
            app_keymap = keymap.defineWindowKeymap()
    
        app_keymap["D-29"] = self.down_nomal_mode_key
        app_keymap["U-29"] = self.up_nomal_mode_key
        app_keymap["D-28"] = self.down_app_mode_key
        app_keymap["U-28"] = self.up_app_mode_key
        
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
        
        app_keymap["D-U0-A"] = self.subnomal_a
        app_keymap["D-U0-B"] = self.subnomal_b
        app_keymap["D-U0-C"] = self.subnomal_c
        app_keymap["D-U0-D"] = self.subnomal_d
        app_keymap["D-U0-E"] = self.subnomal_e
        app_keymap["D-U0-F"] = self.subnomal_f
        app_keymap["D-U0-G"] = self.subnomal_g
        app_keymap["D-U0-H"] = self.subnomal_h
        app_keymap["D-U0-I"] = self.subnomal_i
        app_keymap["D-U0-J"] = self.subnomal_j
        app_keymap["D-U0-K"] = self.subnomal_k
        app_keymap["D-U0-L"] = self.subnomal_l
        app_keymap["D-U0-M"] = self.subnomal_m
        app_keymap["D-U0-N"] = self.subnomal_n
        app_keymap["D-U0-O"] = self.subnomal_o
        app_keymap["D-U0-P"] = self.subnomal_p
        app_keymap["D-U0-Q"] = self.subnomal_q
        app_keymap["D-U0-R"] = self.subnomal_r
        app_keymap["D-U0-S"] = self.subnomal_s
        app_keymap["D-U0-T"] = self.subnomal_t
        app_keymap["D-U0-U"] = self.subnomal_u
        app_keymap["D-U0-V"] = self.subnomal_v
        app_keymap["D-U0-W"] = self.subnomal_w
        app_keymap["D-U0-X"] = self.subnomal_x
        app_keymap["D-U0-Y"] = self.subnomal_y
        app_keymap["D-U0-Z"] = self.subnomal_z

        app_keymap["D-U1-A"] = self.subapp_a
        app_keymap["D-U1-B"] = self.subapp_b
        app_keymap["D-U1-C"] = self.subapp_c
        app_keymap["D-U1-D"] = self.subapp_d
        app_keymap["D-U1-E"] = self.subapp_e
        app_keymap["D-U1-F"] = self.subapp_f
        app_keymap["D-U1-G"] = self.subapp_g
        app_keymap["D-U1-H"] = self.subapp_h
        app_keymap["D-U1-I"] = self.subapp_i
        app_keymap["D-U1-J"] = self.subapp_j
        app_keymap["D-U1-K"] = self.subapp_k
        app_keymap["D-U1-L"] = self.subapp_l
        app_keymap["D-U1-M"] = self.subapp_m
        app_keymap["D-U1-N"] = self.subapp_n
        app_keymap["D-U1-O"] = self.subapp_o
        app_keymap["D-U1-P"] = self.subapp_p
        app_keymap["D-U1-Q"] = self.subapp_q
        app_keymap["D-U1-R"] = self.subapp_r
        app_keymap["D-U1-S"] = self.subapp_s
        app_keymap["D-U1-T"] = self.subapp_t
        app_keymap["D-U1-U"] = self.subapp_u
        app_keymap["D-U1-V"] = self.subapp_v
        app_keymap["D-U1-W"] = self.subapp_w
        app_keymap["D-U1-X"] = self.subapp_x
        app_keymap["D-U1-Y"] = self.subapp_y
        app_keymap["D-U1-Z"] = self.subapp_z
        
