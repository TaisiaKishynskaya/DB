SELECT cities.name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE population > 350000;

SELECT cities.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';




SET NAMES utf8;
SET time_zone = '+00:00';

CREATE TABLE towns (
    city_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(255) NOT NULL,
    latitude DECIMAL,
    longitude DECIMAL,
    PRIMARY KEY (city_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE metro_lines (
    line_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    line_name VARCHAR(255) NOT NULL,
    line_colour VARCHAR(255) NOT NULL,
    PRIMARY KEY (line_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE metro_stations (
    station_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    station_number INT UNSIGNED NOT NULL,
    station_name VARCHAR(255) NOT NULL,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    line_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (station_id),
    FOREIGN KEY (line_id) REFERENCES metro_lines(line_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE station_connections (
    connection_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    station1_id INT UNSIGNED NOT NULL,
    station2_id INT UNSIGNED NOT NULL,
    travel_time TIME,
    distance DECIMAL(10,2),
    PRIMARY KEY (connection_id),
    FOREIGN KEY (station1_id) REFERENCES metro_stations(station_id),
    FOREIGN KEY (station2_id) REFERENCES metro_stations(station_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE countries (
    country_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE areas (
    area_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    area_name VARCHAR(255) NOT NULL,
    country_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (area_id),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE city_regions (
    record_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    city_id INT UNSIGNED NOT NULL,
    area_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (record_id),
    FOREIGN KEY (city_id) REFERENCES towns(city_id),
    FOREIGN KEY (area_id) REFERENCES areas(area_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO towns VALUES
(1,  'Київ',  49.9808100,  36.2527200),
(2,  'Харків',  50.9808100,  45.2527200),
(3, 'Будапешт', 47.4980100, 19.0399100);

INSERT INTO metro_lines VALUES
(1, 'Північна', 'Червоний'),
(2, 'Південна', 'Синій'),
(3, 'Західна', 'Зелений'),
(4, 'Vorosmartu-Mexico', 'Червоний'),
(5, 'Deli-Ors', 'Жовтий');

INSERT INTO metro_stations VALUES
(1, 1, 'Холодна Гора', 49.9808100, 45.2527200, 1),
(2, 2, 'Південний Вокзал', 13.3242, 13.44543, 1),
(3, 3, 'Центральний ринок', 12.12, 13.13, 1),
(4, 4, 'Майдан конституції', 12.12, 13.13, 1),
(5, 5, 'Проспект Гагаріна', 12.12, 13.13, 1),
(6, 6, 'Спортивна', 12.12, 13.13, 1),
(7, 7, 'Завод імені Малишева', 12.12, 13.13, 1),
(8, 8, 'Московський проспект', 12.12, 13.13, 1),
(9, 9, 'Палац спорту', 12.12, 13.13, 1),
(10, 10, 'Армійська', 12.12, 13.13, 1),
(11, 11, 'Шмені Масельского', 12.12, 13.13, 1),
(12, 12, 'Тракторний завод', 12.12, 13.13, 1),
(13, 13, 'Індустріальна', 12.12, 13.13, 1),
(14, 1, 'Героїв Праці', 12.12, 13.13, 2),
(15, 2, 'Студентська', 12.12, 13.13, 2),
(16, 3, 'Академіка Павлова', 12.12, 13.13, 2),
(17, 4, 'Київська', 12.12, 13.13, 2),
(18, 5, 'Пушкінська', 12.12, 13.13, 2),
(19, 6, 'Університет', 12.12, 13.13, 2),
(20, 7, 'Історичний музей', 12.12, 13.13, 2),
(21, 1, 'Перемога', 12.22, 33.24, 3),
(22, 2, 'Олексіївська', 12.22, 33.24, 3),
(23, 3, '23 серпня', 12.22, 33.24, 3),
(24, 4, 'Ботанічний сад', 12.22, 33.24, 3),
(25, 5, 'Наукова', 12.22, 33.24, 3),
(26, 6, 'Держпром', 12.22, 33.24, 3),
(27, 7, 'Архітектора Бікетова', 12.22, 33.24, 3),
(28, 8, 'Захисників України', 12.22, 33.24, 3),
(29, 9, 'Метробудівників', 12.22, 33.24, 3),
(30, 1, 'Vorosmartu', 12.22, 33.24, 4),
(31, 2, 'Szell', 12.22, 33.24, 4),
(32, 3, 'Kosszus', 12.22, 33.24, 4),
(33, 4, 'Deak', 12.22, 33.24, 4),
(34, 5, 'Astoria', 12.22, 33.24, 4),
(35, 6, 'Bjaha', 12.22, 33.24, 4),
(36, 7, 'Mexico', 12.22, 33.24, 4),
(37, 1, 'Vorosmartu', 12.22, 33.24, 5),
(38, 2, 'Deak', 12.22, 33.24, 5),
(39, 3, 'Arany', 12.22, 33.24, 5),
(40, 4, 'Opera', 12.22, 33.24, 5),
(41, 5, 'Oktogon', 12.22, 33.24, 5),
(42, 6, 'Vorosmarty', 12.22, 33.24, 5),
(43, 7, 'Kodaly', 12.22, 33.24, 5);

INSERT INTO station_connections VALUES
(1, 20, 4, '00:05:03', 12.33),
(2, 6, 29, '00:06:09', 21.33),
(3, 26, 19, '00:10:20', 70.02),
(4, 38, 33, '00:05:23', 10.3);

INSERT INTO countries VALUES
(1, 'Україна'),
(2, 'Угорщина');

INSERT INTO areas VALUES
(1, 'Харківська область', 1),
(2, 'Budapest', 2);

INSERT INTO city_regions VALUES
(1, 2, 1),
(2, 3, 2);

SELECT * FROM towns;

SELECT * FROM metro_lines;

SELECT * FROM metro_stations;

SELECT * FROM station_connections;

SELECT * FROM countries;

SELECT * FROM areas;

SELECT * FROM city_regions;

SELECT * FROM metro_stations 
WHERE line_id = (SELECT line_id FROM metro_lines WHERE line_colour = 'Синій');
