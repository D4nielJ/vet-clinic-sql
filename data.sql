/* Populate database with sample data. */

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Agumon', 'FEB-03-2020', 0, TRUE, 10.23);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Gabumon', 'NOV-15-2018', 2, TRUE, 8);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Pikachu', 'JAN-07-2021', 1, FALSE, 15.04);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Devimon', 'MAY-12-2017', 5, TRUE, 11);

-- Second milestone

INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', 'feb/8/20', 0, FALSE, -11);

INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', 'nov/15/22', 2, TRUE, -5.7);

INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', 'apr/2/93', 3, FALSE, -12.13);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Angemon', 'JUN-12-2005', 1, TRUE, -45);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Boarmon', 'JUN-07-2005', 7, TRUE, 20.4);

INSERT INTO public.animals (name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES ('Blossom', 'OCT-13-1998', 3, TRUE, 17);

-- Third Milestone

INSERT INTO public.owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO public.owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO public.owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO public.owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO public.owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO public.owners (full_name, age)
VALUES ('Jodie Whittaker', 38);


INSERT INTO public.species (name)
VALUES ('Pokemon');

INSERT INTO public.species (name)
VALUES ('Digimon');


UPDATE public.animals
SET species_id = public.species.id
FROM public.species
WHERE public.animals.name ~'[A-Za-z]+mon'
  AND species.name ~'Digimon';

UPDATE public.animals
SET species_id = public.species.id
FROM public.species
WHERE public.animals.species_id IS NULL
  AND species.name ~'Pokemon';


UPDATE public.animals
SET owner_id = public.owners.id
FROM public.owners
WHERE public.animals.name = 'Agumon'
  AND public.owners.full_name = 'Sam Smith';


UPDATE public.animals
SET owner_id = public.owners.id
FROM public.owners
WHERE public.animals.name = 'Gabumon'
  AND public.owners.full_name = 'Jennifer Orwell'
  OR public.animals.name = 'Pikachu'
  AND public.owners.full_name = 'Jennifer Orwell';


UPDATE public.animals
SET owner_id = public.owners.id
FROM public.owners
WHERE public.animals.name = 'Devimon'
  AND public.owners.full_name = 'Bob'
  OR public.animals.name = 'Plantmon'
  AND public.owners.full_name = 'Bob';


UPDATE public.animals
SET owner_id = public.owners.id
FROM public.owners
WHERE public.animals.name = 'Charmander'
  AND public.owners.full_name = 'Melody Pond'
  OR public.animals.name = 'Squirtle'
  AND public.owners.full_name = 'Melody Pond'
  OR public.animals.name = 'Blossom'
  AND public.owners.full_name = 'Melody Pond';


UPDATE public.animals
SET owner_id = public.owners.id
FROM public.owners
WHERE public.animals.name = 'Angemon'
  AND public.owners.full_name = 'Dean Winchester'
  OR public.animals.name = 'Boarmon'
  AND public.owners.full_name = 'Dean Winchester';

-- Fourth Milestone

INSERT INTO public.vets ("name",age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-04-23');

INSERT INTO public.vets ("name",age,date_of_graduation)
VALUES ('Maisy Smith',26,'2019-01-17');

INSERT INTO public.vets ("name",age,date_of_graduation)
VALUES ('Stephanie Mendez',64,'1981-05-04');

INSERT INTO public.vets ("name",age,date_of_graduation)
VALUES ('Jack Harkness',38,'2008-06-08'); 


INSERT INTO specializations (species_id, vet_id)
SELECT s.id, v.id
FROM species s
JOIN vets v
ON s.name = 'Pokemon' AND v.name = 'William Tatcher';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Pokemon' AND v.name = 'Stephanie Mendez';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Digimon' AND v.name = 'Stephanie Mendez';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Digimon' AND v.name = 'Jack Harkness';
