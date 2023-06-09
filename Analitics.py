import dearpygui.dearpygui as dpg

from CRUD import executesql
from Services import showMB


def getCountModel(model:str, table:str) -> str:
    sql = f'SELECT COUNT(*) FROM "{table}" WHERE "Name" = \'{model}\''
    return str(executesql(sql,1)[0])

def getDiffBetweenChExp(table) -> int:
    sqlChip = f'SELECT min("Price") FROM "{table}"'
    sqlExp = f'SELECT max("Price") FROM "{table}"'
    return int(executesql(sqlExp,1)[0]) - int(executesql(sqlChip,1)[0])

def onGetCount(id):
    table = dpg.get_item_user_data(id)
    model = dpg.get_value("AnaliticInp")
    if model == "": return
    print(model)
    res = getCountModel(model, table)
    if res == "": return
    
    showMB(f'Результат - {res}')
    
def onGetDiff(id):
    table = dpg.get_item_user_data(id)
    res = getDiffBetweenChExp(table)
    showMB(f'Результат - {res}')
    