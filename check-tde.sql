-- JMS Created: 03.15.2016 Edited: 03.15.2016
-- Desc: Query to see which databases have TDE enabled
-- Information used from: https://www.mssqltips.com/sqlservertip/3572/recovering-a-sql-server-tde-encrypted-database-successfully/

-- TDE enabled DBs will show encryption_state = 3
SELECT DB_Name(database_id) AS 'Database', encryption_state 
FROM sys.dm_database_encryption_keys;