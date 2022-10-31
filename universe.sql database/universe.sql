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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_milkm numeric,
    description text,
    size_in_earths integer,
    year_discovered integer,
    has_life boolean,
    is_gas boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    diameter_milkm numeric,
    description text,
    size_in_earths integer,
    year_discovered integer,
    has_life boolean,
    is_gas boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    diameter_milkm numeric,
    description text,
    size_in_earths integer,
    year_discovered integer,
    has_life boolean,
    is_gas boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race (
    name character varying(30) NOT NULL,
    population bigint,
    race_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.race OWNER TO freecodecamp;

--
-- Name: race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_id_seq OWNER TO freecodecamp;

--
-- Name: race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.race_id_seq OWNED BY public.race.race_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    diameter_milkm numeric,
    description text,
    size_in_earths integer,
    year_discovered integer,
    has_life boolean,
    is_gas boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: race race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race ALTER COLUMN race_id SET DEFAULT nextval('public.race_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('the galaxy', 3, NULL, 'a galaxy far, far away', NULL, NULL, true, true);
INSERT INTO public.galaxy VALUES ('oderma', 4, NULL, 'giant eliptical galaxy', NULL, 2548, true, true);
INSERT INTO public.galaxy VALUES ('orizon xerto', 5, NULL, 'surrounded by 4 blue rings', NULL, 2653, NULL, true);
INSERT INTO public.galaxy VALUES ('andromeda', 2, 141910500000000000, 'nearest large galaxy from milky way', NULL, 1612, NULL, true);
INSERT INTO public.galaxy VALUES ('sarto', 6, 85146300000, 'small galaxy near milky way', NULL, 2073, false, true);
INSERT INTO public.galaxy VALUES ('the milky way', 1, 94607000000000000, 'not for those with lactose intolerance', NULL, 1610, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, 0.0035, 'is it made out of cheese tho?', NULL, NULL, false, false, 1);
INSERT INTO public.moon VALUES ('europa', 2, 0.0031, 'smallest of the four galilean moons of jupiter', NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES ('io', 3, 0.0036, 'looks like metal penetrated by bullets', NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES ('ganymede', 4, 0.0052, 'largest moon in the solar system', NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES ('callisto', 5, 0.0048, 'rad looking planet', NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES ('titan', 6, 0.0051, 'looks very soft', NULL, 1655, false, false, 6);
INSERT INTO public.moon VALUES ('mercur', 7, 0.0048, 'this moon is impossible', NULL, NULL, true, true, 2);
INSERT INTO public.moon VALUES ('mercurius', 8, 0.0049, 'this moon is impossible as well', NULL, NULL, true, false, 2);
INSERT INTO public.moon VALUES ('mercuc', 9, 0.0050, 'what..', NULL, NULL, true, true, 2);
INSERT INTO public.moon VALUES ('der mond', 10, 0.0035, 'its earths moon but in german', NULL, NULL, false, false, 1);
INSERT INTO public.moon VALUES ('damn', 11, 0.123, 'random moon', NULL, NULL, true, false, 9);
INSERT INTO public.moon VALUES ('demizos', 12, 0.0008, 'another random moon', NULL, NULL, false, true, 9);
INSERT INTO public.moon VALUES ('demizos1', 13, 0.0091, 'yet another ranodm moon', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('demizos2', 14, 0.0092, 'aand another random moon', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod', 15, 0.0093, 'somehow pluto has a lot of giant moons', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod1', 16, 0.0094, 'bigger than the planet itself', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod2', 17, 0.0095, 'but also kind of in line', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod3', 18, 0.0096, 'this information is not false', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod4', 19, 1.45, 'this is getting ridiculously huge!!', NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES ('omorod5', 20, 0.004, 'this is the last one i swear', NULL, NULL, false, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('earth', 1, 0.012, 'no its not flat. its donut shaped', 1, NULL, true, false, 1);
INSERT INTO public.planet VALUES ('mercury', 2, 0.0048, 'its liquid at room temperature', NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES ('venus', 3, 0.012, 'grab me by my venus', NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES ('mars', 4, 0.0067, 'haha elon musk haha', NULL, NULL, true, false, 1);
INSERT INTO public.planet VALUES ('jupiter', 5, 0.14, 'gas giant', 1300, NULL, false, true, 1);
INSERT INTO public.planet VALUES ('saturn', 6, 0.12, 'rings', 1220, NULL, false, true, 1);
INSERT INTO public.planet VALUES ('uranus', 7, 0.051, 'hubble just spotted something coming out of uranus', 570, NULL, false, true, 1);
INSERT INTO public.planet VALUES ('neptune', 8, 0.049, 'the blue planet', 565, NULL, false, true, 1);
INSERT INTO public.planet VALUES ('pluto', 9, 0.002, 'dwarf planet', NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES ('makeb', 10, 0.057, 'jabba the hut planet', NULL, NULL, true, false, 3);
INSERT INTO public.planet VALUES ('mustafar', 11, 0.0042, 'the planet with the high ground', NULL, NULL, true, false, 4);
INSERT INTO public.planet VALUES ('mandalore', 12, 0.0532, 'planet of the mandalorians', NULL, NULL, true, false, 5);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race VALUES ('human', 8000000000, 1, 1);
INSERT INTO public.race VALUES ('martians', 42000000, 2, 4);
INSERT INTO public.race VALUES ('plutonians', 2, 3, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, 1.392, 'its the star were orbiting around', 1000000, NULL, false, true, 1);
INSERT INTO public.star VALUES ('sirius a', 2, 2.365, 'brightest star in the milky way', NULL, 1844, false, true, 1);
INSERT INTO public.star VALUES ('sun of makeb', 3, 1.256, 'this is makebs sun', NULL, NULL, false, true, 3);
INSERT INTO public.star VALUES ('priate', 4, 1.54, 'the star of mustafar', NULL, NULL, false, true, 3);
INSERT INTO public.star VALUES ('mandalore', 5, 1.54, 'the star of mandalore', NULL, NULL, false, true, 3);
INSERT INTO public.star VALUES ('lucy ilu', 6, 1.23, 'the brightest star on the sky', NULL, NULL, true, false, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.race_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: race race_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_id_key UNIQUE (race_id);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (race_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


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
-- Name: race race_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

