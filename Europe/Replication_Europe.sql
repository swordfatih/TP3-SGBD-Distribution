-- Création de logs pour que l'amérique puisse faire un refresh fast
CREATE MATERIALIZED VIEW LOG ON Fournisseurs;
GRANT SELECT ON MLOG$_Fournisseurs TO mvieiraper;
GRANT SELECT ON MLOG$_Fournisseurs TO avieiraper;

-- Création des vues matérialisées
DROP SYNONYM Employes;
CREATE MATERIALIZED VIEW Employes
REFRESH FAST
NEXT SYSDATE + 1
AS
SELECT * FROM mvieiraper.Employes@L_Ameriques;

DROP SYNONYM Categories;
CREATE MATERIALIZED VIEW Categories
REFRESH COMPLETE
AS
SELECT * FROM mvieiraper.Categories@L_Ameriques;

DROP SYNONYM Produits;
CREATE MATERIALIZED VIEW Produits
REFRESH COMPLETE
AS
SELECT * FROM mvieiraper.Produits@L_Ameriques;