-- JMS Created: 03.15.2016 Edited: 03.15.2016
-- Desc: Sets up a server for first time TDE use
-- Create a master password and certificate
-- Backup/export certificate and private key to folder
-- Make note of the master password and password with certificate
-- Passwords used here are examples; CHANGE THEM
-- Passwords do not need to match
-- Certificate name "TDECert" is an example; CHANGE IT
-- Consider having different certifcate names per server
-- File location is an example
-- DO NOT store backups of keys and certificates on the server
-- Information used from: https://www.mssqltips.com/sqlservertip/3572/recovering-a-sql-server-tde-encrypted-database-successfully/

USE [master];
GO 

-- Create the database master key
-- to encrypt the certificate
CREATE MASTER KEY
  ENCRYPTION BY PASSWORD = 'FirstServerPassw0rd!';
GO 

-- Create the certificate we're going to use for TDE
CREATE CERTIFICATE TDECert
  WITH SUBJECT = 'TDE Cert for Test';
GO 

-- Back up the certificate and its private key
-- Remember the password!
BACKUP CERTIFICATE TDECert
  TO FILE = N'C:\SQLBackups\TDECert.cer'
  WITH PRIVATE KEY ( 
    FILE = N'C:\SQLBackups\TDECert_key.pvk',
 ENCRYPTION BY PASSWORD = 'APrivateKeyP4ssw0rd!'
  );
GO