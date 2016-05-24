-- JMS Created: 03.15.2016 Edited: 03.15.2016
-- Desc: Restore certificate and private key from folder
-- Password used here is an example; CHANGE to match private key password
-- Certificate name "TDECert" is an example; CHANGE to reflect certificate name
-- File location is an example; CHANGE to reflect location of files
-- Once complete, follow normal SQL restore process
-- Information used from: https://www.mssqltips.com/sqlservertip/3572/recovering-a-sql-server-tde-encrypted-database-successfully/


-- Restoring the certificate, but without the private key.
CREATE CERTIFICATE TDECert
  FROM FILE = 'C:\SQLBackups\TDECert.cer'
  WITH PRIVATE KEY ( 
    FILE = N'C:\SQLBackups\TDECert_key.pvk',
 DECRYPTION BY PASSWORD = 'APrivateKeyP4ssw0rd!'
  );
GO
