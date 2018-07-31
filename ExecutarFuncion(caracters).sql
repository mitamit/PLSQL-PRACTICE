SET SERVEROUTPUT ON



DECLARE

v_prueba VARCHAR2(50);



BEGIN


v_prueba := SUMA_NUM('6597852225522');


imprime(v_prueba);


END;