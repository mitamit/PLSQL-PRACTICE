CREATE OR REPLACE TRIGGER CALCULA_FACTURA 
AFTER INSERT OR DELETE ON MISPEDIDOS 
FOR EACH ROW

DECLARE

v_factura MISFACTURAS.FACTURA%TYPE;
v_importe MISFACTURAS.IMPORTE%TYPE;

BEGIN 

SELECT FACTURA INTO v_factura FROM MISFACTURAS WHERE factura = :new.factura;
SELECT IMPORTE INTO v_importe FROM MISFACTURAS WHERE factura = :new.factura;

IF INSERTING THEN
UPDATE MISFACTURAS SET IMPORTE = v_importe + :new.precio where v_factura = :new.factura;
IMPRIME('LA TABLA MISFACTURAS SE HA MODIFICADO CORRECTAMENTE');
end if;

IF DELETING THEN 
UPDATE MISFACTURAS SET IMPORTE = v_importe - :old.precio WHERE v_factura = :old.factura;
IMPRIME('LA TABLA MISFACTURAS SE HA MODIFICADO CORRECTAMENTE');
END IF;


END;