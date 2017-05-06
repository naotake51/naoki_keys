from util import *
import time 
routine_is_running = False

def routine():
    global routine_is_running
    
    if routine_is_running:
        return
                
    routine_is_running = True
    _routine()
    routine_is_running = False

def _routine():
    print("routein")
    while get_key_state("A"):
        print("routein in")
        if get_key_state("B"):pass
        elif get_key_state("C"):pass
        elif get_key_state("D"):pass
        elif get_key_state("E"):pass
        elif get_key_state("F"):pass
        elif get_key_state("G"):pass
        elif get_key_state("H"):pass
        elif get_key_state("I"):pass
        elif get_key_state("J"):pass
        elif get_key_state("K"):pass
        elif get_key_state("L"):pass
        elif get_key_state("M"):pass
        elif get_key_state("N"):pass
        elif get_key_state("O"):pass
        elif get_key_state("P"):pass
        elif get_key_state("Q"):pass
        elif get_key_state("R"):pass
        elif get_key_state("S"):pass
        elif get_key_state("T"):pass
        elif get_key_state("U"):pass
        elif get_key_state("V"):pass
        elif get_key_state("W"):pass
        elif get_key_state("X"):pass
        elif get_key_state("Y"):pass
        elif get_key_state("Z"):pass
        else:pass
        
        time.sleep(0.1)
        
    print("routein out")
        
        
        
