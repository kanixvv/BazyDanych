SELECT 
    daty ,
    EXTRACT(DOW FROM daty) AS dzien_tygodnia,
    EXTRACT(month FROM daty) AS miesiac
FROM rozliczenia.godziny;