import dearpygui.dearpygui as dpg

from CRUD import *
from Note import Stand
from Services import showMB, m, setDataToTable, setDataToTableOne, clearTable

Standcolumns = ["id Motherboard", "id GPU", "id CPU cooler", "id CPU", "id RAM"]
idTableStand = "tablest"
table = "Stand"
selectid = "selectidst"
exc = 0

def onAddStand():
    st = getDataFromInputsSt()
    count = len(st.checkBadData())
    isFull = not bool(count)
    id = 0
    if(isFull):
        id = add(st.getData(), table, Standcolumns)
        
        data = None
        data = select(str(id), table)
        if data == None: return
        
        setDataToTableOne(data, idTableStand, Standcolumns, exc)
    else:
        showMB()

def onUpdateStand():
    st = getDataFromInputsSt()
    cols, vals = st.getDataToUpdate()
    id = dpg.get_value(selectid)
    
    if id == '': return
    
    update(cols, vals, int(id))
    onSelectStand()

def onDeleteStand():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = deleteCPU(id, table)
    if res == None: return
    
    showMB(f"Запись: {res} была удалена.")
    clearTable(idTableStand, Standcolumns)

def onSelectStand():
    id = dpg.get_value(selectid)
    if id == '': return
    
    res = None
    res = select(id, table)
    if res == None: return
    
    if id == 'all':
        setDataToTable(res, idTableStand, Standcolumns, exc)
    else:
        setDataToTableOne(res, idTableStand, Standcolumns, exc)

def getDataFromInputsSt():
    idmb = m(dpg.get_value('idMb'))
    idgpu = m(dpg.get_value('idGpu'))
    idcpuc = m(dpg.get_value('idCpuc'))
    idcpu = m(dpg.get_value('idCpu'))
    idram = m(dpg.get_value('idRam'))

    st = Stand(idmb, idgpu, idcpuc, idcpu, idram)
    return st