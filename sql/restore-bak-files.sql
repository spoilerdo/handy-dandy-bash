RESTORE DATABASE DBNAME FROM DISK = '/var/opt/mssql/backup/BAKFILE.bak' WITH REPLACE,
	MOVE 'DBNAME' TO '/var/opt/mssql/data/BAKFILE.mdf',
	MOVE 'DBNAME_log' TO '/var/opt/mssql/data/BAKFILE.ldf';