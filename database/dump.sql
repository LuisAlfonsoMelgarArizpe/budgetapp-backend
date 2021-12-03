--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-12-02 17:07:58

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 26188)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    account_id integer NOT NULL,
    bank character varying(255),
    number character varying(255),
    user_id integer,
    account_type integer,
    "holdersName" character varying
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 26187)
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_account_id_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 213
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;


--
-- TOC entry 219 (class 1259 OID 26256)
-- Name: account_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_currency (
    "accountAccountId" integer NOT NULL,
    "currencyCurrencyId" integer NOT NULL
);


ALTER TABLE public.account_currency OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 26172)
-- Name: account_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_type (
    account_type_id integer NOT NULL,
    type character varying(255)
);


ALTER TABLE public.account_type OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 26171)
-- Name: account_type_account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_type_account_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_type_account_type_id_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 209
-- Name: account_type_account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_account_type_id_seq OWNED BY public.account_type.account_type_id;


--
-- TOC entry 216 (class 1259 OID 26208)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category character varying(255),
    user_id integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 26207)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 218 (class 1259 OID 26220)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_id integer NOT NULL,
    currency character varying(255),
    rate double precision
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 26219)
-- Name: currency_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_currency_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 217
-- Name: currency_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_currency_id_seq OWNED BY public.currency.currency_id;


--
-- TOC entry 223 (class 1259 OID 26304)
-- Name: operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation (
    id integer NOT NULL,
    quantity double precision,
    "currencyQuantity" double precision,
    operation_date timestamp with time zone,
    category character varying(255),
    description character varying(255),
    operation_type integer,
    account_id integer,
    currency_id integer
);


ALTER TABLE public.operation OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26303)
-- Name: operation_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operation_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_operation_id_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 222
-- Name: operation_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operation_operation_id_seq OWNED BY public.operation.id;


--
-- TOC entry 221 (class 1259 OID 26279)
-- Name: operation_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_type (
    operation_type_id integer NOT NULL,
    operation_type character varying(255)
);


ALTER TABLE public.operation_type OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26278)
-- Name: operation_type_operation_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operation_type_operation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_type_operation_type_id_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 220
-- Name: operation_type_operation_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operation_type_operation_type_id_seq OWNED BY public.operation_type.operation_type_id;


--
-- TOC entry 212 (class 1259 OID 26179)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    register_date timestamp with time zone,
    usercategories character varying DEFAULT '[]'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 26178)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3201 (class 2604 OID 26191)
-- Name: account account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 26175)
-- Name: account_type account_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN account_type_id SET DEFAULT nextval('public.account_type_account_type_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 26211)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 26223)
-- Name: currency currency_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN currency_id SET DEFAULT nextval('public.currency_currency_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 26307)
-- Name: operation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation ALTER COLUMN id SET DEFAULT nextval('public.operation_operation_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 26282)
-- Name: operation_type operation_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_type ALTER COLUMN operation_type_id SET DEFAULT nextval('public.operation_type_operation_type_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 26182)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3374 (class 0 OID 26188)
-- Dependencies: 214
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (account_id, bank, number, user_id, account_type, "holdersName") FROM stdin;
1	Banco Industrial	555555	13	1	Alfonso Melgar
\.


--
-- TOC entry 3379 (class 0 OID 26256)
-- Dependencies: 219
-- Data for Name: account_currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_currency ("accountAccountId", "currencyCurrencyId") FROM stdin;
1	1
\.


--
-- TOC entry 3370 (class 0 OID 26172)
-- Dependencies: 210
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (account_type_id, type) FROM stdin;
1	Savings
2	Monetary
\.


--
-- TOC entry 3376 (class 0 OID 26208)
-- Dependencies: 216
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, category, user_id) FROM stdin;
11	Gym	13
\.


--
-- TOC entry 3378 (class 0 OID 26220)
-- Dependencies: 218
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (currency_id, currency, rate) FROM stdin;
1	USD	1
3	EUR	0.88
2	GTQ	7.73
\.


--
-- TOC entry 3383 (class 0 OID 26304)
-- Dependencies: 223
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation (id, quantity, "currencyQuantity", operation_date, category, description, operation_type, account_id, currency_id) FROM stdin;
2	100	200	\N	Gym	Gym payment	2	1	1
3	111	111	\N	Food	test	1	\N	1
4	12.987012987012987	100	\N	Test 1	test test 	2	\N	2
5	11111	11111	\N	Studies	test	1	1	1
6	222	222	\N	Food	test test 	2	1	1
\.


--
-- TOC entry 3381 (class 0 OID 26279)
-- Dependencies: 221
-- Data for Name: operation_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_type (operation_type_id, operation_type) FROM stdin;
1	Expense
2	Income
\.


--
-- TOC entry 3372 (class 0 OID 26179)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, register_date, usercategories) FROM stdin;
15	Fonso	fonso@gmail.com	$2a$10$jQxSnMWMI9whZxtQpWuWnegCRCmrMiyceI.hBvG0aV8YnSKXgJ1fS	2021-11-15 22:22:29.913-06	[]
12	Pedro	pedro@gmail.com	$2a$10$AN2Eg2NLcr.Mh3LxvFXi3udIlY8cXo.sNzH7FieBBBnYZmszMzsNS	2021-11-01 20:04:54.102-06	["Gym","Pets"]
13	Alfonso Melgar	alfonso.melgar97@gmail.com	$2a$10$DVym0SZw322UnciJ7JnaoeRlA07qFOxtbMKAOW9XCbJD/klZ0zPmO	2021-11-15 22:12:36.823-06	["Gym","Test 1"]
\.


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 213
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_account_id_seq', 21, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 209
-- Name: account_type_account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_account_type_id_seq', 2, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 11, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 217
-- Name: currency_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_currency_id_seq', 3, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 222
-- Name: operation_operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operation_operation_id_seq', 6, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 220
-- Name: operation_type_operation_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operation_type_operation_type_id_seq', 2, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 3217 (class 2606 OID 26260)
-- Name: account_currency account_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_currency
    ADD CONSTRAINT account_currency_pkey PRIMARY KEY ("accountAccountId", "currencyCurrencyId");


--
-- TOC entry 3211 (class 2606 OID 26195)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);


--
-- TOC entry 3207 (class 2606 OID 26177)
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (account_type_id);


--
-- TOC entry 3213 (class 2606 OID 26213)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3215 (class 2606 OID 26225)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 3221 (class 2606 OID 26311)
-- Name: operation operation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 26284)
-- Name: operation_type operation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_type
    ADD CONSTRAINT operation_type_pkey PRIMARY KEY (operation_type_id);


--
-- TOC entry 3209 (class 2606 OID 26186)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 26201)
-- Name: account account_account_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_account_type_fkey FOREIGN KEY (account_type) REFERENCES public.account_type(account_type_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3225 (class 2606 OID 26261)
-- Name: account_currency account_currency_accountAccountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_currency
    ADD CONSTRAINT "account_currency_accountAccountId_fkey" FOREIGN KEY ("accountAccountId") REFERENCES public.account(account_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3226 (class 2606 OID 26266)
-- Name: account_currency account_currency_currencyCurrencyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_currency
    ADD CONSTRAINT "account_currency_currencyCurrencyId_fkey" FOREIGN KEY ("currencyCurrencyId") REFERENCES public.currency(currency_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3222 (class 2606 OID 26196)
-- Name: account account_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3224 (class 2606 OID 26214)
-- Name: category category_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3228 (class 2606 OID 26317)
-- Name: operation operation_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(account_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3229 (class 2606 OID 26322)
-- Name: operation operation_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3227 (class 2606 OID 26312)
-- Name: operation operation_operation_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_operation_type_fkey FOREIGN KEY (operation_type) REFERENCES public.operation_type(operation_type_id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2021-12-02 17:07:59

--
-- PostgreSQL database dump complete
--

