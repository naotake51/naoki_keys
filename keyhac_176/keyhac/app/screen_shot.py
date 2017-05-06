from PIL import ImageGrab
import datetime

SCREEN_SHOTS_DIR = "C:\\Users\\naoki\\Desktop\\screen_shots"

def save_clipboard_imege():
    now = datetime.datetime.today()
    file_name = now.strftime("%Y_%m_%d-%H_%M_%S.png")
    file_path = SCREEN_SHOTS_DIR + "\\" + file_name
    # ImageGrab.grab().save(file_path)
    ImageGrab.grabclipboard().save(file_path)
