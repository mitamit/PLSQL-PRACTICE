
create or replace TRIGGER SUELDO_NETO_CURSOR
AFTER INSERT ON PORCENTAJEIRPF
FOR EACH ROW
DECLARE
--VARIABLES IRPF
v_id NUMBER;
v_sueldo INTEGER;
v_porcentaje INTEGER;
v_irpf INTEGER;
--
v_dni INTEGER;
v_ss INTEGER;
v_sueldo_neto INTEGER;
v_num_filas INTEGER;
--CURSOR------- PASAMOS LA CONSULTA QUE NOS GENERA MAS DE UN RESULTADO AL CURSOR
CURSOR c_irpf IS 
SELECT DNI
FROM CORRESPONDE
WHERE ID = v_id;


BEGIN
v_id := :NEW.ID;
v_porcentaje := :NEW.PORCENTAJE;

--OBTENEMOS EL DNI DEL ID INTRODUCIDO --CURSOR-------------------------

OPEN c_irpf;
	LOOP
		FETCH c_irpf INTO v_dni;
		EXIT WHEN c_irpf%NOTFOUND;
    v_num_filas := c_irpf%ROWCOUNT;
    
    --OBTENEMOS EL SUELDO BASE DEL DNI
SELECT  "Sueldo base",  "Retención SS"
INTO v_sueldo, v_ss
FROM EMPLEADOS
WHERE DNI = v_dni;

--OBTENEMOS EL IRPF
v_irpf := v_sueldo * v_porcentaje / 100;
--OBTENEMOS EL SUELDO NETO
v_sueldo_neto := v_sueldo - v_irpf - v_ss;

UPDATE EMPLEADOS SET  "Retención IRPF" = v_irpf
WHERE DNI = v_dni;
UPDATE EMPLEADOS SET "Sueldo neto" = v_sueldo_neto
WHERE DNI = v_dni;

DBMS_OUTPUT.PUT_LINE('Numero de fila: '||v_num_filas||'-------------------------------------------');
DBMS_OUTPUT.PUT_LINE('EL SUELDO NETO DEL EMPLEADO CON EL DNI : '||v_dni||' ES DE : '||v_sueldo_neto||' €');
DBMS_OUTPUT.PUT_LINE(v_porcentaje || '% DE IRPF SOBRE UN SUELDO BASE DE : (' ||v_sueldo||') QUE SON:'||v_irpf||'€');
DBMS_OUTPUT.PUT_LINE('MENOS '||v_ss || '€ DE SEGURIDAD SOCIAL');
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');

	END LOOP;
	CLOSE c_irpf;
  
  EXCEPTION 
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('EXCEPCION: NO HAY REGISTROS QUE COINCIDAN CON LOS DATOS INTRODUCIDOS');
DBMS_OUTPUT.PUT_LINE('PRUEBA CON OTRO ID');


END;