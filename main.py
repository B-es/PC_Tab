import customtkinter as ctk
from Note import Note
from IO import saveToFile

class App(ctk.CTk):
    
    def __init__(self):
        super().__init__()
        
        self.note = Note()
        shiftX = 10
        
        #Общие настройки
        self.geometry("500x500")
        self.title("SaveWatched")
        self.resizable(False, False)
        ctk.set_default_color_theme("green")
        
        #Верхний фрейм
        self.input_frame = ctk.CTkFrame(master=self, fg_color='transparent')
        self.input_frame.grid(row=0, column=0, pady=(shiftX,shiftX))
        
        #Поле ввода
        self.inputName = ctk.CTkEntry(master=self.input_frame, width=200)
        self.inputName.grid(row=0, column=0, padx=(shiftX,shiftX))
        
        #Меню выбора типа
        self.kind = ctk.CTkOptionMenu(master=self.input_frame, values=["Аниме", "Кино"])
        self.kind.grid(row=0, column=1, padx=(shiftX,shiftX))
        
        #Кнопка - добавить
        self.inputButton = ctk.CTkButton(master=self.input_frame, width=100, text="Добавить", command=self.addNote)
        self.inputButton.grid(row=0, column=2, padx=(shiftX,shiftX))
        
        #Таблица
        self.table = ctk.CTkScrollableFrame(master=self, width=(self.winfo_width()-shiftX**2), height=(self.winfo_height()-shiftX**2), label_text="Список", label_anchor='e')
        self.table.grid(row=1, column=0, padx=(shiftX, shiftX), pady=(10,10))

        self.lables = []
    
    #Добавленеие лейбла в массив
    def addLableFromNote(self):
        str = self.note.inputNote + ":" + self.note.kindNote
        self.lables.append(ctk.CTkLabel(master=self.table, text=str, width=self.table.winfo_width(), anchor='w'))
        self.lables[len(self.lables)-1].grid(column=0, row=(len(self.lables)-1))
        
    #Добавление записи
    def addNote(self):
        inputNote = self.inputName.get()
        kindNote = self.kind.get()
        self.note.inputNote = inputNote
        self.note.kindNote = kindNote
        self.addLableFromNote()
        print(self.note.inputNote, self.note.kindNote)
        #saveToFile(self.note, "Test.txt")
   
        
if __name__ == "__main__":
    app = App()
    app.mainloop()