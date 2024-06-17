-- 1. Utworzenie dazy danych i schematu
CREATE DATABASE Geochronologia;

CREATE SCHEMA geo;




-- 2. Utworzenie tabeli, oraz kluczy obcych
CREATE TABLE geo.GeoEon(
	IdEon INTEGER NOT NULL PRIMARY KEY,
	NazwaEon VARCHAR(60)
);


CREATE TABLE geo.GeoEra(
	IdEra INTEGER NOT NULL PRIMARY KEY,
	IdEon INTEGER REFERENCES geo.GeoEon(IdEon),
	NazwaEra VARCHAR(60)
);




CREATE TABLE geo.GeoOkres(
	IdOkres INTEGER NOT NULL PRIMARY KEY,
	IdEra INTEGER REFERENCES geo.GeoEra(IdEra),
	NazwaOkres VARCHAR(60)
);




CREATE TABLE geo.GeoEpoka(
	IdEpoka INTEGER NOT NULL PRIMARY KEY,
	IdOkres INTEGER REFERENCES geo.GeoOkres(IdOkres),
	NazwaEpoka VARCHAR(60)
);




CREATE TABLE geo.GeoPietro(
	IdPietro INTEGER NOT NULL PRIMARY KEY,
	IdEpoka INTEGER REFERENCES geo.GeoEpoka(IdEpoka),
	NazwaPietro VARCHAR(60)
);





-- 3. Wypelnienie tabeli danymi
INSERT INTO geo.GeoEon VALUES
(1,'Fanerozoik');


INSERT INTO geo.GeoEra VALUES
(1, 1, 'Paleozoik'),
(2, 1, 'Mezozoik'),
(3, 1, 'Kenozoik');



INSERT INTO geo.GeoOkres VALUES
(1, 1, 'Dewon'),
(2, 1, 'Karbon'),
(3, 1, 'Perm'),

(4, 2, 'Trias'),
(5, 2, 'Jura'),
(6, 2, 'Kreda'),

(7, 3, 'TrzeciorzedPaleogen'),
(8, 3, 'TrzeciorzedNeogen'),
(9, 3, 'Czwartorzed');


INSERT INTO geo.GeoEpoka VALUES
(1, 1, 'Dolny'),
(2, 1, 'Srodkowy'),
(3, 1, 'Gorny'),

(4, 2, 'Dolny'),
(5, 2, 'Gorny'),

(6, 3, 'Dolny'),
(7, 3, 'Gorny'),

(8, 4, 'Dolna'),
(9, 4, 'Srodkowa'),
(10, 4, 'Gorna'),

(11, 5, 'Dolna'),
(12, 5, 'Srodkowa'),
(13, 5, 'Gorna'),

(14, 6, 'Dolna'),
(15, 6, 'Gorna'),

(16, 7, 'Paleocen'),
(17, 7, 'Eocen'),
(18, 7, 'Oligocen'),

(19, 8, 'Miocen'),
(20, 8, 'Pliocen'),

(21, 9, 'Plejstocen'),
(22, 9, 'Holocen');



INSERT INTO geo.GeoPietro VALUES
(1, 1, 'Lochkow'),
(2, 1, 'Prag'),
(3, 1, 'Ems'),

(4, 2, 'Eifel'),
(5, 2, 'Zywet'),

(6, 3, 'Fran'),
(7, 3, 'Famen'),

(8, 4, 'Turnej'),
(9, 4, 'Wizen'),
(10, 4, 'Serpuchow'),

(11, 5, 'Baszkir'),
(12, 5, 'Moskow'),
(13, 5, 'Kasimow'),
(14, 5, 'Gzel'),

(15, 6, 'Assel'),
(16, 6, 'Sakmar'),
(17, 6, 'Artinsk'),
(18, 6, 'Kungur'),

(19, 7, 'Road'),
(20, 7, 'Word'),
(21, 7, 'Kapitan'),
(22, 7, 'Wucziaping'),
(23, 7, 'Czangsing'),

(24, 8, 'Ind'),
(25, 8, 'Olenek'),

(26, 9, 'Anizyk'),
(27, 9, 'Ladyn'),

(28, 10, 'Karnik'),
(29, 10, 'Noryk'),
(30, 10, 'Retyk'),

(31, 11, 'Hettang'),
(32, 11, 'Synemur'),
(33, 11, 'Pliensbach'),
(34, 11, 'Toark'),

(35, 12, 'Aalen'),
(36, 12, 'Bajos'),
(37, 12, 'Baton'),
(38, 12, 'Kelowej'),

(39, 13, 'Oksford'),
(40, 13, 'Kimeryd'),
(41, 13, 'Tyton'),

(42, 14, 'Berrias'),
(43, 14, 'Walanzyn'),
(44, 14, 'Hoteryw'),
(45, 14, 'Barrem'),
(46, 14, 'Apt'),
(47, 14, 'Alb'),

(48, 15, 'Cenoman'),
(49, 15, 'Turon'),
(50, 15, 'Koniak'),
(51, 15, 'Santon'),
(52, 15, 'Kampan'),
(53, 15, 'Mastrycht'),

(54, 16, 'Dan'),
(55, 16, 'Zeland'),
(56, 16, 'Tanet'),

(57, 17, 'Iprez'),
(58, 17, 'Lutet'),
(59, 17, 'Barton'),
(60, 17, 'Priabon'),

(61, 18, 'Rupel'),
(62, 18, 'Szat'),

(63, 19, 'Akwitan'),
(64, 19, 'Burdyga'),
(65, 19, 'Lang'),
(66, 19, 'Serrawal'),
(67, 19, 'Torton'),
(68, 19, 'Messyn'),

(69, 20, 'Zankl'),
(70, 20, 'Piacent'),

(71, 21, 'Gelas'),
(72, 21, 'Kalabr'),
(73, 21, 'Chiban'),
(74, 21, 'Tarant'),

(75, 22, 'Grenland'),
(76, 22, 'Nortgryp'),
(77, 22, 'Megalaj');



-- 5. Wyswietlenie wprowadzonych danych
SELECT  geo.GeoEon.NazwaEon, geo.GeoEra.NazwaEra, geo.GeoOkres.NazwaOkres, 
geo.GeoEpoka.NazwaEpoka, geo.GeoPietro.NazwaPietro, geo.GeoPietro.IdPietro
FROM geo.GeoPietro
JOIN geo.GeoEpoka ON geo.GeoEpoka.IdEpoka = geo.GeoPietro.IdEpoka
JOIN geo.GeoOkres ON geo.GeoOkres.IdOkres = geo.GeoEpoka.IdOkres
JOIN geo.GeoEra ON geo.GeoEra.IdEra = geo.GeoOkres.IdEra
JOIN geo.GeoEon ON geo.GeoEon.IdEon = geo.GeoEra.IdEon
ORDER BY IdPietro;


-- 6. Utworzenie geo-tabeli
CREATE TABLE geo.GeoTabela 
AS (SELECT * FROM geo.GeoPietro 
	NATURAL JOIN geo.GeoEpoka 
	NATURAL JOIN geo.GeoOkres 
	NATURAL JOIN geo.GeoEra 
	NATURAL JOIN geo.GeoEon );


ALTER TABLE geo.GeoTabela ADD PRIMARY KEY (IdPietro);

SELECT * FROM geo.GeoTabela;




--7. Utworzenie tabeli milion wykorzystujac tabele dziesiec
CREATE TABLE geo.Dziesiec (
	Cyfra INTEGER,
	Bit INTEGER 
);


INSERT INTO geo.Dziesiec VALUES
(0, 0),
(1, 1),
(2, 10),
(3, 11),
(4, 100),
(5, 101),
(6, 110),
(7, 111),
(8, 1000),
(9, 1001);

SELECT * FROM geo.Dziesiec;


CREATE TABLE geo.Milion(Liczba int, Cyfra int, Bit int);

INSERT INTO geo.Milion SELECT a1.Cyfra +10* a2.Cyfra +100*a3.Cyfra + 
1000*a4.Cyfra + 10000*a5.Cyfra + 10000*a6.Cyfra 
AS Liczba , a1.Cyfra AS Cyfra, a1.bit AS Bit
FROM geo.Dziesiec a1, geo.Dziesiec a2, geo.Dziesiec a3, 
geo.Dziesiec a4, geo.Dziesiec a5, geo.Dziesiec a6;


SELECT COUNT(*) FROM geo.Milion;

SELECT * FROM geo.Milion
ORDER BY Liczba;


-- 8. Testy zapytan
-- zlaczenie syntetycznej tablicy miliona wynikow tabela geochronologiczną w postaci zdenormalizowanej,
-- do warunku zlaczenia dodano operacje modulo (1 ZL)
SELECT COUNT(*) FROM geo.Milion 
INNER JOIN geo.GeoTabela ON (mod(geo.Milion.Liczba,77) = (geo.GeoTabela.IdPietro));


-- zlaczenie syntetycznej tablicy miliona wynikow
-- z tabela geochronologiczna w postaci znormalizowanej, reprezentowana przez zlaczenia pieciu tabel (2 ZL)
SELECT COUNT(*) FROM geo.Milion 
INNER JOIN geo.GeoPietro ON (mod(Milion.liczba,77) = GeoPietro.IdPietro) 
NATURAL JOIN geo.GeoEpoka
NATURAL JOIN geo.GeoOkres 
NATURAL JOIN geo.GeoEra 
NATURAL JOIN geo.GeoEon;


-- zlaczenie syntetycznej tablicy miliona wynikow z tabela geochronologiczna w postaci zdenormalizowanej, 
-- przy czym zlaczenie jest wykonywane poprzez zagniezdzenie skorelowane (3 ZL)
SELECT COUNT(*) FROM geo.Milion 
WHERE mod(geo.Milion.liczba,77) IN (SELECT IdPietro FROM geo.GeoTabela 
	WHERE mod(geo.Milion.liczba,77)=(IdPietro));


-- zlaczenie syntetycznej tablicy miliona wynikow z tabela geochronologiczna w postaci znormalizowanej, 
-- przy czym zlaczenie jest wykonywane poprzez zagniezdzenie skorelowane, 
-- a zapytanie wewnętrzne jest zlaczeniem tabel poszczegolnych jednostek geochronologicznych (4 ZL)
SELECT COUNT(*) FROM geo.Milion 
WHERE mod(Milion.Liczba,77) IN 
(SELECT geo.GeoPietro.IdPietro FROM geo.GeoPietro 
	NATURAL JOIN geo.GeoEpoka 
	NATURAL JOIN geo.GeoOkres 
	NATURAL JOIN geo.GeoEra 
	NATURAL JOIN geo.GeoEon);

-- 9. Utworzenie indeksow
Select * From geo.GeoTabela

CREATE INDEX IdxMilionLiczba ON geo.Milion(Liczba);
CREATE INDEX IdxGeoEonIdEon ON geo.GeoEon(IdEon);
CREATE INDEX IdxGeoEraIdEra ON geo.GeoEra(IdEra);
CREATE INDEX IdxGeoOkresIdOkres ON geo.GeoOkres(IdOkres);
CREATE INDEX IdxGeoEpokaIdEpoka ON geo.GeoEpoka(IdEpoka);
CREATE INDEX IdxGeoPietroIdPietro ON geo.GeoPietro(IdPietro);
CREATE INDEX IdxGeoEonNazwaEon ON geo.GeoEon(NazwaEon);
CREATE INDEX IdxGeoEraNazwaEra ON geo.GeoEra(NazwaEra);
CREATE INDEX IdxGeoOkresNazwaOkres ON geo.GeoOkres(NazwaOkres);
CREATE INDEX IdxGeoEpokaNazwaEpoka ON geo.GeoEpoka(NazwaEpoka);
CREATE INDEX IdxGeoPietroNazwaPietro ON geo.GeoPietro(NazwaPietro);

CREATE INDEX IdxGeoTabelaIdPietro ON geo.GeoTabela(IdPietro);
CREATE INDEX IdxGeoTabelaIdEon ON geo.GeoTabela(IdEon);
CREATE INDEX IdxGeoTabelaIdEra ON geo.GeoTabela(IdEra);
CREATE INDEX IdxGeoTabelaIdOkres ON geo.GeoTabela(IdOkres);
CREATE INDEX IdxGeoTabelaIdEpoka ON geo.GeoTabela(IdEpoka);

CREATE INDEX IdxGeoTabelaNazwaPietro ON geo.GeoTabela(NazwaPietro);
CREATE INDEX IdxGeoTabelaNazwaEon ON geo.GeoTabela(NazwaEon);
CREATE INDEX IdxGeoTabelaNazwaEra ON geo.GeoTabela(NazwaEra);
CREATE INDEX IdxGeoTabelaNazwaOkres ON geo.GeoTabela(NazwaOkres);
CREATE INDEX IdxGeoTabelaNazwaEpoka ON geo.GeoTabela(NazwaEpoka);