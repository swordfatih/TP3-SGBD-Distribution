CREATE OR REPLACE TRIGGER Delete_Produit_Fk
BEFORE DELETE ON Produits
FOR EACH ROW
DECLARE
  CURSOR cRef_Produit IS
  SELECT Ref_Produit
  FROM Details_Commandes_Europe_du_Nord UNION 
  (SELECT Ref_Produit
  FROM Details_Commandes_Autres) UNION
  (SELECT Ref_Produit
  FROM Stock_Europe_du_Nord) UNION
  (SELECT Ref_Produit
  FROM Stock_Autres);
BEGIN
  FOR Ref_P IN cRef_Produit
  LOOP
    IF Ref_P.Ref_Produit = :old.Ref_Produit THEN
      RAISE_APPLICATION_ERROR(-20003, 'Le produit est en stock. Impossible de le supprimer.');
    END IF;
  END LOOP;
END;