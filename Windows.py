import dearpygui.dearpygui as dpg

from Note import *
from LogicCPU import *
from LogicMB import *
from LogicStand import *
from Services import MessageBox, RussianLanguage, prepareTable

ViewPort_Width = 600
ViewPort_Height = 700

input_width = 100
input_height = 40

ActionsCPU = [onAddCPU, onUpdateCPU, onDeleteCPU, onSelectCPU]
ActionsMotherboard = [onAddMB, onUpdateMB, onDeleteMB, onSelectMB]
ActionsStand = [onAddStand, onUpdateStand, onDeleteStand, onSelectStand]


#Таблица
def createTable(data, id):
     with dpg.child_window():
            with dpg.table(label="Таблица", resizable=False, 
                           policy=dpg.mvTable_SizingStretchProp, 
                           height=ViewPort_Height-200,
                           borders_outerV=True,
                           borders_innerV=True,
                           delay_search=True,
                           no_host_extendX=True, tag=id):
                prepareTable(data) 

#Кнопки действий
def ActionButtons(actions, id):
    btns = []
    with dpg.child_window(width=100, height=200):
        with dpg.group():
            btns.append(dpg.add_button(label="Добавить", callback=getDataFromInputsCPU))
            btns.append(dpg.add_button(label="Обновить"))
            btns.append(dpg.add_button(label="Удалить"))
            btns.append(dpg.add_button(label="Показать"))
            t = dpg.add_input_text(tag=id, label="id", hint="Введите id", height=input_height, 
                                        width=input_width)
            with dpg.tooltip(t):
                dpg.add_text("add - все записи\nчисло - id")

    for i in range(len(btns)):
        dpg.set_item_callback(btns[i], actions[i])

#Тело CPU
def inputCPU():
    
    with dpg.child_window(autosize_x=True, height=200):
        with dpg.group(horizontal=True):
            with dpg.group():
                dpg.add_input_text(tag='namecpu', label="Название", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_text(tag='socketcpu', label="Сокет", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_int(tag='freq', label="Частота", width=input_width, min_value=0)
                dpg.add_input_int(tag='pricecpu', label="Цена", width=input_width)
                dpg.add_checkbox(tag='integ', label="Интегрированная графика")
            dpg.add_slider_int(tag='numcores', label="Кол-во ядер", min_value=4, max_value=18, vertical=True)        
        
#Тело Motherboard
def inputMotherboard():
     with dpg.child_window(autosize_x=True, height=200):
        with dpg.group(horizontal=True):
            with dpg.group():
                dpg.add_input_text(tag='namemb', label="Название", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_text(tag='socketmb', label="Сокет", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_text(tag='form_factormb', label="Форм-фактор", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_text(tag='chipsetmb', label="Чипсет", hint="Введите", height=input_height, 
                                    width=input_width)
                dpg.add_input_int(tag='pricemb', label="Цена", width=input_width)

#Тело Stand
def inputStand():
    with dpg.child_window(autosize_x=True, height=200):
        with dpg.group(horizontal=True):
            with dpg.group():
                dpg.add_input_int(tag='idMb', label="id Motherboard", width=input_width)
                dpg.add_input_int(tag='idGpu', label="id GPU", width=input_width)
                dpg.add_input_int(tag='idCpuc', label="id CPU cooler", width=input_width)
                dpg.add_input_int(tag='idCpu', label="id CPU", width=input_width)
                dpg.add_input_int(tag='idRam', label="id RAM", width=input_width)


#Таб с процессорами
def CPUT():
    with dpg.tab(label="CPU", tag='cputab'):
        with dpg.group(horizontal=True):
            ActionButtons(ActionsCPU, 'selectidcpu')
            inputCPU()
        createTable(CPUcolumns, "tablecpu")

#Таб с материнскими платами    
def MotherboardT():
    with dpg.tab(label="Motherboard"):
        with dpg.group(horizontal=True):
            ActionButtons(ActionsMotherboard, 'selectidmb')
            inputMotherboard()
        createTable(MBcolumns, "tablemb")
        
#Таб с стендом   
def StandT():
    with dpg.tab(label="Stand"):
        with dpg.group(horizontal=True):
            ActionButtons(ActionsStand, 'selectidst')
            inputStand()
        createTable(Standcolumns, "tablest")


def MainWindow():
    dpg.create_context()
    dpg.create_viewport(width=ViewPort_Width, height=ViewPort_Height)  
    dpg.setup_dearpygui()
    
    MessageBox()
    
    
    with dpg.window(tag="Main"):
        with dpg.tab_bar(tag="tb"):
            CPUT()
            MotherboardT()
            StandT()

    dpg.set_primary_window("Main", True)
    RussianLanguage()
    
    
    dpg.show_viewport()
    dpg.start_dearpygui()
    dpg.destroy_context()
    
MainWindow()