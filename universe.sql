CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  galaxy_type VARCHAR(255) NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  description TEXT,
  has_life BOOLEAN NOT NULL DEFAULT false
);

INSERT INTO galaxy (name, galaxy_type, distance_from_earth, description, has_life) VALUES
('Milky Way', 'Spiral', 0, 'Our home galaxy', true),
('Andromeda', 'Spiral', 2537000, 'Nearest spiral galaxy', false),
('Triangulum', 'Spiral', 3000000, 'Third-largest in Local Group', false),
('Whirlpool', 'Spiral', 23000000, 'Also called M51', false),
('Sombrero', 'Elliptical', 29000000, 'Bright galaxy with a dust lane', false),
('Pinwheel', 'Spiral', 21000000, 'Face-on spiral galaxy', false);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  age_in_millions_of_years INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  star_type VARCHAR(255) NOT NULL
);

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical, star_type) VALUES
('Sun', 1, 4600, true, 'G-type main-sequence'),
('Sirius', 1, 242, true, 'A-type main-sequence'),
('Alpha Centauri', 1, 5000, true, 'G-type main-sequence'),
('Betelgeuse', 1, 8500, true, 'Red supergiant'),
('Rigel', 1, 8000, true, 'Blue supergiant'),
('Proxima Centauri', 1, 4500, true, 'Red dwarf');

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  age_in_millions_of_years INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  planet_type VARCHAR(255) NOT NULL
);

INSERT INTO planet (name, star_id, age_in_millions_of_years, is_spherical, planet_type) VALUES
('Mercury', 1, 4500, true, 'Terrestrial'),
('Venus', 1, 4500, true, 'Terrestrial'),
('Earth', 1, 4500, true, 'Terrestrial'),
('Mars', 1, 4500, true, 'Terrestrial'),
('Jupiter', 1, 4500, true, 'Gas giant'),
('Saturn', 1, 4500, true, 'Gas giant'),
('Uranus', 1, 4500, true, 'Ice giant'),
('Neptune', 1, 4500, true, 'Ice giant'),
('Kepler-22b', 2, 6000, true, 'Exoplanet'),
('Proxima b', 6, 4500, true, 'Exoplanet'),
('Alpha Centauri Bb', 3, 5000, true, 'Exoplanet'),
('TRAPPIST-1e', 4, 7000, true, 'Exoplanet');

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  description TEXT
);

INSERT INTO moon (name, planet_id, diameter_km, has_life, description) VALUES
('Moon', 3, 3475, false, 'Earth’s only natural satellite'),
('Phobos', 4, 22, false, 'Mars inner moon'),
('Deimos', 4, 12, false, 'Mars outer moon'),
('Ganymede', 5, 5268, false, 'Largest moon in the solar system'),
('Europa', 5, 3122, false, 'Icy moon of Jupiter'),
('Io', 5, 3643, false, 'Volcanically active moon of Jupiter'),
('Callisto', 5, 4820, false, 'Heavily cratered moon of Jupiter'),
('Titan', 6, 5150, false, 'Saturn’s largest moon'),
('Enceladus', 6, 504, false, 'Icy moon of Saturn'),
('Mimas', 6, 396, false, 'Small moon of Saturn'),
('Rhea', 6, 1528, false, 'Moon of Saturn'),
('Iapetus', 6, 1469, false, 'Saturn’s two-tone moon'),
('Titania', 7, 1577, false, 'Moon of Uranus'),
('Oberon', 7, 1523, false, 'Moon of Uranus'),
('Umbriel', 7, 1169, false, 'Moon of Uranus'),
('Ariel', 7, 1158, false, 'Moon of Uranus'),
('Miranda', 7, 471, false, 'Moon of Uranus'),
('Triton', 8, 2707, false, 'Moon of Neptune'),
('Charon', 11, 1212, false, 'Pluto’s moon'),
('Dysnomia', 12, 163, false, 'Moon of Eris');

CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  is_dangerous BOOLEAN NOT NULL,
  asteroid_type VARCHAR(255) NOT NULL
);

INSERT INTO asteroid (name, age_in_millions_of_years, is_dangerous, asteroid_type) VALUES
('Ceres', 4500, false, 'Dwarf planet'),
('Vesta', 4500, false, 'Asteroid'),
('Pallas', 4500, false, 'Asteroid'),
('Hygiea', 4500, false, 'Asteroid');
