CREATE MATERIALIZED VIEW LOG ON Employes;
GRANT SELECT ON MLOG$_Employes TO nboutadgha;

SELECT * FROM MLOG$_Employes;

CREATE MATERIALIZED VIEW Fournisseurs
REFRESH FAST
NEXT sysdate + 1 -- 1 jour
AS
SELECT * FROM fkilic.Fournisseurs@Europe;