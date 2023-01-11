DROP TABLE Fournisseurs;
CREATE TABLE Fournisseurs AS (
    SELECT *
    FROM Ryori.Fournisseurs@L_DB11 
);

DROP TABLE Stock;
CREATE TABLE Stock AS (
    SELECT * 
    FROM Ryori.Stock@L_DB11
    WHERE Pays IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Clients;
CREATE TABLE Clients AS (
      SELECT *
      FROM Ryori.Clients@L_DB11
      WHERE PAYS IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Commandes;
CREATE TABLE Commandes AS (
    SELECT CODE_CLIENT, SOCIETE, ADRESSE, VILLE, CODE_POSTAL, PAYS, TELEPHONE, FAX 
    FROM Ryori.Commandes@L_DB11 NATURAL JOIN Ryori.Clients@L_DB11
    WHERE Pays IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Details_Commandes;
CREATE TABLE Details_Commandes AS (
    SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
    FROM Ryori.Commandes@L_DB11 NATURAL JOIN Ryori.Details_Commandes@L_DB11
);

