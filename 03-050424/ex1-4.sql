CREATE DATABASE firma;

CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy (
    id_pracownika INT NOT NULL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50),
    adres VARCHAR(100),
    telefon VARCHAR(20)
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    daty DATE NOT NULL,
    liczba_godzin INT NOT NULL,
    id_pracownika int NOT NULL
   );

CREATE TABLE rozliczenia.pensje (
    id_pensji int PRIMARY KEY,
    stanowisko varchar(50) NOT NULL,
    kwota decimal(10,2) NOT NULL,
    id_premii int NOT NULL
   );

CREATE TABLE rozliczenia.premie
(
    id_premii int PRIMARY KEY,
    rodzaj varchar(50) NOT NULL,
    kwota decimal(10,2) NOT NULL
);

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT FK_pensje_premie FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);


ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT FK_pracownicy_godziny FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

INSERT INTO rozliczenia.pracownicy  VALUES 
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


INSERT INTO rozliczenia.godziny VALUES 
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 7, 2),
(3, '2024-04-03', 9, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 7, 5),
(6, '2024-04-06', 8, 6),
(7, '2024-04-07', 9, 7),
(8, '2024-04-08', 7, 8),
(9, '2024-04-09', 8, 9),
(10, '2024-04-10', 7, 10);

INSERT INTO rozliczenia.premie VALUES 
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

INSERT INTO rozliczenia.pensje VALUES 
(1, 'Kierownik', 5000.00, 1),
(2, 'Specjalista', 4000.00, 2),
(3, 'Asystent', 3500.00, 3),
(4, 'Technik', 3000.00, 4),
(5, 'Księgowy', 4500.00, 5),
(6, 'Sprzątaczka', 2500.00, 6),
(7, 'Pracownik produkcji', 3200.00, 7),
(8, 'Analityk', 4800.00, 8),
(9, 'Handlowiec', 4200.00, 9),
(10, 'Recepcjonista', 3800.00, 10);


