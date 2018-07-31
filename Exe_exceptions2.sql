SET SERVEROUTPUT ON

ACCEPT cantidad_sal PROMPT '-Introduzca el salario a consultar-'; 

DECLARE

cantidad NUMBER(7):= &cantidad_sal;
numbr number(7);
salario_max number(7);
salario_min number(7);

BEGIN

salario_max := cantidad + 100;
salario_min := cantidad - 100;

SELECT COUNT(ename) INTO numbr FROM EMP WHERE SAL between salario_min AND salario_max;

IF numbr = 0 THEN
RAISE NO_DATA_FOUND;

ELSE
DBMS_OUTPUT.PUT_LINE('HAY ' || numbr || ' empleados con salario entre los parametros');
END IF;

EXCEPTION

WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('Ningún empleado entre estos parámetros!!');

WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR DESCONOCIDO, vuelva a intentarlo.');

END;