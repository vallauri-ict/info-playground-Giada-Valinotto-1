CREATE PROCEDURE [dbo].[Bonifico]
@importo float = 0,
@contoSorgente int,
@contoDestinazione int
AS
if(@contoDestinazione=@contoSorgente)
return -2;
BEGIN TRANSACTION
INSERT INTO Movimenti(Importo,Data,Tipo,CodiceConto)
VALUES(@importo,GETDATE(),'P',@contoSorgente)
if(@@ERROR<>0)
BEGIN
ROLLBACK
RAISERROR('Errore durante il prelievo',16,1)
return -1;
END
INSERT INTO Movimenti(Importo,Data,Tipo,CodiceConto)
VALUES(@importo,GETDATE(),'V',@contoDestinazione)
if(@@ERROR<>0)
BEGIN
ROLLBACK
RAISERROR('Errore durante il versamento',16,2)
return -1;
END
-- A questo punto, tutti i comandi sono stati eseguiti correttamente
COMMIT
RETURN 0