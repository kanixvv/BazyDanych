--a) dodanie do telefonu kierunkowego dla Polski

select * from ksiegowosc.pracownicy;
update ksiegowosc.pracownicy set telefon = concat('(+48)', LEFT(telefon, 9))
where telefon not like '(+48)%';


--b) modyfikacja atrybtu telefonu, by był rozdzielony myślnikami

ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(18) USING SUBSTRING(telefon FROM 1 FOR 18);
select  
concat 
(
	substring (telefon,1,8),
	'-',
	substring (telefon,9,3),
	'-',
	substring (telefon,12,3)
)
as telefon 
from ksiegowosc.pracownicy;


--c)pracownik o najdluzszym nazwisku
select upper(pracownicy.nazwisko) as nazwisko
from ksiegowosc.pracownicy
order by length(nazwisko) desc
limit 1;

--d)dane i pensje pracowników zakodowane za pomocą md5
select pracownicy.imie, pracownicy.nazwisko, md5(pensja.kwota::varchar) 
from pracownicy 
inner join wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
inner join pensja on pensja.id_pensji = wynagrodzenie.id_pensji;

--f)pracownicy, pensje, premie > złączenie lewostronne
select pracownicy.imie, pracownicy.nazwisko, pensja.kwota, premia.kwota 
from pracownicy 
left join wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
left join pensja on pensja.id_pensji = wynagrodzenie.id_pensji 
left join premia on premia.id_premii = wynagrodzenie.id_premii;

--g)raport wg szablonu
alter table ksiegowosc.godziny 
add nadgodziny int null; --dodatkowa kolumna dla ulatwienia pozniejszych dzialan

update  ksiegowosc.godziny
set nadgodziny = case
	when liczba_godzin > 160 then liczba_godzin - 160
	else null
	end;

select 
concat(
'Pracownik ',pracownicy.imie,' ',pracownicy.nazwisko,', w dniu ',wynagrodzenie."data",
' otrzymał pensję całkowitą na kwotę ',
(pensja.kwota+premia.kwota+(godziny.nadgodziny*pensja.kwota/80)),' zł, gdzie wynagrodzenie zasadnicze wynosiło: ',
pensja.kwota,' zł, premia: ',premia.kwota,' zł, nadgodziny: ', 
    COALESCE((case 
        when godziny.nadgodziny is null then 0 
        else godziny.nadgodziny * pensja.kwota / 80 
    end), 0), ' zł') 
from ksiegowosc.pracownicy 
inner join ksiegowosc.wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika
inner join ksiegowosc.pensja on wynagrodzenie.id_pensji = pensja.id_pensji
inner join ksiegowosc.premia on wynagrodzenie.id_premii = premia.id_premii
inner join ksiegowosc.godziny on wynagrodzenie.id_godziny = godziny.id_godziny;