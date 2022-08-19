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
    name character varying(40) NOT NULL,
    form character varying(40),
    distance_in_kpc numeric(5,1),
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
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
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
    name character varying(20) NOT NULL,
    no_of_moons integer,
    class text,
    has_rings boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(40) NOT NULL,
    class character varying(20) NOT NULL,
    bright_rnk integer
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
-- Name: voyage; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.voyage (
    voyage_id integer NOT NULL,
    name character varying(30) NOT NULL,
    in_progress boolean,
    launch_date date,
    moon_id integer,
    planet_id integer
);


ALTER TABLE public.voyage OWNER TO freecodecamp;

--
-- Name: voyage_voyage_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.voyage_voyage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voyage_voyage_id_seq OWNER TO freecodecamp;

--
-- Name: voyage_voyage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.voyage_voyage_id_seq OWNED BY public.voyage.voyage_id;


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
-- Name: voyage voyage_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.voyage ALTER COLUMN voyage_id SET DEFAULT nextval('public.voyage_voyage_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 0.0, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'barred spiral', 766.5, NULL);
INSERT INTO public.galaxy VALUES (4, 'Leo A', 'irregular', 797.1, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 1560', 'spiral', 3433.9, NULL);
INSERT INTO public.galaxy VALUES (6, 'Segue 1', 'dwarf spheroidal', 23.0, NULL);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'dwarf irregular', 61.3, NULL);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool Galaxy', 'spiral', 9504.6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, ' Earth’s sole natural satellite and nearest large celestial body. Known since prehistoric times, it is the brightest object in the sky after the Sun. It is designated by the symbol ☽. Its name in English, like that of Earth, is of Germanic and Old English derivation. Earth’s sole natural satellite and nearest large celestial body. Known since prehistoric times, it is the brightest object in the sky after the Sun. It is designated by the symbol ☽. Its name in English, like that of Earth, is of Germanic and Old English derivation', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 'The outer and smaller of Mars"s two moons. Named for one of the sons of Ares. Deimos is an irregular rocky object having a cratered surface covered with a thick layer of fine debris.', 4);
INSERT INTO public.moon VALUES (4, 'Amalthea', false, 'A small, potato-shaped moon. Circles Jupiter once every 11 hours 57 minutes.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', true, 'A dark heavily cratered body of rock and ice that appears to have remained substantially unaltered inside and out for the past four billion years', 5);
INSERT INTO public.moon VALUES (6, 'Europa', true, 'A rocky object covered with and extremely smooth, elaborately patterned surface of ice', 5);
INSERT INTO public.moon VALUES (7, 'Ganymede', true, 'One of the Galilean moons, it was discovered by the Italian astronomer Galileo in 1610.', 5);
INSERT INTO public.moon VALUES (8, 'Io', true, 'Io is the most volcanically active body in the solar system.', 5);
INSERT INTO public.moon VALUES (9, 'Dione', true, 'It was discovered by the Italian-born Frnch astronomer Gian Domenico Cassini in 1684 and named for a daughter of the Titan Oceanus in Greek mythology.', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, 'Its suface, which reflects essentially all of the light that strikes it isbasically smooth but includes cratered and grooved plains. The surface is almost pure water ice, with trace amounts of carbon dioxide, ammonia, and light hydrocarbons.', 6);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 'The inner and larger of Mars"s two moon. Named for one of the sons of Ares. Phobos is a small irregular rocky object with a crater-scarred, grooved surface.', 4);
INSERT INTO public.moon VALUES (12, 'Hyperion', false, 'Notable in that it has no regular rotation period but tumbles in an apparently random fashion in its orbit.', 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', true, 'Outermost of Saturns"s regular moons, extraordinary because of its great contrast in surface brightness.', 6);
INSERT INTO public.moon VALUES (14, 'Mimas', true, 'Named for one of the Giants of Greek mythology.', 6);
INSERT INTO public.moon VALUES (15, 'Phoebe', false, 'It takes abour 1.5 Earth years for this celestial object to complete one trip around Saturn.', 6);
INSERT INTO public.moon VALUES (16, 'Rhea', true, '', 6);
INSERT INTO public.moon VALUES (17, 'Tethys', true, '', 6);
INSERT INTO public.moon VALUES (18, 'Titan', false, 'The only moon in the solar system known to have clouds and a dense atmosphere.', 6);
INSERT INTO public.moon VALUES (19, 'Ariel', true, '', 7);
INSERT INTO public.moon VALUES (20, 'Miranda', true, '', 7);
INSERT INTO public.moon VALUES (21, 'Oberon', true, '', 7);
INSERT INTO public.moon VALUES (22, 'Titania', true, '', 7);
INSERT INTO public.moon VALUES (23, 'Umbriel', true, '', 7);
INSERT INTO public.moon VALUES (24, 'Nereid', true, '', 8);
INSERT INTO public.moon VALUES (25, 'Triton', true, '', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 'Gas Giant', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 'Gas Giant', true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'Ice Giant', true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'Ice Giant', true, 1);
INSERT INTO public.planet VALUES (9, 'Gliese 581d', NULL, 'Terrestrial', NULL, NULL);
INSERT INTO public.planet VALUES (10, 'WASP-33b', NULL, 'Terrestrial', NULL, NULL);
INSERT INTO public.planet VALUES (11, '55 Cancri e', NULL, 'Super Earth', NULL, NULL);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', NULL, 'Terrestrial', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'yellow star', 0);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'white dwarf', 1);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'red supergiant', 10);
INSERT INTO public.star VALUES (5, 1, 'Bellatrix', 'blue giant', 26);
INSERT INTO public.star VALUES (6, 1, 'Fomalhaut', 'red dwarf', 18);
INSERT INTO public.star VALUES (4, 1, 'Rigel', 'blue supergiant', 7);


--
-- Data for Name: voyage; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.voyage VALUES (1, 'Voyager 1 and 2', true, '1997-01-01', NULL, 5);
INSERT INTO public.voyage VALUES (3, 'Apollo 11', false, '1969-01-01', 1, NULL);
INSERT INTO public.voyage VALUES (2, 'Galileo', false, '1998-01-01', NULL, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: voyage_voyage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.voyage_voyage_id_seq', 3, true);


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
-- Name: voyage voyage_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_name_key UNIQUE (name);


--
-- Name: voyage voyage_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_pkey PRIMARY KEY (voyage_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: voyage voyage_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: voyage voyage_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

