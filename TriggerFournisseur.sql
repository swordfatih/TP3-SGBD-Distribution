CREATE OR REPLACE TRIGGER Fk_Fournisseur
BEFORE INSERT OR UPDATE ON Produits
FOR EACH ROW
DECLARE
  CURSOR cNo_Fournisseur IS
  SELECT No_Fournisseur
  FROM Fournisseurs;
BEGIN
  FOR No_F IN cNo_Fournisseur
  LOOP
    IF No_F.No_Fournisseur = :new.No_Fournisseur THEN
      RETURN;
    END IF;
  END LOOP;
  RAISE_APPLICATION_ERROR(-20001, 'Il n''y a pas de fournisseur avec le code correspondant');
END;