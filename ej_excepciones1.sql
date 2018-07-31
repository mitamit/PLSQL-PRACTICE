SET SERVEROUTPUT ON

ACCEPT sueldo PROMPT 'Introduzca un sueldo';

DECLARE 

v_sueldo NUMBER(7) := &sueldo;
v_ename emp.ename%TYPE;
v_sal emp.sal%TYPE := 0;
v_una_fila EXCEPTION;
s_ename emp.ename%type;

BEGIN

SELECT ename into s_ename FROM EMP WHERE sal = v_sueldo;
SELECT COUNT(ename) into v_ename FROM EMP WHERE sal = v_sueldo;

IF v_ename = 0 THEN
RAISE NO_DATA_FOUND;
END IF;
IF v_ename = 1 THEN
RAISE v_una_fila;
END IF;
IF v_ename > 1 THEN
RAISE TOO_MANY_ROWS;
END IF;





EXCEPTION

WHEN TOO_MANY_ROWS THEN
INSERT INTO MESSAGES VALUES('Más de un empleado con sueldo ' || v_sueldo);
DBMS_OUTPUT.put_line('MAS DE UN EMPLEADO CON EL SUELDO ' || v_sueldo);

WHEN NO_DATA_FOUND THEN
INSERT INTO MESSAGES VALUES('Ningún empleado con salario de' || v_sueldo);
DBMS_OUTPUT.put_line('NINGÚN EMPLEADO CON EL SALARIO DE' || ' ' || v_sueldo);

WHEN v_una_fila THEN
INSERT INTO MESSAGES VALUES(s_ename || '  ' || v_sueldo);
DBMS_OUTPUT.put_line(s_ename || ' ' || v_sueldo);

WHEN OTHERS THEN
INSERT INTO MESSAGES VALUES('Se produjo algún otro error');
DBMS_OUTPUT.put_line('SE PRODUJO ALGÚN OTRO ERROR');

END;