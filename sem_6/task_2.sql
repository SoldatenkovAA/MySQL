/*2. Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)*/
DROP FUNCTION IF EXISTS get_nums;
DELIMITER //
CREATE FUNCTION get_nums()
RETURNS VARCHAR(50) DETERMINISTIC 
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE start_value INT DEFAULT 2;
	DECLARE stop_value INT DEFAULT 10;
    DECLARE n INT DEFAULT 0;
	SET n = IF(start_value % 2 = 0, start_value, start_value + 1);
	IF n <= stop_value THEN 
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, ",");
            END IF;
			SET result = CONCAT(result, n);
			SET n = n + 2;
			UNTIL n > stop_value
		END REPEAT;
	END IF;
	RETURN result;
END//

SELECT get_nums();
