SELECT name, population
FROM cities
WHERE population >= 1000000;

SELECT name
FROM cities
WHERE region IN ('E', 'W')
ORDER BY population ASC;

SELECT name
FROM cities
WHERE region IN ('S', 'C', 'N') AND population>50000;

SELECT name
FROM cities
WHERE region IN ('E', 'W', 'N') AND 150000<population<350000
ORDER BY name ASC;

SELECT name
FROM cities
WHERE region IN ('E', 'W', 'N') AND population BETWEEN 150000 AND 350000
ORDER BY name ASC
LIMIT 20;

SELECT name
FROM cities
WHERE NOT region IN ('E', 'W')
ORDER BY population ASC
LIMIT 10 OFFSET 11;
