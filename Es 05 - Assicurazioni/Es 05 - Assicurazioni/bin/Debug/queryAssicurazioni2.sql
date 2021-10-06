/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Auto a
WHERE a.Cilindrata > 2000 AND a.Potenza>120;

/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Auto a
WHERE a.Cilindrata > 2000 OR a.Potenza > 120 ;

/*targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore
a 120 CV, assicurate presso la “SARA” */
SELECT a.Targa, p.Nome
FROM Auto a, Proprietari p, Assicurazioni ass
WHERE a.Cilindrata > 2000 OR a.Potenza>120 AND ass.CodAss= a.CodAss AND ass.Nome='Sara';

/*Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02*/
/*SELECT a.Targa, p.Nome, s.Data
FROM Auto a, Proprietari p, Assicurazioni ass, Sinistro s
WHERE a.CodF= p.CodF AND a.CodAss= ass.CodAss AND ass.CodAss='Sara' AND s.Data= 20/01/2002;*/

/*Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate*/
SELECT ass.Nome, ass.Sede, count(*) as NumAuto
FROM Assicurazioni ass, Auto a
WHERE a.CodAss = ass.CodAss
GROUP BY ass.CodAss, ass.Nome, ass.Sede
/*Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta*/
SELECT a.Targa, count(*) as NumSin
FROM Auto a, AutoCoinvolte ac
WHERE a.Marca='Fiat' and a.Targa=ac.Targa
GROUP BY a.Targa

/*Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’ Assicurazion ed il
 totale dei danni riportati*/
SELECT a.Targa, ass.Nome, sum(ac.ImportoDelDanno)
FROM AutoCoinvolte ac, Auto a, Assicurazioni ass
WHERE a.Targa=ac.Targa and a.CodAss=ass.CodAss
GROUP BY a.Targa, ass.Nome
HAVING count(*) >1
/*CodF e Nome di coloro che possiedono più di un’auto*/
SELECT p.CodF, p.Nome
FROM Proprietari p, Auto a
WHERE p.CodF = a.CodF
GROUP BY p.CodF, p.Nome
HAVING count(*) >1
/*La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01*/
SELECT a.Targa
FROM Auto a
WHERE Not Exists ( SELECT *
 FROM AutoCoinvolte ac, Sinistri s
 WHERE a.Targa =ac.Targa and ac.CodS=s.CodS and s.Data>20/01/01)