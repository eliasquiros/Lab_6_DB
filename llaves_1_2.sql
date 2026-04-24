DELIMITER //

-- Llave 1

CREATE FUNCTION fn_cernidor(p_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

    DECLARE p_i INT DEFAULT 2;
    DECLARE p_es_primo BOOLEAN DEFAULT TRUE;

    IF p_id IS NULL THEN
        RETURN NULL;
    END IF;

    IF p_id <= 1 THEN
        RETURN FALSE;
    END IF;

    WHILE p_i <= SQRT(p_id) AND p_es_primo = TRUE DO
        IF p_id % p_i = 0 THEN
            SET p_es_primo = FALSE;
        END IF;
        SET p_i = p_i + 1;
    END WHILE;

    RETURN p_es_primo;

END //

-- Llave 2

CREATE FUNCTION fn_reloj_arena(p_fecha_ingreso DATE, p_meses_validez INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE p_fecha_actual DATE;
    DECLARE p_fecha_vencimiento DATE;

    IF p_fecha_ingreso IS NULL OR p_meses_validez IS NULL THEN
        RETURN NULL;
    END IF;

    SET p_fecha_actual = CURRENT_DATE();

    SET p_fecha_vencimiento = DATE_ADD(p_fecha_ingreso, INTERVAL p_meses_validez MONTH);

    IF p_fecha_vencimiento >= p_fecha_actual THEN
        RETURN 'Fresco';
    ELSE
        RETURN 'Expirado';
    END IF;

END //

DELIMITER ;