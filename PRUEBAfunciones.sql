CREATE OR REPLACE FUNCTION Q_PROD 
(p_dept dept.deptno%TYPE)

RETURN VARCHAR2
IS
  v_loc dept.loc%TYPE;

BEGIN
  SELECT loc INTO v_loc FROM dept WHERE deptno = p_dept;
  RETURN v_loc;
END;
--------------------------------------
/*LLAMADA A LA FUNCION*/
ACCEPT var1 PROMPT 'Inserte un departamento'
DECLARE
v_dept NUMBER := &var1;

DECLARE
v_devuelve dept.loc%TYPE;
BEGIN
v_devuelve:=Q_PROD(10);
DBMS_OUTPUT.PUT_LINE(v_devuelve);
END;
