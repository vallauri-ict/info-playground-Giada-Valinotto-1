CREATE TABLE [dbo].[Driver] (
    [number]         INT           NOT NULL IDENTITY,
    [full_name]      VARCHAR (100) NULL,
    [country]        CHAR (2)      NOT NULL,
    [date_birth]     DATE          NULL,
    [team_id]        INT           NULL,
    [podiums_number] INT           NULL,
    PRIMARY KEY CLUSTERED ([number] ASC)
);

GO

CREATE TRIGGER [dbo].[Trigger_Delete]
    ON [dbo].[Driver]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON

		DECLARE @currDate DATETIME 
		SET @currDate = CURRENT_TIMESTAMP

		INSERT INTO StoricoCancellazioni(number, full_name, country, date_birth, team_id, podiums_number, data)
		SELECT d.number, d.full_name, d.country, d.date_birth, d.team_id, d.podiums_number, @currDate
		FROM deleted d
    END
GO

CREATE TRIGGER [dbo].[Trigger_Update]
    ON [dbo].[Driver]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON

		DECLARE @currDate DATETIME 
		SET @currDate = CURRENT_TIMESTAMP

		INSERT INTO StoricoAggiornamenti(
		number, full_name, country, date_birth, team_id, podiums_number, numberNew, full_nameNew, countryNew, date_birthNew, team_idNew, podiums_numberNew, data)
		SELECT d.*, i.*, @currDate /* CURRENT_TIMESTAMP da aggiungere in coda alla modifica */
		FROM deleted d, inserted i
		WHERE d.number = i.number;
    END