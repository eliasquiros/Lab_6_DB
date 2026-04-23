DELIMITER //

--Llave 1

CREATE FUNCTION fn_cernidor(id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

    DECLARE i INT DEFAULT 2;
    DECLARE es_primo BOOLEAN DEFAULT TRUE;

    IF id <= 1 THEN
        RETURN FALSE;
    END IF;

    WHILE i <= SQRT(id) AND es_primo = TRUE DO
        IF id % i = 0 THEN
            SET es_primo = FALSE;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN es_primo;

END //

-- Llave 2

CREATE FUNCTION fn_reloj_arena(fecha_ingreso DATE, meses_validez INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE fecha_actual DATE;
    DECLARE fecha_vencimiento DATE;

    SET fecha_actual = CURRENT_DATE();

    SET fecha_vencimiento = DATE_ADD(fecha_ingreso, INTERVAL meses_validez MONTH);

    IF fecha_vencimiento >= fecha_actual THEN
        RETURN 'Fresco';
    ELSE
        RETURN 'Expirado';
    END IF;

END //

DELIMITER ;