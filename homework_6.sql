
DELIMITER $$
CREATE PROCEDURE `format_date`(
	IN in_seconds INT
    )
begin
			DECLARE i INT DEFAULT in_seconds;
			DECLARE	days INT DEFAULT 0;
			DECLARE hours INT DEFAULT 0;
			DECLARE minutes INT DEFAULT 0;
			DECLARE seconds INT DEFAULT 0;
            DECLARE res_str VARCHAR(100) DEFAULT '';
			IF(i>0) THEN
					SET days = i DIV 86400;
					SET res_str = CONCAT(days, ' ', 'days', ' ');  
					SET i = i - days*86400;
					SET hours = i DIV 3600;
                    SET res_str = CONCAT(res_str, hours, ' ', 'hours', ' ');
					SET i = i - hours*3600;
					SET minutes = i DIV 60;
                    SET res_str = CONCAT(res_str, minutes, ' ', 'minutes', ' ');
					SET i = i - minutes*60;
                    SET res_str = CONCAT(res_str, i, ' ', 'seconds');
				
					SELECT res_str;
			ELSE
				SELECT 'wrong data';
			END IF;
end $$
DELIMITER ;





DELIMITER $$
CREATE FUNCTION `even_nums_row`(num INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 2;
DECLARE result VARCHAR(100) DEFAULT '';
WHILE i <= num DO
SET result = CONCAT(result, i, ' ');
SET i=i+2;
END WHILE;


RETURN result;
END $$
DELIMITER ;

CALL format_date(123456);
SELECT even_nums_row(10);