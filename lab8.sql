SET NAMES utf8;
SET time_zone = '+00:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE users (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) COLLATE utf8_unicode_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE projects (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE project_users (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    project_id int(10) unsigned NOT NULL,
    user_id int(10) unsigned NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tasks (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    author_id int(10) unsigned NOT NULL,
    project_id int(10) unsigned NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE task_assignees (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    task_id int(10) unsigned NOT NULL,
    user_id int(10) unsigned NOT NULL,
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE files (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    path varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    project_id int(10) unsigned,
    task_id int(10) unsigned,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Вставка користувачів
INSERT INTO users (name) VALUES 
('John Doe'),
('Jane Smith');

-- Вставка проектів
INSERT INTO projects (name) VALUES 
('Project A'),
('Project B');

-- Вставка зв'язків між проектами і користувачами
INSERT INTO project_users (project_id, user_id) VALUES 
(1, 1),
(1, 2),
(2, 1);

-- Вставка завдань з вказанням автора та проекту
INSERT INTO tasks (name, author_id, project_id) VALUES 
('Task 1', 1, 1),
('Task 2', 1, 2);

-- Вставка виконавців для завдання
INSERT INTO task_assignees (task_id, user_id) VALUES 
(1, 1),
(1, 2);

-- Вставка файлу для проекту
INSERT INTO files (name, path, project_id) VALUES 
('Project File', '/path/to/file', 1);

-- Вставка файлу для завдання
INSERT INTO files (name, path, task_id) VALUES 
('Task File', '/path/to/file', 1);

-- Отримання всіх завдань для конкретного проекту з вказанням авторів та виконавців
SELECT t.id AS task_id, t.name AS task_name, u1.name AS task_author, GROUP_CONCAT(u2.name) AS task_assignees
FROM tasks t
JOIN users u1 ON t.author_id = u1.id
LEFT JOIN task_assignees ta ON t.id = ta.task_id
LEFT JOIN users u2 ON ta.user_id = u2.id
WHERE t.project_id = 1
GROUP BY t.id, t.name, task_author;

-- Отримання всіх файлів для конкретного проекту
SELECT * FROM files WHERE project_id = 1;

-- Отримання всіх файлів для конкретного завдання
SELECT * FROM files WHERE task_id = 1;
