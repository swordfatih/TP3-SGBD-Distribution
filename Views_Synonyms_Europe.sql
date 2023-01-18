CREATE OR REPLACE VIEW Clients AS
SELECT * FROM Clients_Europe_Du_Nord
UNION
SELECT * FROM Clients_Autres
UNION
SELECT * FROM mvieiraper.Clients_Europe_Du_Sud
UNION
SELECT * FROM mvieiraper.Clients_Ameriques;

CREATE OR REPLACE VIEW Commandes AS
SELECT * FROM Commandes_Europe_Du_Nord
UNION
SELECT * FROM Commandes_Autres
UNION
SELECT * FROM mvieiraper.Commandes_Europe_Du_Sud
UNION
SELECT * FROM mvieiraper.Commandes_Ameriques;

CREATE OR REPLACE VIEW Details_Commandes AS
SELECT * FROM Details_Commandes_Europe_Du_Nord
UNION
SELECT * FROM Details_Commandes_Autres
UNION
SELECT * FROM mvieiraper.Details_Commandes_Europe_Du_Sud
UNION
SELECT * FROM mvieiraper.Details_Commandes_Ameriques;

CREATE OR REPLACE VIEW Stock AS
SELECT * FROM Stock_Europe_Du_Nord
UNION
SELECT * FROM Stock_Autres
UNION
SELECT * FROM mvieiraper.Stock_Europe_Du_Sud
UNION
SELECT * FROM mvieiraper.Stock_Ameriques;
