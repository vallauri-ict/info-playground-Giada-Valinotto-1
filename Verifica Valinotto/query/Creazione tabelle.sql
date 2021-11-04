CREATE TABLE Attore(
CodAttore INT IDENTITY PRIMARY KEY,
Nome VARCHAR(16) NOT NULL,
AnnoNascita INT,
Nazionalita VARCHAR(20)
)

CREATE TABLE Film
(
	CodFilm INT NOT NULL PRIMARY KEY IDENTITY,
	Titolo VARCHAR(30) NULL,
	AnnoProduzione INT NULL,
	Nazionalita VARCHAR(50) NULL,
	Regista VARCHAR(50) NULL,
	Genere VARCHAR(20) NULL,
	Durata INT NULL
)

CREATE TABLE Recita
(
	CodAttore INT NOT NULL,
	CodFilm INT NOT NULL,
	PRIMARY KEY([CodAttore],[CodFilm]),
	CONSTRAINT [FK_Recita_ToTable] FOREIGN KEY ([CodAttore]) REFERENCES [Attore]([CodAttore]),
	CONSTRAINT [FK_Recita_ToTable_1] FOREIGN KEY ([CodFilm]) REFERENCES [Film]([CodFilm]),
)

CREATE TABLE Proiezione
(
	CodProiezione INT IDENTITY PRIMARY KEY,
	CodSala INT NOT NULL,
	CodFilm INT NOT NULL,
	DataProiezione DATETIME NULL, 
	Incasso DECIMAL(12,2),
	CONSTRAINT [FK_Proiezione_ToTable] FOREIGN KEY ([CodAttore]) REFERENCES [Attore]([CodAttore]),
	CONSTRAINT [FK_Proiezione_ToTable_1] FOREIGN KEY ([CodFilm]) REFERENCES [Film]([CodFilm]),
)

CREATE TABLE Sala
(
	CodSala INT NOT NULL IDENTITY PRIMARY KEY, 
    Posti INT NOT NULL, 
    Nome VARCHAR(15) NOT NULL, 
    Citta VARCHAR(15) NULL, 
)