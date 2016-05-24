-- Let's do this one more time. This time, with everything,
-- Including the private key.
DROP CERTIFICATE TDECert;
GO 

-- Restoring the certificate, but without the private key.
CREATE CERTIFICATE TDECert
  FROM FILE = 'C:\SQLBackups\TDECert.cer'
  WITH PRIVATE KEY ( 
    FILE = N'C:\SQLBackups\TDECert_key.pvk',
 DECRYPTION BY PASSWORD = 'APrivateKeyP4ssw0rd!'
  );
GO

-- We have the correct certificate and we've also restored the 
-- private key. Now everything should work. Finally!
RESTORE DATABASE [RecoveryWithTDE]
  FROM DISK = N'C:\SQLBackups\RecoveryWithTDE_Full.bak'
  WITH MOVE 'RecoveryWithTDE' TO N'C:\SQLData\RecoveryWithTDE_2ndServer.mdf',
       MOVE 'RecoveryWithTDE_log' TO N'C:\SQLData\RecoveryWithTDE_2ndServer_log.mdf';
GO