## 3. Connecting to the Database ##

#1. Importe a biblioteca sqlite3 dentro o ambiente.
#2. Então, use a função sqlite3.connect() para se concetar com jobs.db, e atribua a instancia na variavel conn.
import sqlite3
conn = sqlite3.connect("jobs.db")

## 6. Creating a Cursor and Running a Query ##

import sqlite3
conn = sqlite3.connect("jobs.db")
cursor = conn.cursor()

query = "select * from recent_grads;"
cursor.execute(query)
results = cursor.fetchall()
print(results[0:2])
#1. Escreva uma query que retorne todos os valores da coluna Major da tabela recent_grads.
query = "select Major from recent_grads;"
#2. Aguarde todos os resultados em uma lista tuples na variavel majors.
cursor.execute(query)
majors = cursor.fetchall()
#3. Depois, imprimir as três primeiras tuple.
print(majors[:3])

## 8. Fetching a Specific Number of Results ##

import sqlite3
conn = sqlite3.connect("jobs.db")
cursor = conn.cursor()
#1. Escreva e execute um query que retorne a coluna Major e Major_category do recent_grads.
query = "select Major,Major_category from recent_grads;"
#2. Depois, fetch os cinco primeiros resultados e armazene na variável five_results.
five_results = cursor.execute(query).fetchmany(5)

## 9. Closing the Database Connection ##

conn = sqlite3.connect("jobs.db")
#1. Feche a conexão com o database e use o método. close().
conn.close()

## 10. Practice ##

# 1. Conecte-se ao database jobs2.db, que contêm os mesmos dados que jobs.db.
conn = sqlite3.connect("jobs2.db")
# 2. Escreva uma query que retorne todos os valores da coluna Major na ordem alfabetica reversa(Z ao A).
query = "select Major from recent_grads order by Major desc;"
#3. Atribua todo o resultado a variavel reverse_alphabetical.
reverse_alphabetical = conn.cursor().execute(query).fetchall()
#4. Finalmente, feche a conexão com o database.
conn.close()