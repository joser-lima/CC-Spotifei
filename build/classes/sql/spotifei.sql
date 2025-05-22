--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-20 21:10:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16596)
-- Name: artistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artistas (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.artistas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16595)
-- Name: artistas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artistas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artistas_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 219
-- Name: artistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artistas_id_seq OWNED BY public.artistas.id;


--
-- TOC entry 224 (class 1259 OID 16617)
-- Name: curtidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curtidas (
    id integer NOT NULL,
    usuario_id integer,
    musica_id integer,
    status boolean NOT NULL
);


ALTER TABLE public.curtidas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16616)
-- Name: curtidas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curtidas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curtidas_id_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 223
-- Name: curtidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curtidas_id_seq OWNED BY public.curtidas.id;


--
-- TOC entry 226 (class 1259 OID 16661)
-- Name: historico_buscas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_buscas (
    id integer NOT NULL,
    usuario_id integer,
    musica_id integer,
    data_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historico_buscas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16660)
-- Name: historico_buscas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_buscas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_buscas_id_seq OWNER TO postgres;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 225
-- Name: historico_buscas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_buscas_id_seq OWNED BY public.historico_buscas.id;


--
-- TOC entry 222 (class 1259 OID 16603)
-- Name: musicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musicas (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    genero character varying(50),
    artista_id integer,
    curtidas integer DEFAULT 0,
    descurtidas integer DEFAULT 0
);


ALTER TABLE public.musicas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16602)
-- Name: musicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musicas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musicas_id_seq OWNER TO postgres;

--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 221
-- Name: musicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musicas_id_seq OWNED BY public.musicas.id;


--
-- TOC entry 229 (class 1259 OID 16692)
-- Name: playlist_musica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_musica (
    playlist_id integer NOT NULL,
    musica_id integer NOT NULL
);


ALTER TABLE public.playlist_musica OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16681)
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16680)
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlists_id_seq OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 227
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- TOC entry 218 (class 1259 OID 16587)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    usuario character varying(100) NOT NULL,
    senha character varying(100) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16586)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4671 (class 2604 OID 16599)
-- Name: artistas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artistas ALTER COLUMN id SET DEFAULT nextval('public.artistas_id_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16620)
-- Name: curtidas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas ALTER COLUMN id SET DEFAULT nextval('public.curtidas_id_seq'::regclass);


--
-- TOC entry 4676 (class 2604 OID 16664)
-- Name: historico_buscas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_buscas ALTER COLUMN id SET DEFAULT nextval('public.historico_buscas_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16606)
-- Name: musicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas ALTER COLUMN id SET DEFAULT nextval('public.musicas_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16684)
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 16590)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4853 (class 0 OID 16596)
-- Dependencies: 220
-- Data for Name: artistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artistas (id, nome) FROM stdin;
1	Cuco
\.


--
-- TOC entry 4857 (class 0 OID 16617)
-- Dependencies: 224
-- Data for Name: curtidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curtidas (id, usuario_id, musica_id, status) FROM stdin;
9	1	1	t
1	6	1	t
24	6	8	t
25	6	11	t
26	6	10	t
27	1	11	t
28	1	5	t
6	6	2	t
33	6	3	t
36	6	9	t
32	6	7	t
31	6	4	f
40	6	6	f
\.


--
-- TOC entry 4859 (class 0 OID 16661)
-- Dependencies: 226
-- Data for Name: historico_buscas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_buscas (id, usuario_id, musica_id, data_hora) FROM stdin;
1	6	1	2025-05-17 23:09:23.949251
2	6	2	2025-05-17 23:09:28.349007
3	6	1	2025-05-17 23:14:13.452729
4	6	10	2025-05-17 23:14:13.458561
5	6	8	2025-05-17 23:14:13.459359
6	6	1	2025-05-17 23:14:17.72231
7	6	10	2025-05-17 23:14:17.726394
8	6	8	2025-05-17 23:14:17.726842
9	6	10	2025-05-17 23:14:28.254464
10	6	11	2025-05-17 23:14:28.258635
11	6	10	2025-05-17 23:14:32.832454
12	6	11	2025-05-17 23:14:32.835812
13	6	10	2025-05-17 23:18:30.103253
14	6	11	2025-05-17 23:18:30.106934
15	6	8	2025-05-17 23:18:38.930659
16	6	10	2025-05-17 23:18:38.934351
17	1	11	2025-05-17 23:19:17.456016
18	1	8	2025-05-17 23:19:20.954145
19	1	10	2025-05-17 23:19:20.957782
20	1	4	2025-05-17 23:19:27.845516
21	1	2	2025-05-17 23:19:27.849237
22	6	1	2025-05-17 23:21:01.537983
23	6	10	2025-05-17 23:21:01.541784
24	6	8	2025-05-17 23:21:01.542159
25	6	1	2025-05-17 23:21:06.978302
26	6	10	2025-05-17 23:21:06.981836
27	6	8	2025-05-17 23:21:06.982248
28	6	11	2025-05-17 23:21:16.668176
29	6	10	2025-05-17 23:21:16.671681
30	1	10	2025-05-18 17:41:15.056291
31	1	11	2025-05-18 17:41:15.060035
32	1	10	2025-05-18 17:41:19.061498
33	1	11	2025-05-18 17:41:19.065147
34	1	8	2025-05-18 17:41:29.941315
35	1	10	2025-05-18 17:41:29.945103
36	1	11	2025-05-18 17:41:35.066102
37	1	3	2025-05-18 17:41:35.069327
38	1	8	2025-05-18 17:41:35.069671
39	1	5	2025-05-18 17:41:35.069947
40	1	9	2025-05-18 17:41:35.070217
41	1	10	2025-05-18 17:41:35.070483
42	1	2	2025-05-18 17:41:35.07073
43	1	11	2025-05-18 17:41:58.018896
44	1	3	2025-05-18 17:41:58.022255
45	1	8	2025-05-18 17:41:58.022566
46	1	5	2025-05-18 17:41:58.022892
47	1	9	2025-05-18 17:41:58.023134
48	1	10	2025-05-18 17:41:58.023344
49	1	2	2025-05-18 17:41:58.023556
50	1	11	2025-05-18 17:42:09.632937
51	1	3	2025-05-18 17:42:09.637288
52	1	8	2025-05-18 17:42:09.637707
53	1	5	2025-05-18 17:42:09.638228
54	1	9	2025-05-18 17:42:09.638567
55	1	10	2025-05-18 17:42:09.638863
56	1	2	2025-05-18 17:42:09.639205
57	6	2	2025-05-18 17:47:31.342243
58	6	2	2025-05-18 17:47:34.80456
59	6	2	2025-05-18 17:48:01.368827
60	6	1	2025-05-18 17:48:03.543286
61	6	11	2025-05-18 17:48:03.546813
62	6	6	2025-05-18 17:48:03.547151
63	6	3	2025-05-18 17:48:03.547474
64	6	8	2025-05-18 17:48:03.54779
65	6	7	2025-05-18 17:48:03.548147
66	6	5	2025-05-18 17:48:03.54848
67	6	9	2025-05-18 17:48:03.548823
68	6	10	2025-05-18 17:48:03.549336
69	6	2	2025-05-18 17:48:03.549804
70	6	4	2025-05-18 17:48:03.550336
71	6	1	2025-05-18 17:48:21.429447
72	6	11	2025-05-18 17:48:21.432694
73	6	6	2025-05-18 17:48:21.433314
74	6	3	2025-05-18 17:48:21.433675
75	6	8	2025-05-18 17:48:21.433915
76	6	7	2025-05-18 17:48:21.434132
77	6	5	2025-05-18 17:48:21.434335
78	6	9	2025-05-18 17:48:21.434686
79	6	10	2025-05-18 17:48:21.434914
80	6	2	2025-05-18 17:48:21.435163
81	6	4	2025-05-18 17:48:21.435515
82	6	1	2025-05-18 17:48:25.730012
83	6	11	2025-05-18 17:48:25.733301
84	6	6	2025-05-18 17:48:25.733711
85	6	3	2025-05-18 17:48:25.734108
86	6	8	2025-05-18 17:48:25.734444
87	6	7	2025-05-18 17:48:25.734741
88	6	5	2025-05-18 17:48:25.735042
89	6	9	2025-05-18 17:48:25.735258
90	6	10	2025-05-18 17:48:25.735513
91	6	2	2025-05-18 17:48:25.735737
92	6	4	2025-05-18 17:48:25.736002
93	6	3	2025-05-20 17:23:40.603637
94	6	3	2025-05-20 17:23:44.154174
95	6	7	2025-05-20 17:30:37.290527
96	6	7	2025-05-20 17:30:39.887733
97	6	8	2025-05-20 17:30:54.324158
98	6	9	2025-05-20 17:30:54.327113
99	6	4	2025-05-20 17:30:54.327445
100	6	8	2025-05-20 17:30:57.703799
101	6	9	2025-05-20 17:30:57.707158
102	6	4	2025-05-20 17:30:57.707468
103	6	8	2025-05-20 17:31:04.462186
104	6	9	2025-05-20 17:31:04.464838
105	6	4	2025-05-20 17:31:04.465193
106	6	7	2025-05-20 18:03:58.366137
107	6	4	2025-05-20 18:03:58.372272
108	6	7	2025-05-20 18:04:02.369989
109	6	4	2025-05-20 18:04:02.373519
110	6	7	2025-05-20 18:04:05.655727
111	6	4	2025-05-20 18:04:05.658864
112	6	7	2025-05-20 18:04:20.803438
113	6	4	2025-05-20 18:04:20.806841
114	6	7	2025-05-20 18:04:32.312936
115	6	4	2025-05-20 18:04:32.323328
116	6	7	2025-05-20 18:04:32.557916
117	6	4	2025-05-20 18:04:32.560291
118	6	7	2025-05-20 18:04:32.71514
119	6	4	2025-05-20 18:04:32.717896
120	6	7	2025-05-20 18:04:32.880039
121	6	4	2025-05-20 18:04:32.882686
122	6	7	2025-05-20 18:04:33.036806
123	6	4	2025-05-20 18:04:33.039505
124	6	7	2025-05-20 18:04:33.193077
125	6	4	2025-05-20 18:04:33.195936
126	6	7	2025-05-20 18:04:33.352281
127	6	4	2025-05-20 18:04:33.355126
128	6	7	2025-05-20 18:04:33.598154
129	6	4	2025-05-20 18:04:33.600759
130	6	1	2025-05-20 18:04:39.788043
131	6	11	2025-05-20 18:04:39.791058
132	6	3	2025-05-20 18:04:39.79136
133	6	8	2025-05-20 18:04:39.791686
134	6	7	2025-05-20 18:04:39.791971
135	6	5	2025-05-20 18:04:39.792362
136	6	9	2025-05-20 18:04:39.792658
137	6	1	2025-05-20 18:04:56.932611
138	6	11	2025-05-20 18:04:56.935683
139	6	6	2025-05-20 18:04:56.935997
140	6	3	2025-05-20 18:04:56.936282
141	6	8	2025-05-20 18:04:56.936536
142	6	7	2025-05-20 18:04:56.936732
143	6	5	2025-05-20 18:04:56.936983
144	6	9	2025-05-20 18:04:56.937201
145	6	10	2025-05-20 18:04:56.937379
146	6	2	2025-05-20 18:04:56.93758
147	6	4	2025-05-20 18:04:56.937769
148	6	1	2025-05-20 18:05:12.367267
149	6	11	2025-05-20 18:05:12.370726
150	6	6	2025-05-20 18:05:12.371111
151	6	3	2025-05-20 18:05:12.371416
152	6	8	2025-05-20 18:05:12.371666
153	6	7	2025-05-20 18:05:12.371926
154	6	5	2025-05-20 18:05:12.372231
155	6	9	2025-05-20 18:05:12.372448
156	6	10	2025-05-20 18:05:12.372668
157	6	2	2025-05-20 18:05:12.37284
158	6	4	2025-05-20 18:05:12.373014
\.


--
-- TOC entry 4855 (class 0 OID 16603)
-- Dependencies: 222
-- Data for Name: musicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musicas (id, nome, genero, artista_id, curtidas, descurtidas) FROM stdin;
2	coastin	pop	1	0	0
1	Lo Que Siento	Indie Pop	1	0	0
3	Amor de Siempre	Indie Pop	1	0	0
4	Hydrocodone	Indie Pop	1	0	0
5	Bossa No Sé	Indie Pop	1	0	0
6	Feelings	Indie Pop	1	0	0
7	Summer Time High Time	Indie Pop	1	0	0
8	Lover Is a Day	Indie Pop	1	0	0
9	One and Only	Indie Pop	1	0	0
10	Dontmakemefallinlove	Indie Pop	1	0	0
11	Keeping Tabs	Indie Pop	1	0	0
\.


--
-- TOC entry 4862 (class 0 OID 16692)
-- Dependencies: 229
-- Data for Name: playlist_musica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_musica (playlist_id, musica_id) FROM stdin;
2	1
3	8
\.


--
-- TOC entry 4861 (class 0 OID 16681)
-- Dependencies: 228
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, nome, usuario_id) FROM stdin;
2	pica	6
3	giovb	6
\.


--
-- TOC entry 4851 (class 0 OID 16587)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, usuario, senha) FROM stdin;
1	testeuser	senha123
2	userfoda	senhasenha
3	userteste	senhafoda
4	asda	asd
5	gabriel	foda
6	admin	123
8	tes	789
\.


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 219
-- Name: artistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artistas_id_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 223
-- Name: curtidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curtidas_id_seq', 40, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 225
-- Name: historico_buscas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_buscas_id_seq', 158, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 221
-- Name: musicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musicas_id_seq', 11, true);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 227
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 3, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 8, true);


--
-- TOC entry 4684 (class 2606 OID 16601)
-- Name: artistas artistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artistas
    ADD CONSTRAINT artistas_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 16622)
-- Name: curtidas curtidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT curtidas_pkey PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 16667)
-- Name: historico_buscas historico_buscas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_buscas
    ADD CONSTRAINT historico_buscas_pkey PRIMARY KEY (id);


--
-- TOC entry 4686 (class 2606 OID 16610)
-- Name: musicas musicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas
    ADD CONSTRAINT musicas_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16696)
-- Name: playlist_musica playlist_musica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_pkey PRIMARY KEY (playlist_id, musica_id);


--
-- TOC entry 4694 (class 2606 OID 16686)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 16679)
-- Name: curtidas unique_usuario_musica; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT unique_usuario_musica UNIQUE (usuario_id, musica_id);


--
-- TOC entry 4680 (class 2606 OID 16592)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 16594)
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 4698 (class 2606 OID 16628)
-- Name: curtidas curtidas_musica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT curtidas_musica_id_fkey FOREIGN KEY (musica_id) REFERENCES public.musicas(id);


--
-- TOC entry 4699 (class 2606 OID 16623)
-- Name: curtidas curtidas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT curtidas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4700 (class 2606 OID 16673)
-- Name: historico_buscas historico_buscas_musica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_buscas
    ADD CONSTRAINT historico_buscas_musica_id_fkey FOREIGN KEY (musica_id) REFERENCES public.musicas(id);


--
-- TOC entry 4701 (class 2606 OID 16668)
-- Name: historico_buscas historico_buscas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_buscas
    ADD CONSTRAINT historico_buscas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4697 (class 2606 OID 16611)
-- Name: musicas musicas_artista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas
    ADD CONSTRAINT musicas_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES public.artistas(id);


--
-- TOC entry 4703 (class 2606 OID 16702)
-- Name: playlist_musica playlist_musica_musica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_musica_id_fkey FOREIGN KEY (musica_id) REFERENCES public.musicas(id) ON DELETE CASCADE;


--
-- TOC entry 4704 (class 2606 OID 16697)
-- Name: playlist_musica playlist_musica_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id) ON DELETE CASCADE;


--
-- TOC entry 4702 (class 2606 OID 16687)
-- Name: playlists playlists_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


-- Completed on 2025-05-20 21:10:20

--
-- PostgreSQL database dump complete
--

