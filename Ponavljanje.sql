CREATE DATABASE Upisi

USE Upisi
CREATE TABLE Polaznici (
	sifra_polaznika INT NOT NULL PRIMARY KEY CHECK (sifra_polaznika BETWEEN 1 AND 1000),
	ime CHAR(50)NOT NULL,
	prezime CHAR (50)NOT NULL,
	mjesto_stanovanja CHAR(25)
)


CREATE TABLE Tecajevi (
	sifra_tecaja CHAR(3) NOT NULL PRIMARY KEY,
	naziv_tecaja CHAR(255) NOT NULL
)

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


--1.	Ispišite podatke iz svih stupaca tablice Polaznici.
SELECT * FROM Polaznici;

--2.	Ispišite podatke iz svih stupaca tablice Polaznici i stupcima promijenite naziv u ispisu rezultata: sifra_polaznika – Šifra, ime – Ime osobe, c– Prezime osobe Sortirajmo podatke u upitu tako da je ime sortirano uzlazno.
SELECT sifra_polaznika AS Šifra, ime AS 'Ime Osobe', prezime AS 'Prezime osobe', mjesto_stanovanja AS 'Mjesto' FROM Polaznici
ORDER BY [Ime Osobe] ASC;

--3.	Sortirajmo podatke u upitu tako da je mjesto_stanovanja sortirano silazno.
SELECT sifra_polaznika AS Šifra, ime AS 'Ime Osobe', prezime AS 'Prezime osobe', mjesto_stanovanja AS 'Mjesto' FROM Polaznici
ORDER BY [Mjesto] DESC;

--4.	Ispišite sva mjesta stanovanja. Na popisu se ne smiju pojaviti duplikati.
SELECT DISTINCT mjesto_stanovanja FROM Polaznici

--5.	Ispišite prva 3 zapisa iz tablice Polaznici.
SELECT  TOP 3 * FROM Polaznici

--6.	Ispišite sve polaznike iz Splita.
SELECT * FROM Polaznici
WHERE mjesto_stanovanja = 'Split';

--7.	Ispišite sve polaznike kojima je šifra 1, 3 ili 5.
SELECT * FROM Polaznici
WHERE sifra_polaznika IN(1,2,5)

--8.	Ispišite iz tablice Upisi sve šifre polaznika koji su upisali seminare „Osnove rada PC računala“ (šifra P01) i „Microsoft Word“ (šifra P02).
SELECT sifra_polaznika FROM Upisi
WHERE sifra_tecaja = 'P01'

--9.	Ispišite iz tablice Polaznici imena i prezimena onih polaznika koje ne žive u Zagrebu.
SELECT ime, prezime FROM Polaznici
WHERE mjesto_stanovanja <> 'Zagreb';

--11.	Ispišite iz tablice Polaznici imena i prezimena onih polaznika koje žive u Splitu i šifra im je veća od 2.
SELECT ime, prezime FROM Polaznici
WHERE mjesto_stanovanja = 'Split' AND sifra_polaznika >2;

--12.	Ispišite iz tablice Polaznici sve polaznike čije prezime počinje slovom M.
SELECT * FROM Polaznici
WHERE prezime LIKE ('m%');

--13.	Ispišite iz tablice Tečajevi sve tečajeve koje sadrže riječ Racun.
SELECT * FROM Tecajevi
WHERE naziv_tecaja LIKE ('%Racun%');

--14.	Ispišite iz tablice Polaznici sve polaznike čije prezime završava na ak:
SELECT * FROM Polaznici
WHERE prezime LIKE ('%ak');

--15.	Ispišite iz tablice Polaznici sva mjesta stanovanja koja u svome nazivu ne sadrže slovo s.
SELECT mjesto_stanovanja FROM Polaznici
WHERE mjesto_stanovanja NOT LIKE '%s%'

--16.  Ispišite imena i prezimena nastavnika s nazivom mjesta u kojem stanuju.
USE Fakultet
SELECT n.imeNastavnik, n.prezNastavnik,m.nazMjesto 
FROM nastavnik AS n 
INNER JOIN mjesto AS m ON n.pbrStan=m.pbr

--17. Ispišimo imena i prezimena svih studenata zajedno s ispitima na koje su izašli i ocjenama koje su dobili. Naravno, bit će studenata koji nisu ni jednom izašli na neki ispit, pa kod njih ne možemo ispisati šifru ispita.
USE FAKULTET
SELECT s.imeStud, s.prezStud, i.sifPred, p.nazPred, i.ocjena
FROM stud AS s 
LEFT JOIN ispit AS i ON s.mbrStud = i.mbrStud
INNER JOIN pred AS p ON i.sifPred = p.sifPred

--18.Ispišimo sve predmete i dvorane u kojima se predaje. Kako se neki predmeti ne predaj  ovaj semestar, oni nemaju rezerviranu dvoranu, pa će to biti reprezentirano NULL vrijednostima.
USE Fakultet
SELECT p.nazPred, r.oznDvorana
FROM pred AS p 
LEFT JOIN rezervacija AS r ON p.sifPred = r.sifPred

--19. Ispišimo sve studente koji su izašli na ispite i sve predmete. Naravno, bit će studenata koji nisu izašli ni na jedan predmet, ali i predmeta na koje nitko nije izašao.
USE Fakultet
SELECT s.imeStud, s.prezStud, p.nazPred
FROM stud AS s
JOIN ispit AS i ON s.mbrStud = i.mbrStud
JOIN pred AS p ON i.sifPred = p.sifPred

