import dearpygui.dearpygui as dpg
import math

from CRUD import *
from Note import Motherboard

MBcolumns = ["Price", "Name", "Socket", "Form-factor", "Chipset"]

def m(value):
    return int(math.fabs(value))

def onAddMB():
    pass

def onUpdateMB():
    pass

def onDeleteMB():
    pass

def onSelectMB():
    pass

def getDataFromInputsMB():
    name = dpg.get_value('namemb')
    socket = dpg.get_value('socketmb')
    form_factor = m(dpg.get_value('form_factormb'))
    chipset = dpg.get_value('chipsetmb')
    price = m(dpg.get_value('pricemb'))

    mb = Motherboard(name, socket, form_factor, chipset, price)