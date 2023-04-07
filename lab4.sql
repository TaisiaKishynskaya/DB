SELECT UPPER(name) as name
FROM cities
ORDER BY name
LIMIT 5;

SELECT name, LENGTH(name) AS name_length
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10)

SELECT region, SUM(population) AS total_population
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region

SELECT AVG(population)
FROM cities
WHERE region = 'W';

SELECT COUNT(*) AS city_count 
FROM cities 
WHERE region = 'E';