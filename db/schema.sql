DROP TABLE IF EXISTS quakes;
CREATE TABLE quakes (id SERIAL PRIMARY KEY, usgsid varchar(255) not null unique, latitude float not null, longitude float not null, magnitude float not null, time timestamp with time zone not null);

