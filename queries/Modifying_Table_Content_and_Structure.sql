UPDATE city
SET Population = 158000
WHERE name = 'Salzburg';

UPDATE city
SET Region = 'Unknown'
WHERE CountryCode = 'USA';

UPDATE country
SET LifeExpectancy = 73
WHERE LifeExpectancy IS NULL;

ALTER TABLE city
ADD FoundedYear INT;

ALTER TABLE city
MODIFY FoundedYear DATE;

ALTER TABLE city
DROP FoundedYear;

ALTER TABLE country
MODIFY Region VARCHAR(30);

ALTER TABLE city
RENAME COLUMN Region TO Region2;

RENAME TABLE countrylanguage TO country_language;

ALTER TABLE city
ADD isCapital boolean;

UPDATE city
INNER JOIN country
ON Capital = ID
SET isCapital = 1
WHERE Capital = ID;

UPDATE city
SET isCapital = 0
WHERE isCapital IS NULL;

UPDATE city
INNER JOIN country
ON CountryCode = Code2
SET city.Population = city.Population + 10*city.Population/100
where GNP > ALL (SELECT AVG(GNP)
                 FROM country);