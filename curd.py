import psycopg2
from psycopg2 import Error

def executesql(sql:str, mode:bool=True):
    res = ''
    try:
        conn = psycopg2.connect(dbname='postgres', user='postgres', password='1', host='localhost')
        cursor = conn.cursor()
        cursor.execute(sql)
        if mode:
            res = cursor.fetchall()
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

def selectCPU():
    return executesql('SELECT * FROM "CPU";')

def deleteCPU(id:int):
    return executesql(f'DELETE FROM "CPU" WHERE id = {id};')
