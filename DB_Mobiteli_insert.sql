Use Mobiteli

--Tablica Osobe--
INSERT INTO osoba 
VALUES('1212972383944', 'Ivan', 'Dundov', 'Obala 4', 'Zagreb');
INSERT INTO osoba 
VALUES('1717985383542', 'Ivan', 'Pos', NULL, 'Zagreb');
INSERT INTO osoba 
VALUES('0102968383911', 'Pero', 'Peric', 'Gajeva 3','Zagreb');
INSERT INTO osoba 
VALUES('0302982383818', 'Ivan', 'Ivic', '', 'Split');
INSERT INTO osoba 
VALUES('0305972383915', 'Marko', 'Maric', 'Lavova 67','Zadar');

--TABLICA MOBITEL:
INSERT INTO MOBITEL
VALUES('no3310', 'nokia', '3310', '133', '113', '48', '22');
INSERT INTO MOBITEL
VALUES('no3330', 'nokia', '3330', '133', '113', '48', '22');
INSERT INTO MOBITEL 
VALUES('soz7', 'sony', 'z7', '95', '91', '50', '25');
INSERT INTO MOBITEL
VALUES('mov60', 'motorola', 'v60', '109', '85', '45', '25');
INSERT INTO MOBITEL
VALUES('soj70', 'sony', 'j70', '92', '133', '45', '22');

--TABLICA POSUDI SAP DB:
INSERT INTO posudi (osoba, mobitel, uzeo, vratio, napomena)
VALUES('0102968383911', 'no3310', '2002-01-01', '2002-01-30', '')
INSERT INTO posudi (osoba, mobitel, uzeo, vratio, napomena)
VALUES('0302982383818', 'soz7', '2002-01-15', '2002-02-02', '')
INSERT INTO posudi (osoba, mobitel, uzeo, vratio, napomena)
VALUES('0102968383911', 'no3310', '2002-03-03', '2002-05-15', '')
INSERT INTO posudi (osoba, mobitel, uzeo, vratio, napomena)
VALUES('1212972383944', 'mov60', '2002-02-15', '2002-07-15', '')
INSERT INTO posudi (osoba, mobitel, uzeo, vratio, napomena)
VALUES('0102968383911', 'no3330', '2002-06-01', '2002-10-01', '')