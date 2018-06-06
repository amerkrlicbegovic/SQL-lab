--AGREGATNE FUNKCIJE
--ZADATAK 1.1
---Koliko ukupno ima predmeta?
--Rješenje:
SELECT COUNT(*) AS 'Ukupno predmeta'
FROM pred


--ZADATAK 1.2
--Koliki je ukupan broj upisanih studenata po predmetima?
--Rješenje:
SELECT nazPred, SUM(upisanoStud)AS 'Broj'
FROM pred
GROUP BY nazPred

--ZADATAK 1.3
--Iz koliko razlicitih mjesta dolaze studenti fakulteta?
--Rješenje:
SELECT nazMjesto, COUNT(*) AS 'Broj studenata'
FROM stud 
INNER JOIN mjesto ON stud.pbrStan=mjesto.pbr
GROUP BY nazMjesto

--ZADATAK 1.4
--Koliko ima studenata koji nisu izašli na niti jedan ispit?
--Rješenje:
SELECT COUNT(stud.mbrStud) AS 'Nisu izašli'
FROM stud 
LEFT JOIN ispit ON stud.mbrStud = ispit.mbrStud
WHERE ocjena IS NULL

--ZADATAK 1.5
--Koliko ima predmeta koji imaju upisano više od 5 studenata?
--Rješenje:
SELECT COUNT(nazPred) AS 'Više od 5'
FROM pred
WHERE upisanoStud >5

--ZADATAK 1.6
--Koliko ima predmeta koji nemaju upisanih studenata?
--Rješenje:
SELECT COUNT(nazPred)AS 'Nula studenata'
FROM pred
WHERE upisanoStud=0

--ZADATAK 1.7
--Koliko ima predmeta koji imaju izmedju 2 i 5 upisanih studenata?
--Rješenje:
SELECT COUNT(nazPred) AS 'Izmedju 2 i 5'
FROM dbo.pred
WHERE upisanoStud BETWEEN 2 AND 5

--ZADATAK 1.8
--Koliko ima predmeta za koje ni jedan student nije izašao na ispit?
--Rješenje:
SELECT COUNT(pred.sifPred) AS 'Bez izlazaka'
FROM pred 
LEFT JOIN ispit ON pred.sifPred=ispit.sifPred
WHERE ocjena IS NULL

--ZADATAK 1.9
--Koliko ima predmeta za koje je barem netko izašao na ispit?
--Rješenje:
SELECT COUNT( DISTINCT sifPred) AS 'Broj izlazaka'
FROM ispit

--ZADATAK 1.10
--Ispišite maksimalni koeficijent nastavnika.
--Rješenje:
SELECT MAX(koef)
FROM nastavnik

--ZADATAK 1.11
--Ispišite maksimalni koeficijent nastavnika grupiranih po mjestu stanovanja.
--Rješenje:
SELECT MAX(koef),pbrStan,nazMjesto
FROM nastavnik JOIN mjesto
ON nastavnik.pbrStan=mjesto.pbr
GROUP BY pbrStan,nazMjesto

--ZADATAK 1.12
--Izracunajte prosjecnu ocjenu svakog ispita na pojedinacnom ispitnom roku (po datumu ispita).
--Rješenje:
SELECT sifPred as 'Šifra predmeta', AVG(CONVERT(float, ocjena)) AS 'Prosjecna ocjena', datIspit AS 'Datum ispita'
FROM ispit
GROUP BY sifPred, datIspit
ORDER BY sifPred, datIspit

--ZADATAK 1.13
--Izracunajte prosjecnu ocjenu svih položenih ispita za svakog studenta.
--Rješenje:
SELECT S.mbrStud,S.imeStud,S.prezStud, AVG(CAST (I.ocjena AS FLOAT)) AS 'Prosjek ocjena'
FROM stud S INNER JOIN ispit I
ON S.mbrStud=I.mbrStud
WHERE I.ocjena>1
GROUP BY S.mbrStud,S.imeStud,S.prezStud

--ZADATAK 1.14
--Izracunajte prosjecnu ocjenu svih položenih predmeta. Ispišite naziv predmeta i prosjek ocjene.
--Rješenje:
SELECT P.nazPred, AVG(CAST (I.ocjena AS FLOAT)) AS 'Prosjek ocjena'
FROM pred P 
INNER JOIN ispit I ON P.sifPred=I. sifPred
WHERE I.ocjena>1
GROUP BY P.nazPred

--ZADATAK 1.15
--Izracunajte prosjecnu ocjenu za studente cije prezime pocinje s „k“ i imaju prosjek ocjena veci od 2. Rezultat sortirajte prema prezimenu, pa ocjeni.
--Rješenje:
SELECT S.mbrStud, S.imeStud, S.prezStud, AVG(CAST (I.ocjena AS FLOAT)) AS 'Prosjek'
FROM dbo.stud S 
INNER JOIN dbo.ispit I ON S.mbrStud=I.mbrStud
WHERE S.prezStud LIKE 'K%'
GROUP BY S.mbrStud, S.imeStud, S.prezStud
HAVING AVG(CAST(I.ocjena AS FLOAT))>2
ORDER BY 3,2

--ZADATAK 1.16
--Ispišite ime i prezime i prosjecnu ocjenu svih uspješno položenih ispita za svakog pojedinog studenta, složeno od najvece do najmanje prosjecne ocjene.
--Rješenje:
SELECT S.mbrStud, S.imeStud, S.prezStud, AVG(CAST (I.ocjena AS FLOAT)) AS 'Prosjek ocjena'
FROM stud S 
INNER JOIN ispit I ON S.mbrStud=I.mbrStud
WHERE I.ocjena>1
GROUP BY S.mbrStud, S.imeStud, S.prezStud
ORDER BY 4 DESC


--ZADATAK 1.17
--Ispišite maticni broj studenata koji imaju prosjecnu ocjenu položenih ispita vecu od 2.5.
--Rješenje:
SELECT mbrStud, AVG(CAST (ocjena AS FLOAT)) AS 'Prosjek ocjena'
FROM ispit
WHERE ocjena>1
GROUP BY mbrStud
HAVING AVG(CAST(ocjena AS FLOAT))>2.5

--ZADATAK 1.18
--Ispišite popis organizacijskih jedinica kojima pripada barem jedan nastavnik.
--Rješenje:
SELECT DISTINCT nazOrgjed
FROM orgjed JOIN nastavnik
ON orgjed .sifOrgjed= nastavnik.sifOrgjed

--ZADATAK 1.19
--Ispišite 3 nastavnika s najvišim koeficijentima.
--Rješenje:
SELECT TOP 3 imeNastavnik,prezNastavnik,koef
FROM dbo.nastavnik
ORDER BY koef DESC


--ZADATAK 1.20
--Svakom nastavniku je pridružen koeficijent. Grupirajte nastavnike u grupe
--1, 2, 3, 4, .. itd. prema koeficijentu (ako nastavnik ima koeficijent 5.4 onda
--spada u grupu 5, ako ima 9.4 onda u grupu 9 itd.). Ispišite koliko nastavnika
--ima u svakoj grupi, te koliki je prosjecni koeficijent svake grupe.
--Rješenje:
SELECT FLOOR(koef)AS 'Grupa', COUNT(sifNastavnik)AS 'Broj nastavnika', AVG (koef) AS 'Prosjek'
FROM nastavnik
GROUP BY FLOOR(koef)

--ZADATAK 1.21
--Prebrojite koliko svaka nadreðena organizacijska jedinica ima podreðenih
--organizacijskih jedinica. Neke organizacijske jedinice nemaju nadreðenih,
--kako to možemo procitati iz upita i koliko je takvih? Posebno ispišite tu
--informaciju.
--Rješenje:
SELECT sifNadorgjed, COUNT(sifOrgjed)AS 'Broj podredjenih'
FROM orgjed
GROUP BY sifNadorgjed


--ZADATAK 1.22
--Koliko ima upisanih studenata po organizacijskim jedinicama i broj
--predmeta na svakom zavodu.
Rješenje:
SELECT O.sifOrgjed,O.nazOrgjed, SUM(U.upisanoStud) AS 'Broj upisanih studenata', COUNT(*) AS 'Broj predmeta'
FROM orgjed O INNER JOIN pred U
ON O.sifOrgjed=U.sifOrgjed
GROUP BY O.sifOrgjed,O.nazOrgjed