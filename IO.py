import os 
from config import dir
from Note import Note

def saveToFile(note:Note, name:str):
    f = open(name,'w')
    
    f.write(note)
    
    f.close()
    print("Сохранено")
    
