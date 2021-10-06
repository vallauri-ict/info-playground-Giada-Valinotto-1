/*** CREAZIONE TABELLE ***/

/*CREATE TABLE Proprietari(
CodF int NOT NULL PRIMARY KEY,
Nome VARCHAR(20),
Residenza VARCHAR(40)
)

CREATE TABLE Assicurazioni(
CodAss int NOT NULL PRIMARY KEY,
Nome VARCHAR(20),
Sede VARCHAR(40)
)

CREATE TABLE Auto(
Targa VARCHAR(7) PRIMARY KEY NOT NULL,
Marca VARCHAR(20),
Cilindrata int,
Potenza int,
CodF int,
CodAss int,
FOREIGN KEY(CodF) REFERENCES Proprietari(CodF),
FOREIGN KEY(codAss) REFERENCES Assicurazioni(codAss)
)

CREATE TABLE Sinistro(
CodS int PRIMARY KEY NOT NULL,
Località VARCHAR(40),
Data date
)

CREATE TABLE AutoCoinvolte(
CodS int PRIMARY KEY NOT NULL,
Targa VARCHAR(7) NOT NULL,
ImportoDelDanno int,
FOREIGN KEY(CodS) REFERENCES Sinistro(codS),
FOREIGN KEY(Targa) REFERENCES Auto(Targa)
)*/

/*** QUERY ***/ 

/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Auto a
WHERE a.Cilindrata > 2000 AND a.Potenza>120;

/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Auto a
WHERE a.Cilindrata > 2000 OR a.Potenza > 120 ;
