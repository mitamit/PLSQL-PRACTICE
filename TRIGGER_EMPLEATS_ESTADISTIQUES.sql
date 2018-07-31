CREATE OR REPLACE TRIGGER estadistica
AFTER INSERT ON Empleados
FOR EACH ROW

DECLARE
v_provincia CodiPostal.CO%TYPE;
v_empleados ESTADISTICAS.Empleats%TYPE;

BEGIN

SELECT c.provincia into v_provincia from CodiPostal  c, Domicilis d WHERE :new.DNI = d.DNI and d.CP = c.CO;
SELECT Empleados into v_empleados FROM ESTADISTICAS WHERE Provincia = v_provincia;  
SELECT SouMig into v_SouMig FROM ESTADISTICAS WHERE Provincia = v_provincia;
SELECT SouMax into v_SouMax FROM ESTADISTICAS WHERE Provincia = v_provincia;
SELECT SouMin into v_SouMin FROM ESTADISTICAS WHERE Provincia = v_provincia;

IF :NEW.SOU > v_SouMax THEN
v_SouMax := :new.sou;
END IF;

IF :NEW.SOU < v_SouMin THEN
v_SouMin := :new.sou;
END IF;

UPDATE ESTADISTICAS SET Empleados = v_empleados WHERE Provincia = v_Provincia;
UPDATE ESTADISTICAS SET SouMig = (v_SouMig * v_empleados) + :new.sou / v_empleados + 1 WHERE Provincia = v_Provincia;
UPDATE ESTADISTICAS SET SouMax = v_SouMax WHERE Provincia = v_Provincia; 
UPDATE ESTADISTICAS SET SouMin = v_SouMin WHERE Provincia = v_Provincia;




END;