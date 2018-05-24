CREATE DATABASE Mobiteli

GO

CREATE TABLE osoba
(
maticni NVARCHAR(15),
ime NVARCHAR(15) NOT NULL,
prezime NVARCHAR(15) NOT NULL,
ulica NVARCHAR(25),
mjesto NVARCHAR(15)
PRIMARY KEY (maticni)
);

GO

CREATE TABLE mobitel
(
sifra NVARCHAR(15),
proizvodi NVARCHAR(15) NOT NULL,
model NVARCHAR(15) NOT NULL,
tezina INT,
visina INT,
sirina INT,
debljina INT,
UNIQUE (proizvodi, model),
PRIMARY KEY (sifra)
);

GO

CREATE TABLE posudi
(
broj INT IDENTITY (1, 1) NOT NULL,
osoba NVARCHAR(15),
mobitel NVARCHAR(15),
uzeo DATETIME,
vratio DATETIME,
-- napomena NVARCHAR(25),
FOREIGN KEY (osoba) REFERENCES osoba,
-- FOREIGN KEY (mobitel) REFERENCES mobitel
);

GO

ALTER TABLE posudi ADD FOREIGN KEY (mobitel)
REFERENCES mobitel;
ALTER TABLE posudi ADD napomena NVARCHAR(25);