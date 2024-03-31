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
    name character varying(255) NOT NULL,
    diameter_km integer,
    galaxy_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_type character varying(50),
    estimated_stars integer,
    age_in_billions_years numeric,
    is_spiral boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    diameter_km integer,
    orbital_period_days integer,
    is_geologically_active boolean DEFAULT false,
    planet_id integer NOT NULL,
    composition text
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
    name character varying(255) NOT NULL,
    planet_type character varying(50),
    orbital_period_days integer,
    distance_from_star integer,
    has_rings boolean DEFAULT false,
    has_atmosphere boolean DEFAULT false,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    spectral_type character varying(10),
    mass_solar_masses numeric,
    temperature_kelvin integer,
    galaxy_id integer NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 1);
INSERT INTO public.asteroid VALUES (2, 'Psyche 16', 230, 1);
INSERT INTO public.asteroid VALUES (3, 'C', 940, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 200, 13.8, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 1000, 14.0, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 30, 11.5, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 40, 16.5, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 15, 2.0, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 100, 12.0, false);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical', 3, 15.0, false);
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral', 200, 12.5, false);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'Ring', 100, 10.0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 27, false, 1, 'Rock and ice');
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 0, false, 4, 'Rock and ice');
INSERT INTO public.moon VALUES (3, 'Deimos', 13, 1, false, 4, 'Rock and ice');
INSERT INTO public.moon VALUES (4, 'Io', 3643, 2, true, 5, 'Volcanic rock and sulfur');
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 4, false, 5, 'Ice and water');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 7, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (7, 'Titan', 5150, 16, false, 6, 'Ice, rock, and methane');
INSERT INTO public.moon VALUES (8, 'Rhea', 1529, 5, false, 6, 'Ice and rock');
INSERT INTO public.moon VALUES (9, 'Callisto', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 1, false, 6, 'Ice and rock');
INSERT INTO public.moon VALUES (11, 'Enceladus', 504, 1, true, 6, 'Ice and water');
INSERT INTO public.moon VALUES (12, 'Tethys', 1062, 2, false, 6, 'Ice and rock');
INSERT INTO public.moon VALUES (16, 'Dione', 1118, 3, false, 6, 'Ice and rock');
INSERT INTO public.moon VALUES (23, 'E', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (24, 'A', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (25, 'B', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (26, 'C', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (27, 'D', 4821, 17, false, 5, 'Ice and rock');
INSERT INTO public.moon VALUES (28, 'X', 3474, 27, false, 1, 'Rock and ice');
INSERT INTO public.moon VALUES (29, 'Y', 3474, 27, false, 1, 'Rock and ice');
INSERT INTO public.moon VALUES (30, 'Z', 3474, 27, false, 1, 'Rock and ice');
INSERT INTO public.moon VALUES (31, 'H', 3474, 27, false, 1, 'Rock and ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 'Terrestrial', 687, 2, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Gas Giant', 4333, 5, true, true, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', 'Gas Giant', 10759, 10, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Uranus', 'Ice Giant', 30689, 19, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', 165, 30, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Gliese 581 g', 'Super-Earth', 37, 0, false, false, 3);
INSERT INTO public.planet VALUES (7, 'A', 'A', 1, 1, false, true, 1);
INSERT INTO public.planet VALUES (8, 'B', 'B', 1, 1, false, true, 1);
INSERT INTO public.planet VALUES (9, 'C', 'C', 1, 1, false, true, 1);
INSERT INTO public.planet VALUES (10, 'D', 'A', 1, 1, false, true, 1);
INSERT INTO public.planet VALUES (11, 'E', 'B', 1, 1, false, true, 1);
INSERT INTO public.planet VALUES (12, 'F', 'C', 1, 1, false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.0, 5500, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G8V', 1.1, 5500, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M5V', 0.12, 3000, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 'A1V', 2.0, 9940, 4);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M2Iab', 20.0, 3500, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 'B8Ia', 17.0, 19000, 2);
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 'K1V', 0.9, 5200, 1);
INSERT INTO public.star VALUES (8, 'Canopus', 'A9II', 8.9, 7400, 4);
INSERT INTO public.star VALUES (9, 'Betelgeuse A', 'M2Iab', 15.0, 3900, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: galaxy primary_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT primary_galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: star primary_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT primary_star_id PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

