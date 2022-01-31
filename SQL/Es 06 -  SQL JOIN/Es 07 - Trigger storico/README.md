# ES 07 - TRIGGER STORICO

### Finalità dell'esercizio
L'esercizio realizzato si prepone come scopo quello di realizzare due [Trigger](https://docs.microsoft.com/it-it/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver15) che permettano la storicizzazione dei dati cancellati e di quelli aggiornati nel database.

### Struttura dell'esercizio
Per la realizzazione dell'esercizio, occorre servirsi del database contenente i dati relativi ad una serie di piloti.

Il database è composto delle seguenti tabelle:
- Driver
```SQL
CREATE TABLE [dbo].[Driver] (
    [number]         INT           NOT NULL,
    [full_name]      VARCHAR (100) NULL,
    [country]        CHAR (2)      NOT NULL,
    [date_birth]     DATE          NULL,
    [team_id]        INT           NULL,
    [podiums_number] INT           NULL,
    PRIMARY KEY CLUSTERED ([number] ASC)
);
```
- Storico aggiornamenti
```SQL
CREATE TABLE [dbo].[StoricoAggiornamenti] (
    [id]                INT           IDENTITY (1, 1) NOT NULL,
    [number]            INT           NOT NULL,
    [full_name]         VARCHAR (100) NULL,
    [country]           CHAR (2)      NOT NULL,
    [date_birth]        DATE          NULL,
    [team_id]           INT           NULL,
    [podiums_number]    INT           NULL,
    [numberNew]         INT           NOT NULL,
    [full_nameNew]      VARCHAR (100) NULL,
    [countryNew]        CHAR (2)      NOT NULL,
    [date_birthNew]     DATE          NULL,
    [team_idNew]        INT           NULL,
    [podiums_numberNew] INT           NULL,
    [data]              DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);
```
- Storico cancellazioni
```SQL
CREATE TABLE [dbo].[StoricoCancellazioni] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [number]         INT           NOT NULL,
    [full_name]      VARCHAR (100) NULL,
    [country]        CHAR (2)      NOT NULL,
    [date_birth]     DATE          NULL,
    [team_id]        INT           NULL,
    [podiums_number] INT           NULL,
    [data]           DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

```
### Realizzazione dell'esercizio
L'obiettivo dell'esercizio è stato perseguito con la realizzazione dei trigger necessari, attraverso il seguente codice:
```SQL
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
```

_Ultimo aggiornamento: 31/01/2022_

_Stud. Valinotto Giada, classe 5B Informatica 2021/2022_
