CREATE TABLE [dbo].[Auto]
(
	[targa] VARCHAR(50) NOT NULL PRIMARY KEY, 
    [cilindrata] INT NOT NULL, 
    [prezzo] NUMERIC(8, 2) NOT NULL, 
    [modello] VARCHAR(50) NOT NULL, 
    [colore] VARCHAR(50) NOT NULL, 
    [marca] VARCHAR(50) NOT NULL, 
    [alimentazione] VARCHAR(50) NOT NULL
)

GO

CREATE TRIGGER [dbo].[NuovaAuto]
    ON [dbo].[Auto]
    INSTEAD OF INSERT
    AS
    BEGIN
        --SET NoCount ON
		DECLARE @targa as VARCHAR(50)
		DECLARE @cilindrata as INT
		DECLARE @prezzo as Numeric(8,2)
		DECLARE @modello as VARCHAR(50)
		DECLARE @colore as VARCHAR(50)
		DECLARE @marca as VARCHAR(50)
		DECLARE @alimentazione as VARCHAR(50)

		SET  @targa = (SELECT targa from inserted)
		SET  @cilindrata = (SELECT cilindrata from inserted)
		SET  @prezzo = (SELECT prezzo from inserted)
		SET  @modello = (SELECT modello from inserted)
		SET  @colore = (SELECT colore from inserted)
		SET  @marca = (SELECT marca from inserted)
		SET  @alimentazione = (SELECT alimentazione from inserted)

		if(@cilindrata<900)
			set @cilindrata = 900

		if(@cilindrata>4800)
			set @cilindrata=4800

		INSERT INTO Auto VALUES(@targa,@cilindrata,@prezzo,@modello,@colore,@marca,@alimentazione)
    END
GO

CREATE TRIGGER [dbo].[Trigger_Auto]
    ON [dbo].[Auto]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON
    END