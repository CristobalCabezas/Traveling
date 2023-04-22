--
-- PostgreSQL database cluster dump
--

-- Started on 2023-04-21 20:20:42 -04

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE cris;
ALTER ROLE cris WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-04-21 20:20:42 -04

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

-- Completed on 2023-04-21 20:20:42 -04

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-04-21 20:20:42 -04

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

-- Completed on 2023-04-21 20:20:42 -04

--
-- PostgreSQL database dump complete
--

--
-- Database "traveling" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-04-21 20:20:42 -04

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

--
-- TOC entry 4358 (class 1262 OID 16385)
-- Name: traveling; Type: DATABASE; Schema: -; Owner: cris
--

CREATE DATABASE traveling WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_ES.UTF-8';


ALTER DATABASE traveling OWNER TO cris;

\connect traveling

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

--
-- TOC entry 212 (class 1259 OID 16485)
-- Name: incremental_ciudad; Type: SEQUENCE; Schema: public; Owner: cris
--

CREATE SEQUENCE public.incremental_ciudad
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incremental_ciudad OWNER TO cris;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 16480)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: cris
--

CREATE TABLE public.ciudad (
    id smallint DEFAULT nextval('public.incremental_ciudad'::regclass) NOT NULL,
    nombre_ciudad character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.ciudad OWNER TO cris;

--
-- TOC entry 210 (class 1259 OID 16478)
-- Name: incremental_hoteles; Type: SEQUENCE; Schema: public; Owner: cris
--

CREATE SEQUENCE public.incremental_hoteles
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incremental_hoteles OWNER TO cris;

--
-- TOC entry 209 (class 1259 OID 16473)
-- Name: hoteles; Type: TABLE; Schema: public; Owner: cris
--

CREATE TABLE public.hoteles (
    id numeric(6,0) DEFAULT nextval('public.incremental_hoteles'::regclass) NOT NULL,
    nombre_hotel character varying(50) NOT NULL,
    direccion_hotel character varying(100),
    id_ciudad smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.hoteles OWNER TO cris;

--
-- TOC entry 214 (class 1259 OID 16488)
-- Name: migrations; Type: TABLE; Schema: public; Owner: cris
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO cris;

--
-- TOC entry 213 (class 1259 OID 16487)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cris
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO cris;

--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 213
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cris
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 4201 (class 2604 OID 16491)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: cris
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4349 (class 0 OID 16480)
-- Dependencies: 211
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: cris
--

COPY public.ciudad (id, nombre_ciudad, created_at, updated_at, deleted_at) FROM stdin;
1	Valparaiso	\N	\N	\N
2	Santiago	\N	\N	\N
3	Concepcion	\N	\N	\N
6	Valdivia	2023-04-21 21:50:32	2023-04-21 21:50:32	\N
\.


--
-- TOC entry 4347 (class 0 OID 16473)
-- Dependencies: 209
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: cris
--

COPY public.hoteles (id, nombre_hotel, direccion_hotel, id_ciudad, created_at, updated_at, deleted_at) FROM stdin;
1	Diego de Almagro Valparaiso	Errazuriz 1234	1	\N	\N	\N
2	Diego de Almagro Santiago	Alameda 340	2	\N	\N	\N
3	Diego de Almagro Concepcion	Av Principal 800	3	\N	\N	\N
4	Wynhdam by Pettra	Comandante Malbec 1234	2	2023-04-21 21:38:51	2023-04-21 21:38:51	\N
5	Marina del Rey	Viana 1234	1	2023-04-21 21:41:18	2023-04-21 21:41:18	\N
7	Dreams Pedro de Valdivia	Carampangue 190	6	2023-04-21 22:01:01	2023-04-21 22:18:54	\N
\.


--
-- TOC entry 4352 (class 0 OID 16488)
-- Dependencies: 214
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: cris
--

COPY public.migrations (id, migration, batch) FROM stdin;
\.


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 212
-- Name: incremental_ciudad; Type: SEQUENCE SET; Schema: public; Owner: cris
--

SELECT pg_catalog.setval('public.incremental_ciudad', 7, true);


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 210
-- Name: incremental_hoteles; Type: SEQUENCE SET; Schema: public; Owner: cris
--

SELECT pg_catalog.setval('public.incremental_hoteles', 7, true);


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 213
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cris
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- TOC entry 4205 (class 2606 OID 16484)
-- Name: ciudad CIUDAD_pk; Type: CONSTRAINT; Schema: public; Owner: cris
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT "CIUDAD_pk" PRIMARY KEY (id);


--
-- TOC entry 4203 (class 2606 OID 16477)
-- Name: hoteles HOTELES_pk; Type: CONSTRAINT; Schema: public; Owner: cris
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT "HOTELES_pk" PRIMARY KEY (id);


--
-- TOC entry 4207 (class 2606 OID 16493)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cris
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


-- Completed on 2023-04-21 20:20:42 -04

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-04-21 20:20:42 -04

--
-- PostgreSQL database cluster dump complete
--

