# ES 10 - TRANSACTION & PROCEDURE 

## Finalità dell'esercizio
L'esercizio è finalizzato alla comprensione della funzione e dell'utilizzo del comando SQL TRANSACTION.

All'interno dell'esercizio, vi è anche un riferimento alle procedure.

### Transaction 
Per transazione si intende una serie di istruzioni SQL che vengono trattate come se fossero una singola unità.

Le istruzioni di una transazione devono essere racchiuse tra i comandi **Begin Transaction** e **End Transaction**.

Una transazione può avere solo due esiti:
1. **Terminare correttamente** : questo avviene solo quando l’applicazione,
dopo aver eseguito tutte le operazioni, esegue una particolare istruzio-
ne SQL, detta COMMIT, che garantisce la conclusione delle operazioni;
2. **Terminare non correttamente** (anticipatamente) e quindi sono possi-
bili 2 casi:
    - La transazione determina che è avvenuto un errore e interrompe le
operazioni, eseguendo l’istruzione SQL ROLLBACK;
    - Il sistema non è in grado di garantire la corretta prosecuzione del-
la transazione (per esempio, per un guasto o a causa della violazio-
ne di un vincolo); la transazione viene quindi interrotta

### Stored procedure
Le stored procedure rappresentano il “cuore” della programmazione Transact SQL. Presenti fin dalle prime versioni di SQL Server sono gruppi di istruzioni SQL compattati in un modulo e memorizzati nella cache per un successivo utilizzo. Racchiudere il codice SQL all’interno di procedure memorizzate porta due grossi vantaggi rispetto ai batch di codice SQL tradizionale:
- Aumento nella velocità di esecuzione del codice SQL e quindi delle performance generali delle applicazioni.
- Aumento della leggibilità e della portabilità del codice e quindi della scalabilità delle applicazioni.

## Svolgimento dell'esercizio
Per lo svolgimento dell'esercizio, si è fatto riferimento ad un database contenente l'anagrafica di una serie di dipendenti (tabella Dipendenti) e di una serie di transazioni bancarie effettuate (tabella Bonifici).

- Una transazione permette di effettuare una serie di modifiche sulla tabellla dei dipendenti:
```SQL
BEGIN TRANSACTION
INSERT INTO Dipendenti VALUES (9, 'Velardi', 120);
SAVE TRANSACTION Punto2

INSERT INTO Dipendenti VALUES (22, 'Teleman', 800);
SAVE TRANSACTION Punto3

SELECT * FROM Dipendenti
ROLLBACK TRANSACTION Punto2

SELECT * FROM Dipendenti

COMMIT
```
- Una stored procedure permette di inserire agevolmente i dati dei bonifiici:
```SQL
CREATE PROCEDURE [dbo].[Bonifico]
@importo float = 0,
@contoSorgente int,
@contoDestinazione int
AS
if(@contoDestinazione=@contoSorgente)
return -2;
BEGIN TRANSACTION
INSERT INTO Movimenti(Importo,Data,Tipo,CodiceConto)
VALUES(@importo,GETDATE(),'P',@contoSorgente)
if(@@ERROR<>0)
BEGIN
ROLLBACK
RAISERROR('Errore durante il prelievo',16,1)
return -1;
END
INSERT INTO Movimenti(Importo,Data,Tipo,CodiceConto)
VALUES(@importo,GETDATE(),'V',@contoDestinazione)
if(@@ERROR<>0)
BEGIN
ROLLBACK
RAISERROR('Errore durante il versamento',16,2)
return -1;
END
COMMIT
RETURN 0
```

Ultima modifica: 05/02/2022


_Stud. Valinotto Giada, 5B Informatica 2021/2022_
