-- Active: 1748024847701@@127.0.0.1@5432@conservation_db

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT,
    region VARCHAR(60)
);

SELECT * from rangers;

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(70),
    discovery_date DATE,
    conservation_status VARCHAR(20)
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        ' Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        ' Endangered'
    ),
    (
        'Red Panda',
        ' Ailurus fulgens',
        '1825-01-01',
        ' Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        ' Endangered'
    );

SELECT * FROM species;

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id),
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    location TEXT,
    sighting_time TIMESTAMP,
    notes TEXT
);

-- DROP table rangers;
-- DROP TABLE species;

INSERT INTO sightings(
    ranger_id ,
    species_id ,location ,
    sighting_time ,    
    notes 
)
VALUES (1,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),(2,2,'Bankwood Area','2024-05-12 16:20:00', 'Juvenile seen' ),(3,3,'Bamboo Grove East','2024-05-15 09:10:00','Feeding observed '),(2,1,'Snowfall Pass','2024-05-18 18:30:00', NULL);


-- DROP TABLE sightings;

--problem1
INSERT INTO
    rangers (name, region)
VALUES (
        'Derek Fox',
        'Coastal Plains'
    );

SELECT * FROM rangers;
SELECT * FROM sightings;
--Problem-2------------not done yet
SELECT count(*) FROM sightings GROUP BY species_id;
--Problem-3
SELECT * FROM sightings where location LIKE '%Pass';
--Problem-4
SELECT name, count(name) AS total_sightings FROM rangers r JOIN sightings s ON r.ranger_id=s.ranger_id  GROUP BY name;


---Problem-5
SELECT common_name FROM species sp LEFT JOIN sightings st ON sp.species_id=st.species_id WHERE sighting_id IS NULL;

---Problem-6
SELECT * FROM species sp  JOIN sightings st ON sp.species_id=st.species_id ORDER BY sighting_time DESC LIMIT 2;

SELECT common_name, sighting_time, name FROM rangers r JOIN (SELECT common_name, sighting_time,ranger_id FROM species sp  JOIN sightings st ON sp.species_id=st.species_id ORDER BY sighting_time DESC LIMIT 2) AS ss ON r.ranger_id=ss.ranger_id;


--Problem-7
UPDATE species 
SET conservation_status = 'HISTORIC' WHERE date_part('year', discovery_date) < 1800