CREATE OR REPLACE PROCEDURE MENSAJE_SAL
IS
  v_ename emp.ename%type;
  v_sal emp.sal%type;
  CURSOR seleccion_emple IS 
    SELECT ename, sal FROM emp;
    
BEGIN
  OPEN seleccion_emple;
  FETCH seleccion_emple INTO v_ename, v_sal;
  WHILE seleccion_emple%FOUND LOOP
    IF v_sal<1000 THEN
      INSERT INTO messages VALUES( v_ename || 'tiene poco salario');
    ELSE
      INSERT INTO messages VALUES (v_ename || 'gana + de 1000');
    END IF;
  FETCH seleccion_emple INTO v_ename, v_sal;
  END LOOP;
  CLOSE seleccion_emple;
END;
  



