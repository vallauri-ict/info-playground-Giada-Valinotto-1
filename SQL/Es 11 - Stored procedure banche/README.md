# ES 11 - STORED PROCEDURE BANCHE

### Stored Procedure in SQL

Una stored procedure in SQL Server è un gruppo di una o più istruzioni Transact-SQL oppure un riferimento a un metodo CLR (Common Runtime Language) di Microsoft .NET Framework. Le stored procedure assomigliano ai costrutti di altri linguaggi di programmazione perché possono essere utilizzate per:

- Accettare parametri di input e restituire più valori sotto forma di parametri di output al programma che esegue la chiamata.

- Includere istruzioni di programmazione che eseguono operazioni nel database, tra cui la chiamata di altre stored procedure.

- Restituire un valore di stato a un programma che esegue la chiamata per indicare l'esito positivo o negativo (e il motivo dell'esito negativo).

### Vantaggi dell'utilizzo delle stored procedure
Nell'elenco seguente vengono descritti alcuni vantaggi dell'utilizzo di stored procedure.

- Riduzione del traffico di rete server/client

  I comandi in una stored procedure vengono eseguiti come un solo batch di codice. In questo modo è possibile ridurre significativamente il traffico di rete tra il server e il client perché solo la chiamata per eseguire la stored procedure viene inviata attraverso la rete. Senza l'incapsulamento del codice consentito dalla stored procedure, la rete viene attraversata da ogni singola riga di codice.

- Miglioramento della sicurezza

  Tramite una stored procedure, più utenti e programmi client sono in grado di eseguire operazioni su oggetti di database sottostanti, anche se gli utenti e i programmi non dispongono di autorizzazioni dirette su tali oggetti sottostanti. La stored procedure consente di controllare quali processi e attività vengono eseguiti e di proteggere gli oggetti di database sottostanti. In questo modo si elimina la necessità di concedere autorizzazioni a livello di singolo oggetto, semplificando i livelli di sicurezza.

- È possibile specificare la clausola EXECUTE AS nell'istruzione CREATE PROCEDURE per consentire la rappresentazione di un altro utente o consentire a utenti e applicazioni di eseguire alcune attività nel database senza avere bisogno di autorizzazioni dirette per gli oggetti e i comandi sottostanti. Ad esempio per alcune azioni, come TRUNCATE TABLE non sono disponibili autorizzazioni. Per eseguire TRUNCATE TABLE è necessario che l'utente disponga dell'autorizzazione ALTER per la tabella specificata. Concedere a un utente l'autorizzazione ALTER su una tabella non è consigliabile, perché l'utente disporrebbe di autorizzazioni ben superiori alla semplice possibilità di troncare la tabella. Incorporando l'istruzione TRUNCATE TABLE in un modulo e specificando che tale modulo venga eseguito come un utente che dispone di autorizzazioni per la modifica della tabella è possibile estendere le autorizzazioni per il troncamento della tabella all'utente al quale si concede l'autorizzazione EXECUTE sul modulo.

- In caso di chiamata a una stored procedure attraverso la rete, solo la chiamata per eseguire la stored procedure è visibile. Pertanto, gli utenti malintenzionati non possono visualizzare i nomi di oggetti di database e tabelle, incorporare istruzioni Transact-SQL personalizzate o cercare dati critici.

- L'utilizzo dei parametri della stored procedure aiuta a proteggersi da attacchi SQL injection. Dal momento che l'input del parametro viene trattato come un valore letterale e non come codice eseguibile, è più difficile che un pirata informatico riesca a inserire un comando nelle istruzioni Transact-SQL all'interno della stored procedure compromettendo la sicurezza.

- È possibile crittografare le stored procedure, nascondendo il codice sorgente. Per altre informazioni, vedere Crittografia di SQL Server.

- Riutilizzo del codice

  Il codice di operazioni ripetitive sul database risulta assolutamente appropriato ai fini dell'incapsulamento nelle stored procedure. In questo modo si elimina la necessità di riscrivere più volte lo stesso codice, si riducono le incoerenze al suo interno e se ne consentono l'accesso e l'esecuzione da parte di qualsiasi utente o applicazione che disponga delle autorizzazioni necessarie.

- Semplificazione della manutenzione

  Quando si effettua la chiamata delle stored procedure tramite le applicazioni client e si mantengono le operazioni nel database solo nel livello dati, in caso di modifiche nel database sottostante è necessario aggiornare unicamente le stored procedure. Si mantiene separato il livello applicazione senza che venga interessato dalle modifiche a layout del database, relazioni o processi.

- Prestazioni migliorate

  Per impostazione predefinita, una stored procedure viene compilata solo alla prima esecuzione e si crea un piano di esecuzione da riutilizzare nelle esecuzioni successive. Dal momento che non è necessaria la creazione di un nuovo piano da parte del sistema di elaborazione delle query, l'elaborazione della stored procedure richiede generalmente un tempo minore.

- Se c'è stata modifica significativa alle tabelle o ai dati a cui fa riferimento la stored procedure, è possibile che il piano precompilato comporti in realtà un'esecuzione più lenta della stored procedure. In questo caso, la ricompilazione della stored procedure e la forzatura di un nuovo piano di esecuzione possono migliorare le prestazioni.

Ultima modofica: 02/03/2022

_Stud. Valinotto Giada, classe 5^B Informatica 2021/2022_
