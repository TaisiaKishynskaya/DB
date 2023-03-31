SELECT id, name 
FROM cities
WHERE name LIKE '%ськ';

SELECT id, name 
FROM cities
WHERE name LIKE '%донец%';

SELECT CONCAT(name, " (", region, ")"), population
FROM cities
WHERE population > 100000
ORDER BY population;

"""ROUND для округлення значення відсотка до двох знаків після коми"""
SELECT name, CONCAT(ROUND((population / 40000000) * 100, 2), '%') AS percent_of_population
FROM cities
ORDER BY population DESC
LIMIT 50;

SELECT CONCAT(name, ' - ', ROUND((population / 40000000) * 100, 2), '%') AS city_population
FROM cities
WHERE population >= 40000
ORDER BY city_population DESC;

