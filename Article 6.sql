-- Let's drop the certificate and do the restore of it...
-- But without the private key
DROP CERTIFICATE TDECert;
GO 

-- Restoring the certificate, but without the private key.
CREATE CERTIFICATE TDECert
  FROM FILE = 'C:\SQLBackups\TDECert.cer'
GO

-- We have the correct certificate, but not the private key.
-- This should fail as well.
RESTORE DATABASE [RecoveryWithTDE]
  FROM DISK = N'C:\SQLBackups\RecoveryWithTDE_Full.bak'
  WITH MOVE 'RecoveryWithTDE' TO N'C:\SQLData\RecoveryWithTDE_2ndServer.mdf',
       MOVE 'RecoveryWithTDE_log' TO N'C:\SQLData\RecoveryWithTDE_2ndServer_log.mdf';
GO