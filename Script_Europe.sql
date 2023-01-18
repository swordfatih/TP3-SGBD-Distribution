DROP DATABASE LINK L_Central;
CREATE DATABASE LINK L_Central
CONNECT TO fkilic IDENTIFIED BY "x"
USING 'DB11';

DROP DATABASE LINK L_Ameriques;
CREATE DATABASE LINK L_Ameriques
CONNECT TO fkilic IDENTIFIED BY "x"
USING 'DB14';

GRANT SELECT ON Fournisseurs TO mvieiraper;
GRANT SELECT ON Clients_Europe_Du_Nord TO mvieiraper;
GRANT SELECT ON Clients_Autres TO mvieiraper;
GRANT SELECT ON Commandes_Europe_Du_Nord TO mvieiraper;
GRANT SELECT ON Commandes_Autres TO mvieiraper;
GRANT SELECT ON Details_Commandes_Europe_Du_Nord TO mvieiraper;
GRANT SELECT ON Details_Commandes_Autres TO mvieiraper;
GRANT SELECT ON Stock_Europe_Du_Nord TO mvieiraper;
GRANT SELECT ON Stock_Autres TO mvieiraper;

DROP TABLE Fournisseurs;
CREATE TABLE Fournisseurs AS (
    SELECT *
    FROM Ryori.Fournisseurs@L_Central 
);

DROP TABLE Stock_Europe_Du_Nord;
CREATE TABLE Stock_Europe_Du_Nord AS (
    SELECT * 
    FROM Ryori.Stock@L_Central
    WHERE Pays IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Stock_Autres;
CREATE TABLE Stock_Autres AS (
    SELECT * 
    FROM Ryori.Stock@L_Central
    WHERE PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie')
);

DROP TABLE Clients_Europe_Du_Nord;
CREATE TABLE Clients_Europe_Du_Nord AS (
    SELECT *
    FROM Ryori.Clients@L_Central
    WHERE PAYS IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Clients_Autres;
CREATE TABLE Clients_Autres AS (
    SELECT *
    FROM Ryori.Clients@L_Central
    WHERE PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie')
);

DROP TABLE Commandes_Europe_Du_Nord;
CREATE TABLE Commandes_Europe_Du_Nord AS (
    SELECT NO_COMMANDE, CODE_CLIENT, NO_EMPLOYE, DATE_COMMANDE, DATE_ENVOI, PORT
    FROM Ryori.Commandes@L_Central NATURAL JOIN Clients_Europe_Du_Nord
);

DROP TABLE Commandes_Autres;
CREATE TABLE Commandes_Autres AS (
    SELECT NO_COMMANDE, CODE_CLIENT, NO_EMPLOYE, DATE_COMMANDE, DATE_ENVOI, PORT
    FROM Ryori.Commandes@L_Central NATURAL JOIN Clients_Autres
);

DROP TABLE Details_Commandes_Europe_Du_Nord;
CREATE TABLE Details_Commandes_Europe_Du_Nord AS (
    SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
    FROM Ryori.Details_Commandes@L_Central NATURAL JOIN Commandes_Europe_Du_Nord
);

DROP TABLE Details_Commandes_Autres;
CREATE TABLE Details_Commandes_Autres AS (
    SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
    FROM Ryori.Details_Commandes@L_Central NATURAL JOIN Commandes_Autres
);

CREATE OR REPLACE SYNONYM Clients_Europe_Du_Sud 
FOR mvieiraper.Clients_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Clients_Ameriques
FOR mvieiraper.Clients_Amerique@L_Ameriques;

CREATE SYNONYM Commandes_Europe_Du_Sud
FOR mvieiraper.Commandes_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Commandes_Ameriques
FOR mvieiraper.Commandes_Amerique@L_Ameriques;

CREATE SYNONYM Details_Commandes_Europe_Du_Sud
FOR mvieiraper.Details_Commandes_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Details_Commandes_Ameriques
FOR mvieiraper.Details_Commandes_Ameriques@L_Ameriques;

CREATE SYNONYM Stock_Europe_Du_Sud
FOR mvieiraper.Stock_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Stock_Ameriques
FOR mvieiraper.Stock_Amerique@L_Ameriques;

CREATE SYNONYM Employes
FOR mvieiraper.Employes@L_Ameriques;

CREATE OR REPLACE VIEW Clients AS
SELECT * FROM Clients_Europe_Du_Nord
UNION ALL
SELECT * FROM Clients_Autres
UNION ALL
SELECT * FROM Clients_Europe_Du_Sud
UNION ALL
SELECT * FROM Clients_Ameriques;

CREATE OR REPLACE VIEW Commandes AS
SELECT * FROM Commandes_Europe_Du_Nord
UNION ALL
SELECT * FROM Commandes_Autres
UNION ALL
SELECT * FROM Commandes_Europe_Du_Sud
UNION ALL
SELECT * FROM Commandes_Ameriques;

CREATE OR REPLACE VIEW Details_Commandes AS
SELECT * FROM Details_Commandes_Europe_Du_Nord
UNION ALL
SELECT * FROM Details_Commandes_Autres
UNION ALL
SELECT * FROM Details_Commandes_Europe_Du_Sud
UNION ALL
SELECT * FROM Details_Commandes_Ameriques;

CREATE OR REPLACE VIEW Stock AS
SELECT * FROM Stock_Europe_Du_Nord
UNION ALL
SELECT * FROM Stock_Autres
UNION ALL
SELECT * FROM Stock_Europe_Du_Sud
UNION ALL
SELECT * FROM Stock_Ameriques;