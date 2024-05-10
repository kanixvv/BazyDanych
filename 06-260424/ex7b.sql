CREATE SCHEMA 7B;

--1. Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako argument wejœciowy liczbê n.
--Generowanie ci¹gu Fibonacciego musi zostaæ zaimplementowane jako osobna funkcja,wywo³ywana przez procedurê.

CREATE OR REPLACE FUNCTION fibonacciSeq(n int)
RETURNS int
AS
$$
DECLARE
    a int := 0;
    b int := 1;
    c int;
BEGIN
    IF n = 1 THEN
        RETURN a;
    ELSIF n = 2 OR n = 3 THEN
        RETURN b;
    ELSE
        WHILE n > 2 LOOP
            c := a + b;
            a := b;
            b := c;
            n := n - 1;
        END LOOP;
        RETURN c;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE fibonacciProc(n int)
AS
$$
DECLARE
    i int := 1;
BEGIN
    WHILE n > 0 LOOP
        RAISE NOTICE '%', fibonacciSeq(i);
        i := i + 1;
        n := n - 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL fibonacciProc(8);


--2. Napisz trigger DML, który po wprowadzeniu danych do tabeli 
--Personszmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami. 


CREATE OR REPLACE FUNCTION trig_dml_function()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Person.Person
    SET LastName = UPPER(NEW.LastName)
    WHERE Person.BusinessEntityID = NEW.BusinessEntityID;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_dml
AFTER INSERT
ON Person.Person
FOR EACH ROW
EXECUTE FUNCTION trig_dml_function();

--do aktualizacji:
select * from Person.Person;
insert into Person.Businessentity values (1111);
INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, LastName)
VALUES (1111, 'IN', 'Wiktoria', 'Kania');

--Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie,
--je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’o wiêcej ni¿ 30%.

CREATE OR REPLACE FUNCTION taxRateMonitoring()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.TaxRate > 1.3 * OLD.TaxRate) THEN
        RAISE EXCEPTION 'TaxRate większe niż 30%%';
    ELSE
        NEW.TaxRate := NEW.TaxRate;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER taxRateMonitoringTrig
BEFORE UPDATE
ON Sales.SalesTaxRate
FOR EACH ROW
EXECUTE FUNCTION taxRateMonitoring();


-- do aktualizacji:
UPDATE Sales.SalesTaxRate
SET TaxRate = 120
WHERE SalesTaxRateID = 12;

SELECT * FROM Sales.SalesTaxRate;