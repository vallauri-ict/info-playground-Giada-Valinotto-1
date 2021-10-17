SELECT Auto.Targa, Auto.Marca
FROM Auto
WHERE Auto.Cilindrata>2000 OR Auto.Potenza>120;

SELECT Proprietari.Nome, Auto.Targa
FROM Proprietari, Auto
WHERE Proprietari.CodF=Auto.CodF AND (Auto.Cilindrata>2000 OR Auto.Potenza>120);

SELECT  Proprietari.Nome, Auto.Targa
FROM Proprietari, Auto, ASSICURAZIONI
WHERE Proprietari.CodF=Auto.CodF AND (Auto.Cilindrata>2000 OR Auto.Potenza>120) AND Auto.CodAss=ASSICURAZIONI.CodAss AND ASSICURAZIONI.Nome="Sara";

SELECT  Proprietari.Nome, Auto.Targa
FROM Proprietari, Auto, ASSICURAZIONI, Sinistro, AutoCoinvolte
WHERE Proprietari.CodF= Auto.CodF AND Auto.CodAss = ASSICURAZIONI.CodAss AND ASSICURAZIONI.Nome="Sara" AND AutoCoinvolte.Targa=Auto.Targa AND Sinistro.CodS = AutoCoinvolte.codS AND Sinistro.Data = 20/01/01;

SELECT ASSICURAZIONI.Nome, ASSICURAZIONI.Sede, COUNT(*) as numAuto
FROM ASSICURAZIONI, Auto
WHERE Auto.CodAss=ASSICURAZIONI.CodAss
GROUP BY ASSICURAZIONI.CodAss;

SELECT Auto.Targa, COUNT(*) as numSin
FROM Auto, Sinistro, AutoCoinvolte
WHERE Auto.Targa = AutoCoinvolte.Targa AND AutoCoinvolte.CodS=Sinistro.CodS AND Auto.Marca="Fiat"
GROUP BY Auto.Targa