SET SERVEROUTPUT ON

ACCEPT numero PROMPT 'ESCRIBA UN NUMERO';

DECLARE

v_numero INTEGER := &numero;
v_ename EMP.ENAME%TYPE;
v_sal EMP.SAL%TYPE;

CURSOR sueldos_mayor IS
  SELECT ename, sal FROM EMP ORDER BY SAL DESC;


BEGIN 

OPEN sueldos_mayor;
LOOP
FETCH sueldos_mayor INTO v_ename, v_sal;
EXIT WHEN sueldos_mayor%ROWCOUNT > v_numero;
INSERT INTO TOP_EMPLE(ename, sal) VALUES (v_ename, v_sal);

END LOOP;
CLOSE sueldos_mayor;


END;