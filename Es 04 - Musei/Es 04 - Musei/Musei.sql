/****		Creazione delle tabelle		****
/*MUSEI*/
CREATE TABLE Musei(
NomeM VARCHAR(30) NOT NULL PRIMARY KEY,
Città VARCHAR(30)
)
/*ARTISTI*/
CREATE TABLE Artisti(
NomeA VARCHAR(30) NOT NULL PRIMARY KEY,
Nazionalità VARCHAR(3)
)
/*OPERE*/
CREATE TABLE Opere(
Codice INT NOT NULL PRIMARY KEY,
Titolo VARCHAR(30),
NomeM  VARCHAR(30) NOT NULL,
NomeA  VARCHAR(30) NOT NULL,
CONSTRAINT [FK_Opere_ToTable] FOREIGN KEY ([NomeM]) REFERENCES [Musei]([NomeM]),
CONSTRAINT [FK_Opere_ToTable_1] FOREIGN KEY ([NomeA]) REFERENCES [Artisti]([NomeA])
)
/*PERSONAGGI*/
CREATE TABLE Personaggi(
Personaggio VARCHAR(30) NOT NULL PRIMARY KEY,
Codice INT NOT NULL,
CONSTRAINT [FK_Personaggi_ToTable] FOREIGN KEY (Codice) REFERENCES [Opere]([Codice])
)

/****		Inserimento dei dati		****/

/*MUSEI*/
INSERT INTO Musei VALUES
('National Gallery', 'Londra'),
('Museo egizio', 'Torino'),
('Galleria degli Uffizi', 'Firenze')


/*ARTISTI*/
INSERT INTO Artisti VALUES
('Tiziano', 'IT'),
('Caravaggio', 'IT'),
('Van Gogh', 'NL')


INSERT INTO Opere VALUES
(1, 'Festa degli Amorini', 'Galleria degli Uffizi', 'Tiziano'),
(2, 'Narciso', 'National Gallery','Caravaggio'),
(3, 'Notte stellata', 'Museo egizio','Van Gogh')

INSERT INTO Personaggi VALUES
('Venere',1),
('Narciso',2),
('Kha',4)

*/


/*QUERY*/
