--3.2.2 ZADACI ZA VJEŽBU

--ZADATAK ZA VJEŽBU 8.
--Ispišite matični broj, ime i prezime svih studenata. Ime i prezime se trebaju
--ispisati zajedno, u jednom stupcu.
SELECT mbrStud, RTrim(imeStud)+' '+ Rtrim(prezStud) AS 'Ime i Prezime'
FROM  stud

--ZADATAK ZA VJEŽBU 9.
--Ispišite sva imena studenata tako da se niti jedno ime ne pojavi dva puta.
--Sortirajte imena silazno po abecedi.
SELECT DISTINCT imeStud
FROM stud
ORDER BY imeStud asc


--ZADATAK ZA VJEŽBU 10.
--Ispišite matične brojeve studenata koji su položili ispit iz predmeta sa šifrom 146.
SELECT DISTINCT mbrStud
		FROM ispit
		WHERE sifPred =146 and ocjena > 1

--ZADATAK ZA VJEŽBU 11.
--Ispišite ime i prezime nastavnika te plaću dobivenu formulom: (koeficijent + 0.4) * 800.
SELECT imeNastavnik, prezNastavnik, (koef+0.4)*800 AS Koeficijent
FROM nastavnik

--ZADATAK ZA VJEŽBU 12.
--Ispišite imena i prezimena nastavnika iz prethodnog zadatka koji imaju
--plaću manju od 3500 ili veću od 8000.
SELECT imeNastavnik, prezNastavnik, (koef+0.4)*800 AS Koeficijent
FROM nastavnik
WHERE (koef+0.4)*800 <3500 or (koef+0.4)*800> 8000

--ZADATAK ZA VJEŽBU 13.
--Ispišite imena i prezimena studenata koji su barem jednom pali na ispitu iz
--predmeta sa šiframa od 220 do 240.
SELECT imeStud,prezStud
FROM stud
WHERE mbrStud IN(SELECT DISTINCT mbrStud
		From ispit
		Where Ocjena=1 and sifPred BETWEEN 220 and 240)

--ZADATAK ZA VJEŽBU 14.
--Ispišite imena i prezimena studenata koji su na nekom ispitu dobili 3.
SELECT imeStud,prezStud
FROM stud
WHERE mbrStud IN(SELECT DISTINCT mbrStud
		From ispit Where Ocjena=3)

--ZADATAK ZA VJEŽBU 15.
--Ispišite nazive predmeta na koje niti jedan student nije izašao.
SELECT nazPred
FROM pred
WHERE sifPred IN (SELECT DISTINCT sifPred
					FROM ispit
					WHERE ocjena  IS NULL)

--ZADATAK ZA VJEŽBU 16.
--Ispišite nazive predmeta na koje je izašao barem jedan student.
USE fakultet;
SELECT nazPred FROM pred WHERE upisanoStud>=1


--ZADATAK ZA VJEŽBU 17.
--Ispišite sve podatke o studentima kojima ime počinje i završava samoglasnikom.
USE fakultet;
SELECT * FROM stud WHERE imeStud REGEXP "^[AEIOU](.*)[aeiou]$"


--ZADATAK ZA VJEŽBU 18.
--Ispišite sve podatke o studentima kojima ime počinje i završava bilo kojim
--znakom osim samoglasnikom.
USE fakultet;
SELECT * FROM stud WHERE imeStud REGEXP "^[^AEIOU](.*)[^aeiou]$"


--ZADATAK ZA VJEŽBU 19.
--Ispišite sve podatke o studentima kojima ime počinje ili završava samoglasnikom.
USE fakultet;
SELECT * FROM stud WHERE imeStud REGEXP "^[AEIOU](.*)[aeiou]$"


--ZADATAK ZA VJEŽBU 20.
--Ispišite sve podatke o studentima kojima ime ili prezime bilo gdje sadrži
--slova n i k jedno iza drugog.
USE fakultet;
SELECT * FROM stud WHERE imeStud LIKE '%nk%' OR prezStud LIKE '%nk%';


--ZADATAK ZA VJEŽBU 23.
--Ispišite ime i prezime studenta, te naziv i ocjenu za svaki ispit.
USE fakultet 
SELECT s.imeStud,s.prezStud,p.nazPred,i.ocjena
FROM ispit i INNER JOIN 
		pred p  ON i.sifPred = p.sifPred  INNER JOIN
		stud s  ON i.mbrStud = s.mbrStud 


--ZADATAK ZA VJEŽBU 24.
--Ispišite ime i prezime studenta, te mjesto i županiju u kojoj su rođeni.
--Nakon toga dodajte mjesto i županiju u kojoj stanuju.
USE fakultet 
SELECT s.imeStud,s.prezStud,m.nazMjesto,z.nazZupanija
FROM mjesto m INNER JOIN
 		stud s  ON m.pbr  = s.pbrRod INNER JOIN 
 zupanija z ON m.sifZupanija = z.sifZupanija 



 
--ZADATAK ZA VJEŽBU 25.
--Ispišite nazive kolegija i zavode kojima pripadaju za one kolegije koji imaju
--više od 20 upisanih studenata.
SELECT p.nazPred, o.nazOrgjed
FROM orgjed AS o
INNER JOIN pred AS p ON o.sifOrgjed = p.sifOrgjed
WHERE upisanoStud >20


--ZADATAK ZA VJEŽBU 26.
--Ispišite sve nazive mjesta u kojima barem jedan student stanuje. Imena
--mjesta sa smiju pojaviti samo jednom.
 USE fakultet 
 SELECT DISTINCT M.nazMjesto
 FROM mjesto M INNER JOIN stud S 
 ON s.pbrStan = m.pbr


--ZADATAK ZA VJEŽBU 27.
--Ispišite nazive mjesta u kojima je barem jedan student i rođen i stanuje.
--Imena mjesta smiju se pojaviti samo jednom.
USE fakultet 
SELECT DISTINCT * 
FROM mjesto m 
INNER JOIN stud s 
ON s.pbrRod = m.pbr
WHERE s.pbrRod=s.pbrStan



 --ZADATAK ZA VJEŽBU 28.
--Ispišite oznake dvorana i nazive kolegija za one kolegije koji imaju više od
--2 sata predavanja tjedno.
 USE fakultet 
 SELECT r.oznDvorana,p.nazPred,p.brojSatiTjedno
 FROM rezervacija r 
 INNER JOIN pred p ON p.sifPred = r.sifPred 
 WHERE p.brojSatiTjedno >2


 --ZADATAK ZA VJEŽBU 29.
--Ispišite nazive kolegija i oznake dvorana u kojima imaju rezerviran termin.
--Ispišite i naziv organizacijske jedinice kojoj kolegij pripada.
USE fakultet 
SELECT p.nazPred,r.oznDvorana,r.oznVrstaDan,o.nazOrgjed 
FROM pred p 
INNER JOIN rezervacija r ON p.sifPred = r. sifPred 
INNER JOIN orgjed o ON p.sifOrgjed = o.sifOrgjed

--ZADATAK ZA VJEŽBU 30.
--Ispišite podatke o nastavnicima koji su ispitivali studente koji stanuju u istoj
--županiji u kojoj stanuje i nastavnik
SELECT DISTINCT  nastavnik.*
FROM   nastavnik 
INNER JOIN mjesto ON nastavnik.pbrStan = mjesto.pbr 
INNER JOIN stud ON mjesto.pbr = stud.pbrStan 
INNER JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE nastavnik.pbrStan=Stud.pbrStan

--ZADATAK ZA VJEŽBU 31.
--Ispišite podatke o studentima koji studiraju u mjestu različitom od mjesta
--rođenja, ali koje se nalazi u istoj županiji gdje su i rođeni.
SELECT *
FROM stud
INNER JOIN mjesto ON stud.pbrRod = mjesto.pbr
INNER JOIN zupanija ON zupanija.sifZupanija = mjesto.sifZupanija
WHERE  stud.pbrRod=mjesto.pbr AND stud.pbrStan<>stud.pbrRod

--ZADATAK ZA VJEŽBU 32.
--Ispišite podatke o studentima i nastavnicima koji imaju ista prezimena.
SELECT stud.*, nastavnik.*
FROM ispit 
INNER JOIN stud ON ispit.mbrStud = stud.mbrStud 
INNER JOIN nastavnik ON ispit.sifNastavnik = nastavnik.sifNastavnik
WHERE stud.prezStud = nastavnik.prezNastavnik


--ZADATAK ZA VJEŽBU 33.
--Ispišite podatke o studentima i njihovim mjestima stanovanja za one
--studente koji su bar jednom pali na ispitu 'Osnove baza podataka'
SELECT   stud.imeStud, stud.prezStud, mjesto.nazMjesto
FROM  stud 
INNER JOIN mjesto ON stud.pbrStan = mjesto.pbr
WHERE mbrStud IN((Select distinct mbrStud
					FROM ispit INNER JOIN
					pred ON ispit.sifPred = pred.sifPred 
					WHERE (pred.nazPred = 'Osnove Baza Podataka') and ocjena=1))


--ZADATAK ZA VJEŽBU 34.
--Ispišite ime i prezime nastavnika, mjesto stanovanja i županiju nastavnika
--te naziv kolegija za nastavnike koji su ispitivali studente koji su dobili ocjenu
--2 ili 3 iz tog kolegija.
SELECT        nastavnik.imeNastavnik, nastavnik.prezNastavnik, mjesto.nazMjesto,zupanija.nazZupanija, pred.nazPred
FROM            ispit INNER JOIN
nastavnik ON ispit.sifNastavnik = nastavnik.sifNastavnik INNER JOIN
                        mjesto ON nastavnik.pbrStan = mjesto.pbr INNER JOIN
                         zupanija ON mjesto.sifZupanija = zupanija.sifZupanija INNER JOIN
                         pred ON ispit.sifPred = pred.sifPred
		WHERE pred.nazPred IN (Select DISTINCT pred.nazPred
FROM pred inner join ispit 
ON pred.sifPred=ispit.sifPred
WHERE ispit.ocjena IN(2,3))


 
--5.5.1 ZADACI ZA VJEŽBU

--ZADATAK ZA VJEŽBU 35.
--Ispišite ime i prezime te mjesto rođenja studenata kojima ime počinje
--slovom F
SELECT stud.imeStud, stud.prezStud, mjesto.nazMjesto
FROM stud INNER JOIN
                         mjesto ON stud.pbrRod = mjesto.pbr
Where stud.imeStud IN (Select stud.imeStud
From Stud
Where Left(stud.imeStud,1)='F')

--ZADATAK ZA VJEŽBU 36.
--Ispišite ime i prezime nastavnika koji živi u mjestu koje na trećem mjestu
--ima slovo Z.
SELECT        nastavnik.imeNastavnik, nastavnik.prezNastavnik, mjesto.nazMjesto
FROM  nastavnik INNER JOIN
                         mjesto ON nastavnik.pbrStan = mjesto.pbr
		 WHERE mjesto.nazMjesto IN (Select Distinct mjesto.nazMjesto
					From mjesto
Where SUBSTRING(mjesto.nazMjesto,3,1)='Z')
												
 
		
--ZADATAK ZA VJEŽBU 37.
--Ispišite ime i prezime studenata te imena i prezimena nastavnika koji u
--imenu imaju na petom mjestu isto slovo.
SELECT        stud.imeStud, stud.prezStud, nastavnik.imeNastavnik, nastavnik.prezNastavnik
FROM            nastavnik INNER JOIN
                         ispit ON nastavnik.sifNastavnik = ispit.sifNastavnik INNER JOIN
                         stud ON ispit.mbrStud = stud.mbrStud
						 Where Rtrim(SUBSTRING(stud.imeStud,5,1))=Rtrim(SUBSTRING(Nastavnik.imeNastavnik,5,1))


--ZADATAK ZA VJEŽBU 38.
--Ispišite nazive županija kojima je duljina imena duža od 13 znakova a kraća
--od 20 znakova.
SELECT        nazZupanija, LEN(nazZupanija)
FROM            zupanija
WHERE nazZupanija IN (SELECT Distinct nazZupanija
					From zupanija
					Where LEN(nazZupanija) Between 13 and 20)


--ZADATAK ZA VJEŽBU 39.
--Ispišite ime i prezime studenata koji su rođeni u svibnju.
SELECT        imeStud, prezStud, datRodStud
FROM    stud
WHERE Month(datRodStud)=5
 
--ZADATAK ZA VJEŽBU 40.
--Ispišite ime i prezime studenata koji su na ispit izašli između 10 i 20 u
--mjesecu.
SELECT        stud.imeStud, stud.prezStud, ispit.datIspit
FROM            stud INNER JOIN
                         ispit ON stud.mbrStud = ispit.mbrStud
			 WHERE DAY(ispit.datIspit) Between 10 and 20

--ZADATAK ZA VJEŽBU 41*.
--Pronađite podatke o onim nastavnicima koji su u lipnju ispitivali studente
--čije je mjesto rođenja isto mjestu gdje stanuje nastavnik. Ispišite ime i
--prezime nastavnika, naziv mjesta gdje stanuje, ime i prezime studenta
SELECT        nastavnik.imeNastavnik, nastavnik.prezNastavnik, mjesto.nazMjesto, stud.imeStud, stud.prezStud
FROM            stud INNER JOIN
                        ispit ON stud.mbrStud = ispit.mbrStud INNER JOIN
 nastavnik ON ispit.sifNastavnik = nastavnik.sifNastavnik
 INNER JOIN mjesto ON nastavnik.pbrStan = mjesto.pbr
		 WHERE Month(ispit.datIspit) =6 

