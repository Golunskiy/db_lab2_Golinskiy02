import psycopg2
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker


username = 'postgres'
password = '21132113'
database = 'sholop01_DB'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT TRIM(place_country) AS place_country, COUNT(*) FROM company, place
WHERE company.place_id = place.place_id
GROUP BY place_country
'''
query_2 = '''
SELECT TRIM(place_country), SUM(CAST(SUBSTRING(com_valuation, 2, 10) AS INT))
FROM company, place
WHERE company.place_id = place.place_id
GROUP BY place_country
'''
query_3 = '''
SELECT EXTRACT(YEAR FROM com_joined) AS com_year, COUNT(com_joined) AS com_quantity 
FROM company
GROUP BY EXTRACT(YEAR FROM com_joined)
ORDER BY EXTRACT(YEAR FROM com_joined)
'''


conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur1 = conn.cursor()
    cur1.execute(query_1)
    name_country = []
    company_quantity = []

    for row in cur1:
        name_country.append(row[0])
        company_quantity.append(row[1])

    plt.bar(name_country, company_quantity)
    plt.title('Як багато компаній єдинорогів в певній країні', size=20)
    plt.ylabel('Кількість', size=15)
    plt.xticks(rotation=0, size=15)
    plt.show()


    cur2 = conn.cursor()
    cur2.execute(query_2)
    name_country = []
    company_valuation = []

    for row in cur2:
        name_country.append(row[0])
        company_valuation.append(row[1])

    x, y = plt.subplots()
    plt.title('Діаграма найдорожчих компаній по країнам', size=20)
    y.pie(company_valuation, labels=name_country, autopct='%1.1f%%')
    plt.show()


    cur3 = conn.cursor()
    cur3.execute(query_3)
    company_year = []
    company_quantity = []

    for row in cur3:
        company_year.append(int(row[0]))
        company_quantity.append(row[1])

    fig, ax = plt.subplots()

    ax.plot(company_year, company_quantity, marker='o')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
    plt.ylim(0, max(company_quantity)+1)
    ax.set_title('Кількість нових компаній в певний рік', size=20)
    ax.set_ylabel('Кількість', size=15)
    ax.set_xlabel('Рік', size=15)
    plt.show()

