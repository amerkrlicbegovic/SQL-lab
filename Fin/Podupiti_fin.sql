--PODUPITI
--ZADATAK 2.1
--Ispišite ime i prezime nastavnika s najveæim koeficijentom.

SELECT imeNastavnik,prezNastavnik
FROM nastavnik
WHERE koef=(SELECT MAX(koef)
			FROM nastavnik)

--ZADATAK 2.2
--Ispišite sve nastavnike koji imaju koeficijente veæe od pola koeficijenta
--nastavnika s najveæim koeficijentom.
SELECT sifNastavnik,imeNastavnik,prezNastavnik
FROM dbo.nastavnik
WHERE koef>(SELECT MAX(koef)
			FROM dbo.nastavnik)/2

--ZADATAK 2.3
--Ispišite ime i prezime najstarijeg studenta.
SELECT imeStud,prezStud
FROM stud
WHERE DatRodStud =(SELECT MAX(DatRodStud)
					FROM stud)

--ZADATAK 2.4
--Ispišite sve nastavnike koji rade u organizacijskom odjelu Prirodoslovnomatematièkog fakulteta.
SELECT *
FROM dbo.nastavnik
WHERE sifOrgjed IN (SELECT sifOrgjed
					FROM dbo.orgjed
					WHERE nazOrgjed LIKE 'Prirodoslovno%')

--ZADATAK 2.5
--Ispišite sve nastavnike koji stanuju u mjestu Zagreb.
SELECT *
FROM dbo.nastavnik
WHERE pbrStan = (SELECT pbr
					FROM dbo.mjesto
					WHERE nazMjesto='Zagreb')

--ZADATAK 2.6
--Ispišite sve studente koji su roðeni u mjestu u kojem je roðen i student sa
--matiènim brojem studenta 1127.
SELECT *
FROM dbo.stud
WHERE pbrRod=(SELECT pbrRod
				FROM dbo.stud
				WHERE mbrStud=1127)

--ZADATAK 2.7
--Ispišite sve studente koji su roðeni nakon što je roðen Tibor Poljanec.
SELECT *
FROM dbo.stud
WHERE datRodStud>(SELECT datRodStud
					FROM dbo.stud
					WHERE imeStud='Tibor' AND prezStud='Poljanec')
--ZADATAK 2.8
--Ispišite sve dvorane koje imaju kapacitet koji je veæi od prosjeènog
--kapaciteta svih dvorana.
SELECT *
FROM dvorana
WHERE kapacitet>(SELECT AVG(CAST(kapacitet AS FLOAT))
					FROM dvorana)
--ZADATAK 2.9
--Ispišite sve predmete na kojima su studenti dobili ocjenu koja je veæa od
--prosjeène ocjene dobivenu iz predmeta sa šifrom 98.
SELECT I.sifPred,P.nazPred
FROM dbo.ispit I INNER JOIN dbo.pred P
ON I.sifPred=P.sifPred
WHERE ocjena>(SELECT AVG(CAST(ocjena AS FLOAT))
				FROM dbo.ispit
				WHERE sifPred=98)
--ZADATAK 2.10
--Ispišite iz tablice „pred“ sljedeæe informacije: šifra organizacijske jedinice,
--naziv organizacijske jedinice, prosjeèan broj upisanih studenata u toj
--organizacijskoj jedinici te maksimalan broj sati tjedno u toj jedinici.
SELECT pred.sifOrgjed,nazOrgjed,
avg(upisanoStud) AS 'Prosjek upisanih',
max(brojSatiTjedno) AS 'Max tjedno'
FROM pred JOIN orgjed
ON pred.sifOrgjed=orgjed.sifOrgjed
GROUP BY pred.sifOrgjed,nazOrgjed

--ZADATAK 2.11
--Ispišite sve nastavnike koji ne stanuju u istom mjestu u kojemu stanuju i
--studenti koje su ispitivali.
SELECT DISTINCT *
FROM nastavnik
WHERE sifNastavnik IN (SELECT DISTINCT N.sifNastavnik
						FROM dbo.nastavnik N INNER JOIN dbo.ispit I
						ON N.sifNastavnik=I.sifNastavnik
						INNER JOIN dbo.stud S
						ON I.mbrStud=S.mbrStud
						WHERE N.pbrStan<>S.pbrStan)