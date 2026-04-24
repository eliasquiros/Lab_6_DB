CREATE FUNCTION fn_purificador(p_nombre_sucio VARCHAR (100))
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN 
    DECLARE v_nuevo_nombre VARCHAR (100);
    
    SET v_nuevo_nombre = REGEXP_REPLACE(p_nombre_sucio, '[^a-zA-ZáéíóúÁÉÍÓÚñÑ]', '');
    
    SET v_nuevo_nombre = TRIM(v_nuevo_nombre);

    RETURN v_nuevo_nombre;
END;