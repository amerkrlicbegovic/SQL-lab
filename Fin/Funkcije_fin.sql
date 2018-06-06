--5.5.1 ZADACI ZA VJEŽBU	--										
--ZADATAK ZA VJEŽBU 35.
--Ispišite ime i prezime te mjesto rođenja studenata kojima ime počinje
--slovom F
SELECT stud.imeStud, stud.prezStud, mjesto.nazMjesto
FROM stud 
INNER JOIN mjesto ON stud.pbrRod = mjesto.pbr
WHERE Left(stud.imeStud,1)='F'

--ZADATAK ZA VJEŽBU 36.
--Ispišite ime i prezime nastavnika koji živi u mjestu koje na trećem mjestu
--ima slovo Z.
SELECT nastavnik.imeNastavnik, nastavnik.prezNastavnik, mjesto.nazMjesto
FROM  nastavnik 
INNER JOIN mjesto ON nastavnik.pbrStan = mjesto.pbr
WHERE  SUBSTRING(mjesto.nazMjesto,3,1)='Z'
												
 
		
--ZADATAK ZA VJEŽBU 37.
--Ispišite ime i prezime studenata te imena i prezimena nastavnika koji u
--imenu imaju na petom mjestu isto slovo.
SELECT stud.imeStud, stud.prezStud, nastavnik.imeNastavnik, nastavnik.prezNastavnik
FROM nastavnik 
INNER JOIN ispit ON nastavnik.sifNastavnik = ispit.sifNastavnik 
INNER JOIN stud ON ispit.mbrStud = stud.mbrStud
WHERE Rtrim(SUBSTRING(stud.imeStud,5,1))=Rtrim(SUBSTRING(Nastavnik.imeNastavnik,5,1))


--ZADATAK ZA VJEŽBU 38.
--Ispišite nazive županija kojima je duljina imena duža od 13 znakova a kraća
--od 20 znakova.
SELECT nazZupanija, LEN(nazZupanija)
FROM zupanija
WHERE LEN(nazZupanija) Between 13 and 20


--ZADATAK ZA VJEŽBU 39.
--Ispišite ime i prezime studenata koji su rođeni u svibnju.
SELECT imeStud, prezStud, datRodStud
FROM stud
WHERE Month(datRodStud)=5
 
--ZADATAK ZA VJEŽBU 40.
--Ispišite ime i prezime studenata koji su na ispit izašli između 10 i 20 u
--mjesecu.
SELECT stud.imeStud, stud.prezStud, ispit.datIspit
FROM stud 
INNER JOIN ispit ON stud.mbrStud = ispit.mbrStud
WHERE DAY(ispit.datIspit) Between 10 and 20

--ZADATAK ZA VJEŽBU 41*.
--Pronađite podatke o onim nastavnicima koji su u lipnju ispitivali studente
--čije je mjesto rođenja isto mjestu gdje stanuje nastavnik. Ispišite ime i
--prezime nastavnika, naziv mjesta gdje stanuje, ime i prezime studenta
SELECT nastavnik.imeNastavnik, nastavnik.prezNastavnik, mjesto.nazMjesto, stud.imeStud, stud.prezStud
FROM stud 
INNER JOIN ispit ON stud.mbrStud = ispit.mbrStud 
INNER JOIN nastavnik ON ispit.sifNastavnik = nastavnik.sifNastavnik
INNER JOIN mjesto ON nastavnik.pbrStan = mjesto.pbr
WHERE Month(ispit.datIspit) =6 
