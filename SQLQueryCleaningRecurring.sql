USE [msdb]
GO

CREATE OR ALTER PROCEDURE [dbo].[sp_CleanupOldLogBackups]
    @DaysToKeep INT = 2
AS
BEGIN
    DECLARE @DeleteDate NVARCHAR(50) = FORMAT(DATEADD(DAY, -@DaysToKeep, GETDATE()), 'yyyyMMdd');
    
    EXEC xp_cmdshell 'forfiles -p "C:\Backups\Logs\" -s -m *.trn -d -2 -c "cmd /c del @file"';
    
    PRINT 'Backups de log antigos a ' + @DeleteDate + ' removidos.';
END
GO