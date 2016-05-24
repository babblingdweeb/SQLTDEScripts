-- Now backup the database so we can restore it
-- Onto a second server
BACKUP DATABASE [RecoveryWithTDE]
TO DISK = N'C:\SQLBackups\RecoveryWithTDE_Full.bak';
GO 