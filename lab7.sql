SET NAMES utf8;
SET time_zone = '+00:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE categories (
    id int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) COLLATE utf8_unicode_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE articles (
    id  int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    content TEXT NOT NULL,
    date DATETIME NOT NULL,
    category_id int(10) unsigned NOT NULL,
    rating DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    article_ip varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
    FOREIGN KEY (category_id) REFERENCES categories(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE comments (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    date DATETIME NOT NULL,
    article_id int(10) unsigned NOT NULL,
    FOREIGN KEY (article_id) REFERENCES articles(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE ratings (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article_id int(10) unsigned NOT NULL,
    rating DECIMAL(1.1) NOT NULL,
    ip varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
    FOREIGN KEY (article_id) REFERENCES articles(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO categories (id, name) VALUES 
(1, 'Політика'),
(2, 'Економіка'),
(3, 'Sport'),
(4, 'Культура');

INSERT INTO articles (id, title, content, date, category_id) VALUES
(1, 'Новий закон про вибори', 'У Верховній Раді зареєстрували новий законопроект про вибори', '2023-05-08 10:00:00', 1),
(2, 'Курс долара зрос', 'Курс долара зріс до 30 гривень за долар', '2023-05-08 12:00:00', 2),
(3, 'Команда "Динамо" перемогла', 'У матчі з "Шахтарем" команда "Динамо" забила переможний гол', '2023-05-08 15:00:00', 3),
(4, 'Виставка сучасного мистецтва', 'На виставці представлені роботи провідних сучасних художників', '2023-05-08 18:00:00', 4);

INSERT INTO comments (id, content, date, article_id) VALUES 
(1, 'Дуже цікава стаття', '2023-05-08 10:30:00', 1),
(2, 'Дійсно важливо', '2023-05-08 12:30:00', 1),
(3, 'Неймовірно!', '2023-05-08 15:30:00', 3),
(4, 'Талановиті художники', '2023-05-08 18:30:00', 4);

INSERT INTO ratings (id, article_id, rating, ip) VALUES 
(1, 1, 4.7, '192.168.1.1'),
(2, 1, 5.1, '192.168.1.2'),
(3, 2, 3.2, '192.168.1.1'),
(4,3, 5.9, '192.168.1.3');

SELECT * FROM categories;
SELECT * FROM articles;
SELECT * FROM comments;
SELECT * FROM ratings;