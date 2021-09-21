/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name ~'[A-Za-z]+mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- second milestone

BEGIN;

ALTER TABLE
public.animals
DROP COLUMN species;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;


BEGIN;

UPDATE public.animals
SET species = 'digimon'
WHERE name ~'[A-Za-z]+mon';

UPDATE public.animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;


BEGIN;

DELETE FROM public.animals;

ROLLBACK;


BEGIN;

DELETE FROM public.animals
WHERE date_of_birth > 'JAN-01-2022';

SAVEPOINT SP2;

UPDATE public.animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SP2;

UPDATE public.animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

SELECT * FROM public.animals;

COMMIT;


SELECT COUNT(*) FROM public.animals;

SELECT COUNT(*) FROM public.animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM public.animals;

SELECT neutered, AVG(escape_attempts)
FROM public.animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM public.animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM public.animals
WHERE date_of_birth BETWEEN 'JAN-01-1990' AND 'DEC-31-2000'
GROUP BY species;
