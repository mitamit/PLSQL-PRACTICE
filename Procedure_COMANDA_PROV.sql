CREATE OR REPLACE PROCEDURE COMANDA_A_PROV (v_cod_prod PEDIDO_PROVEEDOR.COD_PROD%TYPE)
IS

v_cod_prov pedido_proveedor.cod_proveedor%TYPE;
v_stock almacen.stock%TYPE;
v_cantidad pedido_proveedor.cantidad%TYPE;
v_numeroUnit ALMACEN.STOCK%TYPE;

BEGIN
v_numeroUnit := UNITATS_A_DEMANAR(COD_PROD);

UPDATE PEDIDO_PROVEEDOR SET cantidad = v_numeroUnit WHERE v_cod_prov =(SELECT v_cod_prov FROM PEDIDO_PROVEEDOR WHERE v_cod_prod = cod_prod);
UPDATE ALMACEN SET stock =(stock + v_numeroUnit) WHERE v_cod_prod = cod_prod;

END;
