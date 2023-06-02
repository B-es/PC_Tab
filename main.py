import dearpygui.dearpygui as dpg
from Note import CPU
from CRUD import *
from Windows import *

class MainViewPort():
    
    def __init__(self, title, width, height, ) -> None:
        self.title = title
        self.width = width
        self.height = height
        self.MainWindot = MainWindow("Main", width, height)
        
        #Создаём VP
        dpg.create_viewport(title=title, width=width, height=height, resizable=False)
        
    
    #Русский язык
    with dpg.font_registry():
        with dpg.font(f'C:\\Windows\\Fonts\\arialbi.ttf', 13, default_font=True, id="Default font"):
            dpg.add_font_range_hint(dpg.mvFontRangeHint_Cyrillic)
    dpg.bind_font("Default font")

    
    def showViewPort(self):
        dpg.show_viewport()
        dpg.start_dearpygui()
        dpg.destroy_context()
        

     
MVP = MainViewPort("PC_Tab", 517, 700)
MVP.showViewPort()
