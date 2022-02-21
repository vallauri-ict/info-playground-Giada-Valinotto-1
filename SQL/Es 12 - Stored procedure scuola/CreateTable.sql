CREATE TABLE [dbo].[Studenti] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Nome]        VARCHAR (30) NOT NULL,
    [Cognome]     VARCHAR (30) NOT NULL,
    [Eta] INT         NOT NULL,
    [Telefono]    VARCHAR (20) NOT NULL,
    [Classe]      VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);