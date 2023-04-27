import customtkinter as ctk
from Note import Note
from curd import *


class App(ctk.CTk):
    lables = []
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
            
    #Команды
    def onCores(self, value):
        v = 0
        if value % 2 != 0: 
            v = round(value)
            if v % 2 != 0: v += 1
        else: v = int(value)
        self.coresCPU_lbl.configure(text = f"Кол-во ядер: {v}")
        
    def selectAllCPU(self):
        if(self.howRows.get() == ''): return None
        
        self.destroyMas(self.lables)

        res = selectCPU()
        for item in res:
            self.insertToScrollTalbe(item)
            if len(self.lables) == int(self.howRows.get()): break
            
    def deleteNote(self):
        deleteCPU(int(self.did.get()))
        print(self.did.get())
        self.selectAllCPU()
    
    def __init__(self):
        super().__init__()
        
        self.note = Note()
        
        #Общие настройки
        self.geometry("500x800")
        self.title("PC_Tab")
        self.resizable(False, False)
        ctk.set_default_color_theme("green")
        
        #Фреймы CPU
        self.frameCPU = ctk.CTkFrame(master=self, width=500, height=500, fg_color='transparent')
        self.rigthframeCPU = ctk.CTkFrame(master=self.frameCPU, width=250, height=500, fg_color='transparent')
        self.leftframeCPU = ctk.CTkFrame(master=self.frameCPU, fg_color='transparent')
        self.bottomframeCPU = ctk.CTkScrollableFrame(master=self, label_anchor='e')        
        
        self.frameCPU.pack(fill="x")
        self.rigthframeCPU.pack(side = 'right', expand=True)
        self.leftframeCPU.pack(side="left", expand=True)
        self.bottomframeCPU.pack(fill='both', pady=(10,0), expand=True)
        
        #Кнопки - правый фрейм
        self.addCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Добавить")
        self.updateCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Обновить")
        self.deleteCPU_btn = ctk.CTkButton(master=self.rigthframeCPU, text="Удалить", command=self.deleteNote)
        self.showCPU = ctk.CTkButton(master=self.rigthframeCPU, text="Вывести все CPU", command=self.selectAllCPU)
        self.howRows_lbl = ctk.CTkLabel(master=self.rigthframeCPU, text="Сколько вывести: ")
        self.howRows = ctk.CTkEntry(master=self.rigthframeCPU)
        self.did_lbl = ctk.CTkLabel(master=self.rigthframeCPU, text="id для удаления: ")
        self.did = ctk.CTkEntry(master=self.rigthframeCPU)
        
        self.addCPU_btn.pack(pady=10)
        self.updateCPU_btn.pack(pady=10)
        self.deleteCPU_btn.pack(pady=10)
        self.showCPU.pack(pady=10)
        self.howRows_lbl.pack(pady=5)
        self.howRows.pack(pady=10)
        self.did_lbl.pack(pady=5)
        self.did.pack(pady=10)
        
        #Ввод - левый фрейм
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
        
        self.inputNameCpu_lbl.pack(pady=2)
        self.inputNameCpu.pack(pady=1)
        self.freqCPU_lbl.pack(pady=2)
        self.freqCPU.pack(pady=1)
        self.coresCPU_lbl.pack(pady=2)
        self.coresCPU.pack(pady=1)
        self.socketCPU_lbl.pack(pady=2)
        self.socketCPU.pack(pady=1)
        self.priceCPU_lbl.pack(pady=2)
        self.priceCPU.pack(pady=1)
        self.integCPU.pack(pady=4)
       
        
        
        
        
if __name__ == "__main__":
    app = App()
    app.mainloop()