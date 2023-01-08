-- Як багато компаній єдинорогів в певній країні
SELECT TRIM(place_country) AS place_country, COUNT(*) FROM company, place
WHERE company.place_id = place.place_id
GROUP BY place_country


-- Суми найдорожчих компаній по країнам
SELECT TRIM(place_country), SUM(CAST(SUBSTRING(com_valuation, 2, 10) AS INT))
FROM company, place
WHERE company.place_id = place.place_id
GROUP BY place_country


-- Кількість нових компаній в певний рік
SELECT EXTRACT(YEAR FROM com_joined) AS com_year, COUNT(com_joined) AS com_quantity 
FROM company
GROUP BY EXTRACT(YEAR FROM com_joined)
ORDER BY EXTRACT(YEAR FROM com_joined)