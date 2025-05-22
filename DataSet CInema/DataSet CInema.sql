
CREATE TABLE Usuarios(
id_usuario INT PRIMARY KEY NOT NULL,
Nombre NVARCHAR(100)  NOT NULL,
Edad INT NOT NULL,
Genero NVARCHAR(100),
Pais NVARCHAR(100),
Fecha_Registro DATE NOT NULL

);
GO


CREATE TABLE Peliculas (
id_pelicula INT PRIMARY KEY NOT NULL,
Titulo NVARCHAR(100) NOT NULL,
Genero NVARCHAR(100)  NOT NULL,
Director NVARCHAR(100) NOT NULL,
AÑO_ESTRENO INT,
DURACION_MIN INT,
Puntuacion_Promedio INT
);

GO


CREATE TABLE Vizualizaciones (
id_visualizacion INT PRIMARY KEY NOT NULL,
id_usuario INT,
id_pelicula INT,
fecha_visualizacion DATE,
Porcentaje_visto DECIMAL(5,2),
FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

GO

CREATE TABLE Reacciones (
    id_reaccion INT PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    tipo_reaccion VARCHAR(20), -- Me gusta, Comentario, Valoración
    comentario TEXT,
    calificacion INT, -- de 1 a 10
    fecha_reaccion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

GO


CREATE TABLE Recomendaciones (
    id_recomendacion INT PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    motivo VARCHAR(255), -- "Basado en tu amor por Ciencia Ficción", etc.
    fecha_recomendacion DATE
);

GO



INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (1, N'Mark Carpenter', 25, N'Femenino', N'Uruguay', '2024-08-31');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (2, N'Gregory Best', 43, N'Femenino', N'Bolivia', '2024-05-05');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (3, N'Jessica Rice', 39, N'Femenino', N'Chile', '2023-10-01');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (4, N'Deborah Jenkins', 59, N'Femenino', N'Bolivia', '2025-03-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (5, N'Dr. Angela Miles', 38, N'Masculino', N'Venezuela', '2024-06-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (6, N'Ashley Franklin', 51, N'Masculino', N'Ecuador', '2024-07-25');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (7, N'Oscar Medina', 62, N'Femenino', N'Bolivia', '2024-11-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (8, N'Tiffany Berger', 22, N'Masculino', N'Colombia', '2023-07-25');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (9, N'Michael Ramirez', 13, N'Masculino', N'México', '2024-09-24');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (10, N'Mary Smith', 13, N'Masculino', N'México', '2025-01-20');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (11, N'James Nolan', 56, N'Masculino', N'Ecuador', '2024-06-01');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (12, N'Sara Montoya', 28, N'Femenino', N'Perú', '2023-09-04');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (13, N'Amber Wright', 66, N'Femenino', N'Uruguay', '2025-04-09');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (14, N'Kyle Rivera', 63, N'Otro', N'Uruguay', '2025-02-04');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (15, N'Andre Chambers', 19, N'Masculino', N'Bolivia', '2024-03-13');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (16, N'Andrew Alvarado', 42, N'Masculino', N'Venezuela', '2023-12-29');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (17, N'William Terrell', 31, N'Femenino', N'Argentina', '2024-03-05');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (18, N'Daniel Nelson', 53, N'Femenino', N'España', '2024-03-26');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (19, N'Todd Lopez', 52, N'Masculino', N'España', '2024-08-02');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (20, N'Kimberly Irwin', 34, N'Femenino', N'Colombia', '2024-12-08');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (21, N'Katherine Peterson', 60, N'Masculino', N'Bolivia', '2025-01-14');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (22, N'Thomas Guerrero', 54, N'Femenino', N'Uruguay', '2024-06-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (23, N'Gary Knight', 28, N'Masculino', N'España', '2023-11-02');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (24, N'Robert Gibson', 36, N'Masculino', N'México', '2024-07-31');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (25, N'Jeffery Roberts', 18, N'Otro', N'Bolivia', '2023-08-04');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (26, N'Cody Moss', 41, N'Femenino', N'Argentina', '2024-07-25');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (27, N'Robert Santiago', 62, N'Otro', N'Bolivia', '2025-01-11');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (28, N'Linda Palmer', 54, N'Otro', N'España', '2024-12-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (29, N'Nicholas Day', 60, N'Femenino', N'Chile', '2023-08-03');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (30, N'Joanna Evans', 61, N'Masculino', N'Chile', '2024-04-17');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (31, N'Erika Rogers', 24, N'Masculino', N'Bolivia', '2024-02-21');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (32, N'Joseph Martin', 31, N'Otro', N'Bolivia', '2024-11-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (33, N'Richard Noble', 53, N'Masculino', N'Venezuela', '2024-08-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (34, N'Mark Payne', 68, N'Otro', N'Chile', '2023-09-10');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (35, N'Lacey Grant', 45, N'Otro', N'Uruguay', '2025-03-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (36, N'Stephen Kim', 57, N'Femenino', N'Uruguay', '2025-02-09');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (37, N'Rachel Martinez', 25, N'Masculino', N'Colombia', '2024-12-27');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (38, N'Donald Hardy', 46, N'Femenino', N'México', '2024-07-31');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (39, N'Brandon Thompson', 27, N'Femenino', N'España', '2024-02-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (40, N'Jacob Hicks', 62, N'Femenino', N'México', '2023-08-06');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (41, N'Brian Schroeder', 64, N'Otro', N'Chile', '2023-12-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (42, N'Lynn Payne', 48, N'Otro', N'Chile', '2025-02-06');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (43, N'Anna Miles', 44, N'Femenino', N'México', '2023-12-06');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (44, N'Chloe Jones', 48, N'Femenino', N'Bolivia', '2024-03-17');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (45, N'Matthew Davis', 31, N'Otro', N'México', '2023-08-21');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (46, N'Kelli Mills', 57, N'Otro', N'Ecuador', '2024-08-16');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (47, N'Charles Terry', 62, N'Femenino', N'España', '2024-05-09');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (48, N'Vanessa Collier', 62, N'Masculino', N'Bolivia', '2025-03-29');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (49, N'Jennifer Rice', 53, N'Masculino', N'México', '2025-02-28');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (50, N'Gina Baker', 36, N'Otro', N'Uruguay', '2023-08-07');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (51, N'Cindy Miller', 54, N'Masculino', N'México', '2024-03-26');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (52, N'David Frazier', 63, N'Femenino', N'México', '2023-11-27');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (53, N'Michael Wilson', 39, N'Femenino', N'Colombia', '2024-04-09');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (54, N'Heather Dennis', 22, N'Otro', N'Argentina', '2023-10-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (55, N'Michael Navarro', 62, N'Femenino', N'Bolivia', '2024-05-03');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (56, N'Leslie Hudson', 69, N'Masculino', N'Perú', '2024-11-04');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (57, N'John Burch', 38, N'Femenino', N'España', '2024-03-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (58, N'Daniel Wilkinson', 14, N'Femenino', N'Chile', '2024-06-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (59, N'James Johnson', 42, N'Femenino', N'España', '2023-06-01');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (60, N'Stephen Schneider', 22, N'Masculino', N'Uruguay', '2024-12-12');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (61, N'Patrick English', 18, N'Otro', N'Chile', '2024-08-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (62, N'Rachel Hunter', 28, N'Masculino', N'Venezuela', '2023-09-19');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (63, N'Sarah Strickland', 21, N'Femenino', N'Chile', '2023-08-07');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (64, N'Lindsey Smith', 25, N'Masculino', N'Perú', '2023-09-06');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (65, N'Tammy Roman', 68, N'Masculino', N'Perú', '2023-11-06');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (66, N'Virginia Garcia', 34, N'Otro', N'Perú', '2024-09-07');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (67, N'Nicole Salinas', 68, N'Femenino', N'Chile', '2023-07-30');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (68, N'Alex Jackson', 62, N'Masculino', N'Perú', '2023-11-16');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (69, N'Ashley Smith', 68, N'Otro', N'Argentina', '2024-11-20');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (70, N'Luke Wang', 66, N'Masculino', N'Bolivia', '2024-12-28');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (71, N'Joseph Vazquez', 62, N'Masculino', N'Bolivia', '2023-07-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (72, N'Edwin Trujillo', 70, N'Masculino', N'España', '2024-09-01');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (73, N'Debra Fisher', 31, N'Masculino', N'Perú', '2024-12-24');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (74, N'Daniel Ochoa', 28, N'Femenino', N'Bolivia', '2023-07-03');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (75, N'Michael Armstrong', 29, N'Masculino', N'Uruguay', '2023-10-04');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (76, N'Matthew Rodriguez', 59, N'Otro', N'Bolivia', '2024-02-28');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (77, N'Denise Mccullough', 30, N'Femenino', N'Bolivia', '2025-01-22');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (78, N'Michelle Carter', 37, N'Masculino', N'España', '2025-01-07');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (79, N'Amy Grimes', 64, N'Otro', N'Colombia', '2023-10-08');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (80, N'Christopher Glenn', 43, N'Otro', N'Ecuador', '2024-12-28');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (81, N'Christine Williamson', 58, N'Masculino', N'Bolivia', '2023-09-09');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (82, N'Benjamin Hall', 31, N'Otro', N'Venezuela', '2023-12-14');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (83, N'Michele Reyes', 15, N'Masculino', N'Chile', '2024-12-25');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (84, N'Megan Murphy', 68, N'Otro', N'Argentina', '2024-08-14');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (85, N'Michelle Garcia', 62, N'Femenino', N'Bolivia', '2025-02-13');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (86, N'Eddie Jensen', 70, N'Femenino', N'México', '2024-10-19');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (87, N'Richard Allen', 57, N'Masculino', N'Bolivia', '2024-11-26');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (88, N'Andrew Butler', 58, N'Otro', N'Bolivia', '2023-04-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (89, N'Juan Mclean', 37, N'Masculino', N'Ecuador', '2023-05-05');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (90, N'Mitchell Newman', 16, N'Masculino', N'Chile', '2024-03-27');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (91, N'Clinton Cole', 34, N'Masculino', N'Argentina', '2024-10-15');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (92, N'Scott Tran', 56, N'Femenino', N'España', '2025-03-22');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (93, N'Sandra Lowe', 53, N'Femenino', N'Chile', '2025-04-03');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (94, N'Jennifer Powers', 28, N'Masculino', N'México', '2024-07-07');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (95, N'Cindy Ortiz', 51, N'Femenino', N'España', '2023-05-13');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (96, N'Stephanie Barnett', 34, N'Otro', N'España', '2024-09-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (97, N'Jacob Parker', 24, N'Femenino', N'España', '2024-10-23');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (98, N'Christine Collins', 21, N'Otro', N'Colombia', '2023-05-18');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (99, N'Jesus Perry', 62, N'Otro', N'Chile', '2024-08-08');
INSERT INTO Usuarios (id_usuario, Nombre, Edad, Genero, Pais, Fecha_Registro) VALUES (100, N'Brittany Miller', 54, N'Femenino', N'México', '2024-08-09');


SELECT * FROM Usuarios;
GO





INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (1, N'Forget attorney.', N'Aventura', N'Timothy Roberts', 1990, 166, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (2, N'Feel road.', N'Aventura', N'Timothy Roberts', 2000, 126, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (3, N'Perhaps.', N'Drama', N'Shannon Johnson', 1984, 134, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (4, N'Memory.', N'Documental', N'Shannon Johnson', 2024, 121, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (5, N'Contain moment.', N'Animación', N'Shannon Johnson', 1981, 113, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (6, N'Despite in.', N'Animación', N'Timothy Roberts', 2021, 118, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (7, N'Him church.', N'Thriller', N'Eric Bell', 2018, 143, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (8, N'World some hour.', N'Animación', N'Mrs. Erika Parker', 1986, 136, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (9, N'Space support.', N'Romance', N'Jeffrey French', 1989, 124, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (10, N'Real will.', N'Acción', N'Mrs. Erika Parker', 2003, 158, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (11, N'Less would.', N'Ciencia Ficción', N'Tanya Graham', 2017, 92, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (12, N'My face.', N'Comedia', N'Shannon Johnson', 1999, 164, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (13, N'Board laugh.', N'Animación', N'Stephanie Baldwin', 2002, 87, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (14, N'Term add.', N'Drama', N'Sydney Mclaughlin', 2012, 82, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (15, N'Very.', N'Terror', N'Melanie Kane', 2006, 121, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (16, N'Lawyer remember mention.', N'Drama', N'Shannon Johnson', 2002, 179, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (17, N'Trouble car character.', N'Terror', N'Mrs. Erika Parker', 1993, 137, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (18, N'Foot land sometimes.', N'Documental', N'Eric Bell', 2001, 179, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (19, N'North nearly answer.', N'Acción', N'Timothy Roberts', 1994, 114, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (20, N'Guess somebody.', N'Comedia', N'Tanya Graham', 1982, 158, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (21, N'Paper exactly.', N'Thriller', N'Sydney Mclaughlin', 1991, 131, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (22, N'Not carry player box.', N'Drama', N'Lori Williams', 2003, 177, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (23, N'Rise soon pick number.', N'Animación', N'Shannon Johnson', 2013, 173, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (24, N'With look pull.', N'Thriller', N'Lori Williams', 2021, 121, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (25, N'All sing health.', N'Terror', N'Shannon Johnson', 1982, 154, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (26, N'Direction character office.', N'Romance', N'Caroline Scott', 1985, 117, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (27, N'Sure ball for.', N'Comedia', N'Scott Bowen', 2023, 138, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (28, N'Direction down across.', N'Documental', N'Carol Gonzalez', 1982, 102, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (29, N'Gas laugh trade.', N'Romance', N'Eric Bell', 2009, 152, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (30, N'Family.', N'Ciencia Ficción', N'Scott Bowen', 1987, 150, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (31, N'Friend station save.', N'Animación', N'Mrs. Erika Parker', 2008, 97, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (32, N'Structure feel show.', N'Ciencia Ficción', N'Lori Williams', 1996, 132, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (33, N'Impact.', N'Drama', N'Veronica Cooley', 1986, 136, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (34, N'Whole buy bad.', N'Animación', N'Mrs. Erika Parker', 2009, 91, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (35, N'Sure discuss.', N'Comedia', N'Eric Bell', 1987, 94, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (36, N'Better blood.', N'Thriller', N'Caroline Scott', 1987, 127, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (37, N'Discussion position lay.', N'Documental', N'Mrs. Erika Parker', 2025, 108, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (38, N'System four.', N'Ciencia Ficción', N'Jennifer Scott', 2010, 133, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (39, N'Hope.', N'Comedia', N'Scott Bowen', 1993, 150, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (40, N'Dinner more city.', N'Documental', N'Scott Bowen', 2014, 156, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (41, N'International school score.', N'Thriller', N'Tanya Graham', 2009, 92, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (42, N'Administration answer result.', N'Drama', N'Lori Williams', 2007, 118, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (43, N'State heart idea.', N'Acción', N'Tanya Graham', 1988, 115, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (44, N'Read million.', N'Romance', N'Melanie Kane', 1988, 91, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (45, N'Fund better.', N'Comedia', N'Caroline Scott', 1998, 179, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (46, N'Stand public instead visit.', N'Ciencia Ficción', N'Brenda Hall', 1986, 82, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (47, N'East discuss.', N'Aventura', N'Veronica Cooley', 2009, 171, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (48, N'Leg total.', N'Acción', N'Melanie Kane', 2024, 122, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (49, N'Example specific opportunity.', N'Comedia', N'Justin Russell', 2012, 110, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (50, N'Avoid.', N'Thriller', N'Maria Harris', 2019, 119, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (51, N'Smile compare environmental.', N'Ciencia Ficción', N'Scott Bowen', 1990, 139, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (52, N'White itself interview family.', N'Documental', N'Tanya Graham', 2023, 93, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (53, N'Sister manage relationship.', N'Thriller', N'Mrs. Erika Parker', 2005, 117, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (54, N'Statement almost couple.', N'Drama', N'Jeffrey French', 2004, 134, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (55, N'Road country.', N'Drama', N'Tanya Graham', 2009, 80, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (56, N'Yeah center you.', N'Thriller', N'Justin Russell', 2017, 148, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (57, N'Site picture.', N'Comedia', N'Michael Santos', 2014, 107, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (58, N'Study these.', N'Romance', N'Lori Williams', 1982, 128, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (59, N'Concern might reveal.', N'Animación', N'Brenda Hall', 2012, 104, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (60, N'Fine force.', N'Comedia', N'Sydney Mclaughlin', 1993, 112, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (61, N'With large girl.', N'Animación', N'Jennifer Scott', 2013, 103, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (62, N'Than why.', N'Romance', N'Eric Bell', 2011, 172, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (63, N'Kitchen learn.', N'Acción', N'Sydney Mclaughlin', 2016, 94, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (64, N'Several focus.', N'Animación', N'Stephanie Baldwin', 1992, 163, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (65, N'Although term exactly time.', N'Thriller', N'Jennifer Scott', 2022, 122, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (66, N'Wear why board dog.', N'Aventura', N'Scott Bowen', 2019, 176, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (67, N'Yes movie quickly.', N'Documental', N'Michael Santos', 1999, 88, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (68, N'Woman activity.', N'Comedia', N'Stephanie Baldwin', 1994, 108, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (69, N'Prove arm.', N'Documental', N'Maria Harris', 2011, 173, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (70, N'Quite money hard.', N'Acción', N'Carol Gonzalez', 2014, 126, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (71, N'Study stay young.', N'Documental', N'Maria Harris', 1995, 172, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (72, N'Name manage.', N'Aventura', N'Timothy Roberts', 2022, 134, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (73, N'Detail.', N'Animación', N'Maria Harris', 1986, 174, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (74, N'Red occur community.', N'Aventura', N'Lori Williams', 1997, 135, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (75, N'People new water.', N'Ciencia Ficción', N'Sydney Mclaughlin', 1990, 164, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (76, N'Compare stand network.', N'Terror', N'Mrs. Erika Parker', 2024, 135, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (77, N'Plant half carry.', N'Comedia', N'Veronica Cooley', 1988, 106, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (78, N'Movement matter why.', N'Thriller', N'Sydney Mclaughlin', 1989, 132, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (79, N'Brother either example.', N'Terror', N'Carol Gonzalez', 2010, 114, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (80, N'Around someone.', N'Drama', N'Shannon Johnson', 2012, 171, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (81, N'Lot strong.', N'Thriller', N'Caroline Scott', 2024, 110, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (82, N'Minute far.', N'Ciencia Ficción', N'Sydney Mclaughlin', 2024, 138, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (83, N'Standard dark.', N'Thriller', N'Jeffrey French', 1983, 90, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (84, N'Test add maintain.', N'Comedia', N'Stephanie Baldwin', 2017, 92, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (85, N'Husband conference.', N'Drama', N'Michael Santos', 2019, 125, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (86, N'Show drive good huge.', N'Terror', N'Jeffrey French', 2020, 120, 9);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (87, N'Party party.', N'Ciencia Ficción', N'Justin Russell', 2011, 175, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (88, N'Mean billion.', N'Acción', N'Eric Bell', 1992, 95, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (89, N'Just security lay.', N'Terror', N'Timothy Roberts', 1999, 118, 1);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (90, N'Whose too white.', N'Animación', N'Lori Williams', 1983, 152, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (91, N'Look mouth program.', N'Acción', N'Eric Bell', 2006, 108, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (92, N'Have country break.', N'Documental', N'Scott Johnson', 2023, 178, 2);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (93, N'Hair need energy involve.', N'Comedia', N'Mrs. Erika Parker', 1985, 106, 7);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (94, N'For.', N'Comedia', N'Michael Santos', 2005, 129, 8);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (95, N'Like answer occur.', N'Thriller', N'Carol Gonzalez', 1989, 139, 10);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (96, N'Each probably list.', N'Thriller', N'Justin Russell', 2014, 138, 3);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (97, N'Far data.', N'Documental', N'Jennifer Scott', 2005, 89, 6);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (98, N'Feel.', N'Drama', N'Michael Santos', 2017, 149, 4);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (99, N'Available how they.', N'Comedia', N'Brenda Hall', 1988, 133, 5);
INSERT INTO Peliculas (id_pelicula, Titulo, Genero, Director, AÑO_ESTRENO, DURACION_MIN, Puntuacion_Promedio) VALUES (100, N'Music receive.', N'Romance', N'Tanya Graham', 1996, 115, 8);




INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (1, 48, 98, '2024-06-12', 45.16);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (2, 80, 59, '2024-04-25', 58.58);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (3, 63, 32, '2025-02-16', 87.3);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (4, 91, 17, '2024-05-04', 68.27);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (5, 78, 65, '2024-11-29', 42.27);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (6, 97, 35, '2024-12-06', 38.55);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (7, 11, 81, '2024-09-16', 25.04);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (8, 86, 25, '2024-10-04', 32.25);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (9, 58, 41, '2024-10-31', 12.72);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (10, 19, 39, '2024-08-05', 70.97);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (11, 14, 74, '2024-07-24', 85.48);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (12, 28, 34, '2024-12-22', 33.73);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (13, 48, 97, '2024-11-19', 82.58);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (14, 80, 1, '2024-07-07', 99.91);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (15, 2, 3, '2025-01-13', 47.82);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (16, 79, 4, '2024-08-16', 50.02);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (17, 6, 35, '2024-04-21', 15.91);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (18, 67, 39, '2025-03-07', 53.64);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (19, 48, 46, '2024-06-12', 81.55);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (20, 31, 32, '2025-01-13', 12.69);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (21, 63, 14, '2024-07-20', 32.02);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (22, 67, 45, '2024-07-12', 18.6);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (23, 50, 18, '2024-10-24', 75.22);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (24, 63, 19, '2024-04-16', 34.85);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (25, 23, 25, '2024-06-18', 74.6);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (26, 69, 20, '2024-10-20', 24.19);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (27, 64, 38, '2024-07-20', 76.82);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (28, 75, 24, '2024-08-11', 70.96);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (29, 37, 54, '2025-01-27', 15.47);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (30, 21, 39, '2024-11-18', 52.28);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (31, 14, 59, '2025-01-06', 44.91);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (32, 16, 73, '2024-12-04', 30.24);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (33, 24, 41, '2024-12-23', 46.46);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (34, 84, 59, '2025-02-17', 57.3);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (35, 17, 24, '2025-02-04', 51.62);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (36, 1, 78, '2024-08-22', 96.16);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (37, 46, 17, '2024-09-29', 86.34);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (38, 45, 98, '2024-12-23', 90.93);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (39, 90, 82, '2025-01-05', 22.12);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (40, 67, 66, '2024-07-19', 33.57);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (41, 65, 28, '2024-06-25', 95.96);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (42, 100, 26, '2024-10-21', 20.11);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (43, 77, 62, '2024-12-03', 45.98);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (44, 45, 79, '2024-10-06', 94.62);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (45, 9, 8, '2024-11-21', 56.1);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (46, 47, 1, '2025-04-03', 97.39);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (47, 22, 19, '2024-06-05', 14.59);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (48, 21, 8, '2024-05-18', 64.93);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (49, 57, 8, '2024-08-31', 90.28);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (50, 7, 5, '2024-07-03', 19.71);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (51, 27, 31, '2024-08-29', 24.24);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (52, 51, 93, '2024-08-08', 13.97);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (53, 25, 81, '2024-11-14', 85.66);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (54, 62, 6, '2025-03-05', 25.96);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (55, 31, 24, '2024-06-28', 71.26);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (56, 95, 27, '2025-01-16', 70.1);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (57, 62, 98, '2024-12-11', 46.84);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (58, 98, 32, '2024-06-05', 95.22);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (59, 55, 60, '2024-07-08', 88.65);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (60, 71, 21, '2024-07-15', 57.57);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (61, 84, 68, '2024-06-05', 71.03);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (62, 55, 57, '2025-02-25', 86.42);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (63, 22, 1, '2024-05-22', 83.0);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (64, 40, 11, '2024-09-10', 39.15);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (65, 3, 73, '2024-12-12', 82.81);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (66, 79, 38, '2024-12-22', 33.4);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (67, 42, 58, '2024-05-18', 54.39);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (68, 78, 94, '2024-09-18', 71.75);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (69, 65, 10, '2024-05-12', 10.13);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (70, 3, 97, '2024-08-18', 96.48);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (71, 83, 14, '2025-04-01', 72.39);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (72, 79, 84, '2024-06-17', 21.86);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (73, 17, 31, '2024-07-14', 73.71);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (74, 96, 51, '2025-03-31', 31.65);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (75, 55, 98, '2024-12-08', 43.26);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (76, 44, 76, '2025-04-03', 73.86);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (77, 33, 11, '2024-07-04', 79.34);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (78, 71, 15, '2024-10-14', 30.39);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (79, 88, 94, '2024-11-09', 31.62);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (80, 90, 23, '2024-09-11', 68.05);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (81, 47, 21, '2025-01-02', 73.2);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (82, 78, 78, '2024-11-07', 12.62);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (83, 14, 18, '2024-07-05', 56.58);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (84, 7, 77, '2024-08-02', 11.0);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (85, 45, 96, '2024-12-02', 31.04);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (86, 45, 68, '2024-11-22', 34.68);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (87, 59, 76, '2024-04-29', 59.98);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (88, 69, 97, '2025-04-10', 87.13);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (89, 81, 57, '2024-05-19', 88.38);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (90, 53, 3, '2025-01-23', 66.25);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (91, 31, 34, '2024-07-13', 59.94);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (92, 65, 90, '2025-01-07', 11.35);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (93, 77, 19, '2024-10-19', 92.3);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (94, 29, 36, '2024-07-30', 52.01);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (95, 27, 90, '2024-10-29', 57.63);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (96, 3, 91, '2025-02-10', 35.63);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (97, 85, 51, '2024-06-10', 10.07);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (98, 75, 67, '2024-06-06', 46.28);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (99, 7, 29, '2024-04-27', 73.08);
INSERT INTO Vizualizaciones (id_visualizacion, id_usuario, id_pelicula, fecha_visualizacion, Porcentaje_visto) VALUES (100, 12, 63, '2025-01-04', 41.94);





INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (1, 14, 10, 'Comentario', 'Natural resource machine or western.', 7, '2024-10-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (2, 4, 83, 'Me gusta', '', 5, '2025-04-01');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (3, 90, 43, 'Me gusta', '', 8, '2024-07-21');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (4, 86, 75, 'Me gusta', '', 7, '2025-04-05');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (5, 14, 71, 'Me gusta', '', 2, '2025-04-01');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (6, 31, 56, 'Comentario', 'Deal join exactly decade.', 7, '2025-01-01');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (7, 38, 58, 'Me gusta', '', 9, '2025-03-02');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (8, 55, 11, 'Comentario', 'Break realize reflect author hard address.', 1, '2024-07-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (9, 69, 41, 'Comentario', 'Give notice police cause official grow score.', 8, '2024-05-23');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (10, 53, 12, 'Comentario', 'Talk fish I sign single more drug.', 7, '2025-02-15');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (11, 8, 5, 'Comentario', 'Find third head shake step west head.', 7, '2025-02-18');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (12, 3, 47, 'Valoración', 'About feeling author remain.', 8, '2024-11-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (13, 36, 71, 'Comentario', 'Try the mission camera.', 5, '2025-04-08');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (14, 100, 69, 'Me gusta', '', 8, '2024-11-27');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (15, 59, 4, 'Valoración', 'Front not he exist brother step.', 9, '2025-03-28');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (16, 51, 33, 'Me gusta', '', 3, '2024-08-14');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (17, 36, 88, 'Valoración', 'Hand pull floor education.', 5, '2024-05-21');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (18, 67, 40, 'Me gusta', '', 9, '2024-08-06');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (19, 9, 93, 'Comentario', 'Water me page worker.', 9, '2024-09-06');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (20, 41, 17, 'Me gusta', '', 2, '2024-12-31');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (21, 57, 46, 'Valoración', 'Argue its work camera type behavior miss.', 4, '2024-12-18');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (22, 49, 81, 'Valoración', 'Peace attorney on reach member practice join.', 3, '2024-11-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (23, 60, 4, 'Comentario', 'Glass camera our behavior provide none two.', 9, '2024-07-14');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (24, 69, 14, 'Me gusta', '', 1, '2025-01-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (25, 60, 80, 'Comentario', 'General environment middle shake.', 5, '2024-08-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (26, 35, 3, 'Valoración', 'Nor go evening hour through wrong chair.', 8, '2025-02-17');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (27, 98, 85, 'Me gusta', '', 9, '2024-06-30');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (28, 99, 83, 'Me gusta', '', 10, '2024-11-21');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (29, 65, 86, 'Valoración', 'Difficult hot similar street.', 10, '2024-12-17');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (30, 80, 22, 'Valoración', 'Reach blue relate class.', 4, '2024-09-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (31, 59, 46, 'Me gusta', '', 8, '2025-01-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (32, 34, 75, 'Comentario', 'Level not lead three tonight traditional.', 6, '2025-03-05');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (33, 83, 33, 'Valoración', 'Ago ask low car prove.', 9, '2024-11-10');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (34, 77, 19, 'Me gusta', '', 5, '2025-02-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (35, 86, 22, 'Comentario', 'Almost crime attention coach mother yourself carry.', 4, '2025-02-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (36, 91, 34, 'Comentario', 'Student well single field every stock bill claim.', 8, '2024-11-09');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (37, 31, 1, 'Me gusta', '', 3, '2024-05-26');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (38, 22, 11, 'Comentario', 'Where yourself detail class individual wait land.', 6, '2024-12-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (39, 5, 98, 'Valoración', 'Star role note morning actually Congress character.', 10, '2025-02-24');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (40, 21, 41, 'Me gusta', '', 3, '2025-01-18');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (41, 50, 5, 'Valoración', 'Parent history as operation line yard term.', 2, '2025-01-11');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (42, 89, 46, 'Me gusta', '', 9, '2024-09-11');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (43, 89, 44, 'Me gusta', '', 3, '2025-02-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (44, 26, 7, 'Comentario', 'Nature during building base team month.', 4, '2024-07-14');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (45, 54, 14, 'Valoración', 'Product size night among probably.', 9, '2024-07-28');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (46, 81, 76, 'Comentario', 'Recognize medical production.', 6, '2024-04-17');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (47, 61, 76, 'Me gusta', '', 2, '2024-11-06');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (48, 35, 77, 'Valoración', 'Per or attack available medical.', 3, '2024-08-19');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (49, 29, 94, 'Me gusta', '', 1, '2024-07-08');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (50, 94, 72, 'Comentario', 'Item major need fast keep maybe expect ask.', 9, '2024-07-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (51, 71, 21, 'Comentario', 'Media popular where morning.', 2, '2024-08-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (52, 26, 52, 'Me gusta', '', 1, '2024-09-01');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (53, 55, 50, 'Me gusta', '', 9, '2025-01-16');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (54, 82, 94, 'Me gusta', '', 7, '2024-08-14');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (55, 64, 49, 'Comentario', 'Single appear charge easy.', 4, '2024-11-27');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (56, 36, 39, 'Me gusta', '', 5, '2024-08-30');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (57, 96, 98, 'Me gusta', '', 7, '2024-08-18');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (58, 40, 88, 'Comentario', 'Few adult trial generation professional investment personal.', 2, '2024-05-23');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (59, 68, 48, 'Valoración', 'Product page several beyond all.', 2, '2025-03-09');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (60, 19, 38, 'Comentario', 'Its task actually skin without happen.', 3, '2024-05-28');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (61, 91, 27, 'Comentario', 'Since onto exactly site meeting.', 2, '2024-05-23');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (62, 71, 5, 'Valoración', 'Old subject last make generation senior.', 7, '2024-08-29');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (63, 14, 41, 'Me gusta', '', 1, '2024-08-30');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (64, 67, 39, 'Me gusta', '', 5, '2024-08-13');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (65, 62, 58, 'Valoración', 'Personal dinner project require five listen church.', 9, '2024-10-10');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (66, 64, 78, 'Valoración', 'Fund next type trip.', 2, '2025-02-10');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (67, 93, 49, 'Me gusta', '', 6, '2024-09-26');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (68, 93, 84, 'Me gusta', '', 1, '2025-01-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (69, 41, 87, 'Comentario', 'Goal long use truth.', 6, '2025-04-15');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (70, 77, 84, 'Comentario', 'Story while nor very.', 7, '2025-04-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (71, 20, 71, 'Comentario', 'Number head over early particularly listen.', 1, '2025-02-05');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (72, 76, 3, 'Me gusta', '', 2, '2024-06-19');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (73, 97, 32, 'Me gusta', '', 10, '2025-03-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (74, 77, 36, 'Me gusta', '', 10, '2024-05-30');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (75, 32, 24, 'Valoración', 'American million cold mother produce size.', 9, '2024-07-23');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (76, 1, 5, 'Valoración', 'Guess almost city score.', 9, '2025-01-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (77, 41, 52, 'Valoración', 'Baby will identify ground.', 4, '2025-02-07');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (78, 6, 1, 'Me gusta', '', 4, '2024-11-19');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (79, 90, 94, 'Valoración', 'Approach drug voice kind they around.', 10, '2025-02-17');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (80, 18, 47, 'Valoración', 'His technology near strategy clear mouth.', 7, '2024-04-17');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (81, 67, 21, 'Comentario', 'Mrs usually always role true approach.', 8, '2024-09-26');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (82, 84, 13, 'Me gusta', '', 5, '2024-07-04');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (83, 37, 36, 'Valoración', 'Laugh four laugh theory.', 2, '2024-11-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (84, 72, 84, 'Me gusta', '', 3, '2024-04-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (85, 11, 96, 'Comentario', 'Challenge first street according third ability much agree.', 10, '2025-01-12');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (86, 39, 98, 'Valoración', 'Technology magazine here where budget.', 10, '2024-11-13');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (87, 28, 58, 'Me gusta', '', 2, '2025-02-24');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (88, 35, 42, 'Valoración', 'Production charge student different bank score south type.', 3, '2024-06-11');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (89, 3, 100, 'Comentario', 'Identify very main ahead.', 5, '2025-04-03');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (90, 37, 51, 'Comentario', 'Care strategy table history million.', 9, '2024-09-20');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (91, 5, 97, 'Valoración', 'Lead possible recently late.', 1, '2024-11-11');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (92, 66, 100, 'Valoración', 'These they lawyer party difficult.', 9, '2024-05-29');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (93, 41, 52, 'Me gusta', '', 8, '2024-10-15');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (94, 81, 31, 'Me gusta', '', 1, '2024-10-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (95, 32, 92, 'Valoración', 'Environmental suddenly relate beautiful subject.', 2, '2024-10-06');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (96, 62, 25, 'Comentario', 'Responsibility girl method college ago age hair fly.', 5, '2024-07-28');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (97, 48, 81, 'Me gusta', '', 10, '2024-09-19');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (98, 98, 65, 'Comentario', 'Score simply population produce drop several career.', 7, '2025-01-23');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (99, 29, 91, 'Comentario', 'Statement left store federal road key.', 9, '2024-12-22');
INSERT INTO Reacciones (id_reaccion, id_usuario, id_pelicula, tipo_reaccion, comentario, calificacion, fecha_reaccion) VALUES (100, 99, 33, 'Valoración', 'Kitchen treat treat over student term community.', 2, '2024-05-24');




INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (1, 12, 61, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (2, 65, 89, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (3, 47, 49, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (4, 21, 26, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (5, 34, 66, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (6, 23, 95, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (7, 44, 51, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (8, 45, 27, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (9, 60, 95, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (10, 62, 54, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (11, 30, 70, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (12, 94, 97, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (13, 49, 83, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (14, 1, 9, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (15, 31, 2, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (16, 40, 51, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (17, 36, 42, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (18, 51, 5, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (19, 20, 26, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (20, 22, 80, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (21, 1, 22, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (22, 55, 32, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (23, 16, 77, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (24, 76, 29, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (25, 21, 64, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (26, 68, 81, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (27, 21, 54, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (28, 22, 21, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (29, 33, 88, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (30, 50, 89, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (31, 18, 89, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (32, 77, 42, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (33, 3, 93, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (34, 43, 46, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (35, 35, 91, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (36, 49, 14, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (37, 3, 74, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (38, 67, 78, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (39, 67, 40, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (40, 31, 20, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (41, 28, 34, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (42, 70, 63, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (43, 24, 89, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (44, 8, 54, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (45, 44, 24, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (46, 14, 92, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (47, 4, 21, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (48, 21, 57, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (49, 98, 94, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (50, 16, 84, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (51, 89, 44, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (52, 56, 88, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (53, 17, 24, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (54, 2, 27, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (55, 36, 50, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (56, 31, 6, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (57, 60, 98, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (58, 58, 74, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (59, 15, 48, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (60, 60, 47, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (61, 11, 67, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (62, 52, 60, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (63, 26, 40, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (64, 89, 82, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (65, 64, 81, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (66, 71, 51, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (67, 97, 25, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (68, 8, 29, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (69, 34, 20, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (70, 5, 41, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (71, 43, 78, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (72, 32, 74, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (73, 93, 26, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (74, 27, 25, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (75, 63, 73, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (76, 20, 66, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (77, 49, 21, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (78, 69, 66, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (79, 75, 42, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (80, 88, 97, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (81, 100, 31, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (82, 45, 21, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (83, 13, 77, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (84, 95, 85, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (85, 54, 11, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (86, 7, 39, 'Tendencia en tu país', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (87, 18, 18, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (88, 23, 95, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (89, 72, 59, 'Popular entre tu grupo de edad', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (90, 86, 92, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (91, 36, 74, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (92, 56, 20, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (93, 93, 97, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (94, 18, 66, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (95, 46, 94, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (96, 62, 41, 'Recomendado por usuarios similares', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (97, 70, 22, 'Basado en tu amor por Acción', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (98, 60, 76, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (99, 80, 47, 'Similar a películas que viste recientemente', '2025-04-16');
INSERT INTO Recomendaciones (id_recomendacion, id_usuario, id_pelicula, motivo, fecha_recomendacion) VALUES (100, 80, 13, 'Recomendado por usuarios similares', '2025-04-16');



SELECT * FROM Usuarios;
GO

SELECT * FROM Peliculas;
GO

SELECT * FROM Recomendaciones;
GO

SELECT * FROM Vizualizaciones;
GO

SELECT * FROM Reacciones;
GO



-- 1. ¿Cuál es el promedio de visualización por género?
SELECT 
    P.Genero,
    AVG(V.Porcentaje_visto) AS Promedio_Visualizacion
FROM Vizualizaciones V
JOIN Peliculas P ON V.id_pelicula = P.id_pelicula
GROUP BY P.Genero
ORDER BY Promedio_Visualizacion DESC;


SELECT
 p.titulo,
 SUM(CASE WHEN R.tipo_reaccion='Me gusta' THEN 1 ELSE 0 END) AS Total_likes,
 SUM(CASE WHEN R.calificacion <=4 THEN 1 ELSE 0 END) AS Total_Negativas
 FROM Reacciones R
 JOIN Peliculas p ON R.id_pelicula=p.id_pelicula
 GROUP BY p.Titulo
 ORDER BY Total_likes DESC , Total_Negativas DESC;




SELECT * FROM Reacciones;
GO

select * from Recomendaciones;
go


SELECT 
    U.Nombre,
    COUNT(DISTINCT V.id_visualizacion) AS Total_Visualizaciones,
    COUNT(DISTINCT R.id_reaccion) AS Total_Reacciones,
    COUNT(DISTINCT V.id_visualizacion) + COUNT(DISTINCT R.id_reaccion) AS Total_Actividad
FROM Usuarios U
LEFT JOIN Vizualizaciones V ON U.id_usuario = V.id_usuario
LEFT JOIN Reacciones R ON U.id_usuario = R.id_usuario
GROUP BY U.Nombre
ORDER BY Total_Actividad DESC;
