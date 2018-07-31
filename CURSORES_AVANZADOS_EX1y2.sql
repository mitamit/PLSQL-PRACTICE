DECLARE

CURSOR dept_cursor IS 
SELECT deptno FROM dept ORDER BY deptno;

CURSOR emp_cursor(p_deptno NUMBER) IS 
SELECT ename FROM emp WHERE deptno = p_deptno FOR UPDATE NOWAIT;
v_current_deptno dept.deptno%TYPE;
v_emp VARCHAR2(50);


BEGIN

DELETE FROM messages;

OPEN dept_cursor;
LOOP
FETCH dept_cursor INTO v_current_deptno;
EXIT WHEN dept_cursor%NOTFOUND;
IF emp_cursor%ISOPEN THEN
CLOSE emp_cursor;
END IF;

OPEN emp_cursor(v_current_deptno);
LOOP
FETCH emp_cursor INTO v_emp;
EXIT WHEN emp_cursor%NOTFOUND;
INSERT INTO messages VALUES (v_emp || ' ' || v_current_deptno);
UPDATE emp SET SAL = SAL + SAL*10/100 WHERE CURRENT OF emp_cursor;
END LOOP;
CLOSE emp_cursor;
END LOOP;
CLOSE dept_cursor;

END;