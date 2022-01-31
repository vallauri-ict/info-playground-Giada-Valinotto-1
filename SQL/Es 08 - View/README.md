# ES 08 - VIEW

### Finalità dell'esercizio
L'esercizio si prepone l'obiettivo di introdurre all'uso del comando [SQL](https://docs.microsoft.com/it-it/sql/?view=sql-server-ver15) [VIEW](https://docs.microsoft.com/it-it/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver15).

### Struttura dell'esercizio
la svolgimento dell'esercizio si appoggia sul database MUSEI, composto dalle seguenti tabelle:
- Musei
```SQL
CREATE TABLE Musei(
NomeM VARCHAR(30) NOT NULL PRIMARY KEY,
Città VARCHAR(30)
)
```
- Artisti
```SQL
CREATE TABLE Artisti(
NomeA VARCHAR(30) NOT NULL PRIMARY KEY,
Nazionalità VARCHAR(3)
)
```
- Opere 
```SQL
CREATE TABLE Opere(
Codice INT NOT NULL PRIMARY KEY,
Titolo VARCHAR(30),
NomeM  VARCHAR(30) NOT NULL,
NomeA  VARCHAR(30) NOT NULL,
CONSTRAINT [FK_Opere_ToTable] FOREIGN KEY ([NomeM]) REFERENCES [Musei]([NomeM]),
CONSTRAINT [FK_Opere_ToTable_1] FOREIGN KEY ([NomeA]) REFERENCES [Artisti]([NomeA])
)
)
```
- Personaggi
```SQL
CREATE TABLE Personaggi(
Personaggio VARCHAR(30) NOT NULL PRIMARY KEY,
Codice INT NOT NULL,
CONSTRAINT [FK_Personaggi_ToTable] FOREIGN KEY (Codice) REFERENCES [Opere]([Codice])
)
)
```

### Reaizzazione dell'esercizo
Una vista è stat realizzata con il seguente codice:
```SQL
CREATE VIEW Vista1 AS
SELECT m.NomeMuseo,m.Citta,o.Titolo
FROM Opere o, Musei m
WHERE m.NomeMuseo = o.NomeMuseo

SELECT *
FROM Vista1
```

_Ultima modifica: 31/01/2022_

_Stud. Giada Valinotto, 5B Informatica 20201/2022_
