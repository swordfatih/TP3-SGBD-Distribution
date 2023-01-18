ALTER TABLE Fournisseurs_Europe_Du_Nord
ADD CONSTRAINT PK_Fournisseurs_Europe_Du_Nord
PRIMARY KEY (NO_FOURNISSEUR);

ALTER TABLE Fournisseurs_Autres
ADD CONSTRAINT PK_Fournisseurs_Autres
PRIMARY KEY (NO_FOURNISSEUR);

ALTER TABLE Stock_Europe_Du_Nord 
ADD CONSTRAINT PK_Stock_Europe_Du_Nord  
PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE Stock_Autres
ADD CONSTRAINT PK_Stock_Autres  
PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE Clients_Europe_Du_Nord
ADD CONSTRAINT PK_Clients_Europe_Du_Nord
PRIMARY KEY (CODE_CLIENT);

ALTER TABLE Clients_Autres
ADD CONSTRAINT PK_Clients_Autres
PRIMARY KEY (CODE_CLIENT);

ALTER TABLE Commandes_Europe_Du_Nord
ADD CONSTRAINT PK_Commandes_Europe_Du_Nord
PRIMARY KEY (NO_COMMANDE);

ALTER TABLE Commandes_Autres
ADD CONSTRAINT PK_Commandes_Autres
PRIMARY KEY (NO_COMMANDE);

ALTER TABLE Details_Commandes_Europe_Du_Nord
ADD CONSTRAINT PK_Details_Commandes_Europe_Du_Nord 
PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

ALTER TABLE Details_Commandes_Autres
ADD CONSTRAINT PK_Details_Commandes_Autres
PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

ALTER TABLE Stock_Europe_Du_Nord
ADD CONSTRAINT FK_Stock_Europe_Du_Nord
FOREIGN KEY (REF_PRODUIT)
REFERENCES PRODUITS(REF_PRODUIT);

ALTER TABLE Stock_Autres
ADD CONSTRAINT FK_Stock_Autres
FOREIGN KEY (REF_PRODUIT)
REFERENCES PRODUITS(REF_PRODUIT);
 
-- CREATE OR REPLACE FK_EMPLOYES
-- BEFORE INSERT OR UPDATE ON Commandes
-- FOR EACH ROW 
-- DECLARE 
   -- CURSOR Curs_NO_EMPLOYE IS 
   -- SELECT NO_EMPLOYE
   -- FROM 

ALTER TABLE Clients_Europe_Du_Nord
ADD CONSTRAINT CK_Code_Clients_Europe_Du_Nord
CHECK (CODE_CLIENT LIKE '0%');

ALTER TABLE Clients_Europe_Du_Nord
ADD CONSTRAINT CK_Code_Clients_Autres
CHECK (CODE_CLIENT LIKE '1%');

ALTER TABLE Clients_Europe_Du_Nord
ADD CONSTRAINT CK_Pays_Clients_Europe_Du_Nord
CHECK (PAYS IN ('Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne'));

ALTER TABLE Clients_Autres
ADD CONSTRAINT CK_Pays_Clients_Autres
CHECK (PAYS NOT IN ('Norvège', 'Suède', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Allemagne', 'Pologne', 'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela', 'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie'));