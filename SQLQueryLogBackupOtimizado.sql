DECLARE @DatabaseName NVARCHAR(128) = 'ExchangeRate';
DECLARE @BackupPath NVARCHAR(256) = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXCHANGERATE\MSSQL\Backup\Log\'; -- Pasta específica para logs
DECLARE @BackupFileName NVARCHAR(256);
DECLARE @DateTimeString NVARCHAR(50) = FORMAT(GETDATE(), 'yyyyMMdd_HHmmss');

SET @BackupFileName = @DatabaseName + '_Log_' + @DateTimeString + '.trn';
SET @BackupPath = @BackupPath + @BackupFileName;

BACKUP LOG @DatabaseName
TO DISK = @BackupPath
WITH COMPRESSION, STATS = 5;

PRINT 'Backup de log criado em: ' + @BackupPath;