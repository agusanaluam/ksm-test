CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_kurs_pajak`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE _id INT;
    DECLARE _curr_id INT;
    DECLARE _kurs_rate DECIMAL;
    DECLARE cur_date DATE;
    DECLARE _start_date DATE;
    DECLARE _end_date DATE;
    DECLARE cur CURSOR FOR SELECT id, kurs_rate, start_date, end_date, curr_id FROM ksm_kurs_pajak;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
		@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
		ROLLBACK;
        SELECT concat('Error. Process rolled back. Kode : ', @p1, ' Message : ', @p2);
    END;

	START TRANSACTION;
    
    DROP TABLE IF EXISTS ksm_detail_kurs;
    CREATE TABLE ksm_detail_kurs (
        id_ksm_kurs_pajak INT,
        kurs_rate decimal(20,4),
        tgl DATE,
        curr_id INT,
        FOREIGN KEY (id_ksm_kurs_pajak) REFERENCES ksm_kurs_pajak(id)
    );
    

    OPEN cur;
	
    read_loop: LOOP
        FETCH cur INTO _id, _kurs_rate, _start_date, _end_date, _curr_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
		
        SET cur_date = _start_date;
        
        WHILE cur_date <= _end_date DO
            INSERT INTO ksm_detail_kurs (id_ksm_kurs_pajak, kurs_rate, tgl, curr_id) VALUES (_id, _kurs_rate, cur_date, _curr_id);
            SET cur_date = cur_date + INTERVAL 1 DAY;
        END WHILE;
    END LOOP;

    CLOSE cur;
    
    COMMIT;
END