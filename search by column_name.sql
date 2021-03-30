SELECT `table_schema`,`table_name`,`column_name` FROM `information_schema`.`columns` WHERE `table_schema` = 'daily_ecash' AND `column_name`LIKE '%vehicle%' ;
SELECT `table_schema`,`table_name`,`column_name` FROM `information_schema`.`columns` WHERE `table_schema` = 'daily_ecash' AND `table_name`LIKE '%property%' ;    
