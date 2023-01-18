CREATE SYNONYM Clients_Europe_Du_Sud 
FOR mvieiraper.Clients_Europe_Du_Sud;

CREATE SYNONYM Clients_Ameriques
FOR mvieiraper.Clients_Ameriques;

CREATE SYNONYM Commandes_Europe_Du_Sud
FOR mvieiraper.Commandes_Europe_Du_Sud;

CREATE SYNONYM Commandes_Ameriques
FOR mvieiraper.Commandes_Ameriques;

CREATE SYNONYM Details_Commandes_Europe_Du_Sud
FOR mvieiraper.Details_Commandes_Europe_Du_Sud;

CREATE SYNONYM Details_Commandes_Ameriques
FOR mvieiraper.Details_Commandes_Ameriques;

CREATE SYNONYM Stock_Europe_Du_Sud
FOR mvieiraper.Stock_Europe_Du_Sud;

CREATE SYNONYM Stock_Ameriques
FOR mvieiraper.Stock_Ameriques;

CREATE OR REPLACE VIEW Clients AS
    SELECT * 
    FROM Clients_Europe_Du_Nord
    NATURAL FULL OUTER JOIN Clients_Autres
    NATURAL FULL OUTER JOIN Clients_Europe_Du_Sud
    NATURAL FULL OUTER JOIN Clients_Ameriques;

CREATE OR REPLACE VIEW Commandes AS
    SELECT * 
    FROM Commandes_Europe_Du_Nord
    NATURAL FULL OUTER JOIN Commandes_Autres
    NATURAL FULL OUTER JOIN Commandes_Europe_Du_Sud
    NATURAL FULL OUTER JOIN Commandes_Ameriques;

CREATE OR REPLACE VIEW Details_Commandes AS
    SELECT * 
    FROM Details_Commandes_Europe_Du_Nord
    NATURAL FULL OUTER JOIN Details_Commandes_Autres
    NATURAL FULL OUTER JOIN Details_Commandes_Europe_Du_Sud
    NATURAL FULL OUTER JOIN Details_Commandes_Ameriques;

CREATE OR REPLACE VIEW Stock AS
    SELECT * 
    FROM Stock_Europe_Du_Nord
    NATURAL FULL OUTER JOIN Stock_Autres
    NATURAL FULL OUTER JOIN Stock_Europe_Du_Sud
    NATURAL FULL OUTER JOIN Stock_Ameriques;
