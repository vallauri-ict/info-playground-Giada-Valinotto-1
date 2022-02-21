CREATE PROCEDURE [dbo].[ElencoClasse]
	@Classe varchar(10),
	@Nome varchar(30) output,
	@Cognome varchar(30) output,
	@Telefono varchar(20) output
AS
	declare @idGiovane int
	set @idGiovane = (SELECT Id FROM Studenti WHERE Classe = @Classe AND DataNascita = (SELECT MAX(DataNascita) FROM Studenti WHERE Classe = @Classe))

	set @Nome = (SELECT Nome FROM Studenti WHERE Id = @idGiovane)
	set @Cognome = (SELECT Cognome FROM Studenti WHERE Id = @idGiovane)
	set @Telefono = (SELECT Telefono FROM Studenti WHERE Id = @idGiovane)

	SELECT * FROM Studenti WHERE Classe = @Classe
RETURN 0