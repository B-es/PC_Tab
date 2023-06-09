import dearpygui.dearpygui as dpg

from CRUD import *
from Note import CPU
from Services import showMB, m, setDataToTable, setDataToTableOne, clearTable

CPUcolumns = ["Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name"]
idTableCPU = "tablecpu"
table = "CPU"
selectid = "selectidcpu"
exc = 5

def onAddCPU():
    cpu = getDataFromInputsCPU()
    count = len(cpu.checkBadData())
    isFull = not bool(count)
    id = 0
    if(isFull):
        id = add(cpu.getData(), table, CPUcolumns)
        
        data = None
        data = select(str(id), table)
        if data == None: return
        
        setDataToTableOne(data, idTableCPU, CPUcolumns, exc)
    else:
        showMB()
    
def onUpdateCPU():
    cpu = getDataFromInputsCPU()
    cols, vals = cpu.getDataToUpdate()
    id = dpg.get_value(selectid)
    
    if id == '': return
    
    update(cols, vals, int(id), table)
    onSelectCPU()

def onDeleteCPU():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = deleteCPU(id, table)
    if res == None: return
    
    showMB(f"Запись: {res} была удалена.")
    clearTable(idTableCPU, CPUcolumns)

def onSelectCPU():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = select(id, table)
    if res == None: return
    
    if id == 'all':
        setDataToTable(res, idTableCPU, CPUcolumns, exc)
    else:
        setDataToTableOne(res, idTableCPU, CPUcolumns, exc)

def getDataFromInputsCPU() -> CPU:
    name = dpg.get_value('namecpu')
    socket = dpg.get_value('socketcpu')
    freq = m(dpg.get_value('freq'))
    price = m(dpg.get_value('pricecpu'))
    integ = dpg.get_value('integ')
    numcores = m(dpg.get_value('numcores'))
    
    cpu = CPU(name, freq, numcores, socket, price, integ)
    return cpu






                    

    