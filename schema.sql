/* Database schema to keep the structure of entire database. */

CREATE
TABLE public.animals
(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

-- Second Milestone

ALTER TABLE
public.animals 
ADD COLUMN IF NOT EXISTS species VARCHAR(100); 

-- Third Milestone

CREATE
TABLE public.owners
(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT
);

CREATE
TABLE public.species (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100);
);

ALTER TABLE
public.animals
DROP COLUMN species;

ALTER TABLE
public.animals
ADD COLUMN IF NOT EXISTS species_id INT REFERENCES public.species(id);

ALTER TABLE
public.animals
ADD COLUMN IF NOT EXISTS owner_id INT REFERENCES public.owners(id);

-- Fourth Milestone

CREATE TABLE public.vets (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar(100) NULL,
    age int NULL,
    date_of_graduation date NULL,
    CONSTRAINT vets_pk PRIMARY KEY (id)
);

CREATE TABLE public.specializations (
    vet_id int NOT NULL,
    species_id int NOT NULL,
    CONSTRAINT specializations_pk PRIMARY KEY (vet_id,species_id),
    CONSTRAINT specializations_fk FOREIGN KEY (vet_id) REFERENCES public.vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT specializations_fk_1 FOREIGN KEY (species_id) REFERENCES public.species(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE public.visits (
    "date_of_visits" date NULL,
    vet_id int NULL,
    animal_id int NULL,
    CONSTRAINT visits_fk_1 FOREIGN KEY (vet_id) REFERENCES public.vets(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT visits_fk FOREIGN KEY (animal_id) REFERENCES public.animals(id) ON DELETE CASCADE ON UPDATE CASCADE
); 