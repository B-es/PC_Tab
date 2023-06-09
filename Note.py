#Класс записи CPU
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
        self.freq = int(freq)
        self.cores = cores
        if socket != '': self.socket = socket
        self.price = int(price)
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
        
class Motherboard():
    name = 'None'
    socket = 'None'
    form_factor = 'None'
    chipset = 'None'
    price = 0
    columns = ["Price", "Name", "Socket", "Form-factor", "Chipset"]
    
    def __init__(self, name, socket, form_factor, chipset, price):
        self.setData(name, socket, form_factor, chipset, price)
    
    def setData(self, name, socket, form_factor, chipset, price):
        if name != '': self.name = name
        if socket != '': self.socket = socket
        if form_factor != '': self.form_factor = form_factor
        if chipset != '': self.chipset = chipset
        self.price = price
    
        
    def getData(self):
        return [self.price, self.name, self.socket, self.form_factor, self.chipset]

    def checkBadData(self):
        baddata = []
        if self.price == 0:
            baddata.append(0)
        if self.name == 'None':
            baddata.append(1)
        if self.socket == 'None':
            baddata.append(2)
        if self.form_factor == 'None':
            baddata.append(3)
        if self.chipset == 'None':
            baddata.append(4)
    
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
        
        
class Stand():
    idmb = 0
    idgpu = 0
    idcpuc = 0
    idcpu = 0
    idram = 0
    columns = ["id Motherboard", "id GPU", "id CPU cooler", "id CPU", "id RAM"]
    
    def __init__(self, idmb, idgpu, idcpuc, idcpu, idram):
        self.setData(idmb, idgpu, idcpuc, idcpu, idram)
    
    def setData(self, idmb, idgpu, idcpuc, idcpu, idram):
        self.idmb = idmb
        self.idgpu = idgpu
        self.idcpuc = idcpuc
        self.idcpu = idcpu
        self.idram = idram
        
    
    def getData(self):
        return [self.idmb, self.idgpu, self.idcpuc, self.idcpu, self.idram]

    def checkBadData(self):
        baddata = []
        if self.idmb == 0:
            baddata.append(0)
        if self.idgpu == 0:
            baddata.append(1)
        if self.idcpuc == 0:
            baddata.append(2)
        if self.idcpu == 0:
            baddata.append(3)
        if self.idram == 0:
            baddata.append(4)
    
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
        