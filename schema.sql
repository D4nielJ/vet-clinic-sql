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

ALTER TABLE
public.animals
DROP COLUMN species;

ALTER TABLE
public.animals
ADD COLUMN IF NOT EXISTS species_id INT REFERENCES public.species(id);

ALTER TABLE
public.animals
ADD COLUMN IF NOT EXISTS owner_id INT REFERENCES public.owners(id);