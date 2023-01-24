ALTER TABLE Categories
ADD CONSTRAINT PK_Categories 
PRIMARY KEY (CODE_CATEGORIE);

ALTER TABLE Clients_Amerique
ADD CONSTRAINT PK_Clients_Amerique 
PRIMARY KEY (CODE_CLIENT);

ALTER TABLE Clients_Europe_du_Sud
ADD CONSTRAINT PK_Clients_Europe_du_Sud
PRIMARY KEY (CODE_CLIENT);

ALTER TABLE Commandes_Amerique
ADD CONSTRAINT PK_Commandes_Amerique 
PRIMARY KEY (NO_COMMANDE);

ALTER TABLE Commandes_Europe_du_Sud
ADD CONSTRAINT PK_Commandes_Europe_du_Sud
PRIMARY KEY (NO_COMMANDE);

ALTER TABLE Details_Commandes_Amerique
ADD CONSTRAINT PK_Details_Commandes_Amerique 
PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

ALTER TABLE Details_Commandes_Europe_du_Sud
ADD CONSTRAINT PK_Details_Commandes_Europe_du_Sud
PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

ALTER TABLE Employes
ADD CONSTRAINT PK_Employes
PRIMARY KEY (NO_EMPLOYE);

ALTER TABLE Produits
ADD CONSTRAINT PK_Produits
PRIMARY KEY (REF_PRODUIT);

ALTER TABLE Stock_Amerique
ADD CONSTRAINT PK_Stock_Amerique
PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE Stock_Europe_du_Sud
ADD CONSTRAINT PK_Stock_Europe_du_Sud
PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE Commandes_Amerique
ADD CONSTRAINT Fk_Code_Client_Amerique
FOREIGN KEY (Code_Client)
REFERENCES Clients_Amerique(Code_Client);

ALTER TABLE Commandes_Amerique
ADD CONSTRAINT Fk_Employe_Amerique
FOREIGN KEY (No_Employe)
REFERENCES Employes(No_Employe);

ALTER TABLE Commandes_Europe_du_Sud
ADD CONSTRAINT Fk_Code_Client_Europe_du_Sud
FOREIGN KEY (Code_Client)
REFERENCES Clients_Europe_du_Sud(Code_Client);

ALTER TABLE Commandes_Europe_du_Sud
ADD CONSTRAINT Fk_Employe_Europe_du_Sud
FOREIGN KEY (No_Employe)
REFERENCES Employes(No_Employe);

ALTER TABLE Details_Commandes_Amerique
ADD CONSTRAINT Fk_No_Commande_Amerique
FOREIGN KEY (No_Commande)
REFERENCES Commandes_Amerique(No_Commande);

ALTER TABLE Details_Commandes_Amerique
ADD CONSTRAINT Fk_Ref_Produit_Amerique
FOREIGN KEY (Ref_Produit)
REFERENCES Produits(Ref_Produit);

ALTER TABLE Details_Commandes_Europe_du_Sud
ADD CONSTRAINT Fk_No_Commande_Europe_du_Sud
FOREIGN KEY (No_Commande)
REFERENCES Commandes_Europe_du_Sud(No_Commande);

ALTER TABLE Details_Commandes_Europe_du_Sud
ADD CONSTRAINT Fk_Ref_Produit_Europe_du_Sud
FOREIGN KEY (Ref_Produit)
REFERENCES Produits(Ref_Produit);

ALTER TABLE Employes
ADD CONSTRAINT Fk_Rend_Compte
FOREIGN KEY (Rend_Compte)
REFERENCES Employes(No_Employe)
DEFERRABLE;

ALTER TABLE Produits
ADD CONSTRAINT Fk_Code_Categorie
FOREIGN KEY (Code_Categorie)
REFERENCES Categories(Code_Categorie);

CREATE DATABASE LINK Europe
CONNECT TO mvieiraper IDENTIFIED BY "MDPORACLE"
USING 'DB12';


CREATE SYNONYM Fournisseurs FOR fkilic.Fournisseurs@Europe;
CREATE SYNONYM Commandes_Europe_du_Nord FOR fkilic.Commandes_Europe_du_Nord@Europe;
CREATE SYNONYM Commandes_Autres FOR fkilic.Commandes_Autres@Europe;
CREATE SYNONYM Stock_Europe_du_Nord FOR fkilic.Stock_Europe_du_Nord@Europe;
CREATE SYNONYM Stock_Autres FOR fkilic.Stock_Autres@Europe;
CREATE SYNONYM Details_Commandes_Europe_du_Nord FOR fkilic.Details_Commandes_Europe_du_Nord@Europe;
CREATE SYNONYM Details_Commandes_Autres FOR fkilic.Details_Commandes_Autres@Europe;

ALTER TABLE Stock_Amerique
ADD CONSTRAINT Fk_Ref_Produit_Stock_Amerique
FOREIGN KEY (Ref_Produit)
REFERENCES Produits(Ref_Produit);

ALTER TABLE Stock_Europe_du_Sud
ADD CONSTRAINT Fk_Ref_Produit_Stock_Europe_du_Sud
FOREIGN KEY (Ref_Produit)
REFERENCES Produits(Ref_Produit);




