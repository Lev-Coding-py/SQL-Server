

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    nombre NVARCHAR(100),
    edad INT,
    genero VARCHAR(10),
    pais NVARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE Doctores (
    id_doctor INT PRIMARY KEY,
    nombre NVARCHAR(100),
    especialidad NVARCHAR(100),
    hospital NVARCHAR(100)
);

CREATE TABLE Citas (
    id_cita INT PRIMARY KEY,
    id_paciente INT,
    id_doctor INT,
    fecha DATE,
    motivo NVARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id_doctor)
);

CREATE TABLE Diagnosticos (
    id_diagnostico INT PRIMARY KEY,
    id_cita INT,
    enfermedad NVARCHAR(100),
    severidad VARCHAR(10), -- Leve, Moderado, Crítico
    observaciones TEXT,
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita)
);

CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY,
    id_diagnostico INT,
    tipo_tratamiento NVARCHAR(100),
    duracion_dias INT,
    resultado NVARCHAR(100), -- Curado, En tratamiento, No responde
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnosticos(id_diagnostico)
);

CREATE TABLE RecomendacionesPreventivas (
    id_recomendacion INT PRIMARY KEY,
    id_paciente INT,
    recomendacion TEXT,
    fecha DATE,
    motivo NVARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);


SELECT * FROM Pacientes;



INSERT INTO Pacientes VALUES (1, N'Julieta Blanch Lago', 82, 'Masculino', N'Perú', '2023-01-31');
INSERT INTO Pacientes VALUES (2, N'Hernando Ledesma', 32, 'Masculino', N'México', '2021-02-23');
INSERT INTO Pacientes VALUES (3, N'Jose Angel Navarrete Pellicer', 87, 'Masculino', N'Colombia', '2024-09-24');
INSERT INTO Pacientes VALUES (4, N'Efraín Quintana Vega', 5, 'Masculino', N'Perú', '2022-06-14');
INSERT INTO Pacientes VALUES (5, N'Amada Chaves Patiño', 30, 'Masculino', N'Colombia', '2022-03-25');
INSERT INTO Pacientes VALUES (6, N'Ester del Galán', 92, 'Femenino', N'México', '2025-01-13');
INSERT INTO Pacientes VALUES (7, N'Vidal Higueras Salvador', 76, 'Femenino', N'Perú', '2021-10-15');
INSERT INTO Pacientes VALUES (8, N'Ovidio Borrell-Seguí', 90, 'Femenino', N'Argentina', '2023-02-12');
INSERT INTO Pacientes VALUES (9, N'Moisés Jimenez Manuel', 20, 'Masculino', N'Argentina', '2021-02-22');
INSERT INTO Pacientes VALUES (10, N'Aurelia Benavent-Durán', 12, 'Femenino', N'Perú', '2024-01-10');
INSERT INTO Pacientes VALUES (11, N'Victoria Mayoral-Benito', 45, 'Femenino', N'Perú', '2025-02-24');
INSERT INTO Pacientes VALUES (12, N'Ignacio Yáñez Fabregat', 69, 'Masculino', N'Chile', '2020-11-18');
INSERT INTO Pacientes VALUES (13, N'Leocadio Grau Porcel', 71, 'Femenino', N'Colombia', '2024-01-21');
INSERT INTO Pacientes VALUES (14, N'Blanca Casado Soto', 74, 'Masculino', N'Perú', '2020-07-06');
INSERT INTO Pacientes VALUES (15, N'Beatriz del Raya', 85, 'Masculino', N'Argentina', '2020-11-22');
INSERT INTO Pacientes VALUES (16, N'Miguel Gallardo Meléndez', 30, 'Masculino', N'Chile', '2023-02-12');
INSERT INTO Pacientes VALUES (17, N'Itziar Carrasco Mendez', 59, 'Femenino', N'México', '2024-02-25');
INSERT INTO Pacientes VALUES (18, N'Jonatan Chamorro Mateu', 46, 'Masculino', N'Argentina', '2020-10-19');
INSERT INTO Pacientes VALUES (19, N'Marcos Mur Palau', 78, 'Masculino', N'Colombia', '2022-09-29');
INSERT INTO Pacientes VALUES (20, N'Brígida Ripoll Doménech', 21, 'Femenino', N'Chile', '2023-01-10');
INSERT INTO Pacientes VALUES (21, N'Zaira Torrents Plana', 82, 'Masculino', N'Argentina', '2020-08-17');
INSERT INTO Pacientes VALUES (22, N'Ani Campillo Gisbert', 30, 'Masculino', N'Argentina', '2024-07-01');
INSERT INTO Pacientes VALUES (23, N'Vera Castells Plana', 35, 'Masculino', N'México', '2023-07-12');
INSERT INTO Pacientes VALUES (24, N'Rafael Plácido Acuña Peral', 28, 'Femenino', N'Chile', '2025-02-22');
INSERT INTO Pacientes VALUES (25, N'Vito del Cabello', 19, 'Femenino', N'México', '2022-10-07');
INSERT INTO Pacientes VALUES (26, N'Virgilio Ropero', 96, 'Femenino', N'Colombia', '2024-10-20');
INSERT INTO Pacientes VALUES (27, N'Vera Leandra Guardiola Polo', 75, 'Femenino', N'Argentina', '2022-06-17');
INSERT INTO Pacientes VALUES (28, N'Agustín Saldaña', 18, 'Femenino', N'Perú', '2020-07-11');
INSERT INTO Pacientes VALUES (29, N'Emilio Duilio Raya Avilés', 15, 'Masculino', N'México', '2024-09-25');
INSERT INTO Pacientes VALUES (30, N'Bernarda de Bello', 77, 'Masculino', N'Chile', '2024-04-12');
INSERT INTO Pacientes VALUES (31, N'Fanny Artigas Gabaldón', 77, 'Femenino', N'Colombia', '2022-10-26');
INSERT INTO Pacientes VALUES (32, N'Rita Linares Zamora', 71, 'Masculino', N'Perú', '2022-12-28');
INSERT INTO Pacientes VALUES (33, N'Borja de Granados', 99, 'Femenino', N'Perú', '2023-04-17');
INSERT INTO Pacientes VALUES (34, N'Sigfrido Girón Franco', 56, 'Masculino', N'Chile', '2020-01-14');
INSERT INTO Pacientes VALUES (35, N'Isabel Carro Gimenez', 93, 'Femenino', N'Colombia', '2022-01-01');
INSERT INTO Pacientes VALUES (36, N'María Severiano Tejada Tejero', 65, 'Masculino', N'Argentina', '2025-09-10');
INSERT INTO Pacientes VALUES (37, N'Heraclio Carballo Contreras', 78, 'Masculino', N'México', '2024-03-11');
INSERT INTO Pacientes VALUES (38, N'Leyre Vicens Goñi', 98, 'Masculino', N'Colombia', '2025-12-12');
INSERT INTO Pacientes VALUES (39, N'Azucena Rivera Solé', 1, 'Femenino', N'Chile', '2020-03-20');
INSERT INTO Pacientes VALUES (40, N'Jose Angel Rey Muro', 15, 'Femenino', N'Argentina', '2022-09-07');
INSERT INTO Pacientes VALUES (41, N'Lina Blázquez Lloret', 8, 'Masculino', N'Colombia', '2020-11-18');
INSERT INTO Pacientes VALUES (42, N'Ema Fortuny', 11, 'Femenino', N'Perú', '2025-12-21');
INSERT INTO Pacientes VALUES (43, N'Teodoro Iborra Ortuño', 99, 'Masculino', N'México', '2025-04-30');
INSERT INTO Pacientes VALUES (44, N'Amalia Jáuregui Egea', 71, 'Masculino', N'Argentina', '2025-12-01');
INSERT INTO Pacientes VALUES (45, N'Kike del Gimeno', 78, 'Femenino', N'México', '2022-04-03');
INSERT INTO Pacientes VALUES (46, N'María Nogueira Linares', 92, 'Femenino', N'Chile', '2024-03-09');
INSERT INTO Pacientes VALUES (47, N'Eleuterio Cadenas Rosell', 57, 'Femenino', N'Perú', '2022-10-12');
INSERT INTO Pacientes VALUES (48, N'Emigdio Nicodemo Torrents Tapia', 29, 'Masculino', N'Argentina', '2020-03-27');
INSERT INTO Pacientes VALUES (49, N'Félix Anaya Jove', 76, 'Masculino', N'Colombia', '2022-06-21');
INSERT INTO Pacientes VALUES (50, N'Francisco Jose Benavent Miguel', 1, 'Masculino', N'Perú', '2022-07-26');
INSERT INTO Pacientes VALUES (51, N'Amor Capdevila Álvarez', 9, 'Masculino', N'Argentina', '2020-10-17');
INSERT INTO Pacientes VALUES (52, N'Roberto Soler Ibarra', 66, 'Masculino', N'Argentina', '2025-06-11');
INSERT INTO Pacientes VALUES (53, N'Alfonso del Sierra', 28, 'Masculino', N'Colombia', '2025-04-20');
INSERT INTO Pacientes VALUES (54, N'María Alba Fernandez', 32, 'Femenino', N'Chile', '2022-02-18');
INSERT INTO Pacientes VALUES (55, N'Nereida Agustí Milla', 13, 'Masculino', N'Chile', '2023-12-22');
INSERT INTO Pacientes VALUES (56, N'Baldomero Mendizábal', 55, 'Femenino', N'Chile', '2020-08-09');
INSERT INTO Pacientes VALUES (57, N'Mauricio Roca Berrocal', 87, 'Masculino', N'Perú', '2024-07-07');
INSERT INTO Pacientes VALUES (58, N'Brígida Olivia Nicolau Camino', 94, 'Femenino', N'Perú', '2022-10-15');
INSERT INTO Pacientes VALUES (59, N'Íngrid Pi', 25, 'Masculino', N'Colombia', '2025-01-11');
INSERT INTO Pacientes VALUES (60, N'Anselmo Folch Sanmiguel', 18, 'Femenino', N'México', '2023-02-14');

INSERT INTO Doctores VALUES (1, N'Sandra Portillo Garriga', N'Pediatría', N'Hospital del Norte');
INSERT INTO Doctores VALUES (2, N'Abilio Castejón Castro', N'Cardiología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (3, N'Nando Gálvez Acuña', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (4, N'Alejandro Carro Benitez', N'Cardiología', N'Hospital Central');
INSERT INTO Doctores VALUES (5, N'Saturnina Carretero Lucena', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (6, N'Fabio Bru Barreda', N'Dermatología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (7, N'Roberto Acuña-Pascual', N'Pediatría', N'Hospital Universitario');
INSERT INTO Doctores VALUES (8, N'Azahar Arcelia Zamorano Sáenz', N'Dermatología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (9, N'Haydée Riera Tudela', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (10, N'María José Segura Camino', N'Pediatría', N'Hospital Central');
INSERT INTO Doctores VALUES (11, N'Julieta Natalia Vazquez Verdugo', N'Pediatría', N'Clínica San Juan');
INSERT INTO Doctores VALUES (12, N'Daniela Arellano Jordá', N'Pediatría', N'Clínica San Juan');
INSERT INTO Doctores VALUES (13, N'Gracia Corominas Bilbao', N'Pediatría', N'Hospital Universitario');
INSERT INTO Doctores VALUES (14, N'Lucila Mercedes Guardia Aliaga', N'Dermatología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (15, N'Nydia Chacón Santos', N'Neurología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (16, N'Estrella Infante', N'Cardiología', N'Hospital Central');
INSERT INTO Doctores VALUES (17, N'Gloria Borja-Colomer', N'Neurología', N'Hospital Central');
INSERT INTO Doctores VALUES (18, N'Salud Ribes Murcia', N'Cardiología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (19, N'Felisa Belmonte Carreras', N'Medicina General', N'Hospital del Norte');
INSERT INTO Doctores VALUES (20, N'Jenny del Mercader', N'Cardiología', N'Hospital Central');
INSERT INTO Doctores VALUES (21, N'Ignacia Coloma Jaume', N'Dermatología', N'Hospital Central');
INSERT INTO Doctores VALUES (22, N'Amalia Fuster Pazos', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (23, N'Lucía Daza', N'Dermatología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (24, N'Teófilo Sotelo Riba', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (25, N'Marcelo Comas Bosch', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (26, N'Pepe Roque Garrido Rocamora', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (27, N'Edelmiro Edgardo Sanmiguel García', N'Pediatría', N'Clínica San Juan');
INSERT INTO Doctores VALUES (28, N'Azahara de Collado', N'Neurología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (29, N'Leocadia Avilés Hoyos', N'Neurología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (30, N'Bernardo Jover Muñoz', N'Neurología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (31, N'Viviana Gallego Canals', N'Dermatología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (32, N'Dan Pulido Larrañaga', N'Pediatría', N'Clínica San Juan');
INSERT INTO Doctores VALUES (33, N'Isidro Salvador Mir', N'Cardiología', N'Hospital Central');
INSERT INTO Doctores VALUES (34, N'Leocadio Bernat Benavides', N'Pediatría', N'Hospital Central');
INSERT INTO Doctores VALUES (35, N'Alicia Sebastián-Vazquez', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (36, N'Néstor Guerra Mesa', N'Medicina General', N'Clínica San Juan');
INSERT INTO Doctores VALUES (37, N'César Cervantes Tormo', N'Dermatología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (38, N'Faustino Montero Saldaña', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (39, N'Trini Jaume Barrio', N'Neurología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (40, N'Febe Hurtado Hidalgo', N'Dermatología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (41, N'Dorita Anglada Pascual', N'Medicina General', N'Clínica San Juan');
INSERT INTO Doctores VALUES (42, N'Albert Clavero Alba', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (43, N'Yolanda Moraleda García', N'Medicina General', N'Clínica San Juan');
INSERT INTO Doctores VALUES (44, N'Roxana de Solé', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (45, N'Caridad Cueto', N'Neurología', N'Hospital Central');
INSERT INTO Doctores VALUES (46, N'Laura Sánchez-Navarro', N'Cardiología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (47, N'Luz Luna Vera', N'Neurología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (48, N'Pablo Cecilio Almansa Cepeda', N'Medicina General', N'Hospital del Norte');
INSERT INTO Doctores VALUES (49, N'Virginia Quiroga-Gallardo', N'Neurología', N'Hospital del Norte');
INSERT INTO Doctores VALUES (50, N'Nidia Luna Piquer', N'Neurología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (51, N'Yéssica Pino Palomino', N'Neurología', N'Hospital Central');
INSERT INTO Doctores VALUES (52, N'Estela Tomas', N'Cardiología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (53, N'Leyre Mayol Uribe', N'Neurología', N'Hospital Central');
INSERT INTO Doctores VALUES (54, N'Máxima Herrera', N'Cardiología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (55, N'Guadalupe Puerta Roda', N'Dermatología', N'Clínica San Juan');
INSERT INTO Doctores VALUES (56, N'Germán de Sanjuan', N'Dermatología', N'Hospital Universitario');
INSERT INTO Doctores VALUES (57, N'Ligia Mascaró-Cantero', N'Medicina General', N'Hospital Universitario');
INSERT INTO Doctores VALUES (58, N'Hortensia Garay Morales', N'Medicina General', N'Hospital Central');
INSERT INTO Doctores VALUES (59, N'Josep Cardona Gras', N'Cardiología', N'Hospital Central');
INSERT INTO Doctores VALUES (60, N'Espiridión Casanova Acosta', N'Dermatología', N'Hospital Central');

INSERT INTO Citas VALUES (1, 54, 24, '2021-08-29', N'Consulta inicial');
INSERT INTO Citas VALUES (2, 9, 3, '2023-06-16', N'Chequeo general');
INSERT INTO Citas VALUES (3, 58, 60, '2020-06-12', N'Chequeo general');
INSERT INTO Citas VALUES (4, 14, 44, '2022-10-19', N'Dolor persistente');
INSERT INTO Citas VALUES (5, 23, 50, '2024-07-22', N'Seguimiento');
INSERT INTO Citas VALUES (6, 48, 10, '2022-08-27', N'Revisión anual');
INSERT INTO Citas VALUES (7, 52, 52, '2021-12-26', N'Consulta inicial');
INSERT INTO Citas VALUES (8, 2, 12, '2023-09-22', N'Consulta inicial');
INSERT INTO Citas VALUES (9, 52, 43, '2022-10-13', N'Chequeo general');
INSERT INTO Citas VALUES (10, 11, 51, '2021-03-18', N'Consulta inicial');
INSERT INTO Citas VALUES (11, 56, 3, '2025-04-11', N'Revisión anual');
INSERT INTO Citas VALUES (12, 13, 53, '2025-02-28', N'Chequeo general');
INSERT INTO Citas VALUES (13, 20, 53, '2022-07-21', N'Revisión anual');
INSERT INTO Citas VALUES (14, 2, 43, '2022-03-02', N'Consulta inicial');
INSERT INTO Citas VALUES (15, 22, 18, '2020-10-11', N'Chequeo general');
INSERT INTO Citas VALUES (16, 23, 42, '2025-09-17', N'Consulta inicial');
INSERT INTO Citas VALUES (17, 44, 54, '2023-09-18', N'Dolor persistente');
INSERT INTO Citas VALUES (18, 8, 57, '2022-12-05', N'Revisión anual');
INSERT INTO Citas VALUES (19, 38, 17, '2020-06-05', N'Dolor persistente');
INSERT INTO Citas VALUES (20, 39, 28, '2023-11-16', N'Chequeo general');
INSERT INTO Citas VALUES (21, 28, 39, '2025-09-25', N'Dolor persistente');
INSERT INTO Citas VALUES (22, 25, 58, '2022-02-17', N'Chequeo general');
INSERT INTO Citas VALUES (23, 3, 46, '2024-11-21', N'Dolor persistente');
INSERT INTO Citas VALUES (24, 34, 60, '2022-03-18', N'Chequeo general');
INSERT INTO Citas VALUES (25, 28, 5, '2023-09-14', N'Seguimiento');
INSERT INTO Citas VALUES (26, 21, 43, '2021-05-25', N'Chequeo general');
INSERT INTO Citas VALUES (27, 33, 20, '2024-07-30', N'Chequeo general');
INSERT INTO Citas VALUES (28, 26, 45, '2023-04-26', N'Seguimiento');
INSERT INTO Citas VALUES (29, 9, 13, '2024-09-18', N'Consulta inicial');
INSERT INTO Citas VALUES (30, 44, 48, '2021-12-13', N'Seguimiento');
INSERT INTO Citas VALUES (31, 37, 20, '2024-07-21', N'Seguimiento');
INSERT INTO Citas VALUES (32, 54, 1, '2023-05-29', N'Chequeo general');
INSERT INTO Citas VALUES (33, 14, 28, '2023-08-12', N'Consulta inicial');
INSERT INTO Citas VALUES (34, 29, 29, '2022-05-25', N'Seguimiento');
INSERT INTO Citas VALUES (35, 31, 51, '2021-11-26', N'Dolor persistente');
INSERT INTO Citas VALUES (36, 19, 33, '2023-10-04', N'Dolor persistente');
INSERT INTO Citas VALUES (37, 53, 49, '2022-08-20', N'Chequeo general');
INSERT INTO Citas VALUES (38, 15, 52, '2022-03-26', N'Revisión anual');
INSERT INTO Citas VALUES (39, 2, 3, '2022-09-29', N'Consulta inicial');
INSERT INTO Citas VALUES (40, 40, 55, '2020-10-25', N'Consulta inicial');
INSERT INTO Citas VALUES (41, 27, 57, '2022-03-07', N'Consulta inicial');
INSERT INTO Citas VALUES (42, 32, 26, '2022-09-26', N'Revisión anual');
INSERT INTO Citas VALUES (43, 42, 45, '2020-01-23', N'Dolor persistente');
INSERT INTO Citas VALUES (44, 50, 28, '2022-06-15', N'Revisión anual');
INSERT INTO Citas VALUES (45, 52, 45, '2025-10-22', N'Consulta inicial');
INSERT INTO Citas VALUES (46, 4, 36, '2022-10-17', N'Dolor persistente');
INSERT INTO Citas VALUES (47, 30, 9, '2025-03-18', N'Seguimiento');
INSERT INTO Citas VALUES (48, 36, 39, '2023-07-23', N'Consulta inicial');
INSERT INTO Citas VALUES (49, 40, 53, '2025-08-29', N'Consulta inicial');
INSERT INTO Citas VALUES (50, 54, 59, '2024-12-31', N'Revisión anual');
INSERT INTO Citas VALUES (51, 48, 56, '2025-04-28', N'Consulta inicial');
INSERT INTO Citas VALUES (52, 17, 49, '2022-10-09', N'Chequeo general');
INSERT INTO Citas VALUES (53, 50, 50, '2025-11-05', N'Consulta inicial');
INSERT INTO Citas VALUES (54, 41, 16, '2023-01-29', N'Consulta inicial');
INSERT INTO Citas VALUES (55, 5, 46, '2023-03-16', N'Revisión anual');
INSERT INTO Citas VALUES (56, 18, 22, '2023-08-02', N'Seguimiento');
INSERT INTO Citas VALUES (57, 6, 9, '2021-09-09', N'Revisión anual');
INSERT INTO Citas VALUES (58, 25, 45, '2021-09-17', N'Revisión anual');
INSERT INTO Citas VALUES (59, 5, 27, '2024-07-27', N'Chequeo general');
INSERT INTO Citas VALUES (60, 35, 30, '2024-08-30', N'Dolor persistente');

INSERT INTO Diagnosticos VALUES (1, 1, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 1.');
INSERT INTO Diagnosticos VALUES (2, 2, N'Asma', 'Crítico', N'Observaciones sobre la enfermedad 2.');
INSERT INTO Diagnosticos VALUES (3, 3, N'Gripe', 'Crítico', N'Observaciones sobre la enfermedad 3.');
INSERT INTO Diagnosticos VALUES (4, 4, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 4.');
INSERT INTO Diagnosticos VALUES (5, 5, N'Gripe', 'Moderado', N'Observaciones sobre la enfermedad 5.');
INSERT INTO Diagnosticos VALUES (6, 6, N'Hipertensión', 'Moderado', N'Observaciones sobre la enfermedad 6.');
INSERT INTO Diagnosticos VALUES (7, 7, N'Asma', 'Crítico', N'Observaciones sobre la enfermedad 7.');
INSERT INTO Diagnosticos VALUES (8, 8, N'COVID-19', 'Crítico', N'Observaciones sobre la enfermedad 8.');
INSERT INTO Diagnosticos VALUES (9, 9, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 9.');
INSERT INTO Diagnosticos VALUES (10, 10, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 10.');
INSERT INTO Diagnosticos VALUES (11, 11, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 11.');
INSERT INTO Diagnosticos VALUES (12, 12, N'Gripe', 'Moderado', N'Observaciones sobre la enfermedad 12.');
INSERT INTO Diagnosticos VALUES (13, 13, N'Hipertensión', 'Crítico', N'Observaciones sobre la enfermedad 13.');
INSERT INTO Diagnosticos VALUES (14, 14, N'Asma', 'Crítico', N'Observaciones sobre la enfermedad 14.');
INSERT INTO Diagnosticos VALUES (15, 15, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 15.');
INSERT INTO Diagnosticos VALUES (16, 16, N'Diabetes', 'Crítico', N'Observaciones sobre la enfermedad 16.');
INSERT INTO Diagnosticos VALUES (17, 17, N'COVID-19', 'Leve', N'Observaciones sobre la enfermedad 17.');
INSERT INTO Diagnosticos VALUES (18, 18, N'Asma', 'Crítico', N'Observaciones sobre la enfermedad 18.');
INSERT INTO Diagnosticos VALUES (19, 19, N'COVID-19', 'Crítico', N'Observaciones sobre la enfermedad 19.');
INSERT INTO Diagnosticos VALUES (20, 20, N'Gripe', 'Leve', N'Observaciones sobre la enfermedad 20.');
INSERT INTO Diagnosticos VALUES (21, 21, N'Asma', 'Leve', N'Observaciones sobre la enfermedad 21.');
INSERT INTO Diagnosticos VALUES (22, 22, N'Asma', 'Leve', N'Observaciones sobre la enfermedad 22.');
INSERT INTO Diagnosticos VALUES (23, 23, N'Gripe', 'Moderado', N'Observaciones sobre la enfermedad 23.');
INSERT INTO Diagnosticos VALUES (24, 24, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 24.');
INSERT INTO Diagnosticos VALUES (25, 25, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 25.');
INSERT INTO Diagnosticos VALUES (26, 26, N'Hipertensión', 'Moderado', N'Observaciones sobre la enfermedad 26.');
INSERT INTO Diagnosticos VALUES (27, 27, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 27.');
INSERT INTO Diagnosticos VALUES (28, 28, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 28.');
INSERT INTO Diagnosticos VALUES (29, 29, N'Gripe', 'Moderado', N'Observaciones sobre la enfermedad 29.');
INSERT INTO Diagnosticos VALUES (30, 30, N'Gripe', 'Crítico', N'Observaciones sobre la enfermedad 30.');
INSERT INTO Diagnosticos VALUES (31, 31, N'COVID-19', 'Leve', N'Observaciones sobre la enfermedad 31.');
INSERT INTO Diagnosticos VALUES (32, 32, N'Hipertensión', 'Leve', N'Observaciones sobre la enfermedad 32.');
INSERT INTO Diagnosticos VALUES (33, 33, N'Gripe', 'Crítico', N'Observaciones sobre la enfermedad 33.');
INSERT INTO Diagnosticos VALUES (34, 34, N'Gripe', 'Leve', N'Observaciones sobre la enfermedad 34.');
INSERT INTO Diagnosticos VALUES (35, 35, N'Diabetes', 'Leve', N'Observaciones sobre la enfermedad 35.');
INSERT INTO Diagnosticos VALUES (36, 36, N'Gripe', 'Crítico', N'Observaciones sobre la enfermedad 36.');
INSERT INTO Diagnosticos VALUES (37, 37, N'Diabetes', 'Leve', N'Observaciones sobre la enfermedad 37.');
INSERT INTO Diagnosticos VALUES (38, 38, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 38.');
INSERT INTO Diagnosticos VALUES (39, 39, N'Gripe', 'Crítico', N'Observaciones sobre la enfermedad 39.');
INSERT INTO Diagnosticos VALUES (40, 40, N'Diabetes', 'Moderado', N'Observaciones sobre la enfermedad 40.');
INSERT INTO Diagnosticos VALUES (41, 41, N'Hipertensión', 'Moderado', N'Observaciones sobre la enfermedad 41.');
INSERT INTO Diagnosticos VALUES (42, 42, N'Diabetes', 'Crítico', N'Observaciones sobre la enfermedad 42.');
INSERT INTO Diagnosticos VALUES (43, 43, N'COVID-19', 'Crítico', N'Observaciones sobre la enfermedad 43.');
INSERT INTO Diagnosticos VALUES (44, 44, N'Gripe', 'Leve', N'Observaciones sobre la enfermedad 44.');
INSERT INTO Diagnosticos VALUES (45, 45, N'Hipertensión', 'Leve', N'Observaciones sobre la enfermedad 45.');
INSERT INTO Diagnosticos VALUES (46, 46, N'COVID-19', 'Leve', N'Observaciones sobre la enfermedad 46.');
INSERT INTO Diagnosticos VALUES (47, 47, N'Hipertensión', 'Crítico', N'Observaciones sobre la enfermedad 47.');
INSERT INTO Diagnosticos VALUES (48, 48, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 48.');
INSERT INTO Diagnosticos VALUES (49, 49, N'Diabetes', 'Leve', N'Observaciones sobre la enfermedad 49.');
INSERT INTO Diagnosticos VALUES (50, 50, N'COVID-19', 'Crítico', N'Observaciones sobre la enfermedad 50.');
INSERT INTO Diagnosticos VALUES (51, 51, N'Diabetes', 'Leve', N'Observaciones sobre la enfermedad 51.');
INSERT INTO Diagnosticos VALUES (52, 52, N'Hipertensión', 'Crítico', N'Observaciones sobre la enfermedad 52.');
INSERT INTO Diagnosticos VALUES (53, 53, N'COVID-19', 'Leve', N'Observaciones sobre la enfermedad 53.');
INSERT INTO Diagnosticos VALUES (54, 54, N'COVID-19', 'Leve', N'Observaciones sobre la enfermedad 54.');
INSERT INTO Diagnosticos VALUES (55, 55, N'Hipertensión', 'Crítico', N'Observaciones sobre la enfermedad 55.');
INSERT INTO Diagnosticos VALUES (56, 56, N'Asma', 'Crítico', N'Observaciones sobre la enfermedad 56.');
INSERT INTO Diagnosticos VALUES (57, 57, N'Hipertensión', 'Leve', N'Observaciones sobre la enfermedad 57.');
INSERT INTO Diagnosticos VALUES (58, 58, N'COVID-19', 'Crítico', N'Observaciones sobre la enfermedad 58.');
INSERT INTO Diagnosticos VALUES (59, 59, N'Hipertensión', 'Leve', N'Observaciones sobre la enfermedad 59.');
INSERT INTO Diagnosticos VALUES (60, 60, N'Asma', 'Moderado', N'Observaciones sobre la enfermedad 60.');

INSERT INTO Tratamientos VALUES (1, 1, N'Terapia', 8, N'En tratamiento');
INSERT INTO Tratamientos VALUES (2, 2, N'Terapia', 16, N'No responde');
INSERT INTO Tratamientos VALUES (3, 3, N'Terapia', 19, N'No responde');
INSERT INTO Tratamientos VALUES (4, 4, N'Terapia', 9, N'En tratamiento');
INSERT INTO Tratamientos VALUES (5, 5, N'Terapia', 10, N'No responde');
INSERT INTO Tratamientos VALUES (6, 6, N'Terapia', 21, N'No responde');
INSERT INTO Tratamientos VALUES (7, 7, N'Terapia', 13, N'No responde');
INSERT INTO Tratamientos VALUES (8, 8, N'Terapia', 30, N'No responde');
INSERT INTO Tratamientos VALUES (9, 9, N'Terapia', 29, N'En tratamiento');
INSERT INTO Tratamientos VALUES (10, 10, N'Terapia', 19, N'En tratamiento');
INSERT INTO Tratamientos VALUES (11, 11, N'Terapia', 28, N'No responde');
INSERT INTO Tratamientos VALUES (12, 12, N'Terapia', 13, N'En tratamiento');
INSERT INTO Tratamientos VALUES (13, 13, N'Terapia', 12, N'Curado');
INSERT INTO Tratamientos VALUES (14, 14, N'Terapia', 13, N'En tratamiento');
INSERT INTO Tratamientos VALUES (15, 15, N'Terapia', 12, N'En tratamiento');
INSERT INTO Tratamientos VALUES (16, 16, N'Terapia', 23, N'No responde');
INSERT INTO Tratamientos VALUES (17, 17, N'Terapia', 26, N'En tratamiento');
INSERT INTO Tratamientos VALUES (18, 18, N'Terapia', 15, N'Curado');
INSERT INTO Tratamientos VALUES (19, 19, N'Terapia', 20, N'En tratamiento');
INSERT INTO Tratamientos VALUES (20, 20, N'Terapia', 10, N'En tratamiento');
INSERT INTO Tratamientos VALUES (21, 21, N'Terapia', 11, N'En tratamiento');
INSERT INTO Tratamientos VALUES (22, 22, N'Terapia', 30, N'En tratamiento');
INSERT INTO Tratamientos VALUES (23, 23, N'Terapia', 15, N'En tratamiento');
INSERT INTO Tratamientos VALUES (24, 24, N'Terapia', 24, N'No responde');
INSERT INTO Tratamientos VALUES (25, 25, N'Terapia', 13, N'No responde');
INSERT INTO Tratamientos VALUES (26, 26, N'Terapia', 5, N'No responde');
INSERT INTO Tratamientos VALUES (27, 27, N'Terapia', 11, N'Curado');
INSERT INTO Tratamientos VALUES (28, 28, N'Terapia', 12, N'No responde');
INSERT INTO Tratamientos VALUES (29, 29, N'Terapia', 18, N'En tratamiento');
INSERT INTO Tratamientos VALUES (30, 30, N'Terapia', 22, N'Curado');
INSERT INTO Tratamientos VALUES (31, 31, N'Terapia', 27, N'En tratamiento');
INSERT INTO Tratamientos VALUES (32, 32, N'Terapia', 25, N'No responde');
INSERT INTO Tratamientos VALUES (33, 33, N'Terapia', 20, N'En tratamiento');
INSERT INTO Tratamientos VALUES (34, 34, N'Terapia', 30, N'Curado');
INSERT INTO Tratamientos VALUES (35, 35, N'Terapia', 7, N'En tratamiento');
INSERT INTO Tratamientos VALUES (36, 36, N'Terapia', 12, N'En tratamiento');
INSERT INTO Tratamientos VALUES (37, 37, N'Terapia', 27, N'Curado');
INSERT INTO Tratamientos VALUES (38, 38, N'Terapia', 14, N'No responde');
INSERT INTO Tratamientos VALUES (39, 39, N'Terapia', 23, N'En tratamiento');
INSERT INTO Tratamientos VALUES (40, 40, N'Terapia', 20, N'No responde');
INSERT INTO Tratamientos VALUES (41, 41, N'Terapia', 21, N'En tratamiento');
INSERT INTO Tratamientos VALUES (42, 42, N'Terapia', 18, N'No responde');
INSERT INTO Tratamientos VALUES (43, 43, N'Terapia', 22, N'En tratamiento');
INSERT INTO Tratamientos VALUES (44, 44, N'Terapia', 16, N'No responde');
INSERT INTO Tratamientos VALUES (45, 45, N'Terapia', 19, N'En tratamiento');
INSERT INTO Tratamientos VALUES (46, 46, N'Terapia', 14, N'En tratamiento');
INSERT INTO Tratamientos VALUES (47, 47, N'Terapia', 12, N'Curado');
INSERT INTO Tratamientos VALUES (48, 48, N'Terapia', 28, N'Curado');
INSERT INTO Tratamientos VALUES (49, 49, N'Terapia', 15, N'Curado');
INSERT INTO Tratamientos VALUES (50, 50, N'Terapia', 28, N'No responde');
INSERT INTO Tratamientos VALUES (51, 51, N'Terapia', 29, N'No responde');
INSERT INTO Tratamientos VALUES (52, 52, N'Terapia', 10, N'Curado');
INSERT INTO Tratamientos VALUES (53, 53, N'Terapia', 11, N'No responde');
INSERT INTO Tratamientos VALUES (54, 54, N'Terapia', 20, N'En tratamiento');
INSERT INTO Tratamientos VALUES (55, 55, N'Terapia', 28, N'No responde');
INSERT INTO Tratamientos VALUES (56, 56, N'Terapia', 29, N'No responde');
INSERT INTO Tratamientos VALUES (57, 57, N'Terapia', 24, N'En tratamiento');
INSERT INTO Tratamientos VALUES (58, 58, N'Terapia', 8, N'Curado');
INSERT INTO Tratamientos VALUES (59, 59, N'Terapia', 14, N'Curado');
INSERT INTO Tratamientos VALUES (60, 60, N'Terapia', 16, N'Curado');

INSERT INTO RecomendacionesPreventivas VALUES (1, 20, N'Ejercicio regular', '2025-12-27', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (2, 18, N'Ejercicio regular', '2020-08-11', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (3, 19, N'Mantener una dieta balanceada', '2025-07-03', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (4, 56, N'Ejercicio regular', '2023-03-10', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (5, 31, N'Evitar estrés', '2023-10-27', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (6, 4, N'Vacunación', '2025-05-10', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (7, 53, N'Ejercicio regular', '2024-06-29', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (8, 5, N'Dormir bien', '2020-08-07', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (9, 10, N'Dormir bien', '2023-05-29', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (10, 16, N'Ejercicio regular', '2024-08-31', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (11, 39, N'Dormir bien', '2022-07-13', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (12, 25, N'Evitar estrés', '2024-12-18', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (13, 56, N'Dormir bien', '2024-10-22', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (14, 37, N'Dormir bien', '2020-09-03', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (15, 48, N'Ejercicio regular', '2022-05-01', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (16, 17, N'Ejercicio regular', '2021-10-05', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (17, 12, N'Dormir bien', '2020-11-03', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (18, 1, N'Evitar estrés', '2025-01-19', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (19, 31, N'Vacunación', '2020-05-13', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (20, 19, N'Vacunación', '2025-02-02', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (21, 44, N'Mantener una dieta balanceada', '2022-12-19', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (22, 43, N'Mantener una dieta balanceada', '2024-10-07', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (23, 35, N'Mantener una dieta balanceada', '2021-09-02', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (24, 53, N'Mantener una dieta balanceada', '2020-10-19', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (25, 11, N'Vacunación', '2023-03-28', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (26, 8, N'Evitar estrés', '2023-05-30', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (27, 18, N'Dormir bien', '2025-07-15', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (28, 6, N'Dormir bien', '2020-06-12', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (29, 48, N'Vacunación', '2022-10-22', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (30, 6, N'Mantener una dieta balanceada', '2020-03-25', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (31, 37, N'Ejercicio regular', '2021-12-18', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (32, 34, N'Evitar estrés', '2023-02-13', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (33, 38, N'Evitar estrés', '2025-07-07', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (34, 31, N'Vacunación', '2024-07-30', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (35, 21, N'Ejercicio regular', '2021-10-20', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (36, 27, N'Evitar estrés', '2023-03-26', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (37, 53, N'Dormir bien', '2020-05-30', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (38, 6, N'Vacunación', '2022-10-30', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (39, 8, N'Evitar estrés', '2025-10-08', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (40, 43, N'Dormir bien', '2025-03-07', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (41, 4, N'Mantener una dieta balanceada', '2025-10-24', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (42, 40, N'Evitar estrés', '2024-12-15', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (43, 14, N'Vacunación', '2021-06-20', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (44, 29, N'Evitar estrés', '2021-05-12', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (45, 41, N'Dormir bien', '2022-09-07', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (46, 20, N'Dormir bien', '2020-02-26', N'Seguimiento');
INSERT INTO RecomendacionesPreventivas VALUES (47, 27, N'Ejercicio regular', '2022-07-09', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (48, 30, N'Ejercicio regular', '2021-09-22', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (49, 60, N'Vacunación', '2025-09-15', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (50, 27, N'Evitar estrés', '2025-04-18', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (51, 30, N'Dormir bien', '2021-08-15', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (52, 13, N'Dormir bien', '2025-09-12', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (53, 56, N'Ejercicio regular', '2023-02-05', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (54, 22, N'Dormir bien', '2022-12-30', N'Dolor persistente');
INSERT INTO RecomendacionesPreventivas VALUES (55, 19, N'Vacunación', '2025-06-28', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (56, 29, N'Dormir bien', '2025-06-06', N'Chequeo general');
INSERT INTO RecomendacionesPreventivas VALUES (57, 22, N'Dormir bien', '2024-03-25', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (58, 60, N'Vacunación', '2022-02-11', N'Revisión anual');
INSERT INTO RecomendacionesPreventivas VALUES (59, 37, N'Evitar estrés', '2022-08-14', N'Consulta inicial');
INSERT INTO RecomendacionesPreventivas VALUES (60, 3, N'Vacunación', '2025-04-21', N'Consulta inicial');


SELECT * FROM RecomendacionesPreventivas;
SELECT * FROM Pacientes;






select pais, count(*) as total_pacientes
from Pacientes
group by pais;

select genero, avg(edad) as edad_promedio
from Pacientes
group by genero;


select d.nombre, count(c.id_cita) as total_citas
from Doctores d
join Citas c on d.id_doctor=c.id_doctor
group by d.nombre;



select d.enfermedad, count(*) as total_casos
from Diagnosticos d
group by d.enfermedad




SELECT enfermedad, COUNT(*) AS total_casos
FROM Diagnosticos
GROUP BY enfermedad
ORDER BY total_casos DESC;


select p.nombre, c.fecha, d.enfermedad, d.severidad, t.tipo_tratamiento, t.resultado
from Pacientes p
join Citas c on p.id_paciente=c.id_paciente
join Diagnosticos d on c.id_cita=d.id_cita
join Tratamientos t on  d.id_diagnostico=t.id_diagnostico
where p.id_paciente=1;



SELECT d.severidad, t.tipo_tratamiento, COUNT(*) AS casos
FROM Diagnosticos d
JOIN Tratamientos t ON d.id_diagnostico = t.id_diagnostico
GROUP BY d.severidad, t.tipo_tratamiento
ORDER BY casos DESC;




SELECT d.enfermedad, AVG(t.duracion_dias) AS duracion_promedio
FROM Diagnosticos d
JOIN Tratamientos t ON d.id_diagnostico = t.id_diagnostico
GROUP BY d.enfermedad;


SELECT doc.nombre, COUNT(*) AS casos_criticos
FROM Doctores doc
JOIN Citas c ON doc.id_doctor = c.id_doctor
JOIN Diagnosticos d ON c.id_cita = d.id_cita
WHERE d.severidad = 'Crítico'
GROUP BY doc.nombre
ORDER BY casos_criticos DESC;



