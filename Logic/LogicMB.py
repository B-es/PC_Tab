import dearpygui.dearpygui as dpg

from Logic.CRUD import *
from Service.Note import Motherboard
from Service.Services import showMB, m, setDataToTable, setDataToTableOne, clearTable

MBcolumns = ["Price", "Name", "Socket", "Form-factor", "Chipset"]
idTableMB = "tablemb"
table = "Motherboard"
selectid = "selectidmb"
exc = 5

def onAddMB():
    mb = getDataFromInputsMB()
    count = len(mb.checkBadData())
    isFull = not bool(count)
    id = 0
    if(isFull):
        id = add(mb.getData(), table, MBcolumns)
        
        data = None
        data = select(str(id), table)
        if data == None: return
        
        setDataToTableOne(data, idTableMB, MBcolumns, exc)
    else:
        showMB()

def onUpdateMB():
    mb = getDataFromInputsMB()
    cols, vals = mb.getDataToUpdate()
    id = dpg.get_value(selectid)
    
    if id == '' or id == 'all': return
    
    update(cols, vals, int(id))
    onSelectMB()

def onDeleteMB():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = deleteCPU(id, table)
    if res == None: return
    
    showMB(f"Запись: {res} была удалена.")
    clearTable(idTableMB, MBcolumns)

def onSelectMB():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = select(id, table)
    if res == None: return
    
    if id == 'all':
        setDataToTable(res, idTableMB, MBcolumns, exc)
    else:
        setDataToTableOne(res, idTableMB, MBcolumns, exc)

def getDataFromInputsMB():
    name = dpg.get_value('namemb')
    socket = dpg.get_value('socketmb')
    form_factor = dpg.get_value('form_factormb')
    chipset = dpg.get_value('chipsetmb')
    price = m(dpg.get_value('pricemb'))

    mb = Motherboard(name, socket, form_factor, chipset, price)
    return mb