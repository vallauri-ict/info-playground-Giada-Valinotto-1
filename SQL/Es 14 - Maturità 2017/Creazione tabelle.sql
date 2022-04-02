CREATE TABLE Passeggeri(
Id_Utente int primary key identity(1,1),
nome varchar(20) not null,
cognome varchar(20) not null,
telefono varchar(10) not null,
email varchar(40) not null,
docIdentita varchar(10) not null
)

CREATE TABLE Autisti(
Id_Utente int primary key identity(1,1),
nome varchar(20) not null,
cognome varchar(20) not null,
telefono varchar(10) not null,
email varchar(40) not null,
fotografia varchar(10) not null,
datiAuto varchar(50) not null,
scadPatente date not null
)

CREATE TABLE Viaggi(
Id_Viaggio int primary key identity(1,1),
cittaPartenza varchar(25) not null,
cittaArrivo varchar(25) not null,
tempiStimati int not null,
prezzo decimal(3,2) not null,
costo decimal(3,2) not null,
[data] date not null,
ora time not null,
soste int not null,
bagagli bit not null,
animali bit not null,
prenotabile bit not null,
Id_Autista int foreign key references Autisti(id_Utente) not null
)

CREATE TABLE Prenotazioni(
Id_Viaggio int foreign key references Viaggi(Id_Viaggio) not null,
Id_Utente  int foreign key references Passeggeri(Id_Utente) not null,
stato bit not null, 
primary key(Id_Viaggio, Id_Utente)
)

CREATE TABLE FeedbackAutista(
Id_FeedbackAutista int primary key not null,
voto int not null,
descrizione varchar(100),
Id_Viaggio int foreign key references Viaggi(Id_Viaggio) not null,
Id_Utente int foreign key references Passeggeri(Id_Utente) not null
)

CREATE TABLE FeedbackPasseggero(
Id_FeedbackPasseggero int primary key not null,
voto int not null,
descrizione varchar(100),
Id_Viaggio int foreign key references Viaggi(Id_Viaggio) not null,
Id_Autista int foreign key references Autisti(Id_Utente) not null
)