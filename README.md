BitBooks
Un’applicazione client-server implementata con socket e connessione TCP/IP, che simula il comportamento di una biblioteca e in particolare nel prestito dei libri.
Sfoglia i libri disponibili, leggi la descrizione di un libro e dai un’occhiata all’anteprima e, se interessato, aggiungilo al carrello e sarà tuo per un periodo. In qualsiasi momento è possibile consultare il proprio profilo per controllare quali libro sono stati presi in prestito ed entro quando deve essere restituito, e giusto per essere sicuri, vi è un sistema di notifiche per avvisare l’utente in caso il libro non sia stato restituito in tempo.
Ovviamente per permettere tutto ciò vi è l’autenticazione utente ed è quindi necessario registrarsi.
Il tutto è gestito in multi-thread, quindi vengono gestiti più client contemporaneamente, cosi come la possibile richiesta simultanea di più utenti per lo stesso libro.

Funzionalità
- [ ] Autenticazione utente
- [ ] Ricerca libri
- [ ] Richiesta prestito libri
- [ ] Sezione profilo con prestiti effettuati
- [ ] Notifiche dopo la data di restituzione

Come eseguire
Senza Docker Compose
- [ ] Aprire una finestra di terminale e spostarsi nella cartella del progetto;
- [ ] Eseguire “gcc -o server server.c Controller/cJSON.c“ (per compilare il server);
- [ ] Eseguire “./server” (per eseguire il server);
- [ ] Aprire, nella cartella clientSwift, il file .xcodeproj con Xcode, selezionare il simulatore o il dispositivo su cui avviare l'app e buildare l'applicazione;
Con Docker Compose
- [ ] Aprire Docker Desktop, aprire una finestra di terminale e spostarsi nella cartella del progetto;
- [ ] Eseguire “docker compose up —-build -d”;
- [ ] Eseguire “docker compose exec client ./client”;

