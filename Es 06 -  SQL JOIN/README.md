# ES 06 - Istruzione di JOIN

Esercizio svolto in classe volto alla comprensione dell'operatore JOIN.
- Nazioni
```SQL
CREATE TABLE [dbo].[Nazioni] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [Nome]          VARCHAR (50) NOT NULL,
    [codContinente] INT          NOT NULL,
    CONSTRAINT [FK_Nazioni_ToTable] FOREIGN KEY ([codContinente]) REFERENCES [dbo].[Continenti] ([Id])
);
```
- Continenti
```SQL
CREATE TABLE [dbo].[Continenti] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Nome] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
```
Sulla base di queste dua tabelle, sono state realizzate le query che consentono di ottenere diversi tipi di cogiunzione tra di esse.
```SQL
SELECT *
FROM Continenti c, Nazioni n
WHERE c.Id = n.codContinente

SELECT *
FROM Continenti c INNER JOIN Nazioni n ON c.Id = n.codContinente

SELECT *
FROM Continenti c LEFT JOIN Nazioni n ON c.Id = n.codContinente
```

_stud. Valinotto Giada, 5B INF 2021/2022_
