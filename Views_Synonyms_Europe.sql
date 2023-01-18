CREATE OR REPLACE SYNONYM Clients_Europe_Du_Sud 
FOR mvieiraper.Clients_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Clients_Amerique
FOR mvieiraper.Clients_Amerique@L_Ameriques;

CREATE SYNONYM Commandes_Europe_Du_Sud
FOR mvieiraper.Commandes_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Commandes_Amerique
FOR mvieiraper.Commandes_Amerique@L_Ameriques;

CREATE SYNONYM Details_Commandes_Europe_Du_Sud
FOR mvieiraper.Details_Commandes_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Details_Commandes_Ameriques
FOR mvieiraper.Details_Commandes_Ameriques@L_Ameriques;

CREATE SYNONYM Stock_Europe_Du_Sud
FOR mvieiraper.Stock_Europe_Du_Sud@L_Ameriques;

CREATE SYNONYM Stock_Amerique
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
SELECT * FROM Clients_Amerique;

CREATE OR REPLACE VIEW Commandes AS
SELECT * FROM Commandes_Europe_Du_Nord
UNION ALL
SELECT * FROM Commandes_Autres
UNION ALL
SELECT * FROM Commandes_Europe_Du_Sud
UNION ALL
SELECT * FROM Commandes_Amerique;

CREATE OR REPLACE VIEW Details_Commandes AS
SELECT * FROM Details_Commandes_Europe_Du_Nord
UNION ALL
SELECT * FROM Details_Commandes_Autres
UNION ALL
SELECT * FROM Details_Commandes_Europe_Du_Sud
UNION ALL
SELECT * FROM Details_Commandes_Amerique;

CREATE OR REPLACE VIEW Stock AS
SELECT * FROM Stock_Europe_Du_Nord
UNION ALL
SELECT * FROM Stock_Autres
UNION ALL
SELECT * FROM Stock_Europe_Du_Sud
UNION ALL
SELECT * FROM Stock_Amerique;
