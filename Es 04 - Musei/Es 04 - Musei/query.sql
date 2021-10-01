/* Per ciascun museo di Londra, il numero di opere di artisti italiani -> Uso la GROUP BY*/
SELECT m.NomeM, count(*) as NumeroOpere
FROM Artisti a, Opere o, Musei m
WHERE a.Nazionalità = 'IT'
AND a.nomeA = o.nomeA
AND m.nomeM = o.nomeM
AND m.Città='Londra'
GROUP BY m.NomeM

/*Il nome dei musei di Londra che NON conservano opere di Tiziano -> uso la EXIST */
SELECT m.nomeM
FROM Musei m 
WHERE m.Città = 'Londra'
AND NOT EXISTS(
	SELECT *
	FROM Opere o
	WHERE o.NomeA='Tiziano'
	AND o.NomeM=m.NomeM
	)
