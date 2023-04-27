import psycopg2
from data import compileMassives, compileEndMassives
from data import sales, columns_sales

conn = psycopg2.connect(dbname='postgres', user='postgres', password='1', host='localhost')

cursor = conn.cursor()


def insertToTable(table, columns, values) -> str:
    columns_str = str(columns).replace('\'', '"')
    len_values = "%s"*len(values)
    len_values = len_values.replace('s', 's,')
    len_values = len_values.rstrip(len_values[-1])
    
    if isinstance(values, str):
        len_values = "%s"
    
    sql_req = f'INSERT INTO "{table}" {columns_str} ' + f'VALUES({len_values})'
    cursor.execute(sql_req, values)
    return sql_req
    
def deleteFromTable(table, value, column=None) -> str:
    
    sql_req = ''
    if value != "all":
        sql_req = f'DELETE FROM "{table}" WHERE "{column}" = {value}'
    else:
        sql_req = f'DELETE FROM "{table}"'
        
    cursor.execute(sql_req)
    return sql_req

def deleteAllRows(tables):
    for _ in tables:
        deleteFromTable(_, 'all')

def printAll(tables):
    for _ in tables:
        cursor.execute(f'SELECT * FROM "{_}"')
        for item in cursor.fetchall():
            print(item)

tables, data, data_columns = compileMassives()
endTables, endData, endData_columns = compileEndMassives()

def inputRows(tables, data, data_columns, count_row = 10):
    for i in range(len(data)):
        for j in range(count_row):
            print(data[i][j])
            insertToTable(tables[i], data_columns[i], data[i][j])
        print(tables[i])
        
# for j in range(10):
#     cursor.execute('INSERT INTO "Build" ("Name") VALUES(%s)', ("Butterbroad",))

def toNullIncrement(tables):
    for i in tables:
        sql_req = f'TRUNCATE TABLE "{i}" RESTART IDENTITY CASCADE;'
        print(sql_req)
        cursor.execute(sql_req)


# inputRows(tables, data, data_columns)
#inputRows(endTables, endData, endData_columns)
# deleteFromTable("Sales", "all")
# for i in range(10):
#     insertToTable("Sales",columns_sales, sales[i])
    

#deleteFromTable("CPU", "all")
# deleteAllRows(endTables)
# toNullIncrement(tables)
# toNullIncrement(endTables)
printAll(tables)
printAll(endTables)

conn.commit()
cursor.close()
conn.close()

  
