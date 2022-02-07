CREATE PROCEDURE [dbo].[Procedure]
	@Numero int
AS
	INSERT INTO ContaFiliali VALUES (@Numero)
RETURN 0
