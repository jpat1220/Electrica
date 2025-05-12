-----------------------------------------------------------------------------------------
-- Funcion que devuelve el nombre de la marca a partir de su ID:
CREATE OR REPLACE FUNCTION obtener_nombre_marca(mid INT)
RETURNS VARCHAR AS $$
DECLARE
    resultado VARCHAR;
BEGIN
    SELECT nombre INTO resultado FROM marcas WHERE marca_id = mid;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

--SELECT obtener_nombre_marca(1);

-----------------------------------------------------------------------------------------
-- Funcion que devuelve el número total de alquileres de un usuario:
CREATE OR REPLACE FUNCTION total_alquileres_usuario(uid INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM alquileres WHERE usuario_id = uid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

--SELECT total_alquileres_usuario(2);

-----------------------------------------------------------------------------------------
-- Función para calcular el costo de un alquiler en tiempo real

CREATE OR REPLACE FUNCTION calcular_costo_estimado(tarifa INT, duracion INT)
RETURNS DECIMAL(10,2) AS $$
DECLARE
    costo_minuto DECIMAL(6,2);
    costo_unlock DECIMAL(6,2);
    total DECIMAL(10,2);
BEGIN
    SELECT costo_por_minuto, costo_desbloqueo
    INTO costo_minuto, costo_unlock
    FROM tarifas
    WHERE tarifa_id = tarifa;

    total := (costo_minuto * duracion) + costo_unlock;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

--SELECT calcular_costo_estimado(4,5);

-----------------------------------------------------------------------------------------
-- Función para verificar disponibilidad de una patineta

CREATE OR REPLACE FUNCTION disponibilidad_patineta(pid INT)
RETURNS BOOLEAN AS $$
DECLARE 
	estado_actual VARCHAR;
BEGIN
    SELECT ep.nombre INTO estado_actual 
    FROM patinetas pa
	JOIN estados_patineta ep ON pa.estado_id = ep.estado_id WHERE pa.patineta_id = pid;

    RETURN estado_actual = 'Disponible';
END;
$$ LANGUAGE plpgsql;

--SELECT disponibilidad_patineta(1);

-----------------------------------------------------------------------------------------