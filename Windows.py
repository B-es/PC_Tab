import dearpygui.dearpygui as dpg

class Window():
    
    def __init__(self, name, width, height) -> None:
        self.name = name
        self.width = width
        self.height = height
    
    dpg.create_context()
    dpg.setup_dearpygui()


class Table(Window):
     
    TAG = ""
     
    def generateTable(self, lables):
        with dpg.table(header_row=True, tag=self.TAG):
            for lbl in lables:
                dpg.add_table_column(label=lbl)
    
    def __init__(self, width, height, parent, headers, tag) -> None:
        super().__init__(self, width, height)
        self.TAG = tag
        
        with dpg.child_window(width=width, height=height, parent=parent):
            self.generateTable(headers)
            dpg.add_button(label="X")

           
class MainWindow(Window):
    
    lablesCPU = ["Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name"]
    lablesMoth = ["Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name"]
    def __init__(self, name, width, height) -> None:
        super().__init__(name, width, height)
        
        with dpg.window(label=name, width=width, height=height):
            with dpg.tab_bar():
                with dpg.tab(label="CPU"):
                    with dpg.child_window(tag="CPUW"):
                        Table(480,500,"CPUW",self.lablesCPU, "t")
                        self.setT()
                with dpg.tab(label="Motherboard"):
                    with dpg.child_window(tag="MothW"):
                        Table(480,500,"MothW",self.lablesMoth, "t2")
                       
        
                    
    def setT(self):
        for i in range(4):
            with dpg.table_row(parent="t"):
                for j in range(3):
                    dpg.add_text(f"Row{i} Column{j}")
        
        