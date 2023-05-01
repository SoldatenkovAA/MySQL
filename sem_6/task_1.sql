/*1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds' */
DROP FUNCTION IF EXISTS get_time;
delimiter //
CREATE FUNCTION get_time (seconds int)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
DECLARE days int default 0;
DECLARE hours int defDECLARE
DECLARE minutes int default 0;
DECLARE answer VARCHAR(255) default '';

SET days = seconds div 86400;
SET answer = concat (answer, days, '', 'days, ');
SET seconds = seconds - (days * 86400);
SET hours = seconds div 3600;
SET answer = concat(answer, hours, '', 'hours, ');
SET seconds = seconds - (hours * 3600);
SET minutes = seconds div 60;
SET answer = concat(answer, minutes, '', 'minutes, ');
SET seconds = seconds - (minutes * 60);
SET answer = concat(answer, seconds, '', 'seconds');
RETURN answer;
END//
SELECT get_time(123456);
