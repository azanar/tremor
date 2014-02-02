DROP TABLE IF EXISTS quakes CASCADE;
DROP TYPE IF EXISTS quake_distance CASCADE;

CREATE TABLE quakes (id SERIAL PRIMARY KEY, usgsid varchar(255) not null unique, latitude numeric not null, longitude numeric not null, magnitude numeric not null, time timestamp with time zone not null);

-- Borrowed from: https://gist.github.com/cypres/831833
CREATE OR REPLACE FUNCTION geodistance(a point, b point)
  RETURNS double precision AS
$BODY$
SELECT acos(
  sin(radians($1[0]))*sin(radians($2[0])) +
  cos(radians($1[0]))*cos(radians($2[0]))*cos(radians($2[1])-radians($1[1]))
)*6371 AS distance;
$BODY$
  LANGUAGE sql IMMUTABLE
  COST 100;

CREATE TYPE quake_distance AS (quake_id integer, distance double precision);
CREATE OR REPLACE FUNCTION quake_distances_from_point(origin point)
  RETURNS setof quake_distance AS
$$
SELECT q.id, geodistance(origin, point(q.latitude, q.longitude)) AS distance
FROM quakes q
$$
LANGUAGE sql STABLE
COST 100;
