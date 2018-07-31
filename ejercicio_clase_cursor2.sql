/*Dado un departamento, incrementar el salario un 10% para sus empleados que
ganen <1500, si ganan >1500 insertar en messages que no se le sube el sueldo*/

CREATE OR REPLACE PROCEDURE actualiza_sal
( midept emp.deptno%type)
IS
  v_ename emp.ename%type;
  v_sal emp.sal%type;
  v_empno emp.empno%type;
  CURSOR seleccion_emple IS 
    SELECT  empno, ename, sal FROM emp
    WHERE deptno=midept;
    
BEGIN
  OPEN seleccion_emple;
  FETCH seleccion_emple INTO v_empno, v_ename, v_sal;
  WHILE seleccion_emple%FOUND LOOP
    IF v_sal>=1500 THEN
      INSERT INTO messages VALUES( v_ename || 'no se le sube el salario');
    ELSE
      UPDATE emp SET sal=sal*1.10 where empno=v_empno;
    END IF;
  FETCH seleccion_emple INTO v_empno, v_ename, v_sal;
  END LOOP;
  CLOSE seleccion_emple;
END;
  



