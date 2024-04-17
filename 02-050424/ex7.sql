ALTER TABLE rozliczenia.pensje RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje ADD COLUMN kwota_netto DECIMAL(10, 2);

UPDATE rozliczenia.pensje
SET kwota_netto = ROUND(kwota_brutto * 0.75, 2);