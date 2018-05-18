DROP DATABASE UPISI
CREATE DATABASE Upisi

USE Upisi
CREATE TABLE Polaznici (
	sifra_polaznika INT NOT NULL PRIMARY KEY CHECK (sifra_polaznika BETWEEN 1 AND 1000),
	ime CHAR(50)NOT NULL,
	prezime CHAR (50)NOT NULL,
	mjesto_stanovanja CHAR(25)
)

USE Upisi
CREATE TABLE Tecajevi (
	sifra_tecaja CHAR(3) NOT NULL PRIMARY KEY,
	naziv_tecaja CHAR(255) NOT NULL
)	
USE Upisi
CREATE TABLE Upisi (
	sifra_polaznika INT FOREIGN KEY REFERENCES Polaznici(sifra_polaznika),
	sifra_tecaja CHAR(3) FOREIGN KEY REFERENCES Tecajevi (sifra_tecaja)
	CONSTRAINT PK_sifre PRIMARY KEY(sifra_polaznika, sifra_tecaja)
)

USE Upisi
INSERT INTO Polaznici VALUES 
(1, 'Ana', 'Milic', 'Zagreb'),
(2, 'Sanja', 'Tarak', 'Split'),
(3, 'Mladen', 'Gork', 'Osijek'),
(4, 'Ivana', 'Matkic', 'Split'),
(5, 'Marina', 'Anic', 'Osijek'),
(6, 'Ivica', 'Limac', 'Split')

SELECT * FROM Polaznici

USE Upisi
INSERT INTO Tecajevi VALUES 
('P01', 'Osnovi rada PC racunala'),
('P02', 'Microsoft Word'),
('N01', 'SQL Osnove'),
('O01', 'Racunalni operator - uredsko poslovanje'),
('O02', 'Specijalist poslovne primjene racunala'),
('O03', 'Graficki dizajner')

SELECT * FROM Tecajevi

USE Upisi
INSERT INTO Upisi VALUES (1, 'P01') 
INSERT INTO Upisi VALUES (2, 'P02')
INSERT INTO Upisi VALUES (3, 'N01')
INSERT INTO Upisi VALUES (4, 'O01')
INSERT INTO Upisi VALUES (5, 'O02')
INSERT INTO Upisi VALUES (6, 'P01')