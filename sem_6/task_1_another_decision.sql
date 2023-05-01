/*1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'*/
DROP PROCEDURE IF EXISTS format_date;
DELIMITER //
CREATE PROCEDURE format_date
(
	IN num INT,
    OUT format_date_text VARCHAR(100)
)

BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
		
    SET format_date_text = "";     
    
    If num > 0 THEN
		SET days = FLOOR(num / (24 * 60 * 60));
        SET num = num - days * 24 * 60 * 60;
	END IF;
    
    If num > 0 THEN
		SET hours = FLOOR(num / (60 * 60));
        SET num = num - hours * 60 * 60;
    END IF;    
    
    If num > 0 THEN
		SET minutes = FLOOR(num / 60);
        SET num = num - minutes * 60;
	END IF;
     
	If num > 0 THEN 
		SET seconds = num;
	END IF;
    
    IF days > 0 THEN
		SET format_date_text = concat(format_date_text, concat(days, " days"), " ");
	END IF;
    
    IF hours > 0 THEN
		SET format_date_text = concat(format_date_text, concat(hours, " hours"), " ");
	END IF;
    
    IF minutes > 0 THEN
		SET format_date_text = concat(format_date_text, concat(minutes, " minutes"), " ");
	END IF;
    
    IF seconds > 0 THEN
		SET format_date_text = concat(format_date_text, concat(seconds, " seconds"), " ");
	END IF;
    
END//

CALL format_date(123456, @res);
SELECT @res;
