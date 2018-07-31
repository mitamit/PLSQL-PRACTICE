SET SERVEROUTPUT ON



ACCEPT cad PROMPT 'Inserte una frase';

DECLARE

cadena VARCHAR2(50):=&cad;
longitud INTEGER;
letra VARCHAR2(1);
resultado VARCHAR2(50):= '';

BEGIN

FOR i IN 1..LENGTH(cadena) LOOP

letra:= substr(cadena, length(cadena)-i +1, 1);


IF
letra NOT IN ('a', 'A', 'E', 'I', 'O', 'U', 'e', 'i', 'o', 'u') THEN
resultado := CONCAT(resultado, letra);


END IF;

END LOOP;

DBMS_OUTPUT.PUT_LINE(resultado);
END;

--frase al revés y sin vocales
  









  
