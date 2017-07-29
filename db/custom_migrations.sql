sqlite> ATTACH DATABASE 'test2.db' AS test2;
sqlite> ATTACH DATABASE 'development.sqlite3' AS development;
INSERT INTO development.animals(sci_name, created_at, updated_at) SELECT 7,'2017-06-29','2017-06-29' FROM test2.test2;
