/*1- Il codice ed il titolo delle opere di Tiziano conservate alla National Gallery*/
SELECT O.Codice, O.Titolo
FROM Opere O
WHERE O.NomeA = 'Tiziano' AND O.NomeM = 'National Gallery'
/*2- Il nome dell’artista ed il titolo delle opere conservate alla Galleria degliUffizi o alla National Gallery*/
SELECT O.NomeA, O.Titolo
FROM Opere O
WHERE O.NomeM = 'Galleria degli Uffizi' OR O.NomeM ='National Gallery'
/*3- Il nome dell’artista ed il titolo delle opere conservate nei musei di Firenze*/
SELECT O.NomeA, O.Titolo
FROM Opere O, Musei M
WHERE M.Città = 'Firenze' AND M.NomeM = O.NomeM
/*4- Le città in cui son conservate opere di Caravaggio*/
SELECT DISTINCT M.Città
FROM Opere O, Musei M
WHERE O.NomeA = 'Caravaggio ' AND M.NomeM = O.NomeM
/*5- Il codice ed il titolo delle opere di Tiziano conservate nei musei di Londra*/
SELECT O.Codice, O.Titolo
FROM Opere O, Musei M
WHERE O.NomeA = 'Tiziano ' AND M.Città = 'Londra' AND M.NomeM = O.NomeM
/*6- Il nome dell’artista ed il titolo delle opere di artisti spagnoli conservate nei musei di Firenze*/
SELECT NomeA, Titolo
FROM Artisti A, Opere O, Musei M
WHERE A.Nazionalità = 'Spagna' AND M.Città = 'Firenze'
AND A.NomeA = O.NomeA AND O.NomeM = M.NomeM
/*7- Il codice ed il titolo delle opere di artisti italiani conservate nei musei di Londra, in cui è rappresentata
 la Madonna*/
SELECT O.Codice, O.Titolo
FROM Opere O, Artisti A, Musei M, Personaggi P
WHERE M.Città = 'Londra' AND P.Personaggio = 'Madonna' AND A.Nazionalità = 'Italia'
 AND A.NomeA=O.NomeA AND M.NomeM = O.NomeM AND O.Codice = P.Codice 
/*8- Il numero di opere di artisti italiani conservate in ciascun museo di Londra*/
SELECT M.NomeM, Count(*) AS NumOpereItaliane
FROM O.Opere, M.Musei, A.Artisti
WHERE M.Città = 'Londra' AND A.Nazionalità = 'Italia'
AND M.NomeM = O.NomeM AND O.NomeA = A.NomeA
GROUP BY M.NomeM
/*9- Il nome dei musei di Londra che non conservano opere di Tiziano*/
SELECT M.NomeM
FROM Musei M
WHERE M.Città = 'Londra' AND Not Exists
( SELECT *
 FROM Opere O
 WHERE O.NomeA = 'Tiziano' AND M.NomeM = O.NomeM)
/*10- Il nome dei musei di Londra che conservano solo opere di Tiziano*/
SELECT M.NomeM
FROM Musei M
WHERE M.Città = 'Londra' AND Not Exists
( SELECT *
 FROM Opere O
 WHERE O.NomeA <> 'Tiziano '
 AND M.NomeM = O.NomeM)
/*11- Per ciascun artista, il nome dell’artista ed il numero di sue opere conservate alla Galleria degli Uffizi*/
SELECT O.NomeA, COUNT(*) AS NumeroOpere
FROM Opere O
WHERE O.NomeM = 'Galleria degli Uffizi'
GROUP BY O.NomeA 
/*12- I musei che conservano almeno 20 opere di artisti italiani*/
SELECT O.NomeM
FROM Opere O, Artisti A
WHERE A.Nazionalità = 'Italia' AND O.NomeA = A.NomeA
GROUP BY O.NomeM
HAVING Count (*) >=20
/*13- Il titolo dell’opera ed il nome dell’artista delle opere di artisti italiani che non hanno personaggi*/
SELECT O.Titolo, A.NomeA
FROM Opere O, Artisti A
WHERE A.Nazionalità = 'Italia' AND O.NomeA=A.NomeA AND
Not Exists ( SELECT *
 FROM Personaggi P
 WHERE P.Codice=O.Codice)
/*14- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano*/
SELECT M.NomeM
FROM Musei M
WHERE M.Città = 'Londra' AND Not Exists
( SELECT *
 FROM Opere O, Artisti A
 WHERE A.NomeA <> 'Tiziano ' AND
 A.Nazionalità='Italia'AND M.NomeM = O.Nome)
/*15- Per ogni museo, il numero di opere divise per la nazionalità dell’artisTA*/
SELECT O.NomeM, A.Nazionalità, Count(*)
FROM Opere O, Artisti A
WHERE O.NomeA = A.NomeA
GROUP BY O.NomeM, A.Nazionalità