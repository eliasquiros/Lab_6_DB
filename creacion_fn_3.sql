DELIMITER $$

CREATE FUNCTION fn_espia_tortuga(p_categoria VARCHAR(100), p_precio_finca DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE p_precio_mercado DECIMAL(10, 2);
    DECLARE p_factor DECIMAL(10, 2);
    
    -- Paso 2: Obtener precio promedio de mercado
    SELECT AVG(mn.precio_referencia) INTO p_precio_mercado
    FROM mercado_negro mn
    WHERE mn.categoria = p_categoria;
    
    -- Paso 4: Asignar factor según comparación
    IF p_precio_finca > p_precio_mercado THEN
        SET p_factor = 1.2;
    ELSE
        SET p_factor = 0.8;
    END IF;
    
    -- Retornar precio con factor aplicado
    RETURN p_precio_finca * p_factor;
END$$

DELIMITER ;