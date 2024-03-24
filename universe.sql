--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    mass integer,
    diameter integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years double precision
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth double precision
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth double precision
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Ceres is the largest object in the asteroid belt between Mars and Jupiter.', 9, 940);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Vesta is the second-largest asteroid and is one of the brightest objects in the asteroid belt.', 2, 525);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Pallas is one of the largest asteroids and is located in the asteroid belt.', 4, 544);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Hygiea is the fourth-largest asteroid and is located in the asteroid belt.', 8, 430);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Eros is a near-Earth asteroid and was visited by the NEAR Shoemaker spacecraft.', 0, 34);
INSERT INTO public.asteroid VALUES (6, 'Ida', 'Ida is an asteroid in the asteroid belt and has a moon named Dactyl.', 5, 56);
INSERT INTO public.asteroid VALUES (7, 'Gaspra', 'Gaspra is a small asteroid visited by the Galileo spacecraft.', 1, 18);
INSERT INTO public.asteroid VALUES (8, 'Mathilde', 'Mathilde is a large, dark asteroid in the asteroid belt.', 3, 52);
INSERT INTO public.asteroid VALUES (9, 'Itokawa', 'Itokawa is a near-Earth asteroid visited by the Hayabusa spacecraft.', 0, 0);
INSERT INTO public.asteroid VALUES (10, 'Bennu', 'Bennu is a carbonaceous asteroid and the target of the OSIRIS-REx mission.', 0, 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Andromeda', 'The Andromeda Galaxy is a spiral galaxy approximately 2.537 million light-years from Earth.', true, 10000);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy located in the constellation Canes Venatici.', false, 400);
INSERT INTO public.galaxy VALUES (9, 'Sombrero', 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.', false, 1000);
INSERT INTO public.galaxy VALUES (10, 'Triangulum', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', true, 13000);
INSERT INTO public.galaxy VALUES (11, 'Pinwheel', 'The Pinwheel Galaxy is a face-on spiral galaxy located in the constellation Ursa Major.', false, 250);
INSERT INTO public.galaxy VALUES (12, 'Bode''s', 'Bode''s Galaxy is an intermediate spiral galaxy located in the constellation Ursa Major.', true, 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 25, 'La Luna es el único satélite natural de la Tierra.', false, true, 4.543);
INSERT INTO public.moon VALUES (22, 'Phobos', 26, 'Phobos es el satélite más grande de Marte.', false, false, 4.603);
INSERT INTO public.moon VALUES (23, 'Deimos', 26, 'Deimos es el satélite más pequeño de Marte.', false, false, 4.603);
INSERT INTO public.moon VALUES (24, 'Phoebe', 29, 'Phoebe es un satélite irregular de Saturno.', false, false, 4.503);
INSERT INTO public.moon VALUES (25, 'Ganymede', 28, 'Ganymede es el satélite más grande de Júpiter y del Sistema Solar.', false, false, 4.503);
INSERT INTO public.moon VALUES (26, 'Titan', 29, 'Titan es el satélite más grande de Saturno y el segundo más grande del Sistema Solar.', false, false, 4.503);
INSERT INTO public.moon VALUES (27, 'Triton', 30, 'Triton es el satélite más grande de Neptuno.', false, true, 4.503);
INSERT INTO public.moon VALUES (28, 'Io', 28, 'Io es uno de los satélites más volcánicamente activos del Sistema Solar.', false, false, 4.503);
INSERT INTO public.moon VALUES (29, 'Europa', 28, 'Europa es uno de los satélites de Júpiter con un océano de agua líquida bajo su superficie helada.', false, false, 4.503);
INSERT INTO public.moon VALUES (30, 'Miranda', 32, 'Miranda es uno de los satélites de Urano y tiene una superficie muy accidentada.', false, false, 4.503);
INSERT INTO public.moon VALUES (31, 'Charon', 33, 'Charon es el satélite más grande de Plutón.', false, true, 4.503);
INSERT INTO public.moon VALUES (32, 'Callisto', 28, 'Callisto es uno de los satélites de Júpiter y tiene una superficie muy antigua y craterizada.', false, false, 4.503);
INSERT INTO public.moon VALUES (33, 'Larissa', 32, 'Larissa es uno de los satélites de Urano y se cree que tiene un núcleo rocoso.', false, false, 4.503);
INSERT INTO public.moon VALUES (34, 'Moonlet', 29, 'Moonlet es un pequeño satélite de Saturno.', false, false, 4.503);
INSERT INTO public.moon VALUES (35, 'Oberon', 32, 'Oberon es uno de los satélites de Urano y tiene una superficie relativamente oscura.', false, false, 4.503);
INSERT INTO public.moon VALUES (36, 'Amalthea', 28, 'Amalthea es uno de los satélites de Júpiter y tiene una órbita muy cercana al planeta.', false, false, 4.503);
INSERT INTO public.moon VALUES (37, 'Rhea', 29, 'Rhea es uno de los satélites de Saturno y tiene una superficie muy reflejante.', false, false, 4.503);
INSERT INTO public.moon VALUES (38, 'Tethys', 29, 'Tethys es uno de los satélites de Saturno y tiene un gran cráter en su polo sur.', false, false, 4.503);
INSERT INTO public.moon VALUES (39, 'Umbriel', 32, 'Umbriel es uno de los satélites de Urano y tiene una superficie muy oscura y antigua.', false, false, 4.503);
INSERT INTO public.moon VALUES (40, 'Nereid', 30, 'Nereid es un satélite de Neptuno con una órbita muy excéntrica.', false, true, 4.503);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Earth', 13, 'Earth is the third planet from the Sun and the only known planet to support life.', true, true, 4.543, 0);
INSERT INTO public.planet VALUES (26, 'Mars', 13, 'Mars is the fourth planet from the Sun and the second smallest planet in the Solar System.', false, true, 4.603, 54.6);
INSERT INTO public.planet VALUES (27, 'Venus', 13, 'Venus is the second planet from the Sun and is often referred to as Earth''s "sister planet".', false, true, 4.503, 108.2);
INSERT INTO public.planet VALUES (28, 'Jupiter', 14, 'Jupiter is the largest planet in the Solar System and is known for its Great Red Spot.', false, false, 4.503, 628.7);
INSERT INTO public.planet VALUES (29, 'Saturn', 14, 'Saturn is the sixth planet from the Sun and is famous for its extensive ring system.', false, false, 4.503, 1278.5);
INSERT INTO public.planet VALUES (30, 'Neptune', 15, 'Neptune is the eighth and farthest known planet from the Sun in the Solar System.', false, true, 4.503, 4497.1);
INSERT INTO public.planet VALUES (31, 'Mercury', 13, 'Mercury is the smallest planet in the Solar System and is closest to the Sun.', false, true, 4.503, 77.3);
INSERT INTO public.planet VALUES (32, 'Uranus', 15, 'Uranus is the seventh planet from the Sun and has a unique sideways rotation.', false, false, 4.503, 2871);
INSERT INTO public.planet VALUES (33, 'Pluto', 16, 'Pluto was formerly considered the ninth planet from the Sun, but is now classified as a dwarf planet.', false, true, 4.503, 5906.4);
INSERT INTO public.planet VALUES (34, 'Kepler-452b', 17, 'Kepler-452b is an exoplanet orbiting the Sun-like star Kepler-452.', true, true, 6.06, 1402);
INSERT INTO public.planet VALUES (35, 'Proxima b', 18, 'Proxima b is an exoplanet orbiting the red dwarf star Proxima Centauri.', true, true, 4.2, 4.22);
INSERT INTO public.planet VALUES (36, 'TRAPPIST-1e', 18, 'TRAPPIST-1e is one of the seven Earth-sized exoplanets orbiting the ultra-cool dwarf star TRAPPIST-1.', true, true, 8, 39.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'Vega', 7, 'Vega is the brightest star in the constellation Lyra.', false, true, 0.455, 25);
INSERT INTO public.star VALUES (14, 'Arcturus', 8, 'Arcturus is the brightest star in the northern celestial hemisphere.', false, true, 7.1, 37);
INSERT INTO public.star VALUES (15, 'Aldebaran', 9, 'Aldebaran is an orange giant star located in the constellation Taurus.', false, false, 6.8, 65);
INSERT INTO public.star VALUES (16, 'Antares', 10, 'Antares is a red supergiant star in the constellation Scorpius.', true, false, 12.4, 550);
INSERT INTO public.star VALUES (17, 'Deneb', 11, 'Deneb is one of the brightest stars in the night sky and is part of the Summer Triangle.', false, true, 19, 1400);
INSERT INTO public.star VALUES (18, 'Rigel', 12, 'Rigel is a blue supergiant star in the constellation Orion.', false, false, 8.8, 860);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

