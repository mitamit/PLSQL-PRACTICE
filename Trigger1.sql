SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER calcula_porcentajes 
AFTER INSERT ON PORCENTAJE_IRPF
FOR EACH ROW

DECLARE
v_dni CORRESPONDE.DNI%TYPE;
salar NUMBER(8, 2);
reten NUMBER(8, 2);

BEGIN




/*
SELECT DNI into v_dni from EMPLEADOS where (SELECT ID FROM CORRESPONDE WHERE CORRESPONDE.DNI = EMPLEADOS.DNI)= :new.id;
SELECT sueldo_base into salar FROM EMPLEADOS WHERE (SELECT ID FROM CORRESPONDE WHERE CORRESPONDE.DNI = EMPLEADOS.DNI)= :new.id;
SELECT Retencion_IRPF INTO reten FROM EMPLEADOS WHERE (SELECT ID FROM CORRESPONDE WHERE CORRESPONDE.DNI = EMPLEADOS.DNI)= :new.id;
UPDATE EMPLEADOS SET reten = (salar * :new.PORCENTAJE / 100) WHERE DNI = v_dni;
*/

/*
SELECT DNI into v_dni FROM CORRESPONDE WHERE CORRESPONDE.ID = :new.ID;
SELECT Sueldo_base into salar FROM EMPLEADOS WHERE EMPLEADOS.DNI = v_dni;
SELECT Retencion_SS into reten FROM EMPLEADOS WHERE EMPLEADOS.DNI = v_dni;
UPDATE EMPLEADOS SET Retencion_IRPF = salar * :new.PORCENTAJE / 100 WHERE DNI = v_dni;
UPDATE EMPLEADOS SET Sueldo_neto = salar - RETENCION_IRPF - reten WHERE DNI = v_dni;
IMPRIME(v_dni);
*/

END;


