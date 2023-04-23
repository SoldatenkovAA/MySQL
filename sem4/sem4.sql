CREATE DATABASE sem4;

USE sem4;

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM AUTO;

/*Задание 1 - Вывести на экран количество машин каждого цвета для машин марок BMW и LADA */
SELECT mark, color, COUNT(color) AS 'quantity' FROM AUTO
WHERE mark = 'LADA'
GROUP BY color, mark 
UNION SELECT mark, color, COUNT(color) AS 'quantity' FROM AUTO
WHERE mark = 'BMW'
GROUP BY color, mark;

/*Задание 2 - Вывести на экран марку авто и количество AUTO не этой марки*/
SELECT a1.MARK, count(a2.REGNUM) as quantity_another_mark
FROM (
	SELECT DISTINCT MARK 
    FROM auto
    ) a1
LEFT JOIN auto a2
ON a1.MARK <> a2.MARK
GROUP BY a1.MARK;

/*задание 3
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице 
test_b, НЕ используя ключевого слова NOT.
*/
CREATE TABLE IF NOT EXISTS test_a(id INT, DATA VARCHAR(45));
CREATE TABLE IF NOT EXISTS test_b  (id INT);
INSERT INTO test_a(id, DATA) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
INSERT INTO test_b(id) VALUES
(10),
(30),
(50);

SELECT a.*
FROM test_a a
LEFT JOIN test_b b
ON a.id = b.id
WHERE b.id IS NUll;
