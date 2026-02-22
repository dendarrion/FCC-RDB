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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: userdata_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.userdata_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userdata_user_id_seq OWNER TO freecodecamp;

--
-- Name: userdata_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.userdata_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.userdata_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 4);
INSERT INTO public.games VALUES (2, 1, 9);
INSERT INTO public.games VALUES (3, 1, 13);
INSERT INTO public.games VALUES (4, 1, 14);
INSERT INTO public.games VALUES (5, 1, 6);
INSERT INTO public.games VALUES (6, 77, 231);
INSERT INTO public.games VALUES (7, 77, 207);
INSERT INTO public.games VALUES (8, 78, 616);
INSERT INTO public.games VALUES (9, 78, 110);
INSERT INTO public.games VALUES (10, 77, 270);
INSERT INTO public.games VALUES (11, 77, 110);
INSERT INTO public.games VALUES (12, 77, 788);
INSERT INTO public.games VALUES (13, 79, 554);
INSERT INTO public.games VALUES (14, 79, 26);
INSERT INTO public.games VALUES (15, 80, 44);
INSERT INTO public.games VALUES (16, 80, 652);
INSERT INTO public.games VALUES (17, 79, 63);
INSERT INTO public.games VALUES (18, 79, 286);
INSERT INTO public.games VALUES (19, 79, 422);
INSERT INTO public.games VALUES (20, 81, 40);
INSERT INTO public.games VALUES (21, 81, 291);
INSERT INTO public.games VALUES (22, 82, 645);
INSERT INTO public.games VALUES (23, 82, 268);
INSERT INTO public.games VALUES (24, 81, 161);
INSERT INTO public.games VALUES (25, 81, 198);
INSERT INTO public.games VALUES (26, 81, 310);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'dendarrion');
INSERT INTO public.users VALUES (68, 'user_1771792216448');
INSERT INTO public.users VALUES (70, 'user_1771792216447');
INSERT INTO public.users VALUES (5, 'user_1771791264092');
INSERT INTO public.users VALUES (7, 'user_1771791264091');
INSERT INTO public.users VALUES (75, 'new user');
INSERT INTO public.users VALUES (12, 'test');
INSERT INTO public.users VALUES (77, 'user_1771792485195');
INSERT INTO public.users VALUES (78, 'user_1771792485194');
INSERT INTO public.users VALUES (79, 'user_1771792509012');
INSERT INTO public.users VALUES (80, 'user_1771792509011');
INSERT INTO public.users VALUES (81, 'user_1771792551441');
INSERT INTO public.users VALUES (19, 'user_1771791497655');
INSERT INTO public.users VALUES (82, 'user_1771792551440');
INSERT INTO public.users VALUES (21, 'user_1771791497654');
INSERT INTO public.users VALUES (26, 'user_1771791535822');
INSERT INTO public.users VALUES (28, 'user_1771791535821');
INSERT INTO public.users VALUES (33, 'user_1771791561523');
INSERT INTO public.users VALUES (35, 'user_1771791561522');
INSERT INTO public.users VALUES (47, 'user_1771791800760');
INSERT INTO public.users VALUES (49, 'user_1771791800759');
INSERT INTO public.users VALUES (54, 'user_1771791897492');
INSERT INTO public.users VALUES (56, 'user_1771791897491');
INSERT INTO public.users VALUES (61, 'user_1771791908187');
INSERT INTO public.users VALUES (63, 'user_1771791908186');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 26, true);


--
-- Name: userdata_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.userdata_user_id_seq', 82, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (user_id);


--
-- Name: users userdata_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT userdata_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

