DECLARE @DatabaseName NVARCHAR(128) = 'ExchangeRate';
DECLARE @BackupType NVARCHAR(50) = 'Diferential'; -- ou 'Diferencial', 'Log'
DECLARE @BackupPath NVARCHAR(256);
DECLARE @BackupFileName NVARCHAR(256);
DECLARE @DateTimeString NVARCHAR(50);

-- Formatar a data no formato anomesdiahoraminutosegundo (AAAAMMDDHHMMSS)
SET @DateTimeString = FORMAT(GETDATE(), 'yyyyMMdd_HHmmss');

-- Montar o nome do arquivo
SET @BackupFileName = @DatabaseName + '_' + @BackupType + '_' + @DateTimeString + '.bak';

-- Definir o caminho do backup (ajuste conforme necessário)
SET @BackupPath = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXCHANGERATE\MSSQL\Backup\Database\' + @BackupFileName;

-- Executar o backup
BACKUP DATABASE @DatabaseName
TO DISK = @BackupPath
WITH DIFFERENTIAL, STATS = 10; -- Opcional: compressão para reduzir tamanho

PRINT 'Backup criado com sucesso em: ' + @BackupPath;