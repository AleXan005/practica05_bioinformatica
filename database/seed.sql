USE practica05_bioinformatica;

-- Registro único de Azucena (Lilium candidum)
INSERT INTO especies (id, nombre_comun, nombre_cientifico, tasa_crecimiento_base, capacidad_carga_base, temp_optima, humedad_optima, dias_madurez) VALUES
(1, 'Azucena', 'Lilium candidum', 0.08, 2.50, 20.0, 60.0, 90);

-- Simulación 1: control en condiciones óptimas (12 macetas, ninguna muere)
INSERT INTO simulaciones (id, nombre, especie_id, modelo_matematico, temperatura_ambiente, humedad_suelo, duracion_ticks, biomasa_final, altura_final, plantas_vivas, plantas_muertas, tasa_r, capacidad_k, estaciones, modo_ab, num_macetas, num_ramas, notas)
VALUES (1, 'Azucena - Control óptimo', 1, 'logistico', 20.0, 60.0, 120, 553.0, 2.49, 12, 0, 0.08, 2.5, 0, 0, 12, 3, 'Condiciones ideales: sin mortalidad');

-- Simulación 2: calor sostenido (35 °C) -> estrés crítico y mortalidad progresiva
INSERT INTO simulaciones (id, nombre, especie_id, modelo_matematico, temperatura_ambiente, humedad_suelo, duracion_ticks, biomasa_final, altura_final, plantas_vivas, plantas_muertas, tasa_r, capacidad_k, estaciones, modo_ab, num_macetas, num_ramas, notas)
VALUES (2, 'Azucena - Ola de calor 35C', 1, 'logistico', 35.0, 60.0, 120, 28.4, 0.55, 3, 9, 0.08, 2.5, 0, 0, 12, 3, 'Estrés térmico sostenido: 9 de 12 plantas murieron');

-- Simulación 3: sequía de verano
INSERT INTO simulaciones (id, nombre, especie_id, modelo_matematico, temperatura_ambiente, humedad_suelo, duracion_ticks, biomasa_final, altura_final, plantas_vivas, plantas_muertas, tasa_r, capacidad_k, estaciones, modo_ab, num_macetas, num_ramas, notas)
VALUES (3, 'Azucena - Sequía de verano', 1, 'gompertz', 30.0, 25.0, 120, 83.3, 0.90, 5, 7, 0.08, 2.5, 0, 0, 12, 3, 'Calor moderado + suelo seco');

-- Mediciones ya registradas (día, altura, biomasa total, estrés térmico, estrés hídrico, ICR, plantas vivas)
INSERT INTO mediciones (simulacion_id, tick, altura, biomasa, estres_termico, estres_hidrico, icr, plantas_vivas) VALUES
(1, 0,   0.05, 11.1,  0, 0, 0.0000, 12),
(1, 15,  0.16, 35.1,  0, 0, 0.0767, 12),
(1, 30,  0.46, 101.9, 0, 0, 0.0711, 12),
(1, 45,  1.07, 237.5, 0, 0, 0.0565, 12),
(1, 60,  1.78, 395.2, 0, 0, 0.0340, 12),
(1, 75,  2.23, 495.1, 0, 0, 0.0150, 12),
(1, 90,  2.41, 535.0, 0, 0, 0.0052, 12),
(1, 105, 2.47, 548.3, 0, 0, 0.0017, 12),
(1, 120, 2.49, 553.0, 0, 0, 0.0005, 12),
(2, 0,   0.05, 11.1,  100, 0, 0.0000, 12),
(2, 15,  0.12, 26.6,  100, 0, 0.0100, 12),
(2, 30,  0.25, 41.6,  100, 0, 0.0120, 9),
(2, 60,  0.42, 38.9,  100, 0, 0.0040, 5),
(2, 120, 0.55, 28.4,  100, 0, 0.0010, 3),
(3, 0,   0.05, 11.1,  67, 88, 0.0000, 12),
(3, 30,  0.20, 40.7,  67, 88, 0.0460, 11),
(3, 60,  0.45, 66.6,  67, 88, 0.0270, 8),
(3, 90,  0.70, 77.7,  67, 88, 0.0147, 6),
(3, 120, 0.90, 83.3,  67, 88, 0.0083, 5);

INSERT INTO decisiones (simulacion_id, tick, alerta, recomendacion) VALUES
(2, 1,  'Estrés crítico (80 %)', 'CRÍTICO: bajar la temperatura (ventilación/sombreo) de inmediato. Hay plantas muriendo o a punto de morir.'),
(2, 26, 'Mortalidad: planta #7 (escenario A) por estrés térmico', 'Tras 26 días de estrés dañino la planta murió. Corregir el factor térmico para proteger al resto del cultivo.'),
(3, 10, 'Estrés dañino (53 %)', 'Las plantas ya pierden salud: incrementar el riego.');
