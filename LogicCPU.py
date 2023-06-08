import dearpygui.dearpygui as dpg
import math

from CRUD import *
from Note import CPU
from Services import showMB

CPUcolumns = ["Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name"]


def m(value):
    return int(math.fabs(value))

def onAddCPU():
    cpu = getDataFromInputsCPU()
    count = len(cpu.checkBadData())
    isFull = not bool(count)
    id = 0
    if(isFull):
        id = addCPU(cpu.getData())
        setDataToTableCPUOne(id)
    else:
        showMB()
    
def onUpdateCPU():
    cpu = getDataFromInputsCPU()
    cols, vals = cpu.getDataToUpdate()
    id = dpg.get_value('selectidcpu')
    
    if id == '': return
    
    updateCPU(cols, vals, int(id))
    onSelectCPU()

def onDeleteCPU():
    id = dpg.get_value('selectidcpu')
    res = deleteCPU(id)
    
    if id == '': return
    
    showMB(f"Запись: {res} была удалена.")
    clearTable()

def onSelectCPU():
    id = dpg.get_value('selectidcpu')
    
    if id == '': return
    
    res = selectCPU(id)
    setDataToTableCPU(res)

def getDataFromInputsCPU() -> CPU:
    name = dpg.get_value('namecpu')
    socket = dpg.get_value('socketcpu')
    freq = m(dpg.get_value('freq'))
    price = m(dpg.get_value('pricecpu'))
    integ = dpg.get_value('integ')
    numcores = m(dpg.get_value('numcores'))
    
    cpu = CPU(name, freq, numcores, socket, price, integ)
    return cpu

#Заполнить таблицу
def prepareTable(columns, parent=''):
    for column in columns:
        dpg.add_table_column(label=column, parent=parent)

def setDataToTableCPU(rows) -> None:
    
    clearTable()
    for row in rows:
        with dpg.table_row(parent="tablecpu"):
            for i in range(len(row)):
                if i != len(row) - 3:
                    dpg.add_text(str(row[i]))

def setDataToTableCPUOne(row) -> None:
   
    clearTable()
    with dpg.table_row(parent="tablecpu"):
            for i in range(len(row)):
                print(row)
                if i != len(row) - 3:
                    dpg.add_text(str(row[i]))
                    
def clearTable():
    dpg.delete_item("tablecpu", children_only=True)
    prepareTable(CPUcolumns, 'tablecpu')
    