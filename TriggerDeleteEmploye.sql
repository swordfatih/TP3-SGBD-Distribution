
CREATE OR REPLACE TRIGGER Delete_Employe_Fk
BEFORE DELETE ON Employes
FOR EACH ROW
DECLARE
  CURSOR cNo_Employe IS
  SELECT No_Employe
  FROM Commandes_Europe_du_Nord UNION 
  (SELECT No_Employe
  FROM Commandes_Autres);
BEGIN
  FOR No_E IN cNo_Employe
  LOOP
    IF No_E.No_Employe = :old.No_Employe THEN
      RAISE_APPLICATION_ERROR(-20002, 'Le employé est affecte à une commande. Impossible de le supprimer.');
    END IF;
  END LOOP;
END;