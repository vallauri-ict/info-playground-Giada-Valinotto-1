/*QUERY 1*/
SELECT f.Titolo, f.Genere
FROM Film f, Proiezione p
WHERE f.CodFilm=p.CodFilm AND p.DataProiezione=25-12-2004;

/*QUERY 2*/
SELECT f.Titolo
FROM Film f, Recita r, Attore a
WHERE f.CodFilm=r.CodFilm AND r.CodAttore=a.CodAttore AND (a.Nome='M. Mastroianni' OR a.Nome='S. Loren');

/*QUERY 3*/
SELECT DISTINCT s.Nome
FROM Attore a, Recita r, Film f, Proiezione p, Sala s
WHERE  s.Citta='Napoli' AND p.DataProiezione =25-12-04 AND a.Nome = 'R. Williams' AND a.CodAttore = r.CodAttore AND r.CodFilm = f.CodFilm AND p.CodSala=s.CodSala AND f.CodFilm=p.CodFilm;

/*QUERY 4*/
SELECT f.Titolo, count(*) as attori
FROM Attore a, Recita r, Film f
WHERE  a.AnnoNascita=r.CodAttore AND r.CodFilm = f.CodFilm
GROUP BY f.CodFilm, f.Titolo
HAVING max(a.AnnoNascita) < 1970;

/*QUERY 5*/
SELECT f.Titolo
FROM Film f
WHERE not exists (
SELECT *
FROM Proiezione p, Sala s, Film f
WHERE s.Citta< > 'Pisa' AND f.CodFilm = p.CodFilm AND p.CodSala = s.CodSala);

/*QUERY 6*/
SELECT f.Titolo
FROM Film f 
WHERE f.Regista='Fellini' AND not exists(
SELECT *
FROM Attore a, Recita r
WHERE f.CodFilm = r.CodFilm AND r.CodAttore = a.CodAttore AND a.Nazionalita = 'ITA');