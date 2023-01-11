DROP TABLE Fournisseurs;
CREATE TABLE Fournisseurs AS (
    SELECT *
    FROM Ryori.Fournisseurs@L_DB11 
);

DROP TABLE Stock_Europe_Du_Nord;
CREATE TABLE Stock_Europe_Du_Nord AS (
    SELECT * 
    FROM Ryori.Stock@L_DB11
    WHERE Pays IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Stock_Autres;
CREATE TABLE Stock_Autres AS (
    SELECT * 
    FROM Ryori.Stock@L_DB11
    WHERE PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie')
);

DROP TABLE Clients_Europe_Du_Nord;
CREATE TABLE Clients_Europe_Du_Nord AS (
    SELECT *
    FROM Ryori.Clients@L_DB11
    WHERE PAYS IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Clients_Autres;
CREATE TABLE Clients_Autres AS (
    SELECT *
    FROM Ryori.Clients@L_DB11
    WHERE PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie')
);

DROP TABLE Commandes_Europe_Du_Nord;
CREATE TABLE Commandes_Europe_Du_Nord AS (
    SELECT CODE_CLIENT, SOCIETE, ADRESSE, VILLE, CODE_POSTAL, PAYS, TELEPHONE, FAX 
    FROM Ryori.Commandes@L_DB11 NATURAL JOIN Ryori.Clients@L_DB11
    WHERE Pays IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne')
);

DROP TABLE Commandes_Autres;
CREATE TABLE Commandes_Autres AS (
    SELECT CODE_CLIENT, SOCIETE, ADRESSE, VILLE, CODE_POSTAL, PAYS, TELEPHONE, FAX 
    FROM Ryori.Commandes@L_DB11 NATURAL JOIN Ryori.Clients@L_DB11
    WHERE PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie')
);

DROP TABLE Details_Commandes_Europe_Du_Nord;
CREATE TABLE Details_Commandes_Europe_Du_Nord AS (
    SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
    FROM Commandes_Europe_Du_Nord NATURAL JOIN Ryori.Details_Commandes@L_DB11
);

DROP TABLE Details_Commandes_Autres;
CREATE TABLE Details_Commandes_Autres AS (
    SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
    FROM Commandes_Autres NATURAL JOIN Ryori.Details_Commandes@L_DB11
);

GRANT SELECT, UPDATE, INSERT, DELETE ON Fournisseurs TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Clients_Europe_Du_Nord TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Clients_Autres TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Commandes_Europe_Du_Nord TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Commandes_Autres TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Details_Commandes_Europe_Du_Nord TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Details_Commandes_Autres TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Stock_Europe_Du_Nord TO mvieiraper;
GRANT SELECT, UPDATE, INSERT, DELETE ON Stock_Autres TO mvieiraper;