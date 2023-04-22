CREATE DATABASE seminar_3; 
USE seminar_3;
/*создание таблицы 1 - продавцы (salespeople)*/
CREATE TABLE salespeople
(
snum INT NOT NULL,
sname VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL, 
comm DOUBLE 
);
INSERT salespeople(snum, sname, city, comm)
VALUES
(1001, "Peel", "London", .12),
(1002, "Serres", "San Jose", .13),
(1004, "Motika", "London", .11),
(1007, "Rifkin", "Barcelona", .15),
(1003, "Axelrod", "New York", .10);

SELECT * FROM sem3.salespeople; /*вывод таблицы*/

/*создание таблицы 2 - заказчики (customers)*/
CREATE TABLE customers
(
cnum INT NOT NULL,
cname VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL, 
rating INT NOT NULL,
snum INT NOT NULL
);
INSERT customers(cnum, cname, city, rating, snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "San Jose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "San Jose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

SELECT * FROM sem3.customers; /*вывод таблицы*/

/*создание таблицы 3 - заказы (orders)*/
CREATE TABLE orders
(
onum INT NOT NULL,
amt DOUBLE NOT NULL,
odate DATE NOT NULL, 
cnum INT NOT NULL,
snum INT NOT NULL
);
INSERT orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, "1990-10-03", 2008, 1007),
(3003, 767.19, "1990-10-03", 2001, 1001),
(3002, 1900.10, "1990-10-03", 2007, 1004),
(3005, 5160.45, "1990-10-03", 2003, 1002),
(3006, 1098.16, "1990-10-03", 2008, 1007),			
(3009, 1713.23, "1990-10-04", 2002, 1003),
(3007, 75.75, "1990-10-04", 2004, 1002),
(3008, 4723.00, "1990-10-05", 2006, 1001),
(3010, 1309.95, "1990-10-06", 2004, 1002),
(3011, 9891.88, "1990-10-06", 2006, 1001);
																																																																																																																																		
SELECT * FROM sem3.orders; /*вывод таблицы*/

/* Задание 1.1
SELECT city, sname, snum, comm FROM sem3.salespeople;
*/
/* Задание 1.2
SELECT rating, cname FROM customers;
*/
/* Задание 1.3
SELECT DISTINCT snum FROM salespeople;
*/
/* Задание 1.4
SELECT * FROM customers WHERE cname LIKE 'G%';
*/
/* Задание 1.5
SELECT * FROM orders HAVING amt > 1000;
*/
/* Задание 1.6
SELECT MIN(amt) AS min_order FROM orders;
*/
/* Задание 1.7
SELECT * FROM customers 
WHERE NOT city = "Rome"
HAVING rating > 100;
*/

/*создание таблицы 4 - task2*/
CREATE TABLE task2
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nam VARCHAR(20) NOT NULL,
surname VARCHAR(20) NOT NULL,
speciality VARCHAR(20) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

INSERT task2(nam, surname, speciality, seniority, salary, age)
VALUES
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петкин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),			
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 2004, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);
/* вывод таблицы																																																																																																																														
SELECT * FROM sem3.task2; 
*/ 
/*Задание 2.1
SELECT * FROM task2
ORDER BY salary DESC;

SELECT * FROM task2
ORDER BY salary;
*/
/* Задание 2.2
SELECT * FROM task2
ORDER BY salary LIMIT 7, 5;
*/
/* Задание 2.3
SELECT speciality, salary FROM task2
GROUP BY speciality
HAVING salary >= 100000;
*/
