SELECT a.nome, v.costo, a.datiAuto, v.ora
FROM Viaggi v, Autisti a
WHERE v.Id_Autista = a.Id_Utente and p.Id_Viaggio = v.Id_Viaggio and v.cittaArrivo='Carmagnola' and v.cittaPartenza = 'Torino' and v.data = '2022-04-02' and p.stato=1
ORDER BY v.ora;

SELECT pas.email, pas.cognome, pas.nome
FROM Prenotazioni p, Passeggeri pas
WHERE p.stato = 1 and p.Id_Utente= pas.Id_Utente

SELECT *
FROM Passeggeri p, FeedbackAutista fa, Viaggi v, Prenotazioni pren
WHERE p.Id_Utente = fa.Id_Utente and v.Id_Viaggio = pren.Id_Viaggio and v.Id_Viaggio= 1 and 1<(SELECT AVG(fa.voto) FROM FeedbackAutista fa, Prenotazioni p WHERE fa.Id_Utente= p.Id_Utente)