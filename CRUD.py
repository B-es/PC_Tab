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

def select(id:str, table:str):
    if(id == 'all'):
        return executesql(f'SELECT * FROM "{table}";')
    else:
        if(id.isdigit()):
            return executesql(f'SELECT * FROM "{table}" WHERE id = {int(id)};', 1)
        else:
            return None
        
def deleteCPU(id:str, table:str):
    if(id.isdigit()):
        return executesql(f'DELETE FROM "{table}" WHERE id = {int(id)} RETURNING *;', 1)
    else:
        return None
    

def add(values:list, table:str, columns:list,):
    id = executesql('SELECT max(id) FROM "CPU";', 1)
    cols = str(columns).replace('[','').replace(']','').replace('\'','"')
    string = str(values).replace('[','').replace(']','')
    sql = f'INSERT INTO "{table}" ({cols}) VALUES({string});'
    executesql(sql, 3)
    return id[0]+1

def update(columns:list, values:list, id:int, table:str):
    vals = str(values).replace('[','').replace(']','').split(',')
    cols = str(columns).replace('[','').replace(']','').replace('\'','"').split(',')
    compile = ([f'{cols[i]} = {vals[i]}' for i in range(len(values))])
    podsql = ''
    for item in compile:
        podsql += f'{item},'
    podsql = podsql.removesuffix(',')
    print(cols)
    sql = f'UPDATE "{table}" SET {podsql} WHERE id = {id};'
    executesql(sql, 3)