-----------------------------------------------------------------------------------------
-- Consulta de Patinetas Disponibles con su Ubicación Actual

SELECT pa.patineta_id, mar.nombre AS marca, mo.nombre AS modelo, ubi.latitud, ubi.longitud, ubi.fecha_hora_registro AS tiempo
FROM patinetas pa
JOIN estados_patineta ep ON pa.estado_id = ep.estado_id
JOIN modelos mo ON pa.modelo_id = mo.modelo_id
JOIN marcas mar ON mo.marca_id = mar.marca_id
JOIN (SELECT DISTINCT ON (patineta_id) * FROM ubicaciones ORDER BY patineta_id, fecha_hora_registro DESC) ubi ON pa.patineta_id = ubi.patineta_id
WHERE ep.nombre = 'Disponible';

-----------------------------------------------------------------------------------------
-- Consulta de Alquileres Activos con Detalles de Usuario y Patineta

SELECT alq.alquiler_id, usu.nombre AS usuario, pa.patineta_id, pa.modelo_id, mar.nombre AS marca, alq.fecha_hora_inicio
FROM alquileres alq
JOIN usuarios usu ON alq.usuario_id = usu.usuario_id
JOIN patinetas pa ON alq.patineta_id = pa.patineta_id
JOIN modelos mo ON pa.modelo_id = mo.modelo_id 
JOIN marcas mar ON mo.marca_id = mar.marca_id
WHERE alq.estado_alquiler_id = 1; -- 1 es activo

-----------------------------------------------------------------------------------------
-- Consulta de Ingresos por Período (Agrupado por Mes)

SELECT TO_CHAR(fecha_hora_fin, 'YYYY-MM') AS periodo, SUM(costo_total) AS ingresos_totales
FROM alquileres
WHERE estado_alquiler_id = 2 -- Solo alquileres finalizados
GROUP BY TO_CHAR(fecha_hora_fin, 'YYYY-MM')
ORDER BY periodo;

-----------------------------------------------------------------------------------------
-- Consulta de Mantenimientos Pendientes y Patinetas que los Necesitan

SELECT man.mantenimiento_id, pa.patineta_id, pa.codigo_serie, pa.modelo_id, man.tipo_mantenimiento, man.fecha_hora_inicio, man.descripcion FROM mantenimientos man
JOIN patinetas pa ON man.patineta_id = pa.patineta_id
WHERE man.fecha_hora_fin IS NULL -- mantenimientos que aun no han terminado
ORDER BY man.fecha_hora_inicio;

-----------------------------------------------------------------------------------------
-- Consulta de Uso por Patineta (Top 10 más utilizadas)

SELECT p.patineta_id, m.nombre AS marca, COUNT(a.alquiler_id) AS total_alquileres FROM alquileres a 
JOIN patinetas p ON a.patineta_id = p.patineta_id 
JOIN modelos mo ON p.modelo_id = mo.modelo_id 
JOIN marcas m ON mo.marca_id = m.marca_id 
GROUP BY p.patineta_id, m.nombre 
ORDER BY total_alquileres DESC 
LIMIT 10;

-----------------------------------------------------------------------------------------