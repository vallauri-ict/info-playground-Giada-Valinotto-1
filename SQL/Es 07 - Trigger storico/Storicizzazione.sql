CREATE PROCEDURE [dbo].[Storicizzazione]
@dataStoricizzazione date

AS
SET NOCOUNT ON;
begin
SELECT *
from StoricoAggiornamenti sa
WHERE sa.data >= @dataStoricizzazione;
RETURN 0;
end