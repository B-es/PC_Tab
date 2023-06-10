import dearpygui.dearpygui as dpg

from Logic.CRUD import *
from Service.Note import Stand
from Service.Services import showMB, m, setDataToTable, setDataToTableOne, clearTable

Standcolumns = ["id Motherboard", "id GPU", "id CPU cooler", "id CPU", "id RAM"]
StandcolumnsView = ["Motherboard", "GPU", "CPU cooler", "CPU", "RAM"]
idTableStand = "tablest"
tableView = "stands"
table = "Stand"
selectid = "selectidst"
exc = -1

def onAddStand():
    st = getDataFromInputsSt()
    count = len(st.checkBadData())
    isFull = not bool(count)
    id = 0
    if(isFull):
        id = add(st.getData(), table, Standcolumns)
        
        data = None
        data = select(str(id), table)
        print(data, id)
        if data == None: return
        
        setDataToTableOne(data, idTableStand, Standcolumns, exc)
    else:
        showMB()

def onUpdateStand():
    st = getDataFromInputsSt()
    cols, vals = st.getDataToUpdate()
    id = dpg.get_value(selectid)
    
    if id == '' or id == 'all': return
    
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
    res = select(id, tableView)
    if res == None: return
    
    if id == 'all':
        setDataToTable(res, idTableStand, StandcolumnsView, exc)
    else:
        setDataToTableOne(res, idTableStand, StandcolumnsView, exc)

def getDataFromInputsSt():
    idmb = m(dpg.get_value('idMb'))
    idgpu = m(dpg.get_value('idGpu'))
    idcpuc = m(dpg.get_value('idCpuc'))
    idcpu = m(dpg.get_value('idCpu'))
    idram = m(dpg.get_value('idRam'))

    st = Stand(idmb, idgpu, idcpuc, idcpu, idram)
    return st