--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: room_facilities; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE room_facilities (
    id integer NOT NULL,
    name text,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.room_facilities OWNER TO pguser;

--
-- Name: room_facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE room_facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_facilities_id_seq OWNER TO pguser;

--
-- Name: room_facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE room_facilities_id_seq OWNED BY room_facilities.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    name character varying,
    status boolean DEFAULT true,
    book_date date,
    in_time time without time zone,
    out_time time without time zone,
    reserve_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.rooms OWNER TO pguser;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO pguser;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO pguser;

--
-- Name: user_rooms; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE user_rooms (
    id integer NOT NULL,
    user_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_rooms OWNER TO pguser;

--
-- Name: user_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE user_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_rooms_id_seq OWNER TO pguser;

--
-- Name: user_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE user_rooms_id_seq OWNED BY user_rooms.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    name character varying,
    contact_no character varying,
    manager boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO pguser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pguser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY room_facilities ALTER COLUMN id SET DEFAULT nextval('room_facilities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY user_rooms ALTER COLUMN id SET DEFAULT nextval('user_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: room_facilities; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY room_facilities (id, name, room_id, created_at, updated_at) FROM stdin;
1	Ac Room	3	2016-09-28 20:49:36.226027	2016-09-28 20:49:36.226027
2	24 hour Water	3	2016-09-28 20:49:36.232349	2016-09-28 20:49:36.232349
\.


--
-- Name: room_facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('room_facilities_id_seq', 2, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY rooms (id, name, status, book_date, in_time, out_time, reserve_date, created_at, updated_at) FROM stdin;
2	107B	t	\N	\N	\N	\N	2016-09-28 20:19:19.342566	2016-09-28 20:19:19.342566
3	109B	t	\N	\N	\N	\N	2016-09-28 20:49:36.213719	2016-09-28 20:49:36.213719
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('rooms_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY schema_migrations (version) FROM stdin;
20160928193625
20160928194249
20160928194309
20160928201112
\.


--
-- Data for Name: user_rooms; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY user_rooms (id, user_id, room_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('user_rooms_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, name, contact_no, manager, created_at, updated_at) FROM stdin;
1	admin@hotel_management.com	$2a$11$Cmz.K7l.3J8sGJTiFA2WIunc8Es7pFC0l2Fisod.LP8Jtsy7dBVn2	\N	\N	\N	0	\N	\N	\N	\N	Admin	9503208140	t	2016-09-28 20:18:27.344006	2016-09-28 20:18:27.344006
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: room_facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY room_facilities
    ADD CONSTRAINT room_facilities_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: user_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY user_rooms
    ADD CONSTRAINT user_rooms_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: pguser; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: pguser; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: pguser; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

