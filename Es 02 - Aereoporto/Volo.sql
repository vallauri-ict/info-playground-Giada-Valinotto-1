CREATE TABLE [dbo].[Volo]
(
	[IdVolo] INT NOT NULL PRIMARY KEY IDENTITY, 
    [giornoSett] VARCHAR(10) NOT NULL, 
    [citttaPart] VARCHAR(50) NOT NULL, 
    [oraPart] TIME NOT NULL, 
    [cittaArr] VARCHAR(50) NOT NULL, 
    [oraArr] TIME NOT NULL, 
    [tipoAereo] VARCHAR(20) NOT NULL
)
