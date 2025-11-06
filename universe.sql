--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbit_period integer NOT NULL,
    mass numeric,
    is_visible boolean DEFAULT true,
    has_tail boolean DEFAULT true,
    origin text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    num_stars integer NOT NULL,
    mass numeric,
    type character varying(50),
    is_visible boolean DEFAULT true,
    is_active boolean DEFAULT true,
    description text
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
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric,
    has_atmosphere boolean DEFAULT false,
    is_colored boolean DEFAULT true,
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric NOT NULL,
    radius integer,
    has_rings boolean DEFAULT false,
    is_habitable boolean DEFAULT false,
    atmosphere text
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
    luminosity numeric NOT NULL,
    temperature integer,
    is_supernova boolean DEFAULT false,
    is_visible boolean DEFAULT true,
    spectral_type character varying(10)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 76, 220000000000000, true, true, 'Oort Cloud');
INSERT INTO public.comet VALUES (2, 'Encke', 3, 30000000000000, true, true, 'Kuiper Belt');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 2533, 2200000000000000, true, true, 'Oort Cloud');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250000, 1500000000000, 'Spiral', true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000, 1200000000000, 'Spiral', true, true, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, 50000000000, 'Spiral', true, true, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 80000, 800000000000, 'Elliptical', true, true, 'Bright central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100000, 1000000000000, 'Spiral', true, true, 'Famous spiral arms');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1000000, 2000000000000, 'Elliptical', false, true, 'Supermassive black hole galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 0.0123, false, true, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.000000010659, false, true, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 0.0000000014762, false, true, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 0.015, true, true, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 0.008, true, true, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 0.025, true, true, 'Icy/Rocky');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 0.018, true, true, 'Icy/Rocky');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 0.0225, true, true, 'Thick nitrogen');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, 0.0023, false, true, 'Icy');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469, 0.001, false, true, 'Icy');
INSERT INTO public.moon VALUES (11, 'Kepler-22b Moon 1', 7, 5000, 0.01, true, true, 'Unknown');
INSERT INTO public.moon VALUES (12, 'Kepler-22b Moon 2', 7, 3000, 0.005, false, true, 'Unknown');
INSERT INTO public.moon VALUES (13, 'HD209458b Moon 1', 8, 4000, 0.007, false, true, 'Unknown');
INSERT INTO public.moon VALUES (14, 'Rigel I Moon 1', 9, 2500, 0.004, false, true, 'Unknown');
INSERT INTO public.moon VALUES (15, 'Rigel I Moon 2', 9, 2600, 0.0045, false, true, 'Unknown');
INSERT INTO public.moon VALUES (16, 'Rigel II Moon 1', 10, 2300, 0.003, false, true, 'Unknown');
INSERT INTO public.moon VALUES (17, 'Betelgeuse I Moon 1', 11, 3000, 0.006, false, true, 'Unknown');
INSERT INTO public.moon VALUES (18, 'Betelgeuse I Moon 2', 11, 2800, 0.0055, false, true, 'Unknown');
INSERT INTO public.moon VALUES (19, 'Betelgeuse II Moon 1', 12, 3100, 0.007, false, true, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Betelgeuse II Moon 2', 12, 3200, 0.0075, false, true, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, 2439, false, false, 'None');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, 6051, false, false, 'CO2');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.0, 6371, false, true, 'N2,O2');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, 3389, false, false, 'CO2');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8, 69911, true, false, 'H2,He');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.2, 58232, true, false, 'H2,He');
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 4, 2.4, 22000, false, true, 'Unknown');
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 4, 0.69, 14000, false, false, 'H2,He');
INSERT INTO public.planet VALUES (9, 'Rigel I', 6, 1.5, 6000, false, false, 'Unknown');
INSERT INTO public.planet VALUES (10, 'Rigel II', 6, 0.9, 5000, false, false, 'Unknown');
INSERT INTO public.planet VALUES (11, 'Betelgeuse I', 5, 1.2, 7000, false, false, 'Unknown');
INSERT INTO public.planet VALUES (12, 'Betelgeuse II', 5, 0.8, 4000, false, false, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 5778, false, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.0017, 3042, false, true, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 25.4, 9940, false, true, 'A1V');
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 2, 300, 13000, false, true, 'B8IVpMnHg');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 126000, 3500, false, true, 'M1-2Ia-Iab');
INSERT INTO public.star VALUES (6, 'Rigel', 2, 120000, 12100, false, true, 'B8Ia');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

