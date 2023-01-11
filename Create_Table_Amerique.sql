CREATE TABLE EMPLOYES AS
  SELECT *
  FROM Ryori.EMPLOYES@Central 
;

CREATE TABLE PRODUITS AS
  SELECT *
  FROM Ryori.PRODUITS@Central 
;

CREATE TABLE CATEGORIES AS
  SELECT *
  FROM Ryori.CATEGORIES@Central 
;

CREATE TABLE CLIENTS_AMERIQUE AS
  SELECT *
  FROM Ryori.CLIENTS@Central
  WHERE pays IN ( 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil',
                  'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique',
                  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique',
                  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie',
                  'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela');

CREATE TABLE CLIENTS_EUROPE_DU_SUD AS
  SELECT *
  FROM Ryori.CLIENTS@Central
  WHERE pays IN ('Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin',
                 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine',
                 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie');
                 
CREATE TABLE COMMANDES_AMERIQUE AS (
  SELECT NO_COMMANDE, CODE_CLIENT, NO_EMPLOYE, DATE_COMMANDE, DATE_ENVOI, PORT
  FROM Ryori.COMMANDES@CENTRAL NATURAL JOIN CLIENTS_AMERIQUE);
  
CREATE TABLE COMMANDES_EUROPE_DU_SUD AS (
  SELECT NO_COMMANDE, CODE_CLIENT, NO_EMPLOYE, DATE_COMMANDE, DATE_ENVOI, PORT
  FROM Ryori.COMMANDES@CENTRAL NATURAL JOIN CLIENTS_EUROPE_DU_SUD);

CREATE TABLE DETAILS_COMMANDES_AMERIQUE AS (
  SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
  FROM Ryori.DETAILS_COMMANDES@CENTRAL NATURAL JOIN COMMANDES_AMERIQUE);
  
CREATE TABLE DETAILS_COMMANDES_EUROPE_DU_SUD AS (
  SELECT NO_COMMANDE, REF_PRODUIT, PRIX_UNITAIRE, QUANTITE, REMISE
  FROM Ryori.DETAILS_COMMANDES@CENTRAL NATURAL JOIN COMMANDES_EUROPE_DU_SUD);
  
CREATE TABLE STOCK_AMERIQUE AS
  SELECT *
  FROM Ryori.STOCK@Central
  WHERE pays IN ( 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil',
                  'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique',
                  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique',
                  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie',
                  'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela');

CREATE TABLE STOCK_EUROPE_DU_SUD AS
  SELECT *
  FROM Ryori.STOCK@Central
  WHERE pays IN ('Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin',
                 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine',
                 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie');
                 
GRANT SELECT, UPDATE, INSERT, DELETE ON CATEGORIES TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON CLIENTS_AMERIQUE TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON CLIENTS_EUROPE_DU_SUD TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON COMMANDES_AMERIQUE TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON COMMANDES_EUROPE_DU_SUD TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON DETAILS_COMMANDES_AMERIQUE TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON DETAILS_COMMANDES_EUROPE_DU_SUD TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON EMPLOYES TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON PRODUITS TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON STOCK_AMERIQUE TO fkilic;
GRANT SELECT, UPDATE, INSERT, DELETE ON STOCK_EUROPE_DU_SUD TO fkilic;
