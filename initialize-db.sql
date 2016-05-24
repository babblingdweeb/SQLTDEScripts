-- JMS Created: 03.15.2016 Edited: 03.15.2016
-- Desc: Sets initial encryption on a databse
-- 
-- Select which database to use, create a key for that DB
-- Turn TDE on for that database
-- Information used from: https://www.mssqltips.com/sqlservertip/3572/recovering-a-sql-server-tde-encrypted-database-successfully/


-- Create the DEK so we can turn on encryption
-- CHANGE DB NAME
USE [RecoveryWithTDE];
GO 

-- CHANGE CERTIFICATE NAME
CREATE DATABASE ENCRYPTION KEY
  WITH ALGORITHM = AES_256
  ENCRYPTION BY SERVER CERTIFICATE TDECert;
GO 

-- Exit out of the database. If we have an active 
-- connection, encryption won't complete.
USE [master];
GO 

-- Turn on TDE
-- CHANGE DB NAME
ALTER DATABASE [RecoveryWithTDE]
  SET ENCRYPTION ON;
GO 