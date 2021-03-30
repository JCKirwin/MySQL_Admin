DELIMITER //
DROP PROCEDURE IF EXISTS db_cursor//
CREATE PROCEDURE db_cursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE output VARCHAR(15000);
    DECLARE db_name VARCHAR(255);
    DECLARE appDBs CURSOR FOR SELECT DISTINCT t.table_schema 
                              FROM information_schema.`COLUMNS` c
                              INNER JOIN information_schema.tables t ON t.table_schema = c.table_schema AND c.table_name= t.table_name
                              WHERE t.table_type = 'BASE TABLE'
                              AND c.TABLE_NAME = 'company'
                              AND c.`COLUMN_NAME` = 'company'
                              ORDER BY t.table_schema;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    SET output = "";
    OPEN appDBs;
    REPEAT
        FETCH appDBs INTO db_name;
        IF NOT done THEN
            SET output = CONCAT(output, ' UNION ALL SELECT company, id AS ''company_id'',SUBSTRING_INDEX(USER(), ''@'', -1) AS ''ip_address'',  ''', db_name, ''' AS ''db'', @@hostname AS ''hostname'', @@port AS ''port'' FROM ', db_name, '.company' );    
        END IF;
    UNTIL done END REPEAT;
    CLOSE appDBs;
    SET output = SUBSTR(CONCAT(output, ' order by db, length(company_id) desc, company_id desc'), 11);
    -- SELECT output AS procs;
    PREPARE stmt FROM output;
    EXECUTE stmt;  
END//
DELIMITER ;
CALL db_cursor();
DROP PROCEDURE db_cursor;

 