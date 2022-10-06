--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    weight integer,
    distance_in_lyrs numeric,
    habitable boolean DEFAULT false,
    details text
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
    name character varying(30) NOT NULL,
    weight integer,
    distance_in_lyrs numeric,
    habitable boolean DEFAULT false,
    details text,
    planet_id integer
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
    name character varying(30) NOT NULL,
    weight integer,
    distance_in_lyrs numeric,
    habitable boolean DEFAULT false,
    details text,
    star_id integer
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
-- Name: signs_of_life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.signs_of_life (
    signs_of_life_id integer NOT NULL,
    name character varying(30),
    habitable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.signs_of_life OWNER TO freecodecamp;

--
-- Name: signs_of_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.signs_of_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.signs_of_life_id_seq OWNER TO freecodecamp;

--
-- Name: signs_of_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.signs_of_life_id_seq OWNED BY public.signs_of_life.signs_of_life_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    weight integer,
    distance_in_lyrs numeric,
    habitable boolean DEFAULT false,
    details text,
    galaxy_id integer
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
-- Name: signs_of_life signs_of_life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.signs_of_life ALTER COLUMN signs_of_life_id SET DEFAULT nextval('public.signs_of_life_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'mily way', 1200, 100, true, 'Galaxy where humans live');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2221312, 500, false, 'Neighbour of mily way');
INSERT INTO public.galaxy VALUES (3, 'Virgo A', 33213, 5000, false, 'Virgo A galaxy');
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 23213, 3434, false, 'Cygnus A galaxy');
INSERT INTO public.galaxy VALUES (5, 'Canis Major', 12321, 213, false, 'A dwarf galaxy');
INSERT INTO public.galaxy VALUES (6, 'Maffei I', 2313, 12322, false, 'Another galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'sun1', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.moon VALUES (2, '11', 2221312, 500, false, '1', 7);
INSERT INTO public.moon VALUES (3, '21', 33213, 5000, false, '2', 7);
INSERT INTO public.moon VALUES (4, '31', 23213, 3434, false, '3', 7);
INSERT INTO public.moon VALUES (5, '41', 12321, 213, false, '4', 7);
INSERT INTO public.moon VALUES (6, '51', 2313, 12322, false, 'Another sun', 7);
INSERT INTO public.moon VALUES (7, 'sun11', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.moon VALUES (8, '111', 2221312, 500, false, '1', 7);
INSERT INTO public.moon VALUES (9, '211', 33213, 5000, false, '2', 7);
INSERT INTO public.moon VALUES (10, '311', 23213, 3434, false, '3', 7);
INSERT INTO public.moon VALUES (11, '411', 12321, 213, false, '4', 7);
INSERT INTO public.moon VALUES (12, '511', 2313, 12322, false, 'Another sun', 7);
INSERT INTO public.moon VALUES (13, 'sun121', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.moon VALUES (14, '1121', 2221312, 500, false, '1', 7);
INSERT INTO public.moon VALUES (15, '2211', 33213, 5000, false, '2', 7);
INSERT INTO public.moon VALUES (16, '3121', 23213, 3434, false, '3', 7);
INSERT INTO public.moon VALUES (17, '2411', 12321, 213, false, '4', 7);
INSERT INTO public.moon VALUES (18, '2511', 2313, 12322, false, 'Another sun', 7);
INSERT INTO public.moon VALUES (19, 'sun1221', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.moon VALUES (20, '11221', 2221312, 500, false, '1', 7);
INSERT INTO public.moon VALUES (21, '22211', 33213, 5000, false, '2', 7);
INSERT INTO public.moon VALUES (22, '31221', 23213, 3434, false, '3', 7);
INSERT INTO public.moon VALUES (23, '22411', 12321, 213, false, '4', 7);
INSERT INTO public.moon VALUES (24, '22511', 2313, 12322, false, 'Another sun', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'sun', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.planet VALUES (8, '1', 2221312, 500, false, '1', 7);
INSERT INTO public.planet VALUES (9, '2', 33213, 5000, false, '2', 7);
INSERT INTO public.planet VALUES (10, '3', 23213, 3434, false, '3', 7);
INSERT INTO public.planet VALUES (11, '4', 12321, 213, false, '4', 7);
INSERT INTO public.planet VALUES (12, '5', 2313, 12322, false, 'Another sun', 7);
INSERT INTO public.planet VALUES (14, 'sun1', 1200, 0, false, 'sun where humans live', 7);
INSERT INTO public.planet VALUES (15, '11', 2221312, 500, false, '1', 7);
INSERT INTO public.planet VALUES (16, '21', 33213, 5000, false, '2', 7);
INSERT INTO public.planet VALUES (17, '31', 23213, 3434, false, '3', 7);
INSERT INTO public.planet VALUES (18, '41', 12321, 213, false, '4', 7);
INSERT INTO public.planet VALUES (19, '51', 2313, 12322, false, 'Another sun', 7);


--
-- Data for Name: signs_of_life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.signs_of_life VALUES (1, 'earth', false);
INSERT INTO public.signs_of_life VALUES (2, 'mars', false);
INSERT INTO public.signs_of_life VALUES (3, 'maybe some other planet', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'sun', 1200, 0, false, 'sun where humans live', 1);
INSERT INTO public.star VALUES (8, '1', 2221312, 500, false, '1', 2);
INSERT INTO public.star VALUES (9, '2', 33213, 5000, false, '2', 3);
INSERT INTO public.star VALUES (10, '3', 23213, 3434, false, '3', 4);
INSERT INTO public.star VALUES (11, '4', 12321, 213, false, '4', 4);
INSERT INTO public.star VALUES (12, '5', 2313, 12322, false, 'Another sun', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: signs_of_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.signs_of_life_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: signs_of_life signs_of_life_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.signs_of_life
    ADD CONSTRAINT signs_of_life_name_key UNIQUE (name);


--
-- Name: signs_of_life signs_of_life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.signs_of_life
    ADD CONSTRAINT signs_of_life_pkey PRIMARY KEY (signs_of_life_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


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

