create database firma2;
create schema ksiegowosc;


CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) not NULL,
    nazwisko VARCHAR(50) not NULL,
    adres VARCHAR(100) not NULL,
    telefon VARCHAR(15) not NULL
);

CREATE TABLE ksiegowosc.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE,
    liczba_godzin INT not null
);

CREATE TABLE ksiegowosc.pensja (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50),
    kwota DECIMAL(10, 2) not null
);

CREATE TABLE ksiegowosc.premia (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10, 2) not null
);

create table ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INT primary key,
	data date,
	id_pracownika INT,
	id_godziny int,
	id_pensji int,
	id_premii int
);


alter table ksiegowosc.wynagrodzenie add foreign key (id_pracownika) references ksiegowosc.pracownicy(id_pracownika);
alter table ksiegowosc.wynagrodzenie add foreign key (id_godziny) references ksiegowosc.godziny(id_godziny);
alter table ksiegowosc.wynagrodzenie add foreign key (id_pensji) references ksiegowosc.pensja(id_pensji);
alter table ksiegowosc.wynagrodzenie add foreign key (id_premii) references ksiegowosc.premia(id_premii);

comment on table ksiegowosc.pracownicy is 'Tabela z danymi pracownikow';
comment on table ksiegowosc.godziny is 'Tabela z danymi dot. ilosci przepracowanych godzin';
comment on table ksiegowosc.pensja is 'Tabela z danymi dot. wynagrodzenia na danym stanowisku';
comment on table ksiegowosc.premia is 'Tabela z danymi dot. typow i wysokosci premii';
comment on table ksiegowosc.wynagrodzenie is 'Tabela laczaca wszystkie tabele';

SELECT obj_description('ksiegowosc.pracownicy'::regclass);
SELECT obj_description('ksiegowosc.godziny'::regclass);
SELECT obj_description('ksiegowosc.pensja'::regclass);
SELECT obj_description('ksiegowosc.premia'::regclass);
SELECT obj_description('ksiegowosc.wynagrodzenie'::regclass);


insert into ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
values
(1, 'Olaf', 'Nowacki', 'ul. Wiejska 1, Warszawa', '123456789'),
(2, 'Anita', 'Nowak', 'ul. Fiołkowa 5, Kraków', '987654321'),
(3, 'Piotr', 'Nowicki', 'ul. Kwiatowa 10, Gdańsk', '456123789'),
(4, 'Iwona', 'Lis', 'ul. Leśna 3, Poznań', '321654987'),
(5, 'Piotr', 'Zieliński', 'ul. Polna 8, Wrocław', '654987321'),
(6, 'Ewa', 'Wójcik', 'ul. Słoneczna 15, Łódź', '789654123'),
(7, 'Tomasz', 'Kaczmarek', 'ul. Morska 22, Szczecin', '159357246'),
(8, 'Karolina', 'Dąbrowska', 'ul. Zielona 7, Lublin', '369258147'),
(9, 'Mateusz', 'Woźniak', 'ul. Jagodowa 12, Katowice', '852741963'),
(10, 'Aleksandra', 'Kubiak', 'ul. Górna 4, Białystok', '741852963');

insert into ksiegowosc.godziny (id_godziny, data, liczba_godzin)
values
(1, '2024-05-13', 186),
(2, '2024-08-27', 104),
(3, '2024-12-19', 70),
(4, '2024-09-27', 168),
(5, '2024-12-13', 166),
(6, '2024-08-22', 160),
(7, '2024-04-29', 148),
(8, '2024-09-14', 170),
(9, '2024-08-23', 82),
(10, '2024-11-23', 120);

insert into ksiegowosc.premia (id_premii, rodzaj, kwota)
values
(1, 'Premia kwartalna', 1000.00),
(2, 'Premia roczna', 2000.00),
(3, 'Premia za wyniki', 1500.00),
(4, 'Premia uznaniowa', 1200.00),
(5, 'Premia świąteczna', 800.00),
(6, 'Premia motywacyjna', 1300.00),
(7, 'Premia jubileuszowa', 2500.00),
(8, 'Premia specjalna', 1800.00),
(9, 'Premia za staż', 900.00),
(10, 'Premia za dodatkową pracę', 1100.00);

INSERT INTO ksiegowosc.pensja VALUES 
(1, 'Kierownik', 5000.00),
(2, 'Specjalista', 4000.00),
(3, 'Asystent', 3500.00),
(4, 'Technik', 3000.00),
(5, 'Księgowy', 4500.00),
(6, 'Sprzątaczka', 2500.00),
(7, 'Pracownik produkcji', 3200.00),
(8, 'Analityk', 4800.00),
(9, 'Handlowiec', 4200.00),
(10, 'Recepcjonista', 3800.00);

insert into ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
values
(1,'2024-05-15', 1, 3, 5, 7),
(2, '2024-07-18', 2, 4,  6, 8),
(3, '2024-07-26', 3, 5, 7, 9),
(4, '2024-08-23', 4, 6, 8, 10),
(5, '2024-09-07', 5, 7, 9, 1),
(6, '2024-09-15', 6, 8, 10, 2),
(7, '2024-09-29', 7, 9, 1, 3),
(8, '2024-10-27', 8, 10, 2, 4),
(9, '2024-12-01', 9, 1, 3, 5),
(10, '2024-12-03', 10, 2, 4, 6);


update ksiegowosc.pensja set kwota = kwota - 3000 where stanowisko like 'EVENT MODERATOR';
update ksiegowosc.pensja set kwota = kwota - 3000 where stanowisko like 'JUNIOR FOLLOWERS DEVELOPER';
update ksiegowosc.pensja set kwota = kwota - 4000 where stanowisko like 'VIRAL PROOFREADER';
update ksiegowosc.pensja set kwota = kwota - 3300 where stanowisko like 'EMPLOYER BRANDING EXORCIST';
update ksiegowosc.wynagrodzenie  set id_premii = null where id_pracownika = 1;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 4;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 5;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 6;
update ksiegowosc.wynagrodzenie  set id_premii = null where id_pracownika = 2;
update ksiegowosc.pracownicy  set nazwisko  = 'Mania' where id_pracownika = 3;

-- a)
select id_pracownika, nazwisko from ksiegowosc.pracownicy;

-- b)
select prac.id_pracownika from 
((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota > 1000;

-- c)
select prac.id_pracownika from 
((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota > 2000 and wynag.id_premii is null;

-- d)
select * from ksiegowosc.pracownicy where imie like 'J%';

-- e)
select * from ksiegowosc.pracownicy where nazwisko like '%n%' and nazwisko like '%a';

-- f)
select prac.imie, prac.nazwisko, (god.liczba_godzin - 160) as nadgodziny
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.godziny as god
on wynag.id_godziny = god.id_godziny)
where god.liczba_godzin > 160;

-- g)
select prac.imie, prac.nazwisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota between 1500 and 3000;

-- h)
select prac.imie, prac.nazwisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.godziny as god
on wynag.id_godziny = god.id_godziny)
where god.liczba_godzin > 160 and wynag.id_premii is null;

-- i)
select prac.*, pen.kwota
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
order by pen.kwota;

-- j)
select prac.*, pen.kwota, prem.kwota
from (((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
order by pen.kwota desc, prem.kwota desc;

-- k)
select count(prac.*), pen.stanowisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
group by pen.stanowisko
order by pen.stanowisko;

-- l)
select min(prem.kwota + pen.kwota) as minimum, max(prem.kwota + pen.kwota) as maximum, avg(prem.kwota + pen.kwota) as srednia 
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
where pen.stanowisko like 'EMPLOYER BRANDING EXORCIST';

-- m)
select prac.imie, prac.nazwisko, pen.kwota, prem.kwota
from (((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
where pen.stanowisko like 'EMPLOYER BRANDING EXORCIST';

-- n)
select sum(prem.kwota + pen.kwota)
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii);

-- o)
select pen.stanowisko, sum(prem.kwota + pen.kwota)
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
group by pen.stanowisko;

--p
select pen.stanowisko, count(wynag.id_premii)
from ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji
group by pen.stanowisko;


select * from ksiegowosc.pracownicy;
select * from ksiegowosc.godziny;
select * from ksiegowosc.premia;
select * from ksiegowosc.pensja;
select * from ksiegowosc.wynagrodzenie;