use sem_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127),
    (3, "Skoda", 9000),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов   
CREATE VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 25000
);

SELECT *
FROM cars_view;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT *
FROM cars_view;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW cars_view2 AS
(
	SELECT *
    FROM cars
    WHERE name IN ("Skoda", "Audi")
);

SELECT *
FROM cars_view2;

-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
CREATE VIEW analysis_orders AS SELECT * 
FROM Analysis
JOIN Orders ON Analysis.an_id=Orders.ord_an;

SELECT an_name, an_price, ord_datetime 
FROM analysis_orders
WHERE ord_datetime BETWEEN '2020-02-05' AND DATE_ADD('2020-02-05', INTERVAL 1 week);
