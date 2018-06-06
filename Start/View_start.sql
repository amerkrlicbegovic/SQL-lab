--VIEW
--Npr, u fakutetskoj bazi kreirajmo pogled na predmete koji ne sadrži koliko je upisano studenata i kojoj organizacijskoj jedinici pripada:
USE fakultet
CREATE VIEW PopisPredmeta AS
SELECT sifPred AS Šifra, kratPred AS Kratica, nazPred AS Naziv
FROM pred

USE fakultet
SELECT * FROM PopisPredmeta
GO

--Npr. kreirajmo pogled kojim vidimo samo predmete sa parnim šiframa:
USE fakultet
GO
CREATE VIEW PopisParnihPredmeta AS
SELECT sifPred AS Šifra, kratPred AS Kratica, nazPred AS Naziv
FROM pred WHERE sifPred%2 = 0
GO
SELECT * FROM PopisParnihPredmeta
GO


--1. Kreirajte pogled tablicu Splicani u kojoj se nalaze podaci samo polaznika iz tablice Polaznici čije je mjesto stanovanja Split.

--2. Kreirajte pogled na tablicu Polaznici. Sadrži samo imena i prezimena polaznika.

--3. Kreirajte pogled koji sadrži informacije o polaznicima i upisanim seminarima.

--4. Kreirajte pogled Inicijali i ispišite inicijal imena i prezime polaznika (npr. A. Milić) u jednom stupcu nazvanom Polaznik.

--5. Kreirajte pogled Sanja iz tablice Polaznici ispišite rečenice oblika: Sanja Tarak ima šifru 2.