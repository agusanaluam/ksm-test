CREATE DEFINER=`root`@`localhost` FUNCTION `min_date`(string_dates TEXT) RETURNS date
BEGIN
	DECLARE min_date DATE;
    DECLARE date_str VARCHAR(10);
    DECLARE done INT DEFAULT 0;
    DECLARE cur CHAR(1);
    DECLARE idx INT DEFAULT 1;
    DECLARE str_len INT;

    SET str_len = CHAR_LENGTH(string_dates);

    WHILE idx <= str_len AND NOT done DO
        SET cur = SUBSTRING(string_dates, idx, 1);
        IF cur = ',' OR idx = str_len THEN
            IF idx = str_len THEN
                SET date_str = SUBSTRING(string_dates, idx - 9, 10);
            ELSE
                SET date_str = SUBSTRING(string_dates, idx - 10, 10);
            END IF;

            IF min_date IS NULL OR STR_TO_DATE(date_str, '%Y-%m-%d') < min_date THEN
                SET min_date = STR_TO_DATE(date_str, '%Y-%m-%d');
            END IF;

            SET idx = idx + 12;
        ELSE
            SET idx = idx + 1;
        END IF;

        IF idx > str_len THEN
            SET done = 1;
        END IF;
    END WHILE;

    RETURN min_date;
END