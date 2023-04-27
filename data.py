#CPU
cpu = [(False, 4200, 8, 15000, "AM4", "Ryzen 7 3700X"),
       (False, 4600, 6, 14490, "AM4", "Ryzen 5 5600X"),
       (False, 4600, 8, 18800, "AM4", "Ryzen 7 5700X"),
       (False, 4300, 4, 8500, "LGA1700", "i3-12100F"),
       (False, 4400, 6, 14400, "LGA1700", "i5-12400F"),
       (False, 5000, 12, 29500, "LGA1700", "i7-12700KF"),
       (False, 4300, 6, 10200, "LGA1200", "i5-10400F"),
       (True, 4000, 4, 8900, "AM4", "Ryzen 3 3200G"),
       (False, 4200, 4, 9000, "LGA1151v2", "i3-9100F"),
       (False, 4800, 12, 30000, "AM4", "Ryzen 9 5900X")]

columns_cpu = ('Integrated graphics', "Frequence", "Number of cores", "Price", "Socket", "Name")

#CPU cooler
cpu_cooler = [(3000, "Воздушный", "DEEPCOOL GAMMAXX GT"),
              (3000, "Воздушный", "ID-COOLING SE-234"),
              (3000, "Воздушный", "ID-COOLING SE-234"),
              (3000, "Воздушный", "DEEPCOOL GAMMAXX GT"),
              (3000, "Воздушный", "ID-COOLING SE-234"),
              (3000, "Воздушный", "DEEPCOOL GAMMAXX GT"),
              (3000, "Воздушный", "ID-COOLING SE-234"),
              (3000, "Воздушный", "DEEPCOOL GAMMAXX GT"),
              (3000, "Воздушный", "ID-COOLING SE-234"),
              (3000, "Воздушный", "ID-COOLING SE-234")]


columns_cpu_cooler = ('Price', 'Type', 'Name')

#Case
case = [(5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower"),
        (5300, "Cougar MX330-F", "Mid-Tower")]

columns_case = ('Price', 'Name', 'Form-factor')

#Client
client = [("Чипалино", "Ваковский", "11222233123"),
          ("Крендель", "Ржаной", "+7966443434"),
          ("Суспензия", "Несладкая", "+3133312323"),
          ("Диалектизм", "Внелогия", "+0000000000"),
          ("Харя", "Димановская", "+1213131313"),
          ("Тест", "Программкин", "+3331333333"),
          ("Помидорец", "Иностранный", "+3030303030"),
          ("Ножка", "Стульная", "+7776667711"),
          ("Теократия", "Божья", "+-000000000"),
          ("Собака", "Павлова", "1234567890")]

columns_client = ('Name', 'Surname', 'Number')

#Fans
fans = [(700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301"),
        (700, "ASUS 120 FAN GT301")]

columns_fans = ('Price', 'Name')

#GPU
gpu = [(2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC"),
       (2, 7600, "GIGABYTE GT 1030 OC")]

columns_gpu = ('VMemory', 'Price', 'Name')

#Motherboard
motherboard = [(13000, "B550 AORUS ELITE V2", "AM4", "ATX", "B550"),
               (11500, "B660 GAMING X DDR4", "LGA1700", "ATX", "B660"),
               (8000, "MSI Z490-A PRO", "LGA1200", "ATX", "Z490"),
               (4500, "MSI H310M PRO-VDH", "LGA1151v2", "ATX", "H310M"),
               (13000, "B550 AORUS ELITE V2", "AM4", "ATX", "B550"),
               (11500, "B660 GAMING X DDR4", "LGA1700", "ATX", "B660"),
               (8000, "MSI Z490-A PRO", "LGA1200", "ATX", "Z490"),
               (4500, "MSI H310M PRO-VDH", "LGA1151v2", "ATX", "H310M"),
               (13000, "B550 AORUS ELITE V2", "AM4", "ATX", "B550"),
               (11500, "B660 GAMING X DDR4", "LGA1700", "ATX", "B660")]

columns_motherboard = ('Price', 'Name', 'Socket', 'Form-factor', 'Chipset')

#PSU
psu = [(750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX"),
       (750, 6500, "be quiet! 750W", "ATX")]

columns_psu = ('Watt', 'Price', 'Name', 'Form-factor')

#RAM
ram = [(2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4"),
       (2, 3200, 4500, "Kingston FURY Beast", "DDR4")]

columns_ram = ('Number of', 'Frequency', 'Price', 'Name', 'Type')

#Sales
sales = [(100000, 1, 1, 'Butterbroad', 1),
         (100000, 1, 1, 'Butterbroad', 2),
         (100000, 1, 1, 'Butterbroad', 3),
         (100000, 1, 1, 'Butterbroad', 4),
         (100000, 1, 1, 'Butterbroad', 5),
         (100000, 1, 1, 'Butterbroad', 6),
         (100000, 1, 1, 'Butterbroad', 7),
         (100000, 1, 1, 'Butterbroad', 8),
         (100000, 1, 1, 'Butterbroad', 9),
         (100000, 1, 1, 'Butterbroad', 10)]

columns_sales = ('Gain', 'id Client', 'Number of sales', 'Name', 'id Build')

#Stand
stand = [(1,1,1,1,1),
         (2,2,2,2,2),
         (3,3,3,3,3),
         (4,4,4,4,4),
         (5,5,5,5,5),
         (6,6,6,6,6),
         (7,7,7,7,7),
         (8,8,8,8,8),
         (9,9,9,9,9),
         (10,10,10,10,10)]

columns_stand = ('id Motherboard', 'id GPU', 'id CPU cooler', 'id CPU', 'id RAM')

#Storage
storage = [(7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2"),
           (7900, "Samsung 980 PRO", "SSD", "M2")]

columns_storage = ('Price', 'Name', 'Type', 'Form-factor')

#Build
build = [(1, "Butterbroad", 1, 1, 1, 1),
         (2, "Butterbroad", 2, 2, 2, 2),
         (3, "Butterbroad", 3, 3, 3, 3),
         (4, "Butterbroad", 4, 4, 4, 4),
         (5, "Butterbroad", 5, 5, 5, 5),
         (6, "Butterbroad", 6, 6, 6, 6),
         (7, "Butterbroad", 7, 7, 7, 7),
         (8, "Butterbroad", 8, 8, 8, 8),
         (9, "Butterbroad", 9, 9, 9, 9),
         (10, "Butterbroad", 10, 10, 10, 10)]

columns_build = ('id Stand', 'Name', 'Fans id', 'Case id', 'PSU id', 'Storage id')

def compileMassives():
       tables = ["CPU", "CPU cooler", "Case", "Client", "Fans", "GPU", "Motherboard", "PSU", "RAM", "Storage"]
       data = [cpu, cpu_cooler, case, client, fans, gpu, motherboard, psu, ram, storage]
       data_columns = [columns_cpu, columns_cpu_cooler, columns_case, columns_client, columns_fans, columns_gpu, columns_motherboard, columns_psu, columns_ram, columns_storage]
       return tables, data, data_columns

def compileEndMassives():
       tables = ["Stand", "Build"]
       data = [stand, build]
       data_columns = [columns_stand, columns_build]
       return tables, data, data_columns