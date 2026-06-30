# PC_Tab

Десктопное приложение на Python для управления каталогом процессоров (CPU) в базе данных PostgreSQL. Поддерживает полный CRUD через графический интерфейс.

## Возможности

- Добавление процессора с параметрами: название, частота, количество ядер, сокет, цена, наличие встроенной графики
- Обновление и удаление записей по ID
- Выборка одной или нескольких записей
- Количество ядер задаётся слайдером (шаг 2, диапазон 2–32)

## Стек

- **customtkinter** — GUI
- **psycopg2** — подключение к PostgreSQL

## Установка

```bash
pip install customtkinter psycopg2
```

## Настройка базы данных

Приложение подключается к локальному PostgreSQL:

```
dbname=postgres  user=postgres  password=1  host=localhost
```

Параметры подключения задаются в [curd.py](curd.py).

Необходимая таблица:

```sql
CREATE TABLE "CPU" (
    id SERIAL PRIMARY KEY,
    "Name" TEXT,
    "Frequence" INTEGER,
    "Number of cores" INTEGER,
    "Socket" TEXT,
    "Price" INTEGER,
    "Integrated graphics" CHAR(1)
);
```

## Запуск

```bash
python main.py
```
