-----------------------------------------------------------------------------------------
-- Procedimiento para agrega un usuario nuevo con lo básico:
CREATE OR REPLACE PROCEDURE registrar_usuario_simple(
    IN p_nombre VARCHAR,
    IN p_apellido VARCHAR,
    IN p_email VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO usuarios(nombre, apellido, email)
    VALUES (p_nombre, p_apellido, p_email);
END;
$$;

-----------------------------------------------------------------------------------------
-- Procedimiento para crea un incidente
CREATE OR REPLACE PROCEDURE registrar_incidente_basico(
    IN p_patineta_id INT,
    IN p_tipo_incidente VARCHAR,
    IN p_descripcion TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO incidentes(patineta_id, tipo_incidente, descripcion)
    VALUES (p_patineta_id, p_tipo_incidente, p_descripcion);
END;
$$;

-----------------------------------------------------------------------------------------
-- Procedimiento para iniciar un nuevo alquiler

CREATE OR REPLACE PROCEDURE iniciar_alquiler(
    p_usuario_id INT,
    p_patineta_id INT,
    p_tarifa_id INT,
    p_metodo_pago_id INT,
    p_estado_alquiler_id INT DEFAULT 1 -- 1 activo, 2 completado
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF disponibilidad_patineta(p_patineta_id) THEN
        INSERT INTO alquileres (usuario_id, patineta_id, tarifa_id, metodo_pago_id, estado_alquiler_id) 
        VALUES (p_usuario_id, p_patineta_id, p_tarifa_id, p_metodo_pago_id, p_estado_alquiler_id);

        UPDATE patinetas
        SET estado_id = 2 WHERE patineta_id = p_patineta_id;
	END IF; --actualiza el estado de la patineta a en uso
END;
$$;

CALL iniciar_alquiler(10, 1, 9, 1, 1);

-----------------------------------------------------------------------------------------
-- Procedimiento para finalizar un alquiler

CREATE OR REPLACE PROCEDURE finalizar_alquiler(aid INT)
LANGUAGE plpgsql
AS $$
DECLARE
    var_tarifa_id INT;
    var_patineta_id INT;
    var_inicio TIMESTAMP;
    var_duracion INT;
    var_costo DECIMAL(10,2);
BEGIN
    SELECT tarifa_id, patineta_id, fecha_hora_inicio
    INTO var_tarifa_id, var_patineta_id, var_inicio
    FROM alquileres
    WHERE alquiler_id = aid;

    var_duracion := EXTRACT(EPOCH FROM (NOW() - var_inicio)) / 60;  --calcula la duración del viaje en minutos. EXTRACT(EPOCH FROM intervalo) obtiene los segundos entre NOW() y v_inicio. y se divide en 60 para obtener el resultad en minutos

    var_costo := calcular_costo_estimado(var_tarifa_id, var_duracion); --calcula costo estimado con la funcion del mismo nombre

    UPDATE alquileres
    SET fecha_hora_fin = NOW(),
        duracion_minutos = var_duracion,
        costo_total = var_costo,
        estado_alquiler_id = 2
    WHERE alquiler_id = aid;  --agrega informacion al alquiler que se finaliza

    UPDATE patinetas
    SET estado_id = 1 WHERE patineta_id = var_patineta_id; --actualiza el estado de la patineta a en matenimiento
END;
$$;

-----------------------------------------------------------------------------------------
-- Procedimiento para registrar mantenimiento preventivo

CREATE OR REPLACE PROCEDURE registrar_mantenimiento_preventivo(
    pid INT, -- id patineta
    p_descripcion TEXT,
    p_usuario_tecnico_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO mantenimientos (
        patineta_id, usuario_tecnico_id, tipo_mantenimiento, fecha_hora_inicio, descripcion
    ) VALUES (
        pid, p_usuario_tecnico_id, 'Preventivo', NOW(), p_descripcion
    );

    UPDATE patinetas
    SET estado_id = 3 WHERE patineta_id = p_patineta_id; --actualiza el estado de la patineta a en matenimiento
END;
$$;

-----------------------------------------------------------------------------------------