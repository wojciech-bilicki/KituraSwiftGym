--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: gym; Type: DATABASE; Schema: -; Owner: gymuser
--

CREATE DATABASE gym WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'UTF-8';


ALTER DATABASE gym OWNER TO gymuser;

\connect gym

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: gymuser
--

CREATE TABLE activities (
    id integer NOT NULL,
    name text,
    description text,
    is_reservable boolean,
    gym_id integer NOT NULL
);


ALTER TABLE activities OWNER TO gymuser;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: gymuser
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO gymuser;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gymuser
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: coaches; Type: TABLE; Schema: public; Owner: gymuser
--

CREATE TABLE coaches (
    id integer NOT NULL,
    name text,
    last_name text,
    age smallint,
    gym_id integer NOT NULL
);


ALTER TABLE coaches OWNER TO gymuser;

--
-- Name: coaches_id_seq; Type: SEQUENCE; Schema: public; Owner: gymuser
--

CREATE SEQUENCE coaches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coaches_id_seq OWNER TO gymuser;

--
-- Name: coaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gymuser
--

ALTER SEQUENCE coaches_id_seq OWNED BY coaches.id;


--
-- Name: gyms; Type: TABLE; Schema: public; Owner: gymuser
--

CREATE TABLE gyms (
    id integer NOT NULL,
    name text,
    address text
);


ALTER TABLE gyms OWNER TO gymuser;

--
-- Name: gyms_id_seq; Type: SEQUENCE; Schema: public; Owner: gymuser
--

CREATE SEQUENCE gyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gyms_id_seq OWNER TO gymuser;

--
-- Name: gyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gymuser
--

ALTER SEQUENCE gyms_id_seq OWNED BY gyms.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: coaches id; Type: DEFAULT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY coaches ALTER COLUMN id SET DEFAULT nextval('coaches_id_seq'::regclass);


--
-- Name: gyms id; Type: DEFAULT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY gyms ALTER COLUMN id SET DEFAULT nextval('gyms_id_seq'::regclass);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: coaches coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY coaches
    ADD CONSTRAINT coaches_pkey PRIMARY KEY (id);


--
-- Name: gyms gyms_pkey; Type: CONSTRAINT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (id);


--
-- Name: activities activities_gym_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_gym_id_fkey FOREIGN KEY (gym_id) REFERENCES gyms(id);


--
-- Name: coaches coaches_gym_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gymuser
--

ALTER TABLE ONLY coaches
    ADD CONSTRAINT coaches_gym_id_fkey FOREIGN KEY (gym_id) REFERENCES gyms(id);


--
-- PostgreSQL database dump complete
--

