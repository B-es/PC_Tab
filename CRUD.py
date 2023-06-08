import psycopg2
from psycopg2 import Error

def executesql(sql:str, mode:int=0):
    res = ''
    try:
        conn = psycopg2.connect(dbname='postgres', user='postgres', password='1', host='localhost')
        cursor = conn.cursor()
        cursor.execute(sql)
        if mode == 0:
            res = cursor.fetchall()
            conn.commit()
        elif mode == 1:
            res = cursor.fetchone()
            conn.commit()
        else:
            res = None
        
    except (Exception, Error) as error:
        print("Ошибка в работе субд")
    finally:
        if conn:
            conn.commit()
            cursor.close()
            conn.close()
            print("Соединение с PostgreSQL закрыто.")
            return res

def selectCPU(id:str):
    if(id == 'all'):
        return executesql('SELECT * FROM "CPU";')
    else:
        if(id.isdigit()):
            return executesql(f'SELECT * FROM "CPU" WHERE id = {int(id)};')
        else:
            return None
        
def deleteCPU(id:str):
    if(id.isdigit()):
        return executesql(f'DELETE FROM "CPU" WHERE id = {int(id)} RETURNING *;', 1)
    else:
        return None
    

def addCPU(values:list):
    id = executesql('SELECT max(id) FROM "CPU";', 1)
    string = str(values).replace('[','').replace(']','')
    sql = f'INSERT INTO "CPU"("Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", "Name") VALUES({string});'
    executesql(sql, 3)
    return id[0]+1

def updateCPU(columns:list, values:list, id:int):
    vals = str(values).replace('[','').replace(']','').split(',')
    cols = str(columns).replace('[','').replace(']','').replace('\'','"').split(',')
    compile = ([f'{cols[i]} = {vals[i]}' for i in range(len(values))])
    podsql = ''
    for item in compile:
        podsql += f'{item},'
    podsql = podsql.removesuffix(',')
    sql = f'UPDATE "CPU" SET {podsql} WHERE id = {id};'
    executesql(sql, 3)