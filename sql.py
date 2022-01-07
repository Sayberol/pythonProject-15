import sqlite3

con = sqlite3.connect('animal.db')

cursor = con.cursor()
query = """
    create table colors(
    id integer primary key autoincrement,
    name varchar(30))
"""

cursor.execute(query)
con.close()
