#Класс записи
class CPU():
    name = 'None'
    freq = 0
    cores = 0
    socket = 'None'
    price = 0
    integ = 'g'
    columns = ["Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name"]
    
    def __init__(self, name, freq, cores, socket, price, integ):
        self.setData(name, freq, cores, socket, price, integ)
    
    def setData(self, name, freq, cores, socket, price, integ):
        if name != '': self.name = name
        if freq.isdigit(): self.freq = int(freq)
        self.cores = cores
        if socket != '': self.socket = socket
        if price.isdigit(): self.price = int(price)
        self.integ = str(integ).replace('1', 't').replace('0','f')
    
        
    def getData(self):
        return [self.integ, self.freq, self.cores, self.price, self.socket, self.name]

    def checkBadData(self):
        baddata = []
        if self.integ == 'g':
            baddata.append(0)
        if self.freq == 0:
            baddata.append(1)
        if self.cores == 0:
            baddata.append(2)
        if self.price == 0:
            baddata.append(3)
        if self.socket == 'None':
            baddata.append(4)
        if self.name == 'None':
            baddata.append(5)
    
        return baddata
    
    def getDataToUpdate(self):
        baddata = self.checkBadData()
        data = self.getData()
        cols = self.columns.copy()
        for i in baddata:
            cols[i] = ''
            data[i] = ''
        goodcols = [value for value in cols if value != '']
        gooddata = [value for value in data if value != '']
        return (goodcols, gooddata)
        