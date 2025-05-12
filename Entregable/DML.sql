-- Insertar estados básicos de patinetas
INSERT INTO estados_patineta (nombre, descripcion) VALUES 
('Disponible', 'Patineta en buen estado y disponible para alquiler'), -- 1
('En uso', 'Patineta actualmente alquilada'), -- 2
('Mantenimiento', 'Patineta en reparación o mantenimiento'), -- 3
('Inactiva', 'Patineta no disponible por algún motivo'); -- 4

-- Insertar tipos de usuario básicos
INSERT INTO tipos_usuario (nombre, descripcion) VALUES 
('Cliente', 'Usuario regular que alquila patinetas'), -- 1
('Técnico', 'Personal encargado de mantenimiento'), -- 2
('Administrador', 'Personal con acceso completo al sistema'); -- 3

-- Insertar métodos de pago comunes
INSERT INTO metodos_pago (nombre, descripcion) VALUES 
('Tarjeta Crédito', 'Pago con tarjeta de crédito'), -- 1
('Tarjeta Débito', 'Pago con tarjeta de débito'), -- 2
('PayPal', 'Pago a través de PayPal'), -- 3
('Transferencia', 'Transferencia bancaria'); -- 4

-- Insertar estados de alquiler
INSERT INTO estados_alquiler (nombre, descripcion) VALUES 
('Activo', 'Alquiler en curso'), -- 1
('Completado', 'Alquiler finalizado correctamente'), -- 2
('Cancelado', 'Alquiler cancelado por el usuario'), -- 3
('Problema', 'Alquiler con algún problema reportado'); -- 4

------------------------------------------------------------------------------------------------------------------------------

-- Insertar marcas
INSERT INTO marcas (nombre, pais_origen, fecha_fundacion, descripcion) VALUES
('Tesla', 'EE.UU.', '2003-07-01', 'Marca conocida por sus patinetas eléctricas de alto rendimiento y tecnología innovadora'),
('Boosted', 'EE.UU.', '2011-02-01', 'Marca enfocada en patinetas eléctricas con velocidad y autonomía destacables'),
('Xiaomi', 'China', '2010-04-06', 'Fabricante de patinetas con tecnología avanzada y precios accesibles'),
('Segway', 'EE.UU.', '1999-10-05', 'Marca pionera en la fabricación de vehículos de movilidad personal, incluyendo patinetas eléctricas'),
('Razor', 'EE.UU.', '2000-04-01', 'Famosa por sus patinetas eléctricas de bajo costo y modelos plegables'),
('Shark Wheel', 'EE.UU.', '2014-01-01', 'Marca que fabrica ruedas especiales para patinetas eléctricas con un diseño innovador'),
('Dualtron', 'Corea del Sur', '2015-06-12', 'Fabricante de patinetas eléctricas de alta gama con enfoque en potencia y autonomía'),
('VoroMotors', 'EE.UU.', '2018-01-01', 'Marca especializada en patinetas eléctricas potentes para usuarios exigentes'),
('Rion Motors', 'EE.UU.', '2010-03-15', 'Marca de patinetas eléctricas ultra rápidas y de alto rendimiento'),
('Inokim', 'Corea del Sur', '2009-05-05', 'Marca conocida por sus patinetas eléctricas ligeras y de calidad premium');

-- Insertar modelos de patinetas
INSERT INTO modelos (marca_id, nombre, year_lanzamiento, peso_kg, velocidad_max_kmh, autonomia_km, potencia_w) VALUES
(1, 'Model S', 2020, 12.50, 50.00, 60.00, 2500),
(1, 'Model X', 2021, 15.00, 55.00, 70.00, 3000),
(2, 'Mini S', 2018, 8.00, 30.00, 20.00, 1000),
(2, 'V2 Dual', 2020, 10.50, 45.00, 40.00, 1500),
(3, 'M365', 2017, 12.00, 25.00, 30.00, 500),
(3, 'Pro 2', 2020, 14.00, 25.00, 40.00, 600),
(4, 'Ninebot', 2016, 12.00, 25.00, 35.00, 700),
(4, 'ES4', 2019, 13.50, 30.00, 45.00, 800),
(5, 'E200', 2018, 10.00, 20.00, 15.00, 400),
(5, 'E300', 2021, 13.00, 22.00, 25.00, 450);

-- Insertar patinetas
INSERT INTO patinetas (modelo_id, estado_id, codigo_serie, fecha_compra, precio_compra, bateria_actual, fecha_ultimo_mantenimiento, notas) VALUES
(1, 1, 'SN1234A', '2020-05-10', 499.99, 100.00, '2021-05-15', 'Patineta de alta gama, poco uso'),
(2, 1, 'SN1234B', '2021-02-25', 599.99, 90.00, '2022-02-10', 'Modelos con mejor autonomía y velocidad'),
(3, 2, 'SN1234C', '2018-07-14', 299.99, 75.00, '2021-07-20', 'Uso frecuente, necesita revisión'),
(4, 3, 'SN1234D', '2020-06-30', 399.99, 60.00, '2021-06-25', 'Daño en la rueda trasera'),
(5, 1, 'SN1234E', '2020-03-05', 499.99, 80.00, '2022-03-10', 'Nuevo modelo con mayor capacidad de batería'),
(6, 2, 'SN1234F', '2019-08-10', 349.99, 65.00, '2021-09-30', 'Daños menores, en uso frecuente'),
(7, 4, 'SN1234G', '2020-12-20', 420.00, 40.00, '2021-10-15', 'No disponible, está en reparación'),
(8, 1, 'SN1234H', '2021-05-15', 560.00, 100.00, '2022-04-12', 'Alta demanda de alquiler, en buen estado'),
(9, 3, 'SN1234I', '2017-11-11', 270.00, 55.00, '2021-06-05', 'Patineta de 3 años, buena autonomía'),
(10, 2, 'SN1234J', '2021-01-01', 350.00, 85.00, '2022-01-20', 'De uso regular, requiere mantenimiento pronto');

-- Insertar ubicaciones de patinetas
INSERT INTO ubicaciones (patineta_id, latitud, longitud, velocidad_actual, bateria_en_ubicacion) VALUES
(1, 40.712776, -74.005974, 25.00, 80.00),
(2, 34.052235, -118.243683, 22.00, 70.00),
(3, 51.507351, -0.127758, 15.00, 65.00),
(4, 48.856613, 2.352222, 18.00, 50.00),
(5, 40.730610, -73.935242, 20.00, 60.00),
(6, 41.878113, -87.629799, 23.00, 90.00),
(7, 34.052235, -118.243683, 20.00, 45.00),
(8, 37.774929, -122.419418, 30.00, 95.00),
(9, 51.165691, 10.451526, 17.00, 50.00),
(10, 40.712776, -74.005974, 25.00, 80.00);

-- Insertar usuarios
INSERT INTO usuarios (tipo_usuario_id, nombre, apellido, email, telefono, fecha_nacimiento, direccion, documento_identidad) VALUES
(1, 'Tony', 'Stark', 'tony@starkindustries.com', '555-1234', '1970-05-29', 'Malibú, California', 'A12345678'),
(1, 'Morty', 'Smith', 'morty@smithfamily.com', '555-2345', '2005-02-18', 'Plumbus Avenue, Springfield', 'B23456789'),
(2, 'Ken', 'Kaneki', 'ken@tokyoghoul.com', '555-3456', '1991-06-09', 'Distrito 20, Tokio', 'C34567890'),
(1, 'Bruce', 'Wayne', 'bruce@wayneenterprise.com', '555-4567', '1980-02-19', 'Gotham City', 'D45678901'),
(3, 'Hermione', 'Granger', 'hermione@hogwarts.edu', '555-5678', '1979-09-19', 'Hogsmeade, Escocia', 'E56789012'),
(1, 'Rick', 'Sanchez', 'rick@c137.com', '555-6789', '1937-11-20', 'Mundo C-137', 'F67890123'),
(2, 'Natasha', 'Romanoff', 'natasha@shield.gov', '555-7890', '1984-11-22', 'Budapest, Hungría', 'G78901234'),
(1, 'Leia', 'Organa', 'leia@rebellion.org', '555-8901', '1981-04-07', 'Alderaan', 'H89012345'),
(3, 'Luke', 'Skywalker', 'luke@jediknight.com', '555-9012', '1977-05-25', 'Tatooine', 'I90123456'),
(1, 'Peter', 'Parker', 'peter@spiderman.com', '555-0123', '1995-08-10', 'Forest Hills, Nueva York', 'J01234567');

-- Insertar Tarifas
INSERT INTO tarifas (nombre, costo_por_minuto, costo_desbloqueo, descripcion, fecha_inicio_vigencia, fecha_fin_vigencia) VALUES
('Tarifa Básica', 0.25, 1.00, 'Tarifa por uso regular de patinetas', '2025-05-08', NULL),
('Tarifa Premium', 0.40, 1.50, 'Tarifa para usuarios frecuentes con descuentos', '2025-05-08', NULL),
('Tarifa Nocturna', 0.35, 1.20, 'Tarifa aplicable solo de noche', '2025-05-08', '2025-12-31'),
('Tarifa Estudiante', 0.20, 1.00, 'Tarifa con descuento para estudiantes universitarios', '2025-05-08', NULL),
('Tarifa Corporativa', 0.30, 1.00, 'Tarifa para empresas que alquilan patinetas en grupo', '2025-05-08', NULL),
('Tarifa Fin de Semana', 0.28, 1.10, 'Tarifa especial durante los fines de semana', '2025-05-08', '2025-08-31'),
('Tarifa Inactiva', 0.00, 0.00, 'Tarifa por patinetas inactivas o fuera de servicio', '2025-05-08', NULL),
('Tarifa Larga Distancia', 0.50, 2.00, 'Tarifa para alquileres de larga distancia', '2025-05-08', NULL),
('Tarifa de Emergencia', 0.60, 2.50, 'Tarifa de urgencia por uso en momentos especiales', '2025-05-08', NULL),
('Tarifa Viaje Corporativo', 0.45, 1.00, 'Tarifa aplicada a viajes corporativos con patinetas compartidas', '2025-05-08', NULL);

-- Insertar alquileres
INSERT INTO alquileres (usuario_id, patineta_id, tarifa_id, metodo_pago_id, estado_alquiler_id, fecha_hora_inicio, fecha_hora_fin, ubicacion_inicio_lat, ubicacion_inicio_lon, ubicacion_fin_lat, ubicacion_fin_lon, costo_total, distancia_recorrida_km, duracion_minutos, calificacion_usuario, comentarios_usuario) VALUES
(1, 1, 1, 1, 1, '2025-05-01 08:00:00', '2025-05-01 10:30:00', 40.712776, -74.005974, 40.730610, -73.935242, 20.00, 3.5, 150, 5, 'Excelente experiencia, muy rápida la patineta.'),
(2, 3, 2, 2, 2, '2025-05-02 09:15:00', '2025-05-02 11:00:00', 34.052235, -118.243683, 34.052235, -118.243683, 15.00, 2.5, 120, 4, 'Buen rendimiento, pero se podría mejorar la autonomía.'),
(3, 4, 3, 3, 3, '2025-05-03 14:00:00', '2025-05-03 14:45:00', 51.507351, -0.127758, 51.509865, -0.118092, 12.50, 1.8, 45, 4, 'El alquiler fue fácil, aunque la patineta no estaba completamente cargada.'),
(4, 2, 1, 4, 1, '2025-05-04 17:30:00', '2025-05-04 19:00:00', 48.856613, 2.352222, 48.856613, 2.362222, 25.00, 4.2, 90, 5, 'Muy buena experiencia, volveré a alquilar sin duda.'),
(5, 5, 3, 2, 2, '2025-05-05 11:45:00', '2025-05-05 13:15:00', 40.730610, -73.935242, 40.741895, -73.989308, 10.00, 1.2, 60, 3, 'La patineta funcionó bien, pero la tarifa es un poco cara.'),
(6, 3, 2, 3, 1, '2025-05-06 08:30:00', '2025-05-06 10:00:00', 52.3676, 4.9041, 52.3738, 4.8978, 22.00, 3.0, 120, 4, 'Muy buena patineta, pero me gustaría más autonomía.'),
(7, 4, 1, 1, 3, '2025-05-07 12:00:00', '2025-05-07 14:00:00', 48.8566, 2.3522, 48.8606, 2.3499, 18.00, 2.5, 90, 5, 'Una experiencia fantástica, altamente recomendada.'),
(8, 2, 3, 4, 2, '2025-05-08 10:15:00', '2025-05-08 12:30:00', 34.0522, -118.2437, 34.0522, -118.2437, 16.50, 3.0, 105, 4, 'Buen servicio y la patineta estuvo en excelente estado.'),
(9, 1, 1, 2, 3, '2025-05-09 14:00:00', '2025-05-09 16:30:00', 40.7128, -74.0060, 40.7306, -73.9352, 23.00, 3.2, 145, 5, 'Gran experiencia. Patineta rápida y cómoda.'),
(10, 5, 3, 3, 2, '2025-05-10 09:30:00', '2025-05-10 11:45:00', 52.3676, 4.9041, 52.3702, 4.8956, 19.00, 2.8, 110, 3, 'La patineta estuvo bien, pero la ubicación de inicio no era precisa.'),
(2, 3, 1, 1, 2, '2025-05-08 11:00:00', '2025-05-08 11:45:00', -34.613150, -58.377250, -34.612300, -58.380000, 5.50, 3.2, 45, 4, 'Muy buen viaje, aunque un poco lento al principio.');

-- Insertar pagos
INSERT INTO pagos (alquiler_id, metodo_pago_id, monto, estado_pago, transaccion_id) VALUES
(1, 1, 20.00, 'Pagado', 'TXN001234'),
(2, 2, 15.00, 'Pagado', 'TXN001235'),
(3, 3, 12.50, 'Pagado', 'TXN001236'),
(4, 4, 25.00, 'Pagado', 'TXN001237'),
(5, 2, 10.00, 'Pendiente', 'TXN001238'),
(6, 1, 22.00, 'Pagado', 'TXN001239'),
(7, 2, 18.00, 'Pagado', 'TXN001240'),
(8, 3, 16.50, 'Pagado', 'TXN001241'),
(9, 4, 23.00, 'Pagado', 'TXN001242'),
(10, 2, 19.00, 'Pendiente', 'TXN001243');

-- Insertar mantenimientos
INSERT INTO mantenimientos (patineta_id, usuario_tecnico_id, tipo_mantenimiento, fecha_hora_inicio, fecha_hora_fin, descripcion, costo, repuestos_cambiados) VALUES
(1, 2, 'Revisión de frenos', '2025-05-02 10:00:00', '2025-05-02 12:00:00', 'Revisión completa de frenos y llantas', 15.00, 'Freno trasero cambiado'),
(2, 3, 'Cambio de batería', '2025-05-04 08:30:00', '2025-05-04 10:30:00', 'Sustitución de batería por agotamiento', 20.00, 'Batería nueva instalada'),
(3, 2, 'Revisión general', '2025-05-03 14:00:00', '2025-05-03 15:00:00', 'Inspección general de la patineta', 10.00, 'Ningún repuesto cambiado'),
(4, 1, 'Revisión de ruedas', '2025-05-01 17:00:00', '2025-05-01 18:00:00', 'Reemplazo de ruedas delanteras', 12.50, 'Ruedas delanteras cambiadas'),
(5, 3, 'Mantenimiento preventivo', '2025-05-05 09:00:00', '2025-05-05 10:00:00', 'Revisión de sistema eléctrico y frenos', 18.00, 'Ningún repuesto cambiado'),
(6, 2, 'Revisión de frenos', '2025-05-06 10:00:00', '2025-05-06 12:00:00', 'Inspección de frenos', 15.00, 'Freno delantero ajustado'),
(7, 1, 'Cambio de ruedas', '2025-05-07 11:00:00', '2025-05-07 13:00:00', 'Reemplazo de las ruedas traseras', 14.00, 'Ruedas traseras nuevas instaladas'),
(8, 3, 'Revisión general', '2025-05-08 08:00:00', '2025-05-08 09:00:00', 'Inspección del sistema eléctrico y frenos', 12.00, 'Reemplazo de cable de freno'),
(9, 2, 'Revisión completa', '2025-05-09 10:00:00', '2025-05-09 12:00:00', 'Revisión de frenos y batería', 16.00, 'Batería recalibrada'),
(10, 1, 'Mantenimiento general', '2025-05-10 14:00:00', '2025-05-10 16:00:00', 'Revisión general de la patineta', 18.00, 'Nada que cambiar'),
(1, 10, 'Preventivo', NOW(), NULL, 'Revisión general programada', 15.50, 'Freno trasero'); --mantenimiento pendiente (sin finalizar)


-- Insertar incidentes
INSERT INTO incidentes (patineta_id, usuario_id, alquiler_id, tipo_incidente, descripcion, fecha_hora_incidente, ubicacion_lat, ubicacion_lon, gravedad, estado, acciones_tomadas) VALUES
(1, 1, 1, 'Freno defectuoso', 'El freno trasero de la patineta dejó de funcionar durante el alquiler.', '2025-05-01 09:30:00', 40.712776, -74.005974, 'Alta', 'Reportado', 'Reemplazo del freno realizado'),
(2, 2, 2, 'Batería agotada', 'La patineta se detuvo por falta de batería antes de terminar el alquiler.', '2025-05-02 10:00:00', 34.052235, -118.243683, 'Media', 'Reportado', 'Batería reemplazada'),
(3, 3, 3, 'Frenos ruidosos', 'Los frenos hicieron ruidos extraños durante el alquiler, pero funcionaron correctamente.', '2025-05-03 14:30:00', 51.507351, -0.127758, 'Baja', 'Reportado', 'Revisión de frenos realizada'),
(4, 4, 4, 'Caída del usuario', 'El usuario perdió el equilibrio y cayó durante el alquiler, pero no sufrió lesiones.', '2025-05-04 17:45:00', 48.856613, 2.352222, 'Alta', 'Reportado', 'Revisión completa de la patineta realizada'),
(5, 5, 5, 'Daño en la rueda', 'Una de las ruedas de la patineta se dañó debido a un golpe durante el alquiler.', '2025-05-05 11:50:00', 40.730610, -73.935242, 'Media', 'Reportado', 'Rueda reparada'),
(6, 1, 6, 'Freno roto', 'El freno delantero se rompió durante el alquiler, no se pudo frenar correctamente.', '2025-05-06 11:00:00', 52.3676, 4.9041, 'Alta', 'Reportado', 'Reemplazo de freno realizado'),
(7, 2, 7, 'Problema en la batería', 'La patineta no se cargó correctamente y se detuvo durante el alquiler.', '2025-05-07 13:00:00', 48.8566, 2.3522, 'Alta', 'Reportado', 'Batería reemplazada'),
(8, 3, 8, 'Ruido en las ruedas', 'Las ruedas emitieron un ruido extraño durante el alquiler, pero no afectó el rendimiento.', '2025-05-08 09:30:00', 52.3676, 4.9041, 'Baja', 'Reportado', 'Revisión de las ruedas realizada'),
(9, 4, 9, 'Accidente con el usuario', 'El usuario se cayó durante el alquiler debido a un bache, pero no sufrió daños.', '2025-05-09 15:30:00', 51.5074, -0.1278, 'Alta', 'Reportado', 'Revisión realizada y sin daños en la patineta'),
(10, 5, 10, 'Problema con la conexión', 'La conexión de la app con la patineta se interrumpió durante el alquiler, causando inconvenientes.', '2025-05-10 16:00:00', 52.3676, 4.9041, 'Media', 'Reportado', 'Revisión y solución del problema');