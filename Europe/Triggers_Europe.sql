-- clés étrangères externes Commandes vers Employes
CREATE OR REPLACE TRIGGER T_FK_Commandes_Europe_Du_Nord_Employes
BEFORE INSERT OR UPDATE ON Commandes_Europe_Du_Nord
FOR EACH ROW
DECLARE
    CURSOR Curseur_Employe IS
        SELECT NO_EMPLOYE
        FROM Employes;
BEGIN
    FOR No_E IN Curseur_Employe
    LOOP
        IF No_E.NO_EMPLOYE = :NEW.NO_EMPLOYE THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'L employé n existe pas');
END;
/
CREATE OR REPLACE TRIGGER T_FK_Commandes_Autres_Employes
BEFORE INSERT OR UPDATE ON Commandes_Autres
FOR EACH ROW
DECLARE
    CURSOR Curseur_Employe IS
        SELECT NO_EMPLOYE
        FROM Employes;
BEGIN
    FOR No_E IN Curseur_Employe
    LOOP
        IF No_E.NO_EMPLOYE = :NEW.NO_EMPLOYE THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'L employé n existe pas');
END;
/
-- clés étrangères externes Stock vers Produits
CREATE OR REPLACE TRIGGER T_FK_Stock_Europe_Du_Nord_Produits
BEFORE INSERT OR UPDATE ON Stock_Europe_Du_Nord
FOR EACH ROW
DECLARE
    CURSOR Curseur_Produits IS
        SELECT REF_PRODUIT
        FROM Produits;
BEGIN
    FOR Ref_P IN Curseur_Produits
    LOOP
        IF Ref_P.REF_PRODUIT = :NEW.REF_PRODUIT THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'Le produit n existe pas');
END;
/
CREATE OR REPLACE TRIGGER T_FK_Stock_Autres_Produits
BEFORE INSERT OR UPDATE ON Stock_Autres
FOR EACH ROW
DECLARE
    CURSOR Curseur_Produits IS
        SELECT REF_PRODUIT
        FROM Produits;
BEGIN
    FOR Ref_P IN Curseur_Produits
    LOOP
        IF Ref_P.REF_PRODUIT = :NEW.REF_PRODUIT THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'Le produit n existe pas');
END;
/
-- clés étrangères externes Details Commandes vers Produits
CREATE OR REPLACE TRIGGER T_FK_Details_Commandes_Europe_Du_Nord_Produits
BEFORE INSERT OR UPDATE ON Details_Commandes_Europe_Du_Nord
FOR EACH ROW
DECLARE
    CURSOR Curseur_Produits IS
        SELECT REF_PRODUIT
        FROM Produits;
BEGIN
    FOR Ref_P IN Curseur_Produits
    LOOP
        IF Ref_P.REF_PRODUIT = :NEW.REF_PRODUIT THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'Le produit n existe pas');
END;
/
CREATE OR REPLACE TRIGGER T_FK_Details_Commandes_Autres_Produits
BEFORE INSERT OR UPDATE ON Details_Commandes_Autres
FOR EACH ROW
DECLARE
    CURSOR Curseur_Produits IS
        SELECT REF_PRODUIT
        FROM Produits;
BEGIN
    FOR Ref_P IN Curseur_Produits
    LOOP
        IF Ref_P.REF_PRODUIT = :NEW.REF_PRODUIT THEN
            RETURN;
        END IF;
    END LOOP;

    RAISE_APPLICATION_ERROR(-20001, 'Le produit n existe pas');
END;
/
-- contrainte suppression de fournisseur
CREATE OR REPLACE TRIGGER T_FK_Fournisseurs_Produits
BEFORE DELETE ON Fournisseurs
FOR EACH ROW
DECLARE
    CURSOR Curseur_Produits IS
        SELECT NO_FOURNISSEUR
        FROM Produits;
BEGIN
    FOR Ref_P IN Curseur_Produits
    LOOP
        IF Ref_P.NO_FOURNISSEUR = :NEW.NO_FOURNISSEUR THEN
            RAISE_APPLICATION_ERROR(-20001, 'Le fournisseur est associé à un produit. Impossible de le supprimer.');
        END IF;
    END LOOP;
END;