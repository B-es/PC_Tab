import customtkinter as ctk
from Note import CPU
from curd import *


class App(ctk.CTk):
    lables = []
    cores = 18
    #Логика 
    def createLableFromTuple(self, item:tuple, master):
        s = str(item).replace(')','').replace('(','').replace('\'','')
        res = f'{len(self.lables)+1}. {s}'
        self.lables.append(ctk.CTkLabel(master=master, text=res, anchor='w', width=self.bottomframeCPU.winfo_width()-10))
        return self.lables[-1]
    
    def insertToScrollTalbe(self, item:tuple):
        lable = self.createLableFromTuple(item, self.bottomframeCPU)
        lable.pack()
        
    def destroyMas(self, mas):
        for item in mas:
            item.pack_forget()
        mas.clear()
        
    def selectAndShowCPU(self, res, howm):
        self.destroyMas(self.lables)
        if(res == None): return
        elif(type(res) == list):
            for item in res:
                self.insertToScrollTalbe(item)
                if len(self.lables) == howm: break  
        else:
            self.insertToScrollTalbe(res)
    #Команды
    def onCores(self, value):
        if value % 2 != 0: 
            self.cores = round(value)
            if self.cores % 2 != 0: self.cores += 1
        else: self.cores = int(value)
        self.coresCPU_lbl.configure(text = f"Кол-во ядер: {self.cores}")
        
    def onselectAndShowCPU(self):
        if(self.howRows.get() == ''): return None
        res = selectCPU(self.did.get())
        self.selectAndShowCPU(res, int(self.howRows.get()))
            
    def ondeleteNote(self):
        deleteCPU(self.did.get())
        self.selectAndShowCPU(self.did.get(), 1)
        
    def onaddNote(self):
        name = self.inputNameCpu.get()
        freq = self.freqCPU.get()
        cores = self.cores;
        socket = self.socketCPU.get()
        price = self.priceCPU.get()
        integ = self.integCPU.get()
        cpu = CPU(name, freq, cores, socket, price, integ)
        id = addCPU(cpu.getData())
        res = selectCPU(str(id))
        self.selectAndShowCPU(res, 1)
        
    def onupdateNote(self):
        name = self.inputNameCpu.get()
        freq = self.freqCPU.get()
        cores = self.cores;
        socket = self.socketCPU.get()
        price = self.priceCPU.get()
        integ = self.integCPU.get()
        cpu = CPU(name, freq, cores, socket, price, integ)
        updateCPU(*cpu.getDataToUpdate(), int(self.did.get()))
        res = selectCPU(self.did.get())
        self.selectAndShowCPU(res, 1)
    
    def __init__(self):
        super().__init__()
        
        #Общие настройки
        self.geometry("600x800")
        self.title("PC_Tab")
        self.resizable(False, False)
        ctk.set_default_color_theme("green")
        
        #Фреймы CPU
        self.frame = ctk.CTkFrame(master=self, width=500, height=500, fg_color='transparent')
        self.rigthframeCPU = ctk.CTkFrame(master=self.frame, width=250, height=500, fg_color='transparent')
        self.leftframeCPU = ctk.CTkFrame(master=self.frame, fg_color='gray21')
        self.leftframeS = ctk.CTkFrame(master=self.frame, fg_color='gray21')
        self.bottomframeCPU = ctk.CTkScrollableFrame(master=self, label_anchor='e')        
        
        self.frame.pack(fill="x")
        self.rigthframeCPU.pack(side = 'right', expand=True)
        self.leftframeCPU.pack(side="left", expand=True, fill='both')
        self.bottomframeCPU.pack(fill='both', pady=(0,0), expand=True)

        #Кнопки - правый фрейм
        self.menu = ctk.CTkOptionMenu(master=self.rigthframeCPU, values=["CPU", "Motherboard", "Stand"])
        self.addCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Добавить", command=self.onaddNote)
        self.updateCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Обновить", command=self.onupdateNote)
        self.deleteCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Удалить", command=self.ondeleteNote)
        self.showCPU = ctk.CTkButton(master=self.rigthframeCPU, text="Вывести", command=self.onselectAndShowCPU)
        self.howRows_lbl = ctk.CTkLabel(master=self.rigthframeCPU, text="Сколько вывести: ")
        self.howRows = ctk.CTkEntry(master=self.rigthframeCPU)
        self.did_lbl = ctk.CTkLabel(master=self.rigthframeCPU, text="id: ")
        self.did = ctk.CTkEntry(master=self.rigthframeCPU)
        
        self.menu.pack(pady=(1,16))
        self.addCPU_btn.pack(pady=2)
        self.updateCPU_btn.pack(pady=2)
        self.deleteCPU_btn.pack(pady=2)
        self.showCPU.pack(pady=2)
        self.howRows_lbl.pack(pady=(16,2))
        self.howRows.pack(pady=2)
        self.did_lbl.pack(pady=2)
        self.did.pack(pady=2)
        
        #Ввод - левый фрейм CPU
        self.inputNameCpu_lbl = ctk.CTkLabel(master=self.leftframeCPU, text="Название: ")
        self.inputNameCpu = ctk.CTkEntry(master=self.leftframeCPU)
        
        self.freqCPU_lbl = ctk.CTkLabel(master=self.leftframeCPU, text="Частота: ")
        self.freqCPU = ctk.CTkEntry(master=self.leftframeCPU)
        
        self.coresCPU_lbl = ctk.CTkLabel(master=self.leftframeCPU, text="Кол-во ядер: ")
        self.coresCPU = ctk.CTkSlider(master=self.leftframeCPU, number_of_steps=16, from_=2, to=32, command=self.onCores)
        
        self.socketCPU_lbl = ctk.CTkLabel(master=self.leftframeCPU, text="Сокет: ")
        self.socketCPU = ctk.CTkEntry(master=self.leftframeCPU)
        
        self.integCPU = ctk.CTkCheckBox(master=self.leftframeCPU, text="Интегрированная графика: ")
        
        self.priceCPU_lbl = ctk.CTkLabel(master=self.leftframeCPU, text="Цена: ")
        self.priceCPU = ctk.CTkEntry(master=self.leftframeCPU)
        
        self.inputNameCpu_lbl.pack(pady=(10,2))
        self.inputNameCpu.pack(pady=1)
        self.freqCPU_lbl.pack(pady=2)
        self.freqCPU.pack(pady=1)
        self.coresCPU_lbl.pack(pady=2)
        self.coresCPU.pack(pady=1)
        self.socketCPU_lbl.pack(pady=2)
        self.socketCPU.pack(pady=1)
        self.priceCPU_lbl.pack(pady=2)
        self.priceCPU.pack(pady=1)
        self.integCPU.pack(pady=20)

        
        
        
if __name__ == "__main__":
    app = App()
    app.mainloop()