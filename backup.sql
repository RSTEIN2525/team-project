--
-- PostgreSQL database dump
--

\restrict ScsgzkwRyj6kH4X4AangzMNQOI4JBUfRyELbvesHX3MpqhfGSUvMpggdVfLYOVv

-- Dumped from database version 18.3 (Homebrew)
-- Dumped by pg_dump version 18.3 (Homebrew)

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
-- Name: albums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.albums (
    album_id text NOT NULL,
    title text NOT NULL,
    artist_id integer NOT NULL,
    release_date text
);


--
-- Name: artists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    name text NOT NULL,
    country_of_origin text,
    founded integer,
    is_group integer
);


--
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artists_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artists_artist_id_seq OWNED BY public.artists.artist_id;


--
-- Name: collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection (
    item_id integer NOT NULL,
    album_id text NOT NULL,
    format text,
    date_acquired text,
    purchase_price real,
    personal_rating integer
);


--
-- Name: collection_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.collection_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collection_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collection_item_id_seq OWNED BY public.collection.item_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tracks (
    track_id text NOT NULL,
    album_id text NOT NULL,
    genre_id integer,
    title text NOT NULL,
    popularity integer,
    duration_ms integer,
    danceability real,
    energy real,
    key integer,
    loudness real,
    mode integer,
    speechiness real,
    acousticness real,
    instrumentalness real,
    liveness real,
    valence real,
    tempo real
);


--
-- Name: artists artist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists ALTER COLUMN artist_id SET DEFAULT nextval('public.artists_artist_id_seq'::regclass);


--
-- Name: collection item_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection ALTER COLUMN item_id SET DEFAULT nextval('public.collection_item_id_seq'::regclass);


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.albums (album_id, title, artist_id, release_date) FROM stdin;
007DWn799UWvfY1wwZeENR	i am > i was	1	2018-12-21
00HZxSA1sOS9T3nA950sg4	The Best In The World Pack	70	2019-06-15
01GR4NL5O5CZM51k0aejKD	World War Joy	229	2019-12-06
01sfgrNbnnPUEyz6GZYlt9	Dua Lipa (Deluxe)	71	2017-06-02
01yYW0rRRwlEZx1dMmc5ff	Para Aventuras y Curiosidades	153	2019-05-03
02sEJTj1sye1JaqxqpcSCp	Encore	65	2016-08-05
02XOoh8XrlCc466QkkjGk5	Te Vi	183	2018-12-14
0488X5veBK6t3vSmIiTDJY	Before You Go	128	2019-11-19
04G0YylSjvDQZrjOfE5jA5	We Sing. We Dance. We Steal Things.	103	2008-05-12
06S3Qjh4QWLtn6c7CVhYh7	Callaita	26	2019-05-31
085TF4mnNbXQT0m2X05cb0	Big Plans	247	2019-01-17
09b9NC1oQbYaHcacgXn66k	We All Shine	252	2019-01-18
0bUTHlWbkSQysoM3VsWldT	Demon Days	86	2005-05-23
0CPLMVp7rMi3BkzAMve96K	Historias de un Capricornio	18	2019-12-20
0cqRGWD3uc5Lggpducn5nD	Piece Of Your Heart	154	2019-02-01
0CUMVFalkFhZM6Xo0ErxLi	ADN	147	2019-08-23
0efvl0HsK2xxttk4IVOJry	Ritual	235	2019-05-31
0FgZKfoU2Br5sHOfvZKTI9	JESUS IS KING	116	2019-10-25
0fYctMs4EvoEqzDh8Kmg5g	Gangsta's Paradise	48	1995-11-07
0h2knr6qpiAq0tV5ri5JMF	The Days / Nights	23	2014-01-01
0ix3XtPV1LwmZADsprKxcp	Don't Start Now	71	2019-10-31
0JcW7yCW3Qj8uMfzO2lUDb	Happy Now	256	2018-07-18
0kBfgEilUFCMIQY5IOjG4t	Slippery When Wet	32	1986-01-01
0lDRXaECpMSYYCsTYRDulh	Shotta Flow (Feat. Blueface) [Remix]	168	2019-06-20
0MGcjBIFcL2qaCrgGjIGFb	Can We Kiss Forever?	123	2018-08-31
0MV1yCXcNNQBfwApqAVkH0	Without Warning	172	2017-10-30
0mZIUXje90JtHxPNzWsJNR	Voicenotes	42	2018-05-11
0O1PJ0t69iTO5yWrIeIga0	Baby On Baby	50	2019-03-01
0OChMQnL4dpFZQH93uPb1d	La Mejor Versión de Mi (Remix)	160	2019-10-04
0p0W4RXcnc59jgatcdZozO	MIA (feat. Drake)	26	2018-10-11
0P3oVJBFOv3TDXlYRhGL7s	Beauty Behind The Madness	234	2015-08-28
0PijZTpKNGUvL12y7w4tZF	Runaway	210	2019-06-21
0puSqXoH0dMgimvyi5slCt	Easier	3	2019-05-23
0RHX9XECH8IVI3LNgWDpmQ	A Rush of Blood to the Head	46	2002-08-08
0rSLgV8p5FzfnqlEk4GzxE	Closer (feat. Halsey)	229	2016-07-29
0S0KGZnfBGSIssfF54WSJh	WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?	30	2019-03-29
0SHGFAL8WZUvpWb5iLPp6E	Slide Away	157	2019-08-16
0syM7OUAhV7S6XmOa4nLUZ	Ivy To Roses (Mixtape)	141	2019-01-18
0tKX7BLXiiRgXUKYdJzjEz	A Love Letter To You 4	242	2019-11-22
0tzusAckn6CYqaCBRJHiAh	Living Facts	21	2018-06-03
0Uv83rRhY5QvHKkQoULRKk	Hozier	95	2014-07-20
0uyDZAeB7oa8CM6G9PjSOf	Tip Toe (feat. A Boogie Wit da Hoodie)	202	2019-11-25
0UywfDKYlyiu1b38DRrzYD	Dance Monkey (Stripped Back) / Dance Monkey	237	2019-10-17
0wb2DaHDhLUUS5RRFa26U9	Death (feat. DaBaby)	242	2019-11-12
0xbuJLlb5afBcmCpdOaszR	Summer Days (feat. Macklemore & Patrick Stump of Fall Out Boy)	152	2019-04-25
0xzScN8P3hQAz3BT3YYX5w	Shawn Mendes (Deluxe)	215	2019-06-19
0Y59j5oCvwTM2aNyPb6YpJ	All Around The World (La La La)	190	2019-04-05
0yd01cU78rnlFXq6vRxPSR	Taste (feat. Offset)	244	2018-05-16
0YZLXTaHLcgl5UdtKDiUXD	Be Alright	58	2018-06-29
0z0z4DcXhHiobX5ZKAw8Qn	STOKELEY	218	2018-11-30
0ZHyvPke0EcVt6rYA8Ins3	Taki Taki (with Selena Gomez, Ozuna & Cardi B)	65	2018-09-28
0ZI6Q1QJSYdeEQPvKzX1XR	Make It Right (feat. Lauv)	36	2019-10-18
0zzrCTzvL4ZmR42xF46Afm	Without Me	92	2018-10-04
10v912xgTZbjAtYfyKWJCS	Highway to Hell	8	1979-07-27
12jwb6dkXYHWYg2YXvNCuA	Velitas	56	2019-07-12
13yMsBNa2femeWzhcDOqFw	i'm so tired...	127	2019-01-24
155yGQqPxsYkhV7zQyL95t	Que Tire Pa Lante	52	2019-10-18
15Id9Jrqab8IwHFirdrrLp	MUDBOY	216	2018-10-05
16mjtcKPxpQ4ajFHmJ0hJC	brent	104	2019-05-03
17FBoXK1NU2rvJBbzdzw0r	FUTURE	84	2017-06-30
17jzAujoXwIF60ojew1yHU	O Embaixador in Cariri (Ao Vivo)	89	2019-12-05
1ATL5GLyefJaxhQzSPVrLX	Scorpion	70	2018-06-29
1AvXa8xFEXtR3hb4bgihIK	MAP OF THE SOUL : PERSONA	36	2019-04-12
1bCBZ8LedqwVYOLDLrRbbY	True 2 Myself	134	2019-10-11
1bcvtuHyO79DNAOOhHEkEm	On My Way	10	2019-03-21
1BfLzaTFI5qKsAAk0Ae6aV	Indigo	44	2019-06-28
1BmxOYHjQv1dKZRr13YRZM	FRIENDS	151	2018-02-09
1bnHPO4dKK7IjvgrtVBcQh	So Much Fun	253	2019-08-16
1C2h7mLntPSeVYciMRTF4a	Thriller 25 Super Deluxe Edition	156	1982-11-30
1c79SozES9Eb3Lzf9KVaIa	In My Mind	72	2018-06-08
1CwXS6MAz8Wo7K4TzW9iuR	Save Me, San Francisco (Golden Gate Edition)	239	2010-12-01
1CYQlkKE5Q0khU6eMwVAVt	Intimo	164	2019-11-01
1Czfd5tEby3DbdYNdqzrCa	Falling	241	2018-10-05
1Db95k6t4rCPHSmdfsTeDl	Qué Pena	145	2019-09-27
1DNx0H5ZX1ax3yyRwtgT4S	Don't Forget About Me, Demos	68	2018-10-16
1ER3B6zev5JEAaqhnyyfbf	Hunting High and Low	5	1985-06-01
1faqBAWocW4ZOe0OFjudGw	The Academy	198	2019-10-11
1Flcx9eDuv7pTGM9nJBmGL	Fantasias	192	2019-08-29
1FOJ5IXGXe8dl0cXvCU6wK	In the Name of Love	152	2016-07-29
1FZKIm3JVDCxTchXDo5jOV	Harry Styles	93	2017-05-12
1gBDGPFz9v93dxE3fUU9eO	You should be sad	92	2020-01-10
1GbtB4zTqAsyfZEsm1RZfx	A Night At The Opera (2011 Remaster)	188	1975-11-21
1GYVNOzwhx1nMcIJDogSNp	Death Race For Love	113	2019-03-08
1HiN2YXZcc3EjmVZ4WjfBk	Everybody	138	2017-05-05
1I6FpscJIfwf4T56VxGVsB	We Love You Tecca	133	2019-08-30
1ID5rMIT1C61W2OLQ3rctp	UP THE SMOKE (with Offset)	220	2019-11-08
1J2BrRxtQjVUa7X9Ne99xD	If I Can't Have You	215	2019-05-03
1jAxVdQ2FFtbHu6kLNM0au	No Idea	69	2019-05-29
1jToVugwBEzcak8gJNZG2f	GINGER	33	2019-08-23
1k1HuvFs562Z3CCiSYhtc1	Good as Hell (feat. Ariana Grande) [Remix]	137	2019-10-25
1KOmHyNLuOe5YrPhD3Juuf	Perception	162	2017-10-06
1Li4rADxSxjT2g4xqUcMYh	Red Pill Blues (Deluxe)	150	2018-06-15
1m3mf7xkXIwssVriaaTjOS	AVĪCI (01)	23	2017-08-10
1MF23oT6lg5q47LnZ91UPy	Lonely	63	2019-09-27
1MFxXAGWNIuz0X1hS9VRiS	Feelings	127	2019-09-19
1MI6gNg0plcEOgs8aezsjH	Tell Me You Love Me (Deluxe)	59	2017-09-29
1MmVkhiwTH0BkNOU3nw5d3	Hot Pink	67	2019-11-07
1NAmidJlEaVgA3MpcPFYGq	Lover	226	2019-08-23
1ne2D0NxoGyZd31gAM4HNd	Illuminate	215	2017-04-20
1NsTSXjVNE7XmZ8PmyW0wl	KIRK	50	2019-09-27
1nzUj7VkiaytMmf2KrhK2L	AI YoungBoy 2	254	2019-10-11
1otwHKoQ5KPaiekpYk4tWh	Con Calma	52	2019-01-24
1PTTAq0OxggVgqP5WTYWDh	China	16	2019-07-19
1q7a5wZeti0neU2jDn8Dz3	Solo (feat. Demi Lovato)	45	2018-05-17
1qgJNWnPIeK9rx7hF8JCPK	Over It	221	2019-10-04
1qSOaTvsCOyFJya3v1UzkP	Lose Control	154	2019-10-11
1RVXVo1puacM8aQ6hgQahi	Providence	94	2016-02-05
1s9tU91VJt4sU5owi29GD3	True	23	2013-01-01
1Sf8GsXG32t0jNrX11xqWx	JACKBOYS	240	2019-12-27
1SN6N3fNkZk5oXQ9X46QZ3	Yummy	114	2020-01-03
1tFnP9PwIMeMIuj92mfswZ	Calma (Remix)	181	2018-10-05
1U1uqmoe8hdbqZWRqd23li	Loyal (feat. Drake)	180	2019-11-22
1Uf67JAtkVWfdydzFFqNF2	Happiness Begins	109	2019-06-07
1uyf3l2d4XYwiEqAb7t7fX	Doo-Wops & Hooligans	34	2010-10-05
1V9oE8bVilClrk5naqyyvL	Dancing With A Stranger (with Normani)	208	2019-01-11
1V9QpD8kjA2iHCElhFGvlo	Famouz	105	2019-05-24
1xn54DMo2qIqBuMqHtUsFd	x (Deluxe Edition)	74	2014-06-21
1xwUFsb21qbGugy09vdd7O	Oye	236	2019-10-11
1y0pdsLO6cixGzAv7Sf8rf	Sigues Con El	61	2019-12-13
20lOt6G8MHv8ZO7ViOmiP7	Native	176	2013-01-01
24jAbLMFzCTlIv3kQ94HwK	So Much Fun (Deluxe)	253	2019-12-20
26ztFK3E69j5THJQdyxC5w	Die A Legend	185	2019-06-07
2801cwQRE2bAQ6pKTrI13w	105 F Remix	121	2019-09-12
28561uZztshyZSVG6ElL62	El Favor (with Nicky Jam & Sech, feat. Farruko, Zion & Lunay)	61	2019-08-30
29FoTD5vBY3Fq1QWhbl3FM	Hate Me (with Juice WRLD)	76	2019-06-26
2Auw0pTT6EcQdvHNimhLQI	V	150	2015-05-15
2bVVESepVYULITlO6mtmoy	TALKING IS HARD (Expanded Edition)	246	2014-12-02
2bw00gRKNKbTFOqCkohbSh	Silence	151	2017-08-11
2cWBwpqMsDJC1ZUwz813lo	The Eminem Show	78	2002-05-26
2D0Hi3Jj6RFnpWDcSa0Otu	Youngblood (Deluxe)	3	2018-06-15
2ei2X6ghPnw7YRwQtAH075	Honky Chateau	77	1972-05-19
2epUYHJteejHG4trbc8drd	Que Calor (feat. J Balvin & El Alfa)	144	2019-09-11
2fYhqwDWXjbpjaIJPEfKFw	thank u, next	20	2019-02-08
2iPZkrN305Ow3wO0LL90Cg	VALENTINO	2	2019-01-25
2J2f6vGACFrRghO1Ki74BE	Dancin (feat. Luvli) [Krono Remix]	7	2014-11-07
2JRundp5dldujo6pVchZco	Cuerpo en Venta	170	2019-08-09
2m9Vuc9Q19qhSm6RQmBgsR	Soltera (Remix)	139	2019-05-10
2MFS6WG6jnPAgvJpV3PehR	Carte Blanche	65	2019-07-25
2njbaonul4fuGOFmPchUgU	Baila Baila Baila (Remix) [feat. Farruko, Anuel Aa]	177	2019-04-25
2ODvWsOgouMbaA5xf0RkJe	Starboy	234	2016-11-25
2pJXQvY0YeDvVJ9gMU9G7j	The Kids Are Coming	237	2019-08-29
2pSH41L4EXqhGHyTjM2dA2	Up All Night	122	2019-11-14
2Q9oTK48eb85waX1fFJsvj	The Truth About Love	178	2012-09-18
2Qxc2NJ7yPKVFRWi3llRr2	Suncity	122	2018-10-18
2r6BEK0wzXbL8JHyCkeJkG	Motivation	171	2019-08-16
2s2XNO2C38JP3NVOp8zkm4	3 Batidas (Ao Vivo)	87	2019-08-16
2S6p0g6YzG3609Ty45i5Cq	Si Te Vas	211	2019-09-26
2sBB17RXTamvj7Ncps15AK	lovely (with Khalid)	30	2018-04-19
2SByipSK8eZ2pasaIwwzhf	Don't Let Me Down	229	2016-02-05
2T0NPRcdhIt71ifDWm328R	God Is A Dancer (with Mabel)	235	2019-09-20
2t2aNgqXTXuCh9fqT05g9U	No Me Conoce (Remix)	105	2019-05-17
2TBJtc64Y76xWs98Mtko07	BEST ON EARTH (feat. BIA)	204	2019-10-18
2tGRWs8mrUVyjgbMIQpWQN	Somebody	98	2019-10-11
2Ti79nwTsont5ZHfdxIzAm	?	250	2018-03-16
2tpWgbBdzjkaJVJzR4T8y1	Promises (with Sam Smith)	38	2018-08-17
2uDTi1PlpSpvAv7IRAoAEU	HIGHEST IN THE ROOM	240	2019-10-04
2uEf3r9i2bnxwJQsxQ0xQ7	Nevermind (Deluxe Edition)	167	1991-09-26
2UfvnX1YYeC2cExMQTMbXC	Lover (Remix) [feat. Shawn Mendes]	226	2019-11-13
2v2CUuzRvsBNb4c5Rj8nqi	Fresa	236	2019-09-06
2v9rQe4F8fVSh5v8bAq0jF	Scared to Be Lonely	152	2017-01-27
2vD3zSQr8hNlg0obNel4TE	Camila	39	2018-01-12
2widuo17g5CEC66IbzveRu	Hotel California (2013 Remaster)	73	1976-12-08
2wiPF3m0ylst0JSk1IvZL8	Divinely Uninspired To A Hellish Extent (Extended Edition)	128	2019-11-22
2WrNHOba5u6P9S9xEboaUy	Perfect Ten	158	2019-06-28
2XvFk3xrG7dV6GhqcJSQHX	So Am I	22	2019-03-07
2Y9IRtehByVkegoD7TcLfi	Californication (Deluxe Edition)	193	1999-06-08
2YQptVBjUJeIOBavD1AyXg	July	169	2019-07-31
2yuTRGIackbcReLUXOYBqU	Jazz (2011 Remaster)	188	1978-11-10
2yXnY2NiaZk9QiJJittS81	Drip Harder	129	2018-10-05
2ZaX1FdZCwchXl1QZiD4O4	Señorita	215	2019-06-21
2zFE4Ze2DjkeZBMbbT4Mgj	Surtada (Remix Brega Funk)	51	2019-09-25
2ZfHkwHuoAZrlz7RMj0PDz	Blinding Lights	234	2019-11-29
2ZoLcA4NMOjJGFKeANgNpF	Writing on the Wall (feat. Post Malone & Cardi B)	83	2019-09-27
30Perjew8HyGkdSmqguYyg	Blood Sugar Sex Magik (Deluxe Edition)	193	1991-09-24
31q47gQszFt0CddSyMksgO	Willy And The Poor Boys	49	1969-11-02
33pt9HBdGlAbRGBHQgsZsU	Evolve	97	2017-06-23
33TJ52PuwenGmysJrwMGCe	Come Over When You're Sober, Pt. 1	131	2017-08-15
35s58BRTGAEWztPo9WqCIs	Spider-Man: Into the Spider-Verse (Soundtrack From & Inspired by the Motion Picture)	187	2018-12-14
37CqAwxTungNxKpIK5vSgE	hot girl bummer	31	2019-08-23
3844bY26oeSkqd06th4EYp	Yo x Ti, Tu x Mi	203	2019-08-15
393l0NdTr8Rv0hybf4FTxy	Woah	129	2019-11-08
3cQO7jp5S9qLBoIVtbkSM1	Blurryface	243	2015-05-15
3CrpfLi8E2VWFf7ZLjgpNt	Loco Contigo (with J. Balvin & Ozuna feat. Nicky Jam, Natti Natasha, Darell & Sech) [REMIX]	65	2019-12-27
3Cse4lihKX7ww99QnZGQAh	Ayy Macarena	244	2019-11-13
3dwf8z3LfHFTlAHiyrcGzb	B11 (feat. Myke Towers)	205	2019-09-18
3E12WU80fDMyu7GyIAx7wJ	Beautiful People (feat. Khalid)	74	2019-06-28
3Fcqa5sb0vVYEEDHzkiOA1	Trigger	144	2019-10-24
3fxzSn0ObgCjLadyR53ohN	Vete	26	2019-11-21
3ggBBGRhkDVAu7pQRXRPXO	Let Me Go (with Alesso, Florida Georgia Line & watt)	91	2017-09-08
3GqSdhWjmMypMwPLtzoFYs	Roses (Imanbek Remix)	206	2019-10-09
3hiJmThCss4ugTPzvgUnT1	Otro Trago (Remix)	211	2019-07-26
3HNnxK7NgLXbDoxRZxNWiR	Kamikaze	78	2018-08-31
3I9Z1nDCL4E0cP62flcbI5	Appetite For Destruction	88	1987-01-01
3J8W9AOjQhnBLCX33m3atT	Heathens	243	2016-06-16
3JfSxDfmwS5OeHPwLSkrfr	Origins (Deluxe)	97	2018-11-09
3JSWZWeTHF4HDGt5Eozdy7	Good Girl Gone Bad: Reloaded	199	2008-06-02
3KjXg0MDej2pG9fv6I22lT	Never Really Over	118	2019-05-31
3KrYBAbfxlssMirZLs6HzZ	Nice To Meet Ya	163	2019-10-04
3L0H4RjVXpEkwfDgi3XOdf	us	85	2016-03-25
3MATDdrpHmQCmuOcozZjDa	TESTING	6	2018-05-25
3mMWlBGocBwsS1Q0o9wvlc	Where the Light Is	222	2019-01-06
3myPwaMYjdwhtq0nFgeG6W	Songs From The Big Chair (Super Deluxe Edition)	227	1985-02-25
3N7eWDCvfWv34xWNohdHjO	Back To You (From 13 Reasons Why – Season 2 Soundtrack)	212	2018-05-10
3nR9B40hYLKLcR0Eph3Goc	Memories	150	2019-09-20
3oFteG1YXJg2LS6R7Ge2yB	Mind Is A Prison	11	2019-12-12
3oIFxDIo2fwuk4lwCmFZCx	No.6 Collaborations Project	74	2019-07-12
3r5hf3Cj3EMh1C2saQ8jyt	Hoodie SZN	4	2018-12-21
3RJvPSUpz8E4b6SjectOPu	Roller	17	2019-08-23
3rVtm00UfbuzWOewdm4iYM	‘The ReVe Festival’ Finale	194	2019-12-23
3RWeME5ryDw9wxO99OoDgP	Bellaquita	53	2019-09-06
3T4tUhGYeRNVUGevb0wThu	÷ (Deluxe)	74	2017-03-03
3t6Z2qoBVCS4NHNI25XECH	Bandit (with YoungBoy Never Broke Again)	113	2019-10-04
3tBkjgxDqAwss76O1YHsSY	Lose You To Love Me	212	2019-10-23
3TgOrQ3p23Af8zSsxK8fdX	Sueños	115	2019-04-19
3tx8gQqWbGwqIGZHqDNrGe	Sweetener	20	2018-08-17
3UMxQfDm6XBUaPf9zuYCzZ	Start Wit Me (feat. Gunna)	202	2019-10-25
3vLaOYCNCzngDf8QdBg2V1	Uptown Special	149	2015-01-12
3Vsbl0diFGw8HNSjG8ue9m	Romance	39	2019-12-06
3wBabo4pmzsYjALMSKY7Iq	Illuminate (Deluxe)	215	2017-04-20
3wpdeV1FZfiEnelZSfAFp4	Good Thing (with Kehlani)	256	2019-09-27
3Wv4X8OA65pGpFzBkuUgAh	DNCE	66	2016-11-18
3xgS4rfthlsvhW7J2WLiiR	Liar	39	2019-09-04
3XzSOIE6zGLliuqsVGLmUc	MIDDLE CHILD	100	2019-01-23
3Y00aLNDKDq9rXR3cIcbDo	Easy (Remix)	105	2019-11-19
3y4AaloFccKNLQcZNS9L8c	Heavy Is The Head	219	2019-12-13
3YD1qyD9KPFzzTK1UC1Gvo	Used To Love (with Dean Lewis)	152	2019-10-31
3YIUNL7qFE8NP3X3zaYSND	11:11	145	2019-05-17
3YPFaTR7WMi1Hd4NVKdCJx	Rare	212	2020-01-10
3zVB99XMdbP9HTVNg0GJwV	boyfriend	20	2019-08-02
40GMAhriYJRO1rsY4YdrZb	Views	70	2016-05-06
41GuZcammIkupMPKH2OJ6I	ASTROWORLD	240	2018-08-03
41S9bfzXTSGK4HU2mp5qXH	Magnets EP	207	2019-05-24
429B3se6xtZuvblNnS2iy7	Electricity (with Dua Lipa)	217	2018-09-06
42wLKnuGyBLGWwH89lnimL	Te Boté (Remix)	166	2018-04-13
42WVQWuf1teDysXiOupIZt	Birds In The Trap Sing McKnight	240	2016-09-16
43wpzak9OmQfrjyksuGwp0	Escape	111	1981
464FQ8gr0oKlQ1a0TCK4Yj	Amanece	16	2018-12-14
46xbsFOp9g1WqTidQEs7YT	Épico	139	2019-10-25
47BiFcV59TQi2s9SkBo2pb	Recovery	78	2010-06-18
47FalEKu0of8GExDtZBkxT	Shelby	132	2019-03-01
48fPbdnqQWvarAivudCrqz	Piensan	159	2019-09-13
49K82qcZN4u109e6Zw8io1	Sanguine Paradise	135	2019-04-09
4aoWQU2gSUjl4AZeCPSo1b	~how i'm feeling~	127	2019-11-14
4bLCVUEB9YWKEeaJm8FfqQ	Close To Me (feat. Swae Lee)	76	2018-10-24
4BQVnx1yJrDa1tcky9D9N6	Outnumbered	60	2019-06-13
4bxHLppgdmaYJk0yfdcP0l	Con Altura	203	2019-03-28
4c2p3TdN7NcQfCXyueCNnC	Jungle Rules	83	2017-07-14
4CA8GvVF7swZafg0zYh9qq	Good as Hell	137	2016-03-09
4Carzsnpd6yvuHZ49I0oz8	"Awaken, My Love!"	43	2016-12-02
4CCaoRnCugI6RsHHBKiMLs	Good News	142	2020-01-09
4cKsqQlyK9pqUTMjI4WnM0	Oye Pablo	55	2019-08-29
4d2oTHRFwGifGFgve7zSGC	Be Honest (feat. Burna Boy)	110	2019-08-16
4D6BtgzCwuJx9omikqA8Rg	Loving Is Easy	197	2017-10-11
4E7bV0pzG0LciBSWTszra6	X&Y	46	2005-06-07
4eLPsYPBmXABThSJ821sqY	DAMN.	119	2017-04-14
4g1ZRSobMefqF6nelkgibi	Hollywood's Bleeding	187	2019-09-06
4Gfnly5CzMJQqkUFfoHaP3	Meteora	136	2003-03-24
4gr1eiDfKDgoXT9HX2EdNT	Juicy	67	2019-08-15
4i3rAwPw7Ln2YrKDusaWyT	everything i wanted	30	2019-11-13
4IRiXE5NROxknUSAUSjMoO	7 EP	130	2019-06-21
4JPguzRps3kuWDD5GS6oXr	Memories...Do Not Open	229	2017-04-07
4KdtEKjY3Gi0mKiSdy96ML	Invasion of Privacy	41	2018-04-06
4lmKt00bHLEeqJRTlNOxXS	Si Supieras	52	2019-06-28
4lvPNGpbLW4MIk3OT4OG3w	KEIN SCHLAF	165	2019-12-05
4M07HWIlZr7zoXoxDHR5mz	Frozen 2 (Original Motion Picture Soundtrack/Deluxe Edition)	179	2019-11-15
4O04QLiB0lGHQlygXxiMuX	Look At Her Now	212	2019-10-24
4OTAx9un4e6NfoHuVRiOrC	Love In The Future (Expanded Edition)	106	2013-08-30
4ow6xJwn49gpWz7iHpOzWY	10,000 Hours (with Justin Bieber)	54	2019-10-04
4PgleR09JVnm3zY1fW3XBA	24K Magic	34	2016-11-17
4PwXTHenZZx7ebgsnTM65K	Giant (with Rag'n'Bone Man)	38	2019-01-11
4QAC6FquY8D0RXom13iE5J	One Thing Right	151	2019-06-21
4qecT0ZJrf35thz2WaEm6P	Indeciso	196	2019-08-23
4QUNWTw2FsIz722xjUjFJw	Issa Album	1	2017-09-23
4sLtOBOzn4s3GDUv3c5oJD	A Star Is Born Soundtrack	126	2018-10-05
4TOkZvtqNpg5UHyGxCn0mS	Expectations	28	2018-06-22
4uTOUYhLrGRKkfxfPKTkuy	Futsal Shuffle 2020	135	2019-12-12
4vu7F6h90Br1ZtYYaqfITy	The Razors Edge	8	1990-09-24
4vUClKTFaDWnsHE8rK52GY	All That We Needed	184	2005-01-01
4VzzEviJGYUtAeSsJlI9QB	Woodstock	186	2017-06-16
4WlC4FXhonJhNTXCQPGP3r	Lalala	251	2019-06-28
4wquJImu8RtyEuDtIAsfcE	Higher Love	125	2019-06-28
4x1U4pmSekLejbWCRI0SES	Maniac	47	2019-10-25
4xkM0BwLM9H2IUcbYzpcBI	I Love You.	232	2013-04-19
4YEes0AZtUChqtLBwaQLzh	Heartless (feat. Morgan Wallen)	63	2019-08-16
4YQQS1DM9JskregbISv1dq	Combatchy (feat. MC Rebecca)	13	2019-11-20
4zbMionGv9W33xjQfoMyuo	Los Campeones del Pueblo "The Big Leagues"	248	2018-12-14
4zOhjJfe0dwqsNdDYk622E	Ride It	195	2019-07-26
51pSyGziPFv8ajzF7ilUAr	Best Friend	197	2017-01-25
52JymrguPgkmmwLaWIusst	Come Over When You're Sober, Pt. 2	131	2018-11-09
52u4anZbHd6UInnmHRFzba	Please Excuse Me For Being Antisocial	202	2019-12-06
54tInqO543zy0Y5F2VsUQI	Amala	67	2018-03-30
54V1ljNtyzAm053oJqi0SH	Second Helping	140	1974-04-15
5658aM19fA3JVwTK6eQX70	Divinely Uninspired To A Hellish Extent	128	2019-05-17
58alCatewkjNm9IM1Ucj67	The Game (2011 Remaster)	188	1980-06-27
58NQUIHQRJnXyBUeGtG8KG	Ella Quiere Beber (Remix)	16	2018-11-02
58ufpQsJ1DS5kq4hhzQDiI	Unorthodox Jukebox	34	2012-12-07
5AXNN75OmMjFrwst6ExNPx	Sixteen	76	2019-04-12
5dXeJdc2hib8JB3Vqon2zB	Bellaquita (Remix)	53	2019-11-22
5EEkfRgfYHiFu0lGur6Z6M	COSMIC	27	2018-04-12
5fEgDYFPUcvQy21TYoLEZ0	New Light	107	2018-05-10
5FXIqS1XqbpfOKNoi5VUwS	See You Again (feat. Charlie Puth)	249	2015
5gQZvWM1o8NkQndueJtZcP	Wolves	212	2017-10-25
5GugLrmYMl5VRoe2zNgLGp	No Need To Argue	230	1994-10-03
5jNDWA19BJbE24x1UUJGRY	Sweet Dreams (Are Made Of This)	79	1983-01-21
5l5gR4rh26QI3fijGFTDrp	Dusk Till Dawn (Radio Edit)	255	2017-09-07
5LiT3OZKgkgEeInFxUEObJ	La Boca (Remix)	153	2019-07-17
5lUuEK82w5OlO2wo2DOWBQ	Skifahren (feat. Joshi Mizu)	231	2019-11-15
5LZSpPoBVBsh6kRSEKfPQ8	Get You The Moon (feat. Snøw)	123	2018-10-08
5mcUbpuVL0i5q4cECQ6cV4	Blanco	99	2019-11-15
5n1GSzC1Reao29ScnpLYqp	Dying to Live	124	2018-12-14
5Nux7ozBJ5KJ02QYWwrneR	I Don't Care (with Justin Bieber)	74	2019-05-10
5p3gSxNiXeYlPlztVAUjB2	All I Want (From "High School Musical: The Musical: The Series")	173	2019-11-27
5pCAWYym13GcQN8CXEb89m	Some Say	161	2019-09-06
5ppnlEoj4HdRRdRihnY3jU	Oral Fixation, Vol. 2 (Expanded Edition)	214	2005-11-28
5QqqBZmdQmY1MvlnpBkagB	Trampoline (with ZAYN)	213	2019-09-26
5s0rmjP8XOPhP6HhqOhuyC	Stoney (Deluxe)	187	2016-12-09
5SL9nXZYZZl68bHwaM8uLa	Adore You	93	2019-12-06
5tdGgaiW18D6bjHFLhtblL	Camelot	168	2019-09-13
5uCEoLCj3ZZZ1EtzQdQWVl	Life Is Good (feat. Drake)	84	2020-01-10
5UHC2JN3ck4XPYPjngia2G	nothings ever good enough	96	2019-05-22
5utJfkRQ5yEIat3AIK6WIL	Fire On Fire (From "Watership Down")	208	2018-12-21
5VdyJkLe3yvOs0l4xXbWp0	17	250	2017-08-25
5VVkOFYXmjtYd6hoasaWKQ	Coronao Now	75	2019-11-07
5W9OT0a5iZlBr83a9WMKFY	Synchronicity (Remastered 2003)	233	1983-06-17
5wi0oKiF99ZVACf6oTTsp2	Let Me Know (I Wonder Why Freestyle)	113	2019-12-07
5xq6RMHNIBA73qld03dR6V	Melly vs. Melvin	252	2019-11-22
5zClcGCSWj926AMjvBNSLc	Songs About Jane: 10th Anniversary Edition	150	2002
5zi7WsKlIiUXv09tbGLKsE	IGOR	245	2019-05-17
60sI3iRfHfu7YpcTpZ29W1	fuck, i'm lonely (with Anne-Marie) (from “13 Reasons Why: Season 3”)	127	2019-08-02
61ulfFSmmxMhc2wCdmdMkN	Merry Christmas	148	1994-11-01
62U7xIHcID94o20Of5ea4D	Toto IV	238	1982-04-08
63Kr9mdWxT7mB2AKgf4rCa	YOU	12	2019-11-08
63MKT9hwmiMFFdFp5SdB1p	Under The Mistletoe (Deluxe Edition)	114	2011-01-01
6400dnyeDyD2mIFHfkwHXN	Pablo Honey	191	1993-02-22
659e2eKbsMH0vYCs5qgFmy	Watermelon Sugar	93	2019-11-17
65Pp2tO1Ul66KcCmmkRGWZ	Hola (Remix)	53	2019-11-01
669dgT2kmrAMrrPaEEHWyE	Graduation (with Juice WRLD)	29	2019-08-30
66o9dDjDduf6jpvZKzAXm4	Eleven	122	2020-01-09
66QwiCFDLtRbrZ5Vs9wlL9	Graveyard	92	2019-09-13
68hy2xnNgeo0dO0YOm4Th7	Baila Conmigo (feat. Kelly Ruiz)	57	2018-12-28
6a6Dy4LaFvh43Ed5lomDEd	Torn	22	2019-08-19
6Ad1E9vl75ZB3Ir87zwXIJ	TIM	23	2019-06-06
6ApYSpXF8GxZAgBTHDzYge	Pray for the Wicked	179	2018-06-22
6b3LhhX9Lt2861Dsh3ZCC2	Slide	90	2019-09-27
6deiaArbeoqp1xPEGdEKp1	By the Way (Deluxe Edition)	193	2002-07-09
6Ei5WWek37m1x9AjpSXTcJ	More Than You Know	24	2017-07-28
6EobpC5SDFy5DF50dWNVGF	RITMO (Bad Boys For Life)	228	2019-10-12
6eZdwrhB97A3EYx9QppGfl	T R A P S O U L	35	2015-10-02
6fpLLJsDSSAlToEDW2jv4F	Animal (Expanded Edition)	120	2010-01-01
6Fr2rQkZ383FcMqFyT7yPr	Purpose (Deluxe)	114	2015-11-13
6gPZmYBSipug1asf4zu9jh	What I Like About You (feat. Theresa Rex)	108	2019-03-22
6hCR3zQtRH0IgookOYt771	Beautiful (feat. Camila Cabello)	27	2018-08-02
6HJDrXs0hpebaRFKA1sF90	ROXANNE	21	2019-10-10
6hPkbAV3ZXpGZBGUvL6jVM	Hybrid Theory (Bonus Edition)	136	2000-10-24
6JdZip7wqJcGYtYDnzpp8T	Teeth	3	2019-08-21
6jKZplJpy21R5lHaYHHjmZ	Narrated For You	11	2018-11-16
6jWde94ln40epKIQCd8XUh	Toxicity	223	2001-09-04
6kf46HbnYCZzP6rjvQHYzg	American Teen	122	2017-04-27
6kMwu0LljP1LlrzpQPlvvQ	SENTADÃO	182	2019-11-22
6KPJTxKFCpuzrwyJGcURqK	Salt	22	2019-12-12
6KT8x5oqZJl9CcnM66hddo	Free Spirit	122	2019-04-05
6KuvJ7yluj7KuMDm9ydXM1	Famous Hoes	168	2019-12-10
6lMlX68jJrx67hiCqdiDvW	bad guy (with Justin Bieber)	30	2019-07-11
6mUdeDZCsExyJLMdAfDuwh	Back In Black	8	1980-07-25
6nAjd2MlBY1f1mNu6BsWLO	Happy Now	125	2018-10-26
6NHS3hV16MZyfcp0nSHdrd	Here With Me	151	2019-03-08
6NSiAkMa61CjJI9AHqOhuZ	Pa' Olvidarme De Ella	183	2019-09-06
6OGzmhzHcjf0uN9j7dYvZH	Chanel	82	2017-03-10
6owzcG80ifZRDApCpzJYK1	Secreto	16	2019-01-15
6P9PZjWXoCRF5b66BafPKY	Future & Juice WRLD Present... WRLD ON DRUGS	84	2018-10-19
6p9Y1K9yu3ojyS8fBJXUnp	The London	253	2019-05-23
6pEhppkTzrKKGkQw4fNqOD	Alocao (With Bad Gyal)	174	2019-10-24
6reTSIf5MoBco62rk8T7Q1	Hot Space (2011 Remaster)	188	1982-05-03
6sTdi5hrN3uFhARaqbikjG	Muévelo	164	2020-01-08
6stPNzjz40FWTiwlOR98Lp	Climaxxx	53	2019-05-10
6t5D6LEgHxqUVOxJItkzfb	All Your Fault: Pt. 2	28	2017-08-11
6t7956yu5zYf5A829XRiHC	The Marshall Mathers LP	78	2000-05-23
6tkjU4Umpo79wwkgPMV3nZ	Goodbye & Good Riddance	113	2018-12-10
6trNtQUgC8cgbWcqoMYkOR	beerbongs & bentleys	187	2018-04-27
6UYZEYjpN1DYRW0kqFy9ZE	Championships	155	2018-11-30
6Vip5A5NmEazvKuxj6GLYf	Only Human (Deluxe)	37	2018-03-09
6xu5asYeoMIT5Sa5b1P13q	Tutu	40	2019-08-09
6yEuIwTQpciH1qtj7mP5GK	Out Of Time (25th Anniversary Edition)	189	1991-03-12
6ylFfzx32ICw4L1A7YWNLN	OASIS	99	2019-06-28
6zardvJflEyoRedCUCBUw9	+	9	2019-12-17
6ZG5lRT77aJ3btmArcykra	Parachutes	46	2000-07-10
700MviIgFKNTldTXmOAFOr	Alone, Pt. II	10	2019-12-27
71BrrQxz8mZAneNSDE9Lov	Panini	130	2019-09-13
71uU1JDWZ61OMDtW8h1Kp8	DJ No Pare (feat. Zion, Dalex, Lenny Tavárez) [Remix]	115	2019-09-06
733e1ZfktLSwj96X5rsMeE	Luv Is Rage 2	135	2017-08-25
75iQSBSaztFIAun9qLLCnb	Girls Like You (feat. Cardi B)	150	2018-05-30
75Y4sJ1vwZfEivbsKPzAx6	Si Se da Remix	159	2019-08-02
76FXHQhTuT4QMIxfL09gX8	The Heist	143	2012-10-09
76XsfdI0kGODDdhHAJKZi3	Verte Ir	64	2019-03-28
77X9PDPmSWyeOrbq5Md56H	COLT	209	2019-12-05
78bpIziExqiI9qztvNFlQu	AM	19	2013-09-09
78EicdHZr5XBWD7llEZ1Jh	Happier	151	2018-08-17
79dL7FLiJFOO0EoehUHQBv	Currents	225	2015-07-17
7baaCf70tVcUBL2bbkuXjo	How Do You Sleep?	208	2019-07-19
7BrlhEO8dHiNmU8A1Ep9RZ	If The World Was Ending (feat. Julia Michaels)	112	2019-10-17
7CdLU3GgPy1PH5FVsrPlyA	Sweet but Psycho	22	2018-08-17
7cekEHNPgpKwVd9kJE9G8F	223's (feat. 9lokknine)	252	2019-08-09
7CucpzwxAZ6kHmctI9eo4X	reality in BLACK	146	2019-11-14
7Cw4LObzgnVqSlkuIyywtI	DIE FOR MY BITCH	25	2019-07-19
7EvmUXEmIRkFwd2nPVmFiP	How I Move (feat. Lil Baby)	80	2019-11-15
7f6r6ijWtMJ0QYydwuCYvH	Nibiru	177	2019-11-29
7fRrTyKvE4Skh93v97gtcU	dont smile at me	30	2017-12-22
7FTzcNdsKhMe53orWXsai8	Instagram	62	2019-07-05
7FzVARL5hF1iZPpOTCyMpp	Nimmerland	200	2019-12-06
7GEzhoTiqcPYkOprWQu581	One Kiss (with Dua Lipa)	38	2018-04-06
7hXWMVDn9SVV7zNYiQGvWO	Hot (Remix) [feat. Gunna and Travis Scott]	253	2019-11-01
7Kmmw7Z5D2UD5MVwdm10sT	Torches	81	2011-05-23
7KPtAktRGrVjy0QV3MXnZk	Sum 2 Prove	129	2020-01-10
7L5mva8yC5ctamvs4XzgpR	Yellow Hearts	15	2019-06-18
7l6fTSFvlumnPFpOSrbnDV	I Like Me Better	127	2017-05-19
7lPoGKpCGgdKFAxpudhAH5	Speak Your Mind (Deluxe)	14	2018-04-27
7mKevNHhVnZER3BLgI8O4F	Tusa	117	2019-11-07
7mtnp7B5yFt3D3PAznGzc8	Turn Me On (feat. Vula)	201	2019-09-13
7naY6j4wcgUxfHB98G79CW	I AM YOU	252	2018-08-03
7nEiwcUSwycvC77kZ9ub7c	The Middle	256	2018-01-23
7nqA49hzXJWPH4cnM8nk6x	Adicto (with Anuel AA & Ozuna)	224	2019-08-22
7oiJYvEJHsmYtrgviAVIBD	Back from the Edge	102	2016-10-28
7p1fX8aUySrBdx4WSYspOu	Midnight Memories (Deluxe)	175	2013-11-25
7pkLXlFdpQDfmHujT2AbBK	Eastside (with Halsey & Khalid)	29	2018-07-12
7viNUmZZ8ztn2UB4XB3jIL	2014 Forest Hills Drive	100	2014-12-09
7vRcickwa6GCfY1qKKe4lK	Heartless	234	2019-11-27
7xgzD7onYd1Pms93ZOtxxX	Immortal	1	2019-10-31
7xV2TzoaVc0ycW7fwBwAml	Fine Line	93	2019-12-13
7yf9ZJyHRbp8sHtpDKfPpt	Harder Than Ever	129	2018-05-18
7ynTaSXD9esXkgY0GG8UFd	Morado	99	2020-01-09
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artists (artist_id, name, country_of_origin, founded, is_group) FROM stdin;
1	21 Savage	United Kingdom	2013	0
2	24kGoldn	United States	2018	0
3	5 Seconds of Summer	Australia	2011	1
4	A Boogie Wit da Hoodie	United States	2015	0
6	A$AP Rocky	United States	2011	0
8	AC/DC	Australia	1973	1
7	Aaron Smith	United States	1990	0
9	Aitana	Spain	2017	0
10	Alan Walker	Norway	2012	0
11	Alec Benjamin	United States	2013	0
12	Ali Gatie	Canada	2016	0
13	Anitta	Brazil	2010	0
14	Anne-Marie	United Kingdom	2015	0
15	Ant Saunders	United States	2019	0
16	Anuel AA	Puerto Rico	2010	0
17	Apache 207	Germany	2018	0
18	Arcangel	Puerto Rico	2004	0
19	Arctic Monkeys	United Kingdom	2002	1
20	Ariana Grande	United States	2008	0
21	Arizona Zervas	United States	2016	0
22	Ava Max	United States	2016	0
23	Avicii	Sweden	2006	0
24	Axwell /\\ Ingrosso	Sweden	2014	1
33	BROCKHAMPTON	United States	2014	1
36	BTS	South Korea	2013	1
25	Baby Keem	United States	2014	0
26	Bad Bunny	Puerto Rico	2013	0
27	Bazzi	United States	2012	0
28	Bebe Rexha	United States	2013	0
30	Billie Eilish	United States	2015	0
32	Bon Jovi	United States	1983	1
34	Bruno Mars	United States	2004	0
35	Bryson Tiller	United States	2011	0
37	Calum Scott	United Kingdom	2015	0
38	Calvin Harris	United Kingdom	2002	0
39	Camila Cabello	Cuba	2012	0
40	Camilo	Colombia	2007	0
41	Cardi B	United States	2015	0
42	Charlie Puth	United States	2009	0
43	Childish Gambino	United States	2008	0
44	Chris Brown	United States	2002	0
45	Clean Bandit	United Kingdom	2008	1
46	Coldplay	United Kingdom	1996	1
47	Conan Gray	United States	2018	0
48	Coolio	United States	1987	0
49	Creedence Clearwater Revival	United States	1967	1
64	DJ Luian	Puerto Rico	2010	0
65	DJ Snake	France	2005	0
66	DNCE	United States	2015	1
50	DaBaby	United States	2014	0
52	Daddy Yankee	Puerto Rico	1992	0
51	Dadá Boladão	Brazil	2011	0
53	Dalex	Puerto Rico	2013	0
54	Dan + Shay	United States	2012	1
55	Danna Paola	Mexico	2000	0
56	Darell	Puerto Rico	2010	0
57	Dayvi	Colombia	2011	0
58	Dean Lewis	Australia	2016	0
59	Demi Lovato	United States	2008	0
60	Dermot Kennedy	Ireland	2015	0
61	Dimelo Flow	Panama	2004	0
62	Dimitri Vegas & Like Mike	Belgium	2007	1
63	Diplo	United States	2003	0
67	Doja Cat	United States	2013	0
177	Ozuna	Puerto Rico	2012	0
68	Dominic Fike	United States	2017	0
69	Don Toliver	United States	2017	0
70	Drake	Canada	2006	0
71	Dua Lipa	United Kingdom	2015	0
72	Dynoro	Lithuania	2013	0
73	Eagles	United States	1971	1
74	Ed Sheeran	United Kingdom	2004	0
75	El Alfa	Dominican Republic	2008	0
76	Ellie Goulding	United Kingdom	2009	0
77	Elton John	United Kingdom	1962	0
78	Eminem	United States	1988	0
79	Eurythmics	United Kingdom	1980	1
80	Flipp Dinero	United States	2016	0
81	Foster The People	United States	2009	1
82	Frank Ocean	United States	2009	0
83	French Montana	Morocco	2002	0
84	Future	United States	2010	0
86	Gorillaz	United Kingdom	1998	1
87	Guilherme & Benuto	Brazil	2019	1
88	Guns N' Roses	United States	1985	1
89	Gusttavo Lima	Brazil	2009	0
90	H.E.R.	United States	2016	0
91	Hailee Steinfeld	United States	2014	0
92	Halsey	United States	2012	0
93	Harry Styles	United Kingdom	2010	0
94	Hippie Sabotage	United States	2005	1
95	Hozier	Ireland	2013	0
97	Imagine Dragons	United States	2008	1
98	Internet Money	United States	2016	1
99	J Balvin	Colombia	2004	0
100	J. Cole	United States	2007	0
101	JACKBOYS	United States	2019	1
112	JP Saxe	Canada	2017	0
102	James Arthur	United Kingdom	2012	0
103	Jason Mraz	United States	1999	0
104	Jeremy Zucker	United States	2015	0
105	Jhay Cortez	Puerto Rico	2011	0
106	John Legend	United States	2000	0
107	John Mayer	United States	1998	0
108	Jonas Blue	United Kingdom	2014	0
109	Jonas Brothers	United States	2005	1
110	Jorja Smith	United Kingdom	2016	0
111	Journey	United States	1973	1
113	Juice WRLD	United States	2015	0
114	Justin Bieber	Canada	2008	0
115	Justin Quiles	Puerto Rico	2013	0
117	KAROL G	Colombia	2007	0
121	KEVVO	Puerto Rico	2019	0
116	Kanye West	United States	2001	0
118	Katy Perry	United States	2001	0
119	Kendrick Lamar	United States	2003	0
120	Kesha	United States	2005	0
122	Khalid	United States	2016	0
123	Kina	Italy	2011	0
124	Kodak Black	United States	2009	0
125	Kygo	Norway	2013	0
126	Lady Gaga	United States	2006	0
127	Lauv	United States	2014	0
128	Lewis Capaldi	United Kingdom	2017	0
129	Lil Baby	United States	2017	0
130	Lil Nas X	United States	2018	0
131	Lil Peep	United States	2013	0
132	Lil Skies	United States	2017	0
133	Lil Tecca	United States	2017	0
134	Lil Tjay	United States	2017	0
135	Lil Uzi Vert	United States	2014	0
136	Linkin Park	United States	1996	1
137	Lizzo	United States	2013	0
138	Logic	United States	2009	0
139	Lunay	Puerto Rico	2017	0
140	Lynyrd Skynyrd	United States	1964	1
154	MEDUZA	Italy	2018	1
141	Mabel	United Kingdom	2015	0
142	Mac Miller	United States	2007	0
143	Macklemore & Ryan Lewis	United States	2009	1
144	Major Lazer	United States	2008	1
145	Maluma	Colombia	2010	0
146	Mamamoo	South Korea	2014	1
147	Manuel Turizo	Colombia	2016	0
148	Mariah Carey	United States	1990	0
149	Mark Ronson	United Kingdom	2003	0
150	Maroon 5	United States	1994	1
151	Marshmello	United States	2015	0
152	Martin Garrix	Netherlands	2012	0
153	Mau y Ricky	Venezuela	2011	1
155	Meek Mill	United States	2006	0
156	Michael Jackson	United States	1964	0
157	Miley Cyrus	United States	2006	0
158	Mustard	United States	2009	0
159	Myke Towers	Puerto Rico	2012	0
162	NF	United States	2010	0
168	NLE Choppa	United States	2018	0
160	Natti Natasha	Dominican Republic	2012	0
161	Nea	Sweden	2019	0
163	Niall Horan	Ireland	2016	0
164	Nicky Jam	United States	1995	0
165	Nimo	Germany	2015	0
166	Nio Garcia	Puerto Rico	2015	0
167	Nirvana	United States	1987	1
169	Noah Cyrus	United States	2016	0
170	Noriel	Puerto Rico	2014	0
171	Normani	United States	2012	0
172	Offset	United States	2008	0
173	Olivia Rodrigo	United States	2021	0
174	Omar Montes	Spain	2015	0
175	One Direction	United Kingdom	2010	1
176	OneRepublic	United States	2002	1
178	P!nk	United States	2000	0
180	PARTYNEXTDOOR	Canada	2013	0
179	Panic! At The Disco	United States	2004	1
181	Pedro Capó	Puerto Rico	1999	0
182	Pedro Sampaio	Brazil	2017	0
183	Piso 21	Colombia	2007	1
184	Plain White T's	United States	1997	1
185	Polo G	United States	2018	0
186	Portugal. The Man	United States	2004	1
187	Post Malone	United States	2015	0
188	Queen	United Kingdom	1970	1
189	R.E.M.	United States	1980	1
190	R3HAB	Netherlands	2007	0
200	RIN	Germany	2012	0
203	ROSALÍA	Spain	2017	0
191	Radiohead	United Kingdom	1985	1
192	Rauw Alejandro	Puerto Rico	2017	0
193	Red Hot Chili Peppers	United States	1983	1
194	Red Velvet	South Korea	2014	1
195	Regard	Kosovo	2008	0
196	Reik	Mexico	2003	1
197	Rex Orange County	United Kingdom	2015	0
198	Rich Music LTD	United States	2007	1
199	Rihanna	Barbados	2005	0
201	Riton	United Kingdom	2000	0
202	Roddy Ricch	United States	2017	0
204	Russ	United States	2011	0
205	Rvssian	Jamaica	2007	0
206	SAINt JHN	United States	2016	0
213	SHAED	United States	2016	1
207	Sam Feldt	Netherlands	2013	0
208	Sam Smith	United Kingdom	2014	0
209	Samra	Germany	2013	0
210	Sebastian Yatra	Colombia	2013	0
211	Sech	Panama	2016	0
212	Selena Gomez	United States	2008	0
214	Shakira	Colombia	1991	0
215	Shawn Mendes	Canada	2013	0
216	Sheck Wes	United States	2016	0
217	Silk City	United States	2017	1
218	Ski Mask The Slump God	United States	2014	0
219	Stormzy	United Kingdom	2013	0
220	Stunna 4 Vegas	United States	2018	0
221	Summer Walker	United States	2017	0
222	Surfaces	United States	2017	1
223	System Of A Down	United States	1994	1
236	TINI	Argentina	2013	0
238	TOTO	United States	1977	1
224	Tainy	Puerto Rico	2005	0
225	Tame Impala	Australia	2007	1
226	Taylor Swift	United States	2006	0
227	Tears For Fears	United Kingdom	1981	1
228	The Black Eyed Peas	United States	1992	1
229	The Chainsmokers	United States	2012	1
230	The Cranberries	Ireland	1989	1
231	The Cratez	Germany	2009	1
232	The Neighbourhood	United States	2011	1
233	The Police	United Kingdom	1977	1
234	The Weeknd	Canada	2010	0
235	Tiësto	Netherlands	1985	0
237	Tones and I	Australia	2017	0
239	Train	United States	1993	1
240	Travis Scott	United States	2008	0
241	Trevor Daniel	United States	2017	0
242	Trippie Redd	United States	2014	0
243	Twenty One Pilots	United States	2009	1
244	Tyga	United States	2006	0
245	Tyler, The Creator	United States	2009	0
246	WALK THE MOON	United States	2006	1
247	Why Don't We	United States	2016	1
248	Wisin & Yandel	Puerto Rico	1998	1
249	Wiz Khalifa	United States	2006	0
250	XXXTENTACION	United States	2013	0
251	Y2K	United States	2012	0
252	YNW Melly	United States	2015	0
253	Young Thug	United States	2010	0
254	YoungBoy Never Broke Again	United States	2015	0
255	ZAYN	United Kingdom	2015	0
256	Zedd	Germany	2010	0
5	a-ha	Norway	1982	1
29	benny blanco	United States	2007	0
31	blackbear	United States	2011	0
85	gnash	United States	2015	0
96	iann dior	Puerto Rico	2019	0
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection (item_id, album_id, format, date_acquired, purchase_price, personal_rating) FROM stdin;
1	52u4anZbHd6UInnmHRFzba	digital	2021-03-14	9.99	5
2	1NsTSXjVNE7XmZ8PmyW0wl	digital	2021-08-02	9.99	4
3	5uCEoLCj3ZZZ1EtzQdQWVl	digital	2022-01-19	7.99	4
4	1jAxVdQ2FFtbHu6kLNM0au	digital	2022-05-07	6.99	5
5	4uTOUYhLrGRKkfxfPKTkuy	digital	2022-09-23	6.99	3
6	3fxzSn0ObgCjLadyR53ohN	CD	2023-02-11	12.99	5
7	2ZfHkwHuoAZrlz7RMj0PDz	vinyl	2023-04-08	32.99	5
8	4g1ZRSobMefqF6nelkgibi	CD	2021-11-20	13.99	5
9	4i3rAwPw7Ln2YrKDusaWyT	digital	2022-02-04	9.99	4
10	0ix3XtPV1LwmZADsprKxcp	digital	2023-07-15	7.99	5
11	3nR9B40hYLKLcR0Eph3Goc	digital	2024-01-29	6.99	3
12	0UywfDKYlyiu1b38DRrzYD	digital	2024-06-12	7.99	4
13	1Czfd5tEby3DbdYNdqzrCa	digital	2024-10-03	6.99	3
14	79dL7FLiJFOO0EoehUHQBv	vinyl	2024-08-18	28.99	5
15	1GbtB4zTqAsyfZEsm1RZfx	vinyl	2025-02-22	36.99	5
16	10v912xgTZbjAtYfyKWJCS	vinyl	2025-05-30	29.99	5
17	6hPkbAV3ZXpGZBGUvL6jVM	CD	2025-07-09	11.99	4
18	6tkjU4Umpo79wwkgPMV3nZ	digital	2022-12-01	9.99	5
19	2sBB17RXTamvj7Ncps15AK	digital	2023-09-14	4.99	4
20	4CA8GvVF7swZafg0zYh9qq	digital	2024-03-21	6.99	4
21	4sLtOBOzn4s3GDUv3c5oJD	vinyl	2025-09-05	34.99	4
22	2T0NPRcdhIt71ifDWm328R	digital	2023-06-26	6.99	4
23	3L0H4RjVXpEkwfDgi3XOdf	digital	2024-11-14	7.99	3
24	1MmVkhiwTH0BkNOU3nw5d3	digital	2025-01-10	9.99	5
25	6xu5asYeoMIT5Sa5b1P13q	digital	2026-02-17	7.99	4
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.genres (genre_id, name, description) FROM stdin;
1	edm	High-energy electronic dance music driven by synths, programmed beats, and drops built for clubs and festivals.
2	latin	Spanish-language music spanning reggaeton, Latin pop, and tropical rhythms with strong dance-oriented grooves.
3	pop	Mainstream popular music defined by catchy hooks, polished production, and broad commercial appeal.
4	r&b	Rhythm and blues — vocal-forward, soulful music built around smooth grooves and melodic phrasing.
5	rap	Hip-hop characterized by rhythmic, spoken-word vocals layered over heavy beats and sampled or programmed instrumentals.
6	rock	Guitar-driven music with prominent drums and strong vocals, ranging from classic rock anthems to modern alternative.
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tracks (track_id, album_id, genre_id, title, popularity, duration_ms, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo) FROM stdin;
2XU0oxnq2qxCpomAAuJY8K	0UywfDKYlyiu1b38DRrzYD	3	Dance Monkey	100	209438	0.824	0.588	6	-6.4	0	0.0924	0.692	0.000104	0.149	0.513	98.027
696DnlkuDOXcMAnKlTgXXK	6HJDrXs0hpebaRFKA1sF90	2	ROXANNE	99	163636	0.621	0.601	6	-5.616	0	0.148	0.0522	0	0.46	0.457	116.735
7k4t7uLgtOxPwTpFmtJNTY	7mKevNHhVnZER3BLgI8O4F	3	Tusa	98	200960	0.803	0.715	2	-3.28	1	0.298	0.295	0.000134	0.0574	0.574	101.085
2b8fOow8UzyDFAE27YhOZM	3nR9B40hYLKLcR0Eph3Goc	3	Memories	98	189486	0.764	0.32	11	-7.209	1	0.0546	0.837	0	0.0822	0.575	91.019
0sf12qNH5qcw8qpgymFOqD	2ZfHkwHuoAZrlz7RMj0PDz	3	Blinding Lights	98	201573	0.513	0.796	1	-4.075	1	0.0629	0.00147	0.000209	0.0938	0.345	171.017
21jGcNKet2qwijlDFuPiPb	4g1ZRSobMefqF6nelkgibi	3	Circles	98	215280	0.695	0.762	0	-3.497	1	0.0395	0.192	0.00244	0.0863	0.553	120.042
0nbXyq5TXYPCO7pr3N8S4I	52u4anZbHd6UInnmHRFzba	5	The Box	98	196653	0.896	0.586	10	-6.687	0	0.0559	0.104	0	0.79	0.642	116.971
3ZCTVFBt2Brf31RLEnCkWJ	4i3rAwPw7Ln2YrKDusaWyT	3	everything i wanted	97	245426	0.704	0.225	6	-14.454	0	0.0994	0.902	0.657	0.106	0.243	120.006
6WrI0LAC5M1Rw2MnX2ZvEg	0ix3XtPV1LwmZADsprKxcp	3	Don't Start Now	97	183290	0.794	0.793	11	-4.521	0	0.0842	0.0125	0	0.0952	0.677	123.941
4TnjEaWOeW0eKTKIEvJyCa	1Czfd5tEby3DbdYNdqzrCa	3	Falling	97	159382	0.784	0.43	10	-8.756	0	0.0364	0.123	0	0.0887	0.236	127.087
6cy3ki60hLwimwIje7tALf	6EobpC5SDFy5DF50dWNVGF	3	RITMO (Bad Boys For Life)	96	221714	0.721	0.716	10	-7.037	0	0.0657	0.0334	0.00084	0.237	0.667	104.994
2Fxmhks0bxGSBdJ92vM42m	0S0KGZnfBGSIssfF54WSJh	3	bad guy	95	194088	0.701	0.425	7	-10.965	1	0.375	0.328	0.13	0.1	0.562	135.128
41L3O37CECZt3N7ziG2z7l	1SN6N3fNkZk5oXQ9X46QZ3	3	Yummy	95	210427	0.662	0.519	9	-6.554	0	0.106	0.404	0	0.121	0.495	145.841
2tnVG71enUj33Ic2nFN6kZ	4zOhjJfe0dwqsNdDYk622E	3	Ride It	94	157606	0.88	0.751	7	-4.258	0	0.0874	0.177	6.43e-05	0.106	0.884	117.948
7qEHsqek33rTcFNT9PFqLf	5658aM19fA3JVwTK6eQX70	3	Someone You Loved	94	182161	0.501	0.405	1	-5.679	1	0.0319	0.751	0	0.105	0.446	109.891
3eekarcy7kvN4yt5ZFzltW	2uDTi1PlpSpvAv7IRAoAEU	3	HIGHEST IN THE ROOM	94	175721	0.598	0.427	7	-8.764	0	0.0317	0.0546	5.83e-06	0.21	0.0605	76.469
7aiClxsDWFRQ0Kzk5KI5ku	37CqAwxTungNxKpIK5vSgE	3	hot girl bummer	94	185093	0.778	0.559	6	-7.109	0	0.0776	0.128	0	0.399	0.678	129.989
3yOlyBJuViE2YSGn3nVE1K	3Vsbl0diFGw8HNSjG8ue9m	3	My Oh My (feat. DaBaby)	94	170746	0.724	0.491	8	-6.024	1	0.0296	0.018	1.29e-05	0.0887	0.383	105.046
2ksOAxtIxY8yElEWw8RhgK	1PTTAq0OxggVgqP5WTYWDh	3	China	93	301714	0.786	0.808	7	-3.702	1	0.0882	0.0846	0.000289	0.0822	0.609	105.027
0TK2YIli7K1leLovkQiNik	2ZaX1FdZCwchXl1QZiD4O4	3	Señorita	93	190960	0.759	0.54	9	-6.039	0	0.0287	0.037	0	0.0945	0.75	116.947
57vxBYXtHMk6H1aD29V7PU	7vRcickwa6GCfY1qKKe4lK	3	Heartless	93	200080	0.531	0.75	10	-5.831	0	0.111	0.00632	7.6e-05	0.117	0.198	169.954
1HfMVBKM75vxSfsQ5VefZ5	3tBkjgxDqAwss76O1YHsSY	3	Lose You To Love Me	93	206459	0.505	0.34	4	-9.005	1	0.0438	0.576	0	0.21	0.0916	101.993
5yY9lUy8nbvjM1Uyo1Uqoc	5uCEoLCj3ZZZ1EtzQdQWVl	5	Life Is Good (feat. Drake)	93	237735	0.676	0.609	2	-5.831	0	0.481	0.0706	0	0.152	0.508	142.037
6Ozh9Ok6h4Oi1wUSLtBseN	1NsTSXjVNE7XmZ8PmyW0wl	5	BOP	93	159715	0.769	0.787	11	-3.909	1	0.367	0.189	0	0.129	0.836	126.77
5DxXgozhkPLgrbKFY91w0c	3fxzSn0ObgCjLadyR53ohN	5	Vete	93	192024	0.886	0.672	1	-4.394	1	0.188	0.0363	8.78e-06	0.101	0.526	91.976
6Gg1gjgKi2AK4e0qzsR7sd	3t6Z2qoBVCS4NHNI25XECH	3	Bandit (with YoungBoy Never Broke Again)	92	189323	0.474	0.631	5	-5.884	0	0.343	0.0687	0	0.132	0.425	180.051
5ZULALImTm80tzUbYQYM9d	2pJXQvY0YeDvVJ9gMU9G7j	3	Dance Monkey	92	209438	0.824	0.588	6	-6.4	0	0.0924	0.692	0.000104	0.149	0.513	98.027
6mAN61JH0dzyZpWslS11jy	1Flcx9eDuv7pTGM9nJBmGL	3	Fantasias	92	199711	0.879	0.703	1	-4.219	1	0.0701	0.143	0	0.0569	0.788	94.004
3VyjsVV24RmBIbWJAeUJNu	1jAxVdQ2FFtbHu6kLNM0au	5	No Idea	92	153750	0.656	0.614	6	-4.973	0	0.102	0.558	0.000862	0.215	0.35	128.038
285pBltuF7vW8TeWk8hdRR	6tkjU4Umpo79wwkgPMV3nZ	4	Lucid Dreams	92	239836	0.511	0.566	6	-7.23	0	0.2	0.349	0	0.34	0.218	83.903
7CHi4DtfK4heMlQaudCuHK	1qSOaTvsCOyFJya3v1UzkP	3	Lose Control	91	168387	0.598	0.526	10	-8.659	0	0.0415	0.129	0	0.14	0.529	123.935
0fea68AdmYNygeTGI4RC18	6ylFfzx32ICw4L1A7YWNLN	3	LA CANCIÓN	91	242573	0.754	0.646	7	-5.795	1	0.317	0.152	1.85e-05	0.108	0.429	176.089
1M4qEo4HE3PRaCOM7EXNJq	5SL9nXZYZZl68bHwaM8uLa	3	Adore You	91	207133	0.676	0.771	8	-3.675	1	0.0483	0.0237	7e-06	0.102	0.569	99.048
2wrJq5XKLnmhRXHIAf9xBa	4ow6xJwn49gpWz7iHpOzWY	3	10,000 Hours (with Justin Bieber)	91	167693	0.654	0.63	10	-4.644	1	0.0259	0.153	0	0.111	0.43	89.991
6b2RcmUt1g9N9mQ3CbjX2Y	7baaCf70tVcUBL2bbkuXjo	3	How Do You Sleep?	91	202205	0.477	0.682	1	-4.931	0	0.0925	0.153	0	0.0763	0.345	110.567
4vUmTMuQqjdnvlZmAH61Qk	3oIFxDIo2fwuk4lwCmFZCx	3	South of the Border (feat. Camila Cabello & Cardi B)	91	204467	0.857	0.621	9	-6.376	0	0.0824	0.148	0	0.0865	0.668	97.986
51Fjme0JiitpyXKuyQiCDo	4WlC4FXhonJhNTXCQPGP3r	3	Lalala	91	160627	0.843	0.391	2	-7.899	1	0.0845	0.181	0	0.137	0.496	129.972
6LcauUZjF1eXQrgqMUecHX	3Cse4lihKX7ww99QnZGQAh	3	Ayy Macarena	91	131607	0.816	0.63	2	-5.568	1	0.226	0.133	0	0.0692	0.715	96.493
2Ec33AVlkTTq8BHFgBTdQs	4uTOUYhLrGRKkfxfPKTkuy	5	Futsal Shuffle 2020	91	198913	0.881	0.457	7	-8.191	0	0.156	0.0327	0	0.231	0.296	136.97
5stPVcRqb4qixbafP9e8lt	65Pp2tO1Ul66KcCmmkRGWZ	2	Hola - Remix	91	249520	0.654	0.672	0	-5.98	0	0.311	0.471	0	0.0781	0.343	181.857
6RyaV7owmVU6fzEPE17sF1	155yGQqPxsYkhV7zQyL95t	3	Que Tire Pa Lante	90	210520	0.658	0.901	7	-2.814	1	0.0357	0.0478	0	0.12	0.708	93.979
3jbT1Y5MoPwEIpZndDDwVq	7nqA49hzXJWPH4cnM8nk6x	3	Adicto (with Anuel AA & Ozuna)	90	270741	0.734	0.836	10	-4.803	0	0.0735	0.017	1.64e-05	0.179	0.623	80.002
7ce20yLkzuXXLUhzIDoZih	0488X5veBK6t3vSmIiTDJY	3	Before You Go	90	215107	0.459	0.575	3	-4.858	1	0.0573	0.604	0	0.0885	0.183	111.881
1iQDltZqI7BXnHrFy4Qo1k	5QqqBZmdQmY1MvlnpBkagB	3	Trampoline (with ZAYN)	90	184280	0.619	0.459	7	-5.782	0	0.0334	0.56	0	0.137	0.498	126.803
1lOe9qE0vR9zwWQAOk6CoO	1I6FpscJIfwf4T56VxGVsB	3	Ransom	90	131240	0.745	0.642	7	-6.257	0	0.287	0.0204	0	0.0658	0.226	179.974
2TH65lNHgvLxCKXM3apjxI	06S3Qjh4QWLtn6c7CVhYh7	3	Callaita	90	250534	0.61	0.624	2	-4.773	1	0.309	0.6	2.12e-06	0.243	0.244	176.169
2YpeDb67231RjR0MgVLzsG	4IRiXE5NROxknUSAUSjMoO	3	Old Town Road - Remix	90	157067	0.878	0.619	6	-5.56	1	0.102	0.0533	0	0.113	0.639	136.041
1e9oZCCiX42nJl0AcqriVo	659e2eKbsMH0vYCs5qgFmy	3	Watermelon Sugar	90	174000	0.548	0.816	0	-4.209	1	0.0465	0.122	0	0.335	0.557	95.39
6ocbgoVGwYJhOv1GgI9NsF	2fYhqwDWXjbpjaIJPEfKFw	3	7 rings	90	178627	0.778	0.317	1	-10.732	0	0.334	0.592	0	0.0881	0.327	140.048
3HVWdVOQ0ZA45FuZGSfvns	5Nux7ozBJ5KJ02QYWwrneR	3	I Don't Care (with Justin Bieber)	90	219947	0.798	0.675	6	-5.041	1	0.0442	0.0912	0	0.0894	0.842	101.956
1iSqfoUFnQwV0QW1EfUit8	5xq6RMHNIBA73qld03dR6V	5	Suicidal	90	222997	0.736	0.369	9	-9.682	0	0.0688	0.334	0	0.126	0.235	140.005
3QzAOrNlsabgbMwlZt7TAY	2WrNHOba5u6P9S9xEboaUy	5	Ballin' (with Roddy Ricch)	90	180435	0.809	0.545	7	-6.678	1	0.0735	0.392	0	0.151	0.244	97.008
7sQKy5vlPQllr0k9IjYJv3	1y0pdsLO6cixGzAv7Sf8rf	2	Sigues Con El	90	226533	0.883	0.668	9	-2.957	1	0.113	0.11	0.000529	0.0734	0.676	87.972
0t3ZvGKlmYmVsDzBJAXK8C	4g1ZRSobMefqF6nelkgibi	2	Goodbyes (feat. Young Thug)	90	174853	0.548	0.653	5	-3.875	1	0.081	0.456	0	0.103	0.163	150.068
2pWOMNQJW3g2zmGjP0Vkb0	1CYQlkKE5Q0khU6eMwVAVt	2	Whine Up	90	215460	0.817	0.665	9	-6.224	0	0.0758	0.0549	0	0.103	0.662	104.957
0bYg9bo50gSsH3LtXe2SQn	61ulfFSmmxMhc2wCdmdMkN	4	All I Want for Christmas Is You	90	241107	0.335	0.625	7	-7.462	1	0.0386	0.164	0	0.0708	0.346	150.277
2W4yABdLc4Jnds67Poi5Nl	7L5mva8yC5ctamvs4XzgpR	3	Yellow Hearts	89	223258	0.865	0.438	7	-8.943	1	0.0719	0.177	0	0.0743	0.695	129.038
07Oz5StQ7GRoygNLaXs2pd	1k1HuvFs562Z3CCiSYhtc1	3	Good as Hell (feat. Ariana Grande) - Remix	89	159011	0.668	0.892	5	-3.001	0	0.0645	0.298	0	0.735	0.478	95.927
4evmHXcjt3bTUHD1cvny97	3E12WU80fDMyu7GyIAx7wJ	3	Beautiful People (feat. Khalid)	89	197867	0.64	0.648	5	-8.113	0	0.187	0.124	0	0.0802	0.548	92.977
2dpaYNEQHiRxtZbfNsse99	78EicdHZr5XBWD7llEZ1Jh	3	Happier	89	214290	0.687	0.792	5	-2.749	1	0.0452	0.191	0	0.167	0.671	100.015
5DqdesEfbRyOlSS3Tf6c29	63Kr9mdWxT7mB2AKgf4rCa	3	It's You	89	212607	0.732	0.463	11	-6.972	0	0.0287	0.374	0	0.194	0.397	95.971
7h0d2h0fUmzbs7zeFigJPn	1Sf8GsXG32t0jNrX11xqWx	5	HIGHEST IN THE ROOM (feat. ROSALÍA & Lil Baby) - REMIX	89	244874	0.559	0.491	2	-6.406	0	0.0346	0.0567	0	0.0992	0.114	153.131
37zdqI4r1gswIzczSBkRon	46xbsFOp9g1WqTidQEs7YT	5	Aventura	89	217130	0.729	0.726	5	-3.208	1	0.0422	0.223	0	0.101	0.876	92.025
0u2P5u6lvoDfwTYjAADbn4	2sBB17RXTamvj7Ncps15AK	4	lovely (with Khalid)	89	200186	0.351	0.296	4	-10.109	0	0.0333	0.934	0	0.095	0.12	115.284
24Yi9hE78yPEbZ4kxyoXAI	3GqSdhWjmMypMwPLtzoFYs	3	Roses - Imanbek Remix	88	176840	0.77	0.724	8	-5.484	1	0.0495	0.0167	0.0105	0.353	0.898	121.974
59s0s39NFWScuHDbHytI14	4qecT0ZJrf35thz2WaEm6P	3	Indeciso	88	217253	0.738	0.748	0	-4.902	1	0.0453	0.182	0	0.11	0.896	94.949
2rc7BkzO8qepMFAxHtOrXc	5mcUbpuVL0i5q4cECQ6cV4	3	Blanco	88	145800	0.87	0.706	9	-5.395	0	0.126	0.0253	0.0063	0.0872	0.593	100.013
7HMmFQsKsljwTw8bS7lu19	3YPFaTR7WMi1Hd4NVKdCJx	3	Rare	88	220590	0.838	0.545	5	-6.713	1	0.0706	0.208	8.01e-05	0.103	0.631	114.998
6v3KW9xbzN5yKLt9YKDYA2	0xzScN8P3hQAz3BT3YYX5w	3	Señorita	88	190800	0.759	0.548	9	-6.049	0	0.029	0.0392	0	0.0828	0.749	116.967
6osaMSJh9NguagEDQcZaKx	2MFS6WG6jnPAgvJpV3PehR	3	Loco Contigo (feat. J. Balvin & Tyga)	88	185195	0.694	0.758	11	-2.986	1	0.218	0.278	1.34e-06	0.102	0.371	192.091
6Y4PDQv4XjYjHLeLmvyOt0	2S6p0g6YzG3609Ty45i5Cq	3	Si Te Vas	88	204907	0.732	0.644	0	-4.124	1	0.132	0.0934	4.54e-06	0.143	0.554	174.1
7BlBVFwvbWvcwNcUarQmjk	3844bY26oeSkqd06th4EYp	3	Yo x Ti, Tu x Mi	88	201040	0.78	0.759	1	-3.292	1	0.225	0.462	0.000868	0.143	0.579	91.952
5a6pdCHlWS2ekOOQ70QnAr	2YQptVBjUJeIOBavD1AyXg	3	July	88	156107	0.708	0.186	9	-8.953	0	0.0422	0.868	0	0.0779	0.321	72.541
2kJwzbxV2ppxnQoYw4GLBZ	7BrlhEO8dHiNmU8A1Ep9RZ	3	If The World Was Ending (feat. Julia Michaels)	88	208687	0.464	0.473	1	-10.086	1	0.129	0.866	0	0.109	0.604	75.801
3KkXRkHbMCARz0aVfEt68P	35s58BRTGAEWztPo9WqCIs	3	Sunflower - Spider-Man: Into the Spider-Verse	88	158040	0.76	0.479	2	-5.574	1	0.0466	0.556	0	0.0703	0.913	89.911
3jjujdWJ72nww5eGnfs2E7	7xV2TzoaVc0ycW7fwBwAml	3	Adore You	88	207133	0.676	0.771	8	-3.675	1	0.0483	0.0237	7e-06	0.102	0.569	99.048
5p7ujcrUXASCNwRaWNHR1C	0zzrCTzvL4ZmR42xF46Afm	3	Without Me	88	201661	0.752	0.488	6	-7.05	1	0.0705	0.297	9.11e-06	0.0936	0.533	136.041
6kls8cSlUyHW2BUOkDJIZE	29FoTD5vBY3Fq1QWhbl3FM	3	Hate Me (with Juice WRLD)	88	186223	0.657	0.768	8	-4.628	1	0.0507	0.108	0	0.144	0.759	75.025
598yNsG1JFrGd4n2kMoz7F	393l0NdTr8Rv0hybf4FTxy	5	Woah	88	183011	0.882	0.602	11	-5.554	1	0.245	0.0177	0	0.178	0.43	142.959
0fySG6A6qLE8IvDpayb5bM	1NsTSXjVNE7XmZ8PmyW0wl	5	VIBEZ	88	144935	0.768	0.652	1	-2.708	0	0.307	0.113	0	0.107	0.777	154.187
5ry2OE6R2zPQFDO85XkgRb	00HZxSA1sOS9T3nA950sg4	5	Money In The Grave (Drake ft. Rick Ross)	88	205427	0.831	0.502	10	-4.045	0	0.046	0.101	0	0.122	0.101	100.541
6U0FIYXCQ3TGrk4tFpLrEA	1jToVugwBEzcak8gJNZG2f	5	SUGAR	88	204533	0.453	0.538	1	-8.212	1	0.0638	0.449	0	0.19	0.516	122.973
0e7ipj03S05BNilyu5bRzt	6trNtQUgC8cgbWcqoMYkOR	5	rockstar (feat. 21 Savage)	88	218147	0.585	0.52	5	-6.136	0	0.0712	0.124	7.01e-05	0.131	0.129	159.801
6Hj9jySrnFppAI0sEMCZpJ	1GYVNOzwhx1nMcIJDogSNp	5	Robbery	88	240051	0.685	0.692	2	-5.122	1	0.0457	0.328	0	0.153	0.578	159.966
1nocRtwyNPVtGcIJqfgdzZ	6xu5asYeoMIT5Sa5b1P13q	2	Tutu	88	178613	0.731	0.832	9	-2.592	1	0.0503	0.273	0	0.0665	0.94	146.013
3Dv1eDb0MEgF93GpLXlucZ	1MmVkhiwTH0BkNOU3nw5d3	2	Say So	88	237893	0.787	0.673	11	-4.577	0	0.158	0.256	3.57e-06	0.0904	0.786	110.962
1DFD5Fotzgn6yYXkYsKiGs	0cqRGWD3uc5Lggpducn5nD	2	Piece Of Your Heart	88	152913	0.677	0.744	10	-6.806	0	0.0295	0.0404	0.00016	0.074	0.631	124.08
5Id5B3dxJZhPcV9GzgYZZe	1faqBAWocW4ZOe0OFjudGw	2	Quizas	88	216067	0.727	0.815	3	-2.454	1	0.153	0.0258	0	0.231	0.677	176.075
4QPEwDdOMhY7rNS05mTyMR	3y4AaloFccKNLQcZNS9L8c	2	Own It (feat. Ed Sheeran & Burna Boy)	88	216707	0.817	0.781	7	-4.178	0	0.112	0.00838	5.21e-06	0.123	0.359	104
0pqnGHJpmpxLKifKRmU6WP	33pt9HBdGlAbRGBHQgsZsU	2	Believer	88	204347	0.776	0.78	10	-4.374	0	0.128	0.0622	0	0.081	0.666	124.949
2VxeLyX666F8uXCJ0dZF8B	4sLtOBOzn4s3GDUv3c5oJD	4	Shallow	88	215733	0.572	0.385	7	-6.362	1	0.0308	0.371	0	0.231	0.323	95.799
1ZMiCix7XSAbfAJlEZWMCp	7xV2TzoaVc0ycW7fwBwAml	4	Falling	88	240133	0.567	0.267	4	-6.502	1	0.0299	0.839	1.46e-06	0.089	0.0592	110.011
6oJ6le65B3SEqPwMRNXWjY	4wquJImu8RtyEuDtIAsfcE	3	Higher Love	87	228267	0.693	0.678	8	-7.159	1	0.0324	0.0154	6.05e-06	0.101	0.404	103.952
25sgk305KZfyuqVBQIahim	7CdLU3GgPy1PH5FVsrPlyA	3	Sweet but Psycho	87	187436	0.719	0.704	1	-4.724	1	0.0476	0.0691	0	0.166	0.628	133.002
6Qs4SXO9dwPj5GKvVOv8Ki	1V9oE8bVilClrk5naqyyvL	3	Dancing With A Stranger (with Normani)	87	171030	0.741	0.52	8	-7.513	1	0.0656	0.45	1.97e-06	0.222	0.347	102.998
3cphb8kdsjElYR7r5icK3H	3KrYBAbfxlssMirZLs6HzZ	3	Nice To Meet Ya	87	158805	0.591	0.841	4	-4.351	0	0.0304	0.0119	0	0.395	0.392	109.034
5w9c2J52mkdntKOmRLeM2m	1otwHKoQ5KPaiekpYk4tWh	3	Con Calma	87	193227	0.737	0.86	8	-2.652	0	0.0593	0.11	1.94e-06	0.0574	0.656	93.989
7LzouaWGFCy4tkXDOOnEyM	3xgS4rfthlsvhW7J2WLiiR	3	Liar	87	207039	0.74	0.498	11	-6.684	0	0.0456	0.0169	0.00282	0.319	0.652	98.016
0RiRZpuVRbi7oqRdSMwhQY	4g1ZRSobMefqF6nelkgibi	3	Sunflower - Spider-Man: Into the Spider-Verse	87	157560	0.755	0.522	2	-4.368	1	0.0575	0.533	0	0.0685	0.925	89.96
6V9fHiv84WlVTg7CSnIVY2	66QwiCFDLtRbrZ5Vs9wlL9	3	Graveyard	87	181806	0.667	0.583	11	-5.127	0	0.0747	0.231	4.48e-05	0.181	0.187	92.043
7CZyCXKG6d5ALeq41sLzbw	4g1ZRSobMefqF6nelkgibi	3	Take What You Want (feat. Ozzy Osbourne & Travis Scott)	87	229573	0.499	0.8	1	-2.665	0	0.0502	0.0906	0	0.147	0.272	139.919
22vgEDb5hykfaTwLuskFGD	1Uf67JAtkVWfdydzFFqNF2	3	Sucker	87	181027	0.842	0.734	1	-5.065	0	0.0588	0.0427	0	0.106	0.952	137.958
1mpD5Q8IM32I4bF6eCpU74	2pSH41L4EXqhGHyTjM2dA2	3	Up All Night	87	157220	0.665	0.712	1	-7.536	1	0.0527	0.00103	0.00342	0.102	0.669	93.989
3e9HZxeyfWwjeyPAMmWSSQ	2fYhqwDWXjbpjaIJPEfKFw	3	thank u, next	87	207320	0.717	0.653	1	-5.634	1	0.0658	0.229	0	0.101	0.412	106.966
7dt6x5M1jzdTEt8oCbisTK	6trNtQUgC8cgbWcqoMYkOR	3	Better Now	87	231267	0.68	0.578	10	-5.804	1	0.04	0.331	0	0.135	0.341	145.038
2xLMifQCjDGFmkHkpNLD9h	41GuZcammIkupMPKH2OJ6I	3	SICKO MODE	87	312820	0.834	0.73	8	-3.714	1	0.222	0.00513	0	0.124	0.446	155.008
4SSnFejRGlZikf02HLewEF	0S0KGZnfBGSIssfF54WSJh	3	bury a friend	87	193143	0.905	0.389	8	-14.505	1	0.332	0.74	0.162	0.106	0.196	120.046
6gi6y1xwmVszDWkUqab1qw	1Sf8GsXG32t0jNrX11xqWx	5	OUT WEST (feat. Young Thug)	87	157712	0.802	0.591	8	-4.895	1	0.225	0.0104	0	0.196	0.309	139.864
2gwkD6igEhQbDQegRCcdoB	0O1PJ0t69iTO5yWrIeIga0	5	Suge	87	163320	0.876	0.662	2	-6.482	0	0.426	0.0608	0	0.127	0.844	75.445
3ClBKQkKoaUQ6UOhe2xlJK	4CCaoRnCugI6RsHHBKiMLs	5	Good News	87	342040	0.794	0.32	1	-12.92	0	0.173	0.853	0.134	0.112	0.241	174.088
3ee8Jmje8o58CHK66QrVC2	2Ti79nwTsont5ZHfdxIzAm	5	SAD!	87	166606	0.74	0.613	8	-4.88	1	0.145	0.258	0.00372	0.123	0.473	75.023
2qG5sZ7Si6sdK74qLxedYM	4bxHLppgdmaYJk0yfdcP0l	2	Con Altura	87	161627	0.882	0.689	6	-4.027	1	0.124	0.39	0.00325	0.0501	0.746	97.963
3CYH422oy1cZNoo0GTG1TK	3rVtm00UfbuzWOewdm4iYM	2	Psycho	87	210560	0.664	0.666	8	-2.203	1	0.0446	0.193	0	0.0854	0.405	139.987
1Xnn1TPyr5h0hpRAT4B4EA	5dXeJdc2hib8JB3Vqon2zB	2	Bellaquita - Remix	87	304733	0.795	0.715	1	-3.582	1	0.0838	0.141	2.12e-06	0.179	0.758	165.941
0qaWEvPkts34WF68r8Dzx9	7mtnp7B5yFt3D3PAznGzc8	3	Turn Me On (feat. Vula)	86	208474	0.737	0.828	11	-4.711	1	0.0396	0.0149	0.000583	0.0862	0.517	124.052
2usxQITOSDqvkYiI0oIwao	1gBDGPFz9v93dxE3fUU9eO	3	You should be sad	86	205473	0.591	0.585	2	-6.35	1	0.0277	0.143	0	0.109	0.324	110.94
7qiZfU4dY1lWllzX7mPBI3	3T4tUhGYeRNVUGevb0wThu	3	Shape of You	86	233713	0.825	0.652	1	-3.183	0	0.0802	0.581	0	0.0931	0.931	95.977
4yI3HpbSFSgFZtJP2kDe5m	4O04QLiB0lGHQlygXxiMuX	3	Look At Her Now	86	162596	0.563	0.564	10	-7.906	0	0.271	0.114	0.0254	0.304	0.55	154.355
56AMYGJzxBO6p8v0wEe9de	7hXWMVDn9SVV7zNYiQGvWO	3	Hot (Remix) [feat. Gunna and Travis Scott]	86	279907	0.845	0.631	7	-8.206	0	0.216	0.188	0	0.0806	0.545	111.983
4R8BJggjosTswLxtkw8V7P	1V9QpD8kjA2iHCElhFGvlo	3	No Me Conoce - Remix	86	309120	0.806	0.786	10	-3.831	0	0.0741	0.145	0	0.0935	0.58	91.973
4Of7rzpRpV1mWRbhp5rAqG	5658aM19fA3JVwTK6eQX70	3	Bruises	86	220492	0.736	0.308	4	-7.83	1	0.0677	0.946	0	0.186	0.361	111.202
6RRNNciQGZEXnqk8SQ9yv5	1NAmidJlEaVgA3MpcPFYGq	3	You Need To Calm Down	86	171360	0.771	0.671	2	-5.617	1	0.0553	0.00929	0	0.0637	0.714	85.026
1rqqCSm0Qe4I9rUvWncaom	6ApYSpXF8GxZAgBTHDzYge	3	High Hopes	86	190947	0.579	0.904	5	-2.729	1	0.0618	0.193	0	0.064	0.681	82.014
6DCZcSspjsKoFjzjrWoCdn	1ATL5GLyefJaxhQzSPVrLX	3	God's Plan	86	198973	0.754	0.449	7	-9.211	1	0.109	0.0332	8.29e-05	0.552	0.357	77.169
4ZLzoOkj0MPWrTLvooIuaa	5LZSpPoBVBsh6kRSEKfPQ8	3	Get You The Moon (feat. Snøw)	86	179080	0.498	0.235	1	-16.541	0	0.188	0.72	0	0.144	0.0895	118.917
6gBFPUFcJLzWGx4lenP6h2	42WVQWuf1teDysXiOupIZt	3	goosebumps	86	243837	0.841	0.728	7	-3.37	1	0.0484	0.0847	0	0.149	0.43	130.049
6IRdLKIyS4p7XNiP8r6rsx	0S0KGZnfBGSIssfF54WSJh	3	all the good girls go to hell	86	168840	0.726	0.444	8	-8.922	0	0.372	0.283	0.143	0.177	0.569	185.044
2FvD20Z8aoWIePi7PoN8sG	1NsTSXjVNE7XmZ8PmyW0wl	5	TOES (feat. Lil Baby & Moneybagg Yo)	86	136366	0.816	0.582	8	-4.141	1	0.341	0.0794	5.84e-06	0.0916	0.542	160.004
2JvzF1RMd7lE3KmFlsyZD8	3XzSOIE6zGLliuqsVGLmUc	5	MIDDLE CHILD	86	213594	0.837	0.364	8	-11.713	1	0.276	0.149	0	0.271	0.463	123.984
7m9OqQk4RVRkw9JJdeAw96	5VdyJkLe3yvOs0l4xXbWp0	5	Jocelyn Flores	86	119133	0.872	0.391	0	-9.144	0	0.242	0.469	4.13e-06	0.297	0.437	134.021
4bTZeO72FwMa6wKOiqoynL	3hiJmThCss4ugTPzvgUnT1	5	Otro Trago - Remix	86	287773	0.725	0.79	0	-2.331	1	0.197	0.0711	1.14e-06	0.0602	0.763	175.988
25ZAibhr3bdlMCLmubZDVt	6ylFfzx32ICw4L1A7YWNLN	5	QUE PRETENDES	86	222347	0.639	0.791	10	-4.443	0	0.253	0.0275	0	0.362	0.939	92.603
5iwz1NiezX7WWjnCgY5TH4	1tFnP9PwIMeMIuj92mfswZ	2	Calma - Remix	86	238200	0.826	0.773	11	-4.218	0	0.0524	0.323	0	0.143	0.761	126.899
1ndyl3wJCFs872XZ3ztPk6	71uU1JDWZ61OMDtW8h1Kp8	2	DJ No Pare (feat. Zion, Dalex, Lenny Tavárez) - Remix	86	258600	0.743	0.709	3	-3.922	0	0.0879	0.0451	5.18e-06	0.0809	0.831	170.001
7KbF6AdprOXEEHlsq11Z6d	3YIUNL7qFE8NP3X3zaYSND	2	11 PM	86	175733	0.777	0.712	10	-4.84	1	0.277	0.217	0	0.091	0.68	95.692
1tNJrcVe6gwLEiZCtprs1u	1DNx0H5ZX1ax3yyRwtgT4S	2	3 Nights	86	177667	0.815	0.518	7	-6.594	0	0.0897	0.223	0	0.104	0.877	151.891
0DiDStADDVh3SvAsoJAFMk	1Uf67JAtkVWfdydzFFqNF2	2	Only Human	86	183000	0.795	0.496	0	-5.883	1	0.0722	0.108	0	0.0645	0.874	94.01
1cVlW9WQiGlFdWUXFdFZGh	6NSiAkMa61CjJI9AHqOhuZ	2	Pa' Olvidarme De Ella	86	227234	0.728	0.542	0	-5.195	1	0.0514	0.259	0	0.136	0.637	90.016
0tgVpDi06FyKpA1z0VMD4v	3T4tUhGYeRNVUGevb0wThu	2	Perfect	86	263400	0.599	0.448	8	-6.312	1	0.0232	0.163	0	0.106	0.168	95.05
2qxmye6gAegTMjLKEBoR3d	6jKZplJpy21R5lHaYHHjmZ	4	Let Me Down Slowly	86	169354	0.652	0.557	1	-5.714	0	0.0318	0.74	0	0.124	0.483	150.073
6UelLqGlWMcVH1E5c4H7lY	7xV2TzoaVc0ycW7fwBwAml	4	Watermelon Sugar	86	174000	0.548	0.816	0	-4.209	1	0.0465	0.122	0	0.335	0.557	95.39
4VXIryQMWpIdGgYR4TrjT1	6tkjU4Umpo79wwkgPMV3nZ	4	All Girls Are The Same	86	165820	0.671	0.529	0	-7.226	1	0.307	0.0769	0.000335	0.0856	0.203	161.989
0JP9xo3adEtGSdUEISiszL	2Ti79nwTsont5ZHfdxIzAm	4	Moonlight	86	135090	0.921	0.537	9	-5.723	0	0.0804	0.556	0.00404	0.102	0.711	128.009
5PYQUBXc7NYeI1obMKSJK0	3KjXg0MDej2pG9fv6I22lT	3	Never Really Over	85	223523	0.77	0.882	8	-4.792	1	0.0602	0.194	0	0.316	0.385	99.991
5WHTFyqSii0lmT9R21abT8	0syM7OUAhV7S6XmOa4nLUZ	3	Don't Call Me Up	85	178480	0.674	0.881	9	-2.853	1	0.147	0.296	3.01e-06	0.0793	0.234	98.994
7BKLCZ1jbUBVqRi2FVlTVw	0rSLgV8p5FzfnqlEk4GzxE	3	Closer (feat. Halsey)	85	244960	0.748	0.524	8	-5.599	1	0.0338	0.414	0	0.111	0.661	95.01
7ef4DlsgrMEH11cDZd32M6	7GEzhoTiqcPYkOprWQu581	3	One Kiss (with Dua Lipa)	85	214847	0.791	0.862	9	-3.24	0	0.11	0.037	2.19e-05	0.0814	0.592	123.994
5KawlOMHjWeUjQtnuRs22c	1AvXa8xFEXtR3hb4bgihIK	3	Boy With Luv (feat. Halsey)	85	229773	0.645	0.862	11	-4.757	0	0.0965	0.0923	0	0.192	0.798	119.991
0bMbDctzMmTyK2j74j3nF3	700MviIgFKNTldTXmOAFOr	3	Alone, Pt. II	85	179053	0.67	0.668	3	-4.306	0	0.0422	0.536	0	0.133	0.608	88.033
3TKpJrY9q49Mj1JOsM9zGL	01GR4NL5O5CZM51k0aejKD	3	Family	85	194827	0.584	0.607	11	-6.605	1	0.0356	0.426	0	0.101	0.374	117.817
4hPpVbbakQNv8YTHYaOJP4	4QAC6FquY8D0RXom13iE5J	3	One Thing Right	85	181824	0.659	0.623	4	-2.253	1	0.0451	0.0667	0	0.582	0.439	88.042
3i9UVldZOE0aD0JnyfAZZ0	2UfvnX1YYeC2cExMQTMbXC	3	Lover (Remix) [feat. Shawn Mendes]	85	221307	0.448	0.603	7	-7.176	1	0.064	0.433	0	0.0862	0.422	205.272
1c0hsvHLELX6y8qymnpLKL	2m9Vuc9Q19qhSm6RQmBgsR	3	Soltera - Remix	85	266087	0.795	0.783	5	-4.271	1	0.0432	0.361	0	0.437	0.8	92.016
3U4isOIWM3VvDubwSI3y7a	4OTAx9un4e6NfoHuVRiOrC	3	All of Me	85	269560	0.422	0.264	8	-7.064	1	0.0322	0.922	0	0.132	0.331	119.93
2QpGZOhTCHHiKmpSO9FW4h	0FgZKfoU2Br5sHOfvZKTI9	3	Follow God	85	104591	0.529	0.9	1	-3.503	1	0.418	0.000248	1.21e-05	0.0426	0.434	180.291
70eFcWOvlMObDhURTqT4Fv	3oIFxDIo2fwuk4lwCmFZCx	3	Beautiful People (feat. Khalid)	85	197867	0.64	0.648	5	-8.113	0	0.187	0.124	0	0.0802	0.548	92.977
4sjiIpEv617LDXaidKioOI	7cekEHNPgpKwVd9kJE9G8F	3	223's (feat. 9lokknine)	85	176640	0.932	0.547	0	-7.787	0	0.333	0.0388	0	0.0924	0.695	94.998
3g0mEQx3NTanacLseoP0Gw	01GR4NL5O5CZM51k0aejKD	3	Takeaway	85	209880	0.528	0.511	3	-8.144	1	0.0324	0.126	0	0.101	0.351	100.1
5uCax9HTNlzGybIStD3vDh	7oiJYvEJHsmYtrgviAVIBD	3	Say You Won't Let Go	85	211467	0.358	0.557	10	-7.398	1	0.059	0.695	0	0.0902	0.494	85.043
4l0Mvzj72xxOpRrp6h8nHi	3YPFaTR7WMi1Hd4NVKdCJx	3	Lose You To Love Me	85	206459	0.488	0.343	4	-8.985	1	0.0436	0.556	0	0.21	0.0978	102.819
1wJRveJZLSb1rjhnUHQiv6	3r5hf3Cj3EMh1C2saQ8jyt	3	Swervin (feat. 6ix9ine)	85	189487	0.581	0.662	9	-5.239	1	0.303	0.0153	0	0.111	0.434	93.023
2IRZnDFmlqMuOrYOLnZZyc	6UYZEYjpN1DYRW0kqFy9ZE	3	Going Bad (feat. Drake)	85	180522	0.889	0.496	4	-6.365	0	0.0905	0.259	0	0.252	0.544	86.003
1zB4vmk8tFRmM9UULNzbLB	33pt9HBdGlAbRGBHQgsZsU	3	Thunder	85	187147	0.605	0.822	0	-4.833	1	0.0438	0.00671	0.134	0.147	0.288	167.997
3GRSqlALWISqLeNncZMbpX	4aoWQU2gSUjl4AZeCPSo1b	3	Mean It	85	232853	0.746	0.45	7	-8.543	1	0.0872	0.0407	0	0.172	0.336	95.998
1VJwtWR6z7SpZRwipI12be	54tInqO543zy0Y5F2VsUQI	3	Candy	85	190920	0.689	0.516	8	-5.857	1	0.0444	0.513	0	0.163	0.209	124.876
4sWuPniHClkInYAnzXAYUF	5tdGgaiW18D6bjHFLhtblL	5	Camelot	85	148759	0.787	0.713	7	-5.252	1	0.401	0.0849	0	0.717	0.762	175.041
7eBqSVxrzQZtK2mmgRG6lC	7naY6j4wcgUxfHB98G79CW	5	Murder On My Mind	85	268434	0.759	0.73	0	-7.985	0	0.0516	0.145	3.06e-06	0.11	0.74	115.007
6K4t31amVTZDgR3sKmwUJJ	79dL7FLiJFOO0EoehUHQBv	6	The Less I Know The Better	85	216320	0.64	0.74	4	-4.083	1	0.0284	0.0115	0.00678	0.167	0.785	116.879
2bPtwnrpFNEe8N7Q85kLHw	4YQQS1DM9JskregbISv1dq	2	Combatchy (feat. MC Rebecca)	85	157600	0.826	0.73	1	-3.032	1	0.0809	0.383	0.000374	0.0197	0.605	150.134
4lKuzrdZrJuCAedbIslF3A	6kMwu0LljP1LlrzpQPlvvQ	2	SENTADÃO	85	143448	0.68	0.869	6	-1.94	1	0.0589	0.178	0	0.223	0.924	173.997
40rXWke6SnXiGkSmaT8ZUr	7f6r6ijWtMJ0QYydwuCYvH	2	Fantasía	85	175187	0.695	0.719	2	-5.938	1	0.0903	0.227	0.000171	0.0884	0.781	180.074
5099x34vBakWpGkHourFxP	1Db95k6t4rCPHSmdfsTeDl	2	Qué Pena	85	212711	0.635	0.661	11	-6.425	0	0.364	0.102	0	0.336	0.858	126.15
6XHVuErjQ4XNm6nDPVCxVX	1BfLzaTFI5qKsAAk0Ae6aV	2	No Guidance (feat. Drake)	85	260640	0.698	0.454	1	-6.756	0	0.151	0.123	0	0.155	0.137	92.932
58wyJLv6yH1La9NIZPl3ne	0MGcjBIFcL2qaCrgGjIGFb	2	Can We Kiss Forever?	85	187932	0.522	0.128	4	-18.717	1	0.0357	0.894	0.026	0.0941	0.124	109.986
0RDgqtvOHLwcI6yz9bjsZV	1faqBAWocW4ZOe0OFjudGw	2	Perreo en La Luna	85	218587	0.711	0.757	1	-4.188	0	0.29	0.268	0	0.367	0.724	174.013
6CcJMwBtXByIz4zQLzFkKc	0S0KGZnfBGSIssfF54WSJh	4	i love you	85	291796	0.421	0.131	0	-18.435	1	0.0382	0.952	0.00453	0.109	0.12	137.446
7hDVYcQq6MxkdJGweuCtl9	7fRrTyKvE4Skh93v97gtcU	4	ocean eyes	85	200379	0.511	0.363	4	-7.65	0	0.041	0.816	0.0317	0.084	0.169	144.892
41zXlQxzTi6cGAjpOXyLYH	7fRrTyKvE4Skh93v97gtcU	4	idontwannabeyouanymore	85	203569	0.483	0.412	7	-8.461	1	0.0402	0.737	0	0.116	0.247	170.163
7hpJ9tATWb2vztlq99hERP	4x1U4pmSekLejbWCRI0SES	4	Maniac	85	185787	0.623	0.647	8	-5.438	1	0.04	0.00122	0	0.354	0.522	107.987
09IStsImFySgyp0pIQdqAc	7nEiwcUSwycvC77kZ9ub7c	3	The Middle	84	184732	0.753	0.657	7	-3.061	1	0.0449	0.171	0	0.112	0.437	107.01
5N5k9nd479b1xpDZ4usjrg	2tpWgbBdzjkaJVJzR4T8y1	3	Promises (with Sam Smith)	84	213309	0.781	0.768	11	-5.991	1	0.0394	0.0119	4.91e-06	0.325	0.486	123.07
4h8VwCb1MTGoLKueQ1WgbD	1s9tU91VJt4sU5owi29GD3	3	Wake Me Up	84	247427	0.532	0.783	2	-5.697	1	0.0523	0.0038	0.0012	0.161	0.643	124.08
0E9ZjEAyAwOXZ7wJC0PD33	1c79SozES9Eb3Lzf9KVaIa	3	In My Mind	84	184560	0.694	0.77	6	-5.335	1	0.149	0.176	1.1e-05	0.118	0.163	125.905
1sviDBcAqVOxMXq4xITVEs	2epUYHJteejHG4trbc8drd	3	Que Calor (feat. J Balvin & El Alfa)	84	169998	0.795	0.885	8	-4.13	1	0.0713	0.0375	0.00638	0.292	0.46	126.037
0hVXuCcriWRGvwMV1r5Yn9	3oIFxDIo2fwuk4lwCmFZCx	3	I Don't Care (with Justin Bieber)	84	219947	0.798	0.675	6	-5.041	1	0.0442	0.0912	0	0.0894	0.842	101.956
6fTt0CH2t0mdeB2N9XFG5r	4IRiXE5NROxknUSAUSjMoO	3	Panini	84	114893	0.703	0.594	5	-6.146	0	0.0752	0.342	0	0.123	0.475	153.848
6WkJ2OK163XXS2oARUC9JM	2J2f6vGACFrRghO1Ki74BE	3	Dancin (feat. Luvli) - Krono Remix	84	198053	0.72	0.741	10	-6.529	0	0.0287	0.101	1.41e-05	0.289	0.357	119.896
322tcqPhma7F6hfCeLisx0	60sI3iRfHfu7YpcTpZ29W1	3	fuck, i'm lonely (with Anne-Marie) - from “13 Reasons Why: Season 3”	84	198973	0.806	0.558	9	-6.46	1	0.0683	0.482	0	0.0618	0.678	95.016
0JQ5MbyriK6ruD3t6RZ7ix	2pJXQvY0YeDvVJ9gMU9G7j	3	Never Seen The Rain	84	200742	0.672	0.464	6	-5.624	0	0.037	0.43	0	0.284	0.271	92.069
1rfofaqEpACxVEHIZBJe6W	2vD3zSQr8hNlg0obNel4TE	3	Havana (feat. Young Thug)	84	217307	0.765	0.523	2	-4.333	1	0.03	0.184	3.56e-05	0.132	0.394	104.988
1HNkqx9Ahdgi1Ixy2xkKkL	1xn54DMo2qIqBuMqHtUsFd	3	Photograph	84	258987	0.614	0.379	4	-10.48	1	0.0476	0.607	0.000464	0.0986	0.201	107.989
78QR3Wp35dqAhFEc2qAGjE	2yXnY2NiaZk9QiJJittS81	3	Drip Too Hard (Lil Baby & Gunna)	84	145543	0.897	0.662	1	-6.903	0	0.292	0.0852	0	0.534	0.389	112.511
2iUXsYOEPhVqEBwsqP70rE	2D0Hi3Jj6RFnpWDcSa0Otu	3	Youngblood	84	203418	0.596	0.854	7	-5.114	0	0.463	0.0169	0	0.124	0.152	120.274
4kV4N9D1iKVxx1KLvtTpjS	2fYhqwDWXjbpjaIJPEfKFw	3	break up with your girlfriend, i'm bored	84	190440	0.726	0.554	5	-5.29	0	0.0917	0.0421	0	0.106	0.335	169.999
7MXVkk9YMctZqd1Srtv4MB	2ODvWsOgouMbaA5xf0RkJe	3	Starboy	84	230453	0.678	0.588	7	-7.015	1	0.276	0.141	6.35e-06	0.137	0.486	186.005
7xapw9Oy21WpfEcib2ErSA	63MKT9hwmiMFFdFp5SdB1p	3	Mistletoe	84	182947	0.658	0.56	6	-9.049	0	0.0467	0.498	0	0.0794	0.854	161.994
0Ryd8975WihbObpp5cPW1t	3zVB99XMdbP9HTVNg0GJwV	3	boyfriend (with Social House)	84	186107	0.4	0.795	10	-3.731	0	0.461	0.119	0	0.159	0.702	190.097
0d2iYfpKoM0QCKvcLCkBao	7pkLXlFdpQDfmHujT2AbBK	3	Eastside (with Halsey & Khalid)	84	173800	0.56	0.68	6	-7.648	0	0.321	0.555	0	0.116	0.319	89.391
7GX5flRQZVHRAGd6B4TmDO	733e1ZfktLSwj96X5rsMeE	3	XO Tour Llif3	84	182707	0.732	0.75	11	-6.366	0	0.231	0.00264	0	0.109	0.401	155.096
58q2HKrzhC3ozto2nDdN4z	4KdtEKjY3Gi0mKiSdy96ML	3	I Like It	84	253390	0.816	0.726	5	-3.998	0	0.129	0.099	0	0.372	0.65	136.048
7KXjTSCq5nL1LoYtL7XAwS	4eLPsYPBmXABThSJ821sqY	3	HUMBLE.	84	177000	0.908	0.621	1	-6.638	0	0.102	0.000282	5.39e-05	0.0958	0.421	150.011
3a1lNhkSLSkpJE4MSHpDu9	5s0rmjP8XOPhP6HhqOhuyC	3	Congratulations	84	220293	0.63	0.804	6	-4.183	1	0.0363	0.215	0	0.253	0.492	123.146
6LsAAHotRLMOHfCsSfYCsz	1J2BrRxtQjVUa7X9Ne99xD	3	If I Can't Have You	84	190800	0.692	0.809	2	-4.198	1	0.0602	0.524	0	0.147	0.864	123.911
3XF5xLJHOQQRbWya6hBp7d	0S0KGZnfBGSIssfF54WSJh	3	you should see me in a crown	84	180953	0.678	0.533	4	-10.485	1	0.186	0.462	0.219	0.139	0.323	150.455
4bl1HBZliBuYpFZjWgefE4	52u4anZbHd6UInnmHRFzba	5	Peta (feat. Meek Mill)	84	198849	0.778	0.573	10	-7.339	0	0.251	0.015	0	0.464	0.269	140.114
6klLvorLoo1sxvZcjJIY8I	1nzUj7VkiaytMmf2KrhK2L	5	Make No Sense	84	148630	0.876	0.733	10	-4.478	0	0.333	0.0208	0	0.0999	0.962	154.904
6uJONCdr2rC65BNmCnTBWK	1Sf8GsXG32t0jNrX11xqWx	5	GANG GANG	84	244761	0.859	0.6	7	-4.63	0	0.301	0.071	0	0.353	0.568	123.017
5hVghJ4KaYES3BFUATCYn0	5zi7WsKlIiUXv09tbGLKsE	5	EARFQUAKE	84	190067	0.554	0.498	9	-8.866	1	0.0685	0.23	5.98e-06	0.795	0.413	79.635
6uFn47ACjqYkc0jADwEdj1	26ztFK3E69j5THJQdyxC5w	5	Pop Out (feat. Lil Tjay)	84	166560	0.772	0.639	1	-7.119	1	0.467	0.15	0	0.0698	0.261	168.112
3wwo0bJvDSorOpNfzEkfXx	5wi0oKiF99ZVACf6oTTsp2	5	Let Me Know (I Wonder Why Freestyle)	84	215381	0.635	0.537	7	-7.895	0	0.0832	0.172	0	0.418	0.383	125.028
0c7K73roy6RW4ebDkf4yGh	2iPZkrN305Ow3wO0LL90Cg	5	VALENTINO	84	179133	0.745	0.718	9	-4.853	0	0.183	0.197	0	0.134	0.539	151.097
5bvnqVuq7UFl0txSlHpsfS	1U1uqmoe8hdbqZWRqd23li	5	Loyal (feat. Drake)	84	197973	0.866	0.53	0	-6.347	0	0.0495	0.517	0.00159	0.0946	0.203	104.952
7AQim7LbvFVZJE3O8TYgf2	5VdyJkLe3yvOs0l4xXbWp0	5	Fuck Love (feat. Trippie Redd)	84	146520	0.797	0.533	0	-9.74	0	0.0412	0.0172	0.000152	0.103	0.329	131.036
4z6wo6PJG4Fve45OXK6D9m	0CPLMVp7rMi3BkzAMve96K	5	Infeliz	84	221103	0.713	0.798	1	-3.147	1	0.219	0.366	4.3e-06	0.246	0.721	176.073
7rknFhrVDyxzTJkPSf7LoW	2t2aNgqXTXuCh9fqT05g9U	5	No Me Conoce - Remix	84	307547	0.794	0.79	10	-3.855	0	0.0599	0.144	0	0.0893	0.577	91.984
4u7EnebtmKWzUH433cf5Qv	1GbtB4zTqAsyfZEsm1RZfx	6	Bohemian Rhapsody - 2011 Mix	84	354320	0.414	0.404	0	-9.928	0	0.0499	0.271	0	0.3	0.224	71.105
6K5BsR04ijf3FHNzjbaagD	75Y4sJ1vwZfEivbsKPzAx6	2	Si Se Da - Remix	84	332240	0.817	0.672	11	-5.612	0	0.299	0.441	0	0.13	0.774	93.999
1Ej96GIBCTvgH7tNX1r3qr	3TgOrQ3p23Af8zSsxK8fdX	2	Otro Trago	84	225933	0.747	0.7	0	-4.669	1	0.341	0.136	0.000167	0.11	0.62	176.036
7g8YaUQABMal0zWe7a2ijz	6stPNzjz40FWTiwlOR98Lp	2	Pa Mí - Remix	84	360960	0.688	0.62	11	-8.029	0	0.22	0.753	5.27e-06	0.158	0.727	170.018
5F8ffc8KWKNawllr5WsW0r	2zFE4Ze2DjkeZBMbbT4Mgj	1	Surtada - Remix Brega Funk	84	152784	0.832	0.55	5	-7.026	0	0.0587	0.249	8.17e-06	0.182	0.881	154.064
3swc6WTsr7rl9DqQKQA55C	6trNtQUgC8cgbWcqoMYkOR	4	Psycho (feat. Ty Dolla $ign)	83	221440	0.75	0.56	8	-8.094	1	0.105	0.546	0	0.111	0.459	140.06
3tv697PZNnaQN0Mn2zGhS5	17jzAujoXwIF60ojew1yHU	1	A Gente Fez Amor - Ao Vivo	84	237517	0.793	0.937	8	-2.44	0	0.0336	0.366	4.27e-06	0.962	0.827	134.012
3yNZ5r3LKfdmjoS3gkhUCT	6lMlX68jJrx67hiCqdiDvW	3	bad guy (with Justin Bieber)	83	194840	0.67	0.453	0	-11.265	1	0.295	0.252	0.33	0.117	0.68	135.055
0qc4QlcCxVTGyShurEv1UU	41S9bfzXTSGK4HU2mp5qXH	3	Post Malone (feat. RANI)	83	174444	0.59	0.642	7	-3.87	1	0.122	0.0771	0	0.105	0.651	107.356
5icOoE6VgqFKohjWWNp0Ac	6NHS3hV16MZyfcp0nSHdrd	3	Here With Me	83	156347	0.791	0.565	5	-3.933	0	0.0439	0.0623	0	0.156	0.181	99.961
4w8niZpiMy6qz1mntFA5uM	0ZHyvPke0EcVt6rYA8Ins3	3	Taki Taki (with Selena Gomez, Ozuna & Cardi B)	83	212500	0.842	0.801	8	-4.167	0	0.228	0.157	4.82e-06	0.0642	0.617	95.881
6RUKPb4LETWmmr3iAEQktW	4JPguzRps3kuWDD5GS6oXr	3	Something Just Like This	83	247160	0.617	0.635	11	-6.769	0	0.0317	0.0498	1.44e-05	0.164	0.446	103.019
7pWK1kMgHy5lNNiIfuRbkP	3YD1qyD9KPFzzTK1UC1Gvo	3	Used To Love (with Dean Lewis)	83	236765	0.651	0.693	4	-4.722	1	0.0375	0.458	0	0.335	0.392	118.97
7Feaw9WAEREY0DUOSXJLOM	0xbuJLlb5afBcmCpdOaszR	3	Summer Days (feat. Macklemore & Patrick Stump of Fall Out Boy)	83	163805	0.661	0.723	5	-6.976	0	0.0566	0.179	1.23e-05	0.14	0.316	113.778
5itOtNx0WxtJmi1TQ3RuRd	4PwXTHenZZx7ebgsnTM65K	3	Giant (with Rag'n'Bone Man)	83	229184	0.807	0.887	1	-4.311	0	0.0361	0.016	0.000503	0.0811	0.606	122.015
0uUNN1nSoUx1A4fkDCWDQ7	2XvFk3xrG7dV6GhqcJSQHX	3	So Am I	83	183027	0.682	0.656	6	-4.67	1	0.0435	0.0737	0	0.353	0.607	130.089
4n7jnSxVLd8QioibtTDBDq	1bcvtuHyO79DNAOOhHEkEm	3	On My Way	83	193798	0.509	0.689	1	-4.929	0	0.102	0.0209	0	0.301	0.297	170.087
0rIAC4PXANcKmitJfoqmVm	2r6BEK0wzXbL8JHyCkeJkG	3	Motivation	83	193837	0.599	0.887	4	-3.967	1	0.0984	0.0192	1.21e-06	0.3	0.881	170.918
7w87IxuO7BDcJ3YUqCyMTT	7Kmmw7Z5D2UD5MVwdm10sT	3	Pumped Up Kicks	83	239600	0.733	0.71	5	-5.849	0	0.0292	0.145	0.115	0.0956	0.965	127.975
2ekn2ttSfGqwhhate0LSR0	01sfgrNbnnPUEyz6GZYlt9	3	New Rules	83	209320	0.762	0.7	9	-6.021	0	0.0694	0.00261	1.56e-05	0.153	0.608	116.073
314ZkcV7oLWG8yWE7LABvH	0ZI6Q1QJSYdeEQPvKzX1XR	3	Make It Right (feat. Lauv)	83	226321	0.584	0.685	7	-7.811	1	0.425	0.0304	0	0.189	0.345	97.551
2gMXnyrvIjhVBUZwvLZDMP	2wiPF3m0ylst0JSk1IvZL8	3	Before You Go	83	215107	0.459	0.575	3	-4.858	1	0.0573	0.604	0	0.0885	0.183	111.881
3QGsuHI8jO1Rx4JWLUh9jd	1ne2D0NxoGyZd31gAM4HNd	3	Treat You Better	83	187973	0.444	0.819	10	-4.078	0	0.341	0.106	0	0.107	0.747	82.695
2qT1uLXPVPzGgFOx4jtEuo	3tx8gQqWbGwqIGZHqDNrGe	3	no tears left to cry	83	205920	0.699	0.713	9	-5.507	0	0.0594	0.04	3.11e-06	0.294	0.354	121.993
2BgEsaKNfHUdlh97KmvFyo	7lPoGKpCGgdKFAxpudhAH5	3	2002	83	186987	0.697	0.683	1	-2.881	0	0.117	0.0372	0	0.137	0.603	96.133
1wjzFQodRWrPcQ0AnYnvQ9	7l6fTSFvlumnPFpOSrbnDV	3	I Like Me Better	83	197437	0.752	0.505	9	-7.621	1	0.253	0.535	2.55e-06	0.104	0.419	91.97
0FZ4Dmg8jJJAPJnvBIzD9z	5n1GSzC1Reao29ScnpLYqp	3	ZEZE	83	228760	0.861	0.603	8	-5.788	0	0.176	0.0521	0	0.0924	0.504	98.043
08mG3Y1vljYA6bvDt4Wqkj	6mUdeDZCsExyJLMdAfDuwh	3	Back In Black	83	255493	0.31	0.7	9	-5.678	1	0.047	0.011	0.00965	0.0828	0.763	188.386
2WfaOiMkCvy7F5fcp2zZ8L	1ER3B6zev5JEAaqhnyyfbf	3	Take on Me	83	225280	0.573	0.902	6	-7.638	0	0.054	0.018	0.00125	0.0928	0.876	84.412
3CRDbSIZ4r5MsZ0YwxuEkn	3cQO7jp5S9qLBoIVtbkSM1	3	Stressed Out	83	202333	0.734	0.637	4	-5.677	0	0.141	0.0462	2.29e-05	0.0602	0.648	169.977
5Z3GHaZ6ec9bsiI5BenrbY	6kf46HbnYCZzP6rjvQHYzg	3	Young Dumb & Broke	83	202547	0.798	0.539	1	-6.351	1	0.0421	0.199	1.66e-05	0.165	0.394	136.949
3bidbhpOYeV4knp8AIu8Xn	76FXHQhTuT4QMIxfL09gX8	3	Can't Hold Us - feat. Ray Dalton	83	258343	0.641	0.922	2	-4.457	1	0.0786	0.0291	0	0.0862	0.847	146.078
7COXchtUOMd6uIT6HvmRaI	13yMsBNa2femeWzhcDOqFw	3	i'm so tired...	83	162583	0.599	0.733	11	-7.058	1	0.203	0.176	0	0.242	0.534	102.211
1zi7xx7UVEFkmKfv06H8x0	40GMAhriYJRO1rsY4YdrZb	3	One Dance	83	173987	0.792	0.625	1	-5.609	1	0.0536	0.00776	0.00188	0.329	0.37	103.967
2G7V7zsVDxg1yRsu7Ew9RJ	1ATL5GLyefJaxhQzSPVrLX	3	In My Feelings	83	217925	0.835	0.626	1	-5.833	1	0.125	0.0589	6e-05	0.396	0.35	91.03
08bNPGLD8AhKpnnERrAc6G	1BmxOYHjQv1dKZRr13YRZM	3	FRIENDS	83	202621	0.626	0.88	9	-2.384	0	0.0504	0.205	0	0.128	0.534	95.079
75JFxkI2RXiU7L9VXzMkle	0RHX9XECH8IVI3LNgWDpmQ	3	The Scientist	83	309600	0.56	0.442	5	-7.224	1	0.0243	0.727	1.71e-05	0.11	0.212	146.448
2x0RZdkZcD8QRI53XT4GI5	6Ad1E9vl75ZB3Ir87zwXIJ	3	SOS (feat. Aloe Blacc)	83	157202	0.802	0.645	5	-6.181	0	0.0715	0.272	0	0.119	0.376	100.001
7fBv7CLKzipRk6EC6TWHOB	0P3oVJBFOv3TDXlYRhGL7s	3	The Hills	83	242253	0.58	0.565	0	-7.065	0	0.0488	0.0671	0	0.135	0.138	112.986
2RSHsoi04658QL5xgQVov3	3JfSxDfmwS5OeHPwLSkrfr	3	Bad Liar	83	260773	0.383	0.637	3	-6.993	1	0.0703	0.0722	0	0.368	0.0827	177.913
5FkoSXiJPKTNyYgALRJFhD	7Cw4LObzgnVqSlkuIyywtI	5	ORANGE SODA	83	129882	0.83	0.564	1	-7.822	1	0.235	0.177	0	0.128	0.107	85.042
07KXEDMj78x68D884wgVEm	52u4anZbHd6UInnmHRFzba	5	High Fashion (feat. Mustard)	83	220487	0.831	0.499	11	-8.442	0	0.114	0.269	0	0.3	0.511	97.956
735RSTb2xbtWbDtKD9XDYi	2tGRWs8mrUVyjgbMIQpWQN	5	Somebody	83	174333	0.63	0.671	6	-6.659	0	0.256	0.363	0	0.113	0.333	89.921
7tgjDlQsMR8RvkdlNCJA58	0tKX7BLXiiRgXUKYdJzjEz	5	6 Kiss	83	199437	0.687	0.449	2	-10.061	1	0.154	0.109	0	0.282	0.229	142.048
4IO8X9W69dIQe0EC5ALXhq	7xgzD7onYd1Pms93ZOtxxX	5	Immortal	83	254723	0.741	0.87	6	-3.494	0	0.503	0.00813	0	0.114	0.663	184.194
7LGWmZaoS7jZJ5tEi9EcDi	1Sf8GsXG32t0jNrX11xqWx	5	HAD ENOUGH (feat. Quavo & Offset)	83	157133	0.75	0.789	2	-4.578	1	0.108	0.253	0	0.129	0.673	147.957
7DcvwMAiqKJQD1rrdfxSDx	6p9Y1K9yu3ojyS8fBJXUnp	5	The London (feat. J. Cole & Travis Scott)	83	200107	0.796	0.586	4	-6.946	0	0.147	0.0247	0	0.132	0.179	97.981
5Z8HZM6iQMhhqyPcCGY5g9	1bnHPO4dKK7IjvgrtVBcQh	5	Hot (feat. Gunna)	83	193027	0.855	0.651	0	-8.044	0	0.235	0.063	0	0.0772	0.559	111.997
4xkOaSrkexMciUUogZKVTS	2cWBwpqMsDJC1ZUwz813lo	5	'Till I Collapse	83	297787	0.548	0.847	1	-3.237	1	0.186	0.0622	0	0.0816	0.1	171.447
4jvjzW7Hm0yK4LvvE0Paz9	52JymrguPgkmmwLaWIusst	5	Falling Down - Bonus Track	83	196400	0.669	0.574	4	-6.442	0	0.0286	0.0175	0.00294	0.146	0.273	120.013
4fj7e6Tc48Bmomwyz2Z2XC	0CUMVFalkFhZM6Xo0ErxLi	5	Te Quemaste	83	199091	0.729	0.773	0	-2.486	1	0.131	0.611	0.00106	0.287	0.718	176.053
7anSoGdgtmJTAPZBzcPhO6	6stPNzjz40FWTiwlOR98Lp	5	Cuaderno	83	286507	0.681	0.648	1	-5.021	0	0.38	0.524	0	0.104	0.687	172.019
4lzxJ4jCuFDXXGkE1LmpKR	76XsfdI0kGODDdhHAJKZi3	5	Verte Ir	83	267500	0.857	0.647	11	-4.152	0	0.0984	0.391	1.2e-06	0.0842	0.553	95.982
116H0KvKr2Zl4RPuVBruDO	0p0W4RXcnc59jgatcdZozO	5	MIA (feat. Drake)	83	210368	0.817	0.539	6	-6.349	0	0.0621	0.0141	0.000496	0.099	0.158	97.062
2zYzyRzz6pRmhPzyfMEC8s	10v912xgTZbjAtYfyKWJCS	6	Highway to Hell	83	208400	0.573	0.913	6	-4.793	0	0.132	0.0591	0.00173	0.156	0.422	115.715
5T8EDUDqKcs6OSOwEsfqG7	2yuTRGIackbcReLUXOYBqU	6	Don't Stop Me Now - 2011 Mix	83	209413	0.559	0.868	5	-5.276	1	0.17	0.0475	0.000176	0.776	0.609	156.295
2374M0fQpWi3dLnB54qaLX	62U7xIHcID94o20Of5ea4D	6	Africa	83	295893	0.671	0.373	9	-18.064	1	0.0323	0.257	7.95e-05	0.0481	0.732	92.717
1JSTJqkT5qHq8MDJnJbRE1	5W9OT0a5iZlBr83a9WMKFY	6	Every Breath You Take	83	253920	0.82	0.452	1	-9.796	1	0.0348	0.543	0.00294	0.0714	0.74	117.401
37ZJ0p5Jm13JPevGcx4SkF	0kBfgEilUFCMIQY5IOjG4t	6	Livin' On A Prayer	83	249293	0.532	0.887	0	-3.757	1	0.0335	0.0778	0.000214	0.294	0.795	122.511
60a0Rd6pjrkxjPbaKzXjfq	6hPkbAV3ZXpGZBGUvL6jVM	6	In the End	83	216880	0.556	0.864	3	-5.87	0	0.0584	0.00958	0	0.209	0.4	105.143
52okn5MNA47tk87PeZJLEL	1KOmHyNLuOe5YrPhD3Juuf	2	Let You Down	83	212120	0.662	0.714	5	-5.68	0	0.121	0.312	0	0.179	0.464	147.997
34gCuhDGsG4bRPIf9bb02f	1xn54DMo2qIqBuMqHtUsFd	2	Thinking out Loud	83	281560	0.781	0.445	2	-6.061	1	0.0295	0.474	0	0.184	0.591	78.998
1ToprX3cpBiXoAe5eNSk74	66o9dDjDduf6jpvZKzAXm4	2	Eleven	83	206361	0.701	0.396	4	-10.182	0	0.119	0.112	0.0209	0.223	0.115	129.004
4Clmg1g8n2yBYG13Z1oSdG	68hy2xnNgeo0dO0YOm4Th7	2	Baila Conmigo (feat. Kelly Ruiz)	83	189818	0.745	0.972	7	-3.506	1	0.0774	0.00903	0.465	0.297	0.556	128.031
059bcIhyc2SBwm6sw2AZzd	02XOoh8XrlCc466QkkjGk5	2	Te Vi	83	231848	0.877	0.777	1	-4.246	1	0.117	0.0446	3.46e-05	0.0863	0.706	102.02
684EjRHwNsZQ9hCQxL4NYL	28561uZztshyZSVG6ElL62	2	El Favor (with Nicky Jam & Sech, feat. Farruko, Zion & Lunay)	83	233113	0.747	0.647	9	-3.234	1	0.0737	0.113	0	0.112	0.478	87.988
2B94bbI1a4LyBpK1439oP7	2JRundp5dldujo6pVchZco	2	Cuerpo en Venta	83	254413	0.696	0.601	11	-5.749	1	0.302	0.161	0	0.0974	0.408	91.924
1LIqNVhaIgxXUt2eVoIQJ3	3YIUNL7qFE8NP3X3zaYSND	2	HP	83	184436	0.837	0.791	4	-3.157	0	0.0773	0.252	1.14e-06	0.188	0.618	91.98
7fODjB7BrQTGqh0hogW6XD	3TgOrQ3p23Af8zSsxK8fdX	2	Que Mas Pues - Remix	83	305962	0.648	0.661	11	-5.027	1	0.195	0.121	2.33e-06	0.12	0.813	113.363
3Yh9lZcWyKrK9GjbhuS0hR	4CA8GvVF7swZafg0zYh9qq	4	Good as Hell	83	159736	0.682	0.919	0	-3.18	0	0.0875	0.256	0	0.442	0.535	95.982
4QIo4oxwzzafcBWkKjDpXY	0S0KGZnfBGSIssfF54WSJh	4	xanny	83	243725	0.521	0.125	9	-17.832	1	0.239	0.751	0.00207	0.265	0.0528	111.554
3EPXxR3ImUwfayaurPi3cm	0YZLXTaHLcgl5UdtKDiUXD	4	Be Alright	83	196373	0.553	0.586	11	-6.319	1	0.0362	0.697	0	0.0813	0.443	126.684
69vToJ9BMbbLlFZo7k7A7B	6Vip5A5NmEazvKuxj6GLYf	4	You Are The Reason	83	204326	0.331	0.235	10	-7.7	1	0.0299	0.918	0	0.137	0.218	171.232
4Yxc55NX3tAXC2mHRAhtcW	5p3gSxNiXeYlPlztVAUjB2	4	All I Want - From "High School Musical: The Musical: The Series"	83	177323	0.376	0.43	0	-6.585	0	0.0328	0.0902	0	0.0912	0.129	77.599
3oDkdAySo1VQQG0ptV7uwa	6tkjU4Umpo79wwkgPMV3nZ	4	Lean Wit Me	83	175755	0.665	0.651	1	-5.515	1	0.156	0.0414	0	0.0896	0.237	163.935
50kpGaPAhYJ3sGmk6vplg0	6Fr2rQkZ383FcMqFyT7yPr	4	Love Yourself	83	233720	0.609	0.378	4	-9.828	1	0.438	0.835	0	0.28	0.515	100.418
3M9Apu4OZfylLTFKvgEtKa	0efvl0HsK2xxttk4IVOJry	3	Ritual	82	198996	0.647	0.726	3	-4.389	0	0.0552	0.157	0	0.0844	0.767	114.996
6RyuoOJXNzlVWpfC5xQyeI	6pEhppkTzrKKGkQw4fNqOD	3	Alocao (With Bad Gyal)	82	209320	0.673	0.752	11	-4.705	0	0.0567	0.214	1.53e-06	0.106	0.699	178.005
3mQ6SLdxxaL52Yte7KF2Ks	7ynTaSXD9esXkgY0GG8UFd	3	Morado	82	200667	0.881	0.696	11	-3.838	0	0.0797	0.137	4.13e-05	0.0927	0.781	97.002
32OlwWuMpZ6b0aN2RZOeMS	3vLaOYCNCzngDf8QdBg2V1	3	Uptown Funk	82	269667	0.856	0.609	0	-7.223	1	0.0824	0.00801	8.15e-05	0.0344	0.928	114.988
5aUSEPNd3m5xliFK4pn5mU	3wpdeV1FZfiEnelZSfAFp4	3	Good Thing (with Kehlani)	82	210901	0.693	0.564	1	-3.857	0	0.0378	0.399	0	0.0409	0.574	185.913
0rFQ5cKYJ9WtHSKp9sxVYt	4YEes0AZtUChqtLBwaQLzh	3	Heartless (feat. Morgan Wallen)	82	169227	0.764	0.555	11	-6.414	1	0.0604	0.275	0	0.0824	0.255	111.004
0tBbt8CrmxbjRP0pueQkyU	5gQZvWM1o8NkQndueJtZcP	3	Wolves	82	197993	0.724	0.804	11	-4.614	0	0.0448	0.124	0	0.204	0.306	124.987
0kzw2tRyuL9rzipi5ntlIy	2bVVESepVYULITlO6mtmoy	3	Shut Up and Dance	82	199080	0.578	0.866	1	-3.804	1	0.0619	0.00701	0	0.257	0.619	128.038
6cjSh516BbrNUs213jDAGm	669dgT2kmrAMrrPaEEHWyE	3	Graduation (with Juice WRLD)	82	177847	0.731	0.65	0	-5.286	1	0.271	0.107	0	0.124	0.605	154.968
4HlFJV71xXKIGcU3kRyttv	1CwXS6MAz8Wo7K4TzW9iuR	3	Hey, Soul Sister	82	216773	0.673	0.886	1	-4.44	0	0.0431	0.185	0	0.0826	0.795	97.012
76cy1WJvNGJTj78UqeA5zr	01sfgrNbnnPUEyz6GZYlt9	3	IDGAF	82	217947	0.836	0.544	7	-5.975	1	0.0943	0.0403	0	0.0824	0.51	97.028
7JJmb5XwzOO8jgpou264Ml	3wBabo4pmzsYjALMSKY7Iq	3	There's Nothing Holdin' Me Back	82	199440	0.866	0.813	11	-4.063	0	0.0554	0.38	0	0.0779	0.969	121.998
5cF0dROlMOK5uNZtivgu50	0mZIUXje90JtHxPNzWsJNR	3	Attention	82	208787	0.775	0.613	3	-4.586	0	0.0542	0.109	2.33e-05	0.134	0.797	100.066
0KKkJNfGyhkQ5aFogxQAPU	4PgleR09JVnm3zY1fW3XBA	3	That's What I Like	82	206693	0.853	0.56	1	-4.961	1	0.0406	0.013	0	0.0944	0.86	134.066
5JEx7HbmvHQQswJCsoo9rA	4bLCVUEB9YWKEeaJm8FfqQ	3	Close To Me (with Diplo) (feat. Swae Lee)	82	182623	0.574	0.758	1	-5.029	0	0.0621	0.0969	0	0.395	0.492	144.111
6Nle9hKrkL1wQpwNfEkxjh	6OGzmhzHcjf0uN9j7dYvZH	3	Chanel	82	210285	0.776	0.503	0	-5.732	0	0.237	0.874	0	0.112	0.473	110.134
7o2CTH4ctstm8TNelqjb51	3I9Z1nDCL4E0cP62flcbI5	3	Sweet Child O' Mine	82	354520	0.454	0.91	6	-7.766	1	0.0446	0.0852	0.0988	0.116	0.63	125.116
3B54sVLJ402zGa6Xm4YGNe	4c2p3TdN7NcQfCXyueCNnC	3	Unforgettable	82	233902	0.726	0.769	6	-5.043	1	0.123	0.0293	0.0101	0.104	0.733	97.985
62vpWI1CHwFy7tMIcSStl8	7viNUmZZ8ztn2UB4XB3jIL	3	No Role Modelz	82	292987	0.696	0.521	10	-8.465	0	0.332	0.302	0	0.0565	0.458	100
421eObjg0DTm2qajJl5OJm	4M07HWIlZr7zoXoxDHR5mz	3	Into the Unknown - Panic! At The Disco Version	82	189132	0.456	0.828	1	-6.225	1	0.077	0.0244	0	0.21	0.313	116.719
1EzrEOXmMH3G43AXT1y7pA	04G0YylSjvDQZrjOfE5jA5	3	I'm Yours	82	242187	0.686	0.457	11	-8.322	1	0.0468	0.595	0	0.105	0.718	150.953
6YfTl5YupXOQBKiJJLrxcw	0wb2DaHDhLUUS5RRFa26U9	5	Death (feat. DaBaby)	82	172196	0.802	0.82	10	-5.969	0	0.146	0.0579	0	0.149	0.613	164.005
3RZftiuTcLOqpsd8ZlwNhr	24jAbLMFzCTlIv3kQ94HwK	5	Hop Off A Jet (feat. Travis Scott)	82	174067	0.823	0.476	7	-8.951	1	0.242	0.0115	0	0.213	0.353	144.998
2Xo3rLHjXfdb4avN68aQyi	2TBJtc64Y76xWs98Mtko07	5	BEST ON EARTH (feat. BIA)	82	160720	0.568	0.764	5	-3.465	0	0.255	0.217	0	0.0931	0.625	179.985
40mjsnRjCpycdUw3xhS20g	1Sf8GsXG32t0jNrX11xqWx	5	GATTI	82	181145	0.594	0.676	2	-5.808	1	0.344	0.135	0	0.163	0.472	143.477
3XiNC94b4Tq1xwv70sQJGN	49K82qcZN4u109e6Zw8io1	5	Sanguine Paradise	82	243976	0.729	0.603	6	-6.736	0	0.0666	0.0948	0	0.113	0.207	134.972
2zjGJ0dChMR0KxBZS15aqo	2WrNHOba5u6P9S9xEboaUy	5	Baguettes in the Face (feat. NAV, Playboi Carti & A Boogie Wit da Hoodie)	82	174100	0.883	0.525	2	-8.054	0	0.0633	0.189	0	0.0971	0.312	99.978
0RLLvYBopDwooCyvnTwgYu	1bCBZ8LedqwVYOLDLrRbbY	5	F.N	82	224000	0.567	0.515	6	-10.265	0	0.247	0.354	0	0.078	0.321	120.1
7ycWLEP1GsNjVvcjawXz3z	3MATDdrpHmQCmuOcozZjDa	5	Praise The Lord (Da Shine) (feat. Skepta)	82	205040	0.85	0.569	5	-8.152	0	0.136	0.0609	0.0816	0.1	0.294	80.02
1ThmUihH9dF8EV08ku5AXN	0z0z4DcXhHiobX5ZKAw8Qn	5	Faucet Failure	82	145627	0.935	0.552	10	-9.373	0	0.335	0.111	0	0.0952	0.615	99.993
4SDgTLDYrJ2UrHbkRkg7MD	71BrrQxz8mZAneNSDE9Lov	5	Panini - DaBaby Remix	82	151040	0.717	0.598	5	-5.613	0	0.0809	0.22	0	0.122	0.496	153.905
1tpbAGsGpZee5jDHMcLrUJ	3RWeME5ryDw9wxO99OoDgP	5	Bellaquita	82	204787	0.584	0.698	8	-3.961	1	0.106	0.09	6.87e-05	0.171	0.765	166.047
5vdp5UmvTsnMEMESIF2Ym7	58alCatewkjNm9IM1Ucj67	6	Another One Bites The Dust - Remastered 2011	82	214653	0.933	0.528	5	-6.472	0	0.161	0.112	0.312	0.163	0.754	109.967
40riOy7x9W7GXjyGp4pjAv	2widuo17g5CEC66IbzveRu	6	Hotel California - 2013 Remaster	82	391376	0.579	0.508	2	-9.484	1	0.027	0.00574	0.000494	0.0575	0.609	147.125
6b2oQwSGFkzsMtQruIWm2p	6400dnyeDyD2mIFHfkwHXN	6	Creep	82	238640	0.515	0.43	7	-9.935	1	0.0369	0.0102	0.000141	0.129	0.104	91.841
5FVd6KXrgO9B3JPmC8OPst	78bpIziExqiI9qztvNFlQu	6	Do I Wanna Know?	82	272394	0.548	0.532	5	-7.596	1	0.0323	0.186	0.000263	0.217	0.405	85.03
7x9nXsowok1JszkVztI5NI	2ZoLcA4NMOjJGFKeANgNpF	2	Writing on the Wall (feat. Post Malone & Cardi B)	82	201271	0.773	0.836	9	-2.326	0	0.153	0.283	2.1e-05	0.0828	0.497	112.01
4VgYtXCVJ7IbWAZ5ryfvEQ	6sTdi5hrN3uFhARaqbikjG	2	Muévelo	82	194892	0.595	0.807	7	-2.409	1	0.0489	0.416	1.41e-05	0.565	0.919	188.081
1GBLO0NFODuL31A5fgw0uR	3YIUNL7qFE8NP3X3zaYSND	2	No Se Me Quita (feat. Ricky Martin)	82	219933	0.864	0.869	7	-2.963	1	0.139	0.146	0	0.063	0.853	99.988
2EEmzqzM70CybVspgM7YRT	5LiT3OZKgkgEeInFxUEObJ	2	La Boca - Remix	82	188468	0.691	0.773	11	-3.812	0	0.0355	0.236	0	0.329	0.85	92.992
5W83ErFkO3aKAIS1WMi6u0	6owzcG80ifZRDApCpzJYK1	2	Secreto	82	258800	0.807	0.803	11	-4.156	1	0.126	0.602	0.00853	0.136	0.706	91.987
6TqXcAFInzjp0bODyvrWEq	6KT8x5oqZJl9CcnM66hddo	2	Talk (feat. Disclosure)	82	197573	0.901	0.4	0	-8.575	1	0.126	0.051	0	0.0599	0.346	135.984
5IaHrVsrferBYDm0bDyABy	0yd01cU78rnlFXq6vRxPSR	2	Taste (feat. Offset)	82	232959	0.884	0.559	0	-7.442	1	0.12	0.0236	0	0.101	0.342	97.994
0TlLq3lA83rQOYtrqBqSct	1ATL5GLyefJaxhQzSPVrLX	2	Nonstop	82	238614	0.912	0.412	7	-8.074	1	0.124	0.0164	0.013	0.104	0.422	154.983
4o1DxRjMCHDwBiOKv88rOl	3dwf8z3LfHFTlAHiyrcGzb	2	B11 (feat. Myke Towers)	82	251929	0.759	0.717	0	-5.014	1	0.115	0.0672	0.000455	0.131	0.195	99.946
4BCPItsB94KDLuERZT3aNM	2v2CUuzRvsBNb4c5Rj8nqi	2	Fresa	82	165646	0.781	0.866	5	-3.493	0	0.0867	0.216	0	0.101	0.864	95.993
3f5lA8nnc4YYF1qf78WpHw	58NQUIHQRJnXyBUeGtG8KG	2	Ella Quiere Beber - Remix	82	219357	0.75	0.665	8	-3.083	1	0.124	0.265	0	0.0515	0.697	95.239
15JINEqzVMv3SvJTAXAKED	47BiFcV59TQi2s9SkBo2pb	2	Love The Way You Lie	82	263373	0.749	0.925	10	-5.034	1	0.227	0.241	0	0.52	0.641	86.989
0nJW01T7XtvILxQgC5J7Wh	58ufpQsJ1DS5kq4hhzQDiI	2	When I Was Your Man	82	213827	0.612	0.28	0	-8.648	1	0.0434	0.932	0	0.088	0.387	72.795
6lruHh1jF7ezgbLv72xYmf	0tzusAckn6CYqaCBRJHiAh	4	FML	82	223000	0.822	0.575	5	-5.95	1	0.0934	0.113	0	0.106	0.616	100.087
152lZdxL1OR0ZMW6KquMif	6kf46HbnYCZzP6rjvQHYzg	4	Location	82	219080	0.736	0.449	1	-11.462	0	0.425	0.33	0.000162	0.0898	0.326	80.126
3Tc57t9l2O8FwQZtQOvPXK	0S0KGZnfBGSIssfF54WSJh	4	my strange addiction	82	179889	0.939	0.305	8	-10.952	0	0.354	0.35	0.000169	0.105	0.563	100.029
4CxFN5zON70B3VOPBYbd6P	16mjtcKPxpQ4ajFHmJ0hJC	4	you were good to me	82	219147	0.561	0.0848	2	-15.099	1	0.0404	0.913	2.62e-05	0.112	0.206	102.128
1xzBco0xcoJEDXktl7Jxrr	15Id9Jrqab8IwHFirdrrLp	4	Mo Bamba	82	183907	0.729	0.625	4	-5.266	1	0.0315	0.194	0.00986	0.248	0.261	146.034
4GGSmoTmc5LClrowB4SmEw	3oFteG1YXJg2LS6R7Ge2yB	4	Mind Is A Prison	82	162034	0.636	0.661	5	-5.217	0	0.05	0.527	0	0.18	0.694	151.148
6fenHIxXuuzKB55wY4WCHP	2T0NPRcdhIt71ifDWm328R	1	God Is A Dancer (with Mabel)	82	168125	0.774	0.747	1	-3.908	0	0.082	0.0241	6.11e-06	0.342	0.833	119.964
1uryupl9hqVZYurJwH4G9k	2s2XNO2C38JP3NVOp8zkm4	1	3 Batidas - Ao Vivo	82	157186	0.552	0.709	8	-5.435	1	0.129	0.611	0	0.763	0.528	117.582
4PkIDTPGedm0enzdvilLNd	5AXNN75OmMjFrwst6ExNPx	3	Sixteen	81	201072	0.669	0.801	8	-5.445	1	0.136	0.268	0	0.0594	0.541	109.919
4NSW0Km5ZG60L8FthUebPJ	6gPZmYBSipug1asf4zu9jh	3	What I Like About You (feat. Theresa Rex)	81	220396	0.46	0.8	1	-3.584	1	0.05	0.289	6.16e-06	0.121	0.553	102.46
5N4erncE7kuUccm7zEmwzk	429B3se6xtZuvblNnS2iy7	3	Electricity (with Dua Lipa)	81	238173	0.588	0.67	0	-6.439	1	0.0473	0.0104	3.33e-06	0.338	0.505	118.159
3ebXMykcMXOcLeJ9xZ17XH	2v9rQe4F8fVSh5v8bAq0jF	3	Scared to Be Lonely	81	220883	0.584	0.54	1	-7.786	0	0.0576	0.0895	0	0.261	0.195	137.972
0lYBSQXN6rCTvUZvg9S0lU	02sEJTj1sye1JaqxqpcSCp	3	Let Me Love You	81	205947	0.649	0.716	8	-5.371	1	0.0349	0.0863	2.63e-05	0.135	0.163	99.988
09CtPGIpYB4BrO8qb1RGsF	6Fr2rQkZ383FcMqFyT7yPr	3	Sorry	81	200787	0.654	0.76	0	-3.669	0	0.045	0.0797	0	0.299	0.41	99.945
0U6bQIAh6MCGo1xjbIIx2S	7FTzcNdsKhMe53orWXsai8	3	Instagram	81	184558	0.765	0.906	8	-2.097	0	0.0965	0.125	0	0.423	0.95	96.071
14sOS5L36385FJ3OL8hew4	6nAjd2MlBY1f1mNu6BsWLO	3	Happy Now	81	211362	0.693	0.575	9	-6.998	1	0.0801	0.374	0	0.252	0.492	117.999
6Pgkp4qUoTmJIPn7ReaGxL	1m3mf7xkXIwssVriaaTjOS	3	Without You (feat. Sandro Cavazza)	81	181673	0.662	0.858	2	-4.844	1	0.0428	0.00163	0	0.0456	0.295	133.993
24nK8tW7Pt3Inh2utttuoG	7CucpzwxAZ6kHmctI9eo4X	3	HIP	81	195307	0.782	0.731	3	-4.581	0	0.143	0.0376	3.15e-05	0.0956	0.824	138.032
5Cbo7oz78gqkzV3EAM63VA	6zardvJflEyoRedCUCBUw9	3	+	81	219367	0.561	0.666	8	-4.243	1	0.0322	0.106	0	0.123	0.675	160.019
0Cn8NxJZz7zUlsaA3rXoIU	3Y00aLNDKDq9rXR3cIcbDo	3	Easy - Remix	81	220147	0.886	0.752	1	-3.819	0	0.0949	0.191	2.76e-06	0.146	0.435	94.066
1i1fxkWeaMmKEB4T7zqbzK	2SByipSK8eZ2pasaIwwzhf	3	Don't Let Me Down	81	208373	0.532	0.869	11	-5.094	1	0.172	0.157	0.00508	0.136	0.422	159.803
1Cv1YLb4q0RzL6pybtaMLo	3mMWlBGocBwsS1Q0o9wvlc	3	Sunday Best	81	158571	0.878	0.525	5	-6.832	1	0.0578	0.183	0	0.0714	0.694	112.022
1j4kHkkpqZRBwE0A4CN4Yv	5l5gR4rh26QI3fijGFTDrp	3	Dusk Till Dawn - Radio Edit	81	239000	0.258	0.437	11	-6.593	0	0.039	0.101	1.27e-06	0.106	0.0967	180.043
7vGuf3Y35N4wmASOKLUVVU	2bw00gRKNKbTFOqCkohbSh	3	Silence	81	180823	0.52	0.761	4	-3.093	1	0.0853	0.256	4.96e-06	0.17	0.286	141.971
0y675KDleCZEudjoeL1sQQ	1MFxXAGWNIuz0X1hS9VRiS	3	Feelings	81	189613	0.694	0.466	9	-6.758	1	0.0384	0.0934	0	0.098	0.246	103.018
44ADyYoY5liaRa3EOAl4uf	0SHGFAL8WZUvpWb5iLPp6E	3	Slide Away	81	233654	0.53	0.538	5	-6.672	1	0.0335	0.17	2.83e-06	0.248	0.288	148.051
5Gu0PDLN4YJeW75PpBSg9p	3ggBBGRhkDVAu7pQRXRPXO	3	Let Me Go (with Alesso, Florida Georgia Line & watt)	81	174800	0.663	0.708	8	-4.154	1	0.0473	0.0337	0	0.0841	0.742	103.073
4tNXntkAzQ5A2dfYRYGIIQ	0puSqXoH0dMgimvyi5slCt	3	Easier	81	157493	0.505	0.428	5	-5.604	1	0.221	0.489	0	0.0977	0.618	175.813
4poybupy26pTWPr9zY1i7h	5pCAWYym13GcQN8CXEb89m	3	Some Say	81	175602	0.779	0.342	3	-6.316	0	0.0404	0.701	2.56e-06	0.132	0.482	104.993
2GdxQw8NwoeH8tKySg6nym	6a6Dy4LaFvh43Ed5lomDEd	3	Torn	81	198006	0.664	0.831	2	-4.472	0	0.0435	0.111	1.42e-06	0.0596	0.696	125.058
7uzmGiiJyRfuViKKK3lVmR	5EEkfRgfYHiFu0lGur6Z6M	3	Mine	81	131064	0.71	0.789	4	-3.874	1	0.0722	0.0161	2.77e-06	0.451	0.717	142.929
2t8yVaLvJ0RenpXUIAC52d	007DWn799UWvfY1wwZeENR	3	a lot	81	288624	0.837	0.636	1	-7.643	1	0.086	0.0395	0.00125	0.342	0.274	145.972
3Ol2xnObFdKV9pmRD2t9x8	3r5hf3Cj3EMh1C2saQ8jyt	3	Look Back at It	81	179449	0.791	0.587	3	-5.075	0	0.0413	0.407	0	0.148	0.536	96.057
2Z8WuEywRWYTKe1NybPQEW	3cQO7jp5S9qLBoIVtbkSM1	3	Ride	81	214507	0.645	0.713	6	-5.355	1	0.0393	0.00835	0	0.113	0.566	74.989
6Qn5zhYkTa37e91HC1D7lb	33pt9HBdGlAbRGBHQgsZsU	3	Whatever It Takes	81	201240	0.672	0.655	10	-5.021	0	0.0311	0.0362	0	0.117	0.556	134.945
57bgtoPSgt236HzfBOd8kj	4vu7F6h90Br1ZtYYaqfITy	3	Thunderstruck	81	292880	0.501	0.889	4	-5.175	1	0.0364	0.000147	0.0114	0.217	0.257	133.519
31AOj9sFz2gM0O3hMARRBx	6yEuIwTQpciH1qtj7mP5GK	3	Losing My Religion	81	268427	0.666	0.855	9	-5.051	0	0.0295	0.179	1.2e-06	0.0987	0.803	125.639
1TfqLAPs4K3s2rJMoCokcS	5jNDWA19BJbE24x1UUJGRY	3	Sweet Dreams (Are Made of This) - Remastered	81	216933	0.692	0.711	0	-7.498	0	0.0317	0.227	0	0.12	0.875	125.135
6zeeWid2sgw4lap2jV61PZ	2Qxc2NJ7yPKVFRWi3llRr2	3	Better	81	229320	0.596	0.552	0	-10.278	0	0.097	0.0765	0.334	0.104	0.112	97.949
4VUwkH455At9kENOfzTqmF	6hCR3zQtRH0IgookOYt771	3	Beautiful (feat. Camila Cabello)	81	180000	0.638	0.717	2	-4.722	1	0.0337	0.346	0	0.105	0.249	100.027
6i0V12jOa3mr6uu4WYhUBr	3J8W9AOjQhnBLCX33m3atT	3	Heathens	81	195920	0.732	0.396	4	-9.348	0	0.0286	0.0841	3.58e-05	0.105	0.548	90.024
0VgkVdmE4gld66l8iyGjgx	17FBoXK1NU2rvJBbzdzw0r	3	Mask Off	81	204600	0.833	0.434	2	-8.795	1	0.431	0.0102	0.0219	0.165	0.281	150.062
3AJwUDP919kvQ9QcozQPxg	6ZG5lRT77aJ3btmArcykra	3	Yellow	81	266773	0.429	0.661	11	-7.227	1	0.0281	0.00239	0.00013	0.234	0.285	173.365
7LVHVU3tWfcxj5aiPFEW4Q	4E7bV0pzG0LciBSWTszra6	3	Fix You	81	295533	0.209	0.418	3	-8.74	1	0.0338	0.163	0.00195	0.113	0.123	138.265
7MiZjKawmXTsTNePyTfPyL	1RVXVo1puacM8aQ6hgQahi	3	Devil Eyes	81	131272	0.391	0.396	1	-8.621	0	0.189	0.702	0.405	0.315	0.199	99.112
4ZT9FnbFu1PaBfV3itxiqT	47FalEKu0of8GExDtZBkxT	3	I	81	181891	0.649	0.453	6	-7.28	1	0.085	0.627	0	0.116	0.431	99.183
6FRLCMO5TUHTexlWo8ym1W	75iQSBSaztFIAun9qLLCnb	3	Girls Like You (feat. Cardi B)	81	235545	0.851	0.541	0	-6.825	1	0.0505	0.568	0	0.13	0.448	124.959
2QjOHCTQ1Jl3zawyYOpxh6	4xkM0BwLM9H2IUcbYzpcBI	3	Sweater Weather	81	240400	0.612	0.807	10	-2.81	1	0.0336	0.0495	0.0177	0.101	0.398	124.053
47Bg6IrMed1GPbxRgwH2aC	51pSyGziPFv8ajzF7ilUAr	3	Best Friend	81	262231	0.575	0.714	6	-5.247	1	0.0596	0.395	0	0.115	0.32	144.982
2u3EyuCqqV31woqGvO9LBz	7KPtAktRGrVjy0QV3MXnZk	5	Sum 2 Prove	81	205760	0.823	0.552	4	-7.57	0	0.324	0.0174	0	0.122	0.418	124.038
09TZsMHXEtQkdmMJZPLKup	1ID5rMIT1C61W2OLQ3rctp	5	UP THE SMOKE (with Offset)	81	188048	0.907	0.765	4	-7.043	1	0.426	0.0512	0	0.153	0.896	142.992
1GeNui6m825V8jP4uKiIaH	1bnHPO4dKK7IjvgrtVBcQh	5	Bad Bad Bad (feat. Lil Baby)	81	149040	0.974	0.596	6	-8.888	1	0.184	0.0976	0	0.151	0.892	111.959
7sO5G9EABYOXQKNPNiE9NR	0MV1yCXcNNQBfwApqAVkH0	5	Ric Flair Drip (& Metro Boomin)	81	172800	0.88	0.428	9	-8.28	1	0.206	0.149	5.07e-05	0.114	0.333	100.007
5j1yOqWONR9T6l43AzJ6Es	0uyDZAeB7oa8CM6G9PjSOf	5	Tip Toe (feat. A Boogie Wit da Hoodie)	81	185806	0.757	0.673	1	-8.513	1	0.141	0.095	0	0.338	0.574	92.958
5tz69p7tJuGPeMGwNTxYuV	1HiN2YXZcc3EjmVZ4WjfBk	5	1-800-273-8255	81	250173	0.62	0.574	5	-7.788	0	0.0479	0.57	0	0.19	0.352	100.021
5dhQeuLGmlhfwlI6BWfSpo	3RJvPSUpz8E4b6SjectOPu	5	Roller	81	158853	0.928	0.758	10	-6.471	0	0.144	0.03	0.00437	0.29	0.729	128.005
7e89621JPkKaeDSTQ3avtg	54V1ljNtyzAm053oJqi0SH	5	Sweet Home Alabama	81	283800	0.596	0.605	7	-12.145	1	0.0255	0.181	0.000331	0.0863	0.886	97.798
6vN77lE9LK6HP2DewaN6HZ	7yf9ZJyHRbp8sHtpDKfPpt	5	Yes Indeed	81	142273	0.964	0.346	5	-9.309	0	0.53	0.035	0	0.108	0.562	119.958
1fCeXjoRExPP2qwSBh2aST	6tkjU4Umpo79wwkgPMV3nZ	5	Black & White	81	186945	0.776	0.736	7	-4.612	1	0.247	0.0802	0	0.159	0.233	147.946
3d9DChrdc6BOeFsbrZ3Is0	30Perjew8HyGkdSmqguYyg	6	Under the Bridge	81	264307	0.559	0.345	4	-13.496	1	0.0459	0.0576	0.000105	0.141	0.458	84.581
3gdewACMIVMEWVbyb8O9sY	2ei2X6ghPnw7YRwQtAH075	6	Rocket Man (I Think It's Going To Be A Long, Long Time)	81	281613	0.601	0.532	10	-9.119	1	0.0286	0.432	6.25e-06	0.0925	0.341	136.571
48UPSzbZjgc449aqz8bxox	2Y9IRtehByVkegoD7TcLfi	6	Californication	81	329733	0.592	0.767	9	-2.788	0	0.027	0.0021	0.00165	0.127	0.328	96.483
5ChkMS8OtdzJeqyybCc9R5	1C2h7mLntPSeVYciMRTF4a	6	Billie Jean	81	293827	0.92	0.654	11	-3.051	0	0.0401	0.0236	0.0158	0.0359	0.847	117.046
1f3yAtsJtY87CTmM8RLnxf	2uEf3r9i2bnxwJQsxQ0xQ7	6	Smells Like Teen Spirit	81	301920	0.502	0.912	1	-4.556	1	0.0564	2.55e-05	0.000173	0.106	0.72	116.761
2nLtzopw4rPReszdYBJU6h	4Gfnly5CzMJQqkUFfoHaP3	6	Numb	81	185587	0.496	0.863	9	-4.153	1	0.0381	0.0046	0	0.639	0.243	110.018
2fuCquhmrzHpu5xcA1ci9x	6reTSIf5MoBco62rk8T7Q1	6	Under Pressure - Remastered	81	248440	0.671	0.712	2	-7.815	1	0.0476	0.429	0	0.103	0.462	113.805
09nSCeCs6eYfAIJVfye1CE	1xwUFsb21qbGugy09vdd7O	2	Oye	81	173021	0.683	0.51	7	-7.894	0	0.0646	0.447	0	0.175	0.255	95.08
1E1YyZjbteIz2XQyLvtRxD	5lUuEK82w5OlO2wo2DOWBQ	2	Skifahren (feat. Joshi Mizu)	81	162651	0.719	0.705	5	-6.891	0	0.252	0.223	1.89e-06	0.152	0.435	133.927
4wJFExEZZo62tmwTM9ENDR	4cKsqQlyK9pqUTMjI4WnM0	2	Oye Pablo	81	177747	0.699	0.65	5	-4.281	0	0.171	0.0332	5.24e-06	0.299	0.52	179.84
0wMs7DPFOnToNAoecvAFQc	1faqBAWocW4ZOe0OFjudGw	2	Uniforme	81	279280	0.739	0.863	9	-3.667	1	0.139	0.0656	0	0.254	0.773	173.946
0i9oiUkWOgvtnjkr0fa3XN	48fPbdnqQWvarAivudCrqz	2	Piensan	81	173452	0.677	0.722	2	-4.443	0	0.0626	0.538	0	0.11	0.786	172
7FbKipScVxkjQxQXwTd0gL	5VVkOFYXmjtYd6hoasaWKQ	2	Coronao Now	81	217881	0.941	0.729	6	-7.56	0	0.246	0.146	0.00451	0.18	0.718	118.026
1aUGxXCz9QimNkKeiJtzZ7	2801cwQRE2bAQ6pKTrI13w	2	105 F Remix	81	464200	0.9	0.754	5	-7.016	0	0.156	0.368	2.74e-06	0.286	0.741	100.045
26Qhn2T88XqVinXQpmSarj	1CYQlkKE5Q0khU6eMwVAVt	2	Atrévete	81	198320	0.552	0.675	11	-3.824	1	0.297	0.311	0	0.119	0.586	183.785
7iDa6hUg2VgEL1o1HjmfBn	6t5D6LEgHxqUVOxJItkzfb	2	Meant to Be (feat. Florida Georgia Line)	81	163870	0.643	0.783	10	-6.458	1	0.0856	0.047	0	0.083	0.579	154.084
2rTnVB1bvwxHtaIl4uVu7f	6b3LhhX9Lt2861Dsh3ZCC2	4	Slide	81	238321	0.827	0.469	10	-9.141	0	0.341	0.0807	8.12e-06	0.207	0.196	97.028
7qvsl2pYzrsYgPeFBN5jxp	4gr1eiDfKDgoXT9HX2EdNT	4	Juicy	81	202333	0.786	0.658	0	-2.61	1	0.0661	0.0856	0	0.0689	0.458	170.037
5rFj8OzffT0iggSjcBaeND	5utJfkRQ5yEIat3AIK6WIL	4	Fire On Fire - From "Watership Down"	81	246735	0.584	0.407	1	-7.356	0	0.046	0.476	0	0.18	0.341	115.124
7qEKqBCD2vE5vIBsrUitpD	0S0KGZnfBGSIssfF54WSJh	4	ilomilo	81	156371	0.855	0.423	5	-15.044	0	0.0585	0.724	0.469	0.0896	0.572	120.02
0tMSssfxAL2oV8Vri0mFHE	0S0KGZnfBGSIssfF54WSJh	4	listen before i go	81	242652	0.319	0.0561	0	-23.023	1	0.045	0.935	0.00384	0.388	0.082	79.764
0wXuerDYiBnERgIpbb3JBR	4Carzsnpd6yvuHZ49I0oz8	4	Redbone	81	326933	0.743	0.347	1	-11.174	1	0.121	0.167	0.00951	0.103	0.572	160.143
6QgjcU0zLnzq5OrUoSZ3OK	4VzzEviJGYUtAeSsJlI9QB	4	Feel It Still	81	163253	0.801	0.795	1	-5.115	0	0.0504	0.0417	0.000113	0.0717	0.754	79.028
7vRriwrloYVaoAe3a9wJHe	3L0H4RjVXpEkwfDgi3XOdf	1	i hate u, i love u (feat. olivia o'brien)	81	251034	0.492	0.275	6	-13.4	0	0.3	0.687	0	0.101	0.18	92.6
6kPJZM97LwdG9QIsT7khp6	1q7a5wZeti0neU2jDn8Dz3	3	Solo (feat. Demi Lovato)	80	222653	0.737	0.636	11	-4.546	0	0.0437	0.0441	6.66e-05	0.35	0.565	105.005
02itaCXOdC54J0ISjqqFAp	0Y59j5oCvwTM2aNyPb6YpJ	3	All Around The World (La La La)	80	147840	0.733	0.859	9	-5.03	0	0.033	0.479	0.0645	0.105	0.52	124.948
0vrmHPfoBadXVr2n0m1aqZ	6Ad1E9vl75ZB3Ir87zwXIJ	3	Heaven	80	277262	0.592	0.873	9	-5.65	1	0.0275	0.0715	0.00982	0.142	0.516	122.011
0ct6r3EGTcMLPtrXHDvVjc	0h2knr6qpiAq0tV5ri5JMF	3	The Nights	80	176658	0.527	0.835	6	-5.298	1	0.0433	0.0166	0	0.249	0.654	125.983
23L5CiUhw2jV1OIMwthR3S	1FOJ5IXGXe8dl0cXvCU6wK	3	In the Name of Love	80	195707	0.501	0.519	4	-5.88	0	0.0409	0.109	0	0.454	0.168	133.99
4keoy2fqgwGnbWlm3ZVZFa	0JcW7yCW3Qj8uMfzO2lUDb	3	Happy Now	80	207030	0.503	0.741	4	-5.128	1	0.047	0.579	1.49e-06	0.0712	0.458	88.335
2tpWsVSb9UEmDRxAl1zhX1	20lOt6G8MHv8ZO7ViOmiP7	3	Counting Stars	80	257267	0.664	0.705	1	-4.972	0	0.0382	0.0654	0	0.118	0.477	122.016
5QXQy0f2q8wJNpPwJtjifx	3CrpfLi8E2VWFf7ZLjgpNt	3	Loco Contigo (with J. Balvin & Ozuna feat. Nicky Jam, Natti Natasha, Darell & Sech) - REMIX	80	341875	0.789	0.694	6	-5.781	0	0.0729	0.0982	0	0.0962	0.549	96.035
7BuSE9uTIw931wtZYzvZcQ	0PijZTpKNGUvL12y7w4tZF	3	Runaway	80	200693	0.756	0.851	2	-3.33	1	0.0674	0.0336	0	0.126	0.934	75.014
5EYi2rH4LYs6M21ZLOyQTx	4D6BtgzCwuJx9omikqA8Rg	3	Loving Is Easy	80	155720	0.756	0.609	3	-7.927	1	0.0544	0.217	0.00474	0.096	0.537	117.023
1mKXFLRA179hdOWQBwUk9e	2Q9oTK48eb85waX1fFJsvj	3	Just Give Me a Reason (feat. Nate Ruess)	80	242733	0.778	0.547	2	-7.273	1	0.0489	0.346	0.000302	0.132	0.441	95.002
4nVBt6MZDDP6tRVdQTgxJg	7p1fX8aUySrBdx4WSYspOu	3	Story of My Life	80	245493	0.6	0.663	3	-5.802	1	0.0477	0.225	0	0.119	0.286	121.07
0HPD5WQqrq7wPWR7P7Dw1i	6fpLLJsDSSAlToEDW2jv4F	3	TiK ToK	80	199693	0.755	0.837	2	-2.718	0	0.142	0.0991	0	0.289	0.714	120.028
3bH4HzoZZFq8UpZmI2AMgV	5fEgDYFPUcvQy21TYoLEZ0	3	New Light	80	216015	0.828	0.689	7	-7.878	1	0.0326	0.325	0.0384	0.0808	0.853	123.931
0Z26mbSHJ1dkUu7g9DDgif	3Fcqa5sb0vVYEEDHzkiOA1	3	Trigger	80	171987	0.57	0.585	8	-7.041	1	0.251	0.128	9.7e-05	0.111	0.378	97.285
4fwo6czG5nvOQMzhOto1ya	1MF23oT6lg5q47LnZ91UPy	3	Lonely (with Jonas Brothers)	80	139813	0.738	0.717	1	-5.121	1	0.0573	0.062	0	0.205	0.5	98.047
1JRK7srBWUtAW7dPabKBwJ	6JdZip7wqJcGYtYDnzpp8T	3	Teeth	80	204887	0.755	0.448	3	-2.993	0	0.0405	0.0508	3.87e-06	0.11	0.431	139.028
6UjZ2Yx2g2a52XxiA8ONxZ	4BQVnx1yJrDa1tcky9D9N6	3	Outnumbered	80	245700	0.614	0.684	0	-5.79	1	0.157	0.247	0	0.0976	0.258	156.85
2xyx0o4xNOLLjBSbOOdcbA	1qgJNWnPIeK9rx7hF8JCPK	3	Playing Games (with Bryson Tiller) - Extended Version	80	143227	0.726	0.408	11	-6.606	0	0.0614	0.603	0	0.225	0.459	115.918
7gvd8xj4QgPqbQSsn5pV7d	1MI6gNg0plcEOgs8aezsjH	3	Sorry Not Sorry	80	203760	0.705	0.64	11	-6.928	0	0.225	0.0237	0	0.262	0.887	144.077
76hfruVvmfQbw0eYn1nmeC	3Wv4X8OA65pGpFzBkuUgAh	3	Cake By The Ocean	80	219147	0.774	0.753	4	-5.445	0	0.0517	0.153	0	0.0371	0.896	119.002
04ZTP5KsCypmtCmQg5tH9R	4TOkZvtqNpg5UHyGxCn0mS	3	I'm a Mess	80	195519	0.63	0.694	11	-6.257	0	0.0253	0.00281	0	0.0719	0.216	97.005
7vgv8KZBSo0TPzyIWG9yzV	6KPJTxKFCpuzrwyJGcURqK	3	Salt	80	180283	0.693	0.835	6	-3.242	1	0.0623	0.131	0	0.073	0.743	128.052
7fa9MBXhVfQ8P8Df9OEbD8	1Li4rADxSxjT2g4xqUcMYh	3	Girls Like You (feat. Cardi B)	80	235545	0.851	0.541	0	-6.825	1	0.0505	0.568	0	0.13	0.448	124.959
4RCWB3V8V0dignt99LZ8vH	4vUClKTFaDWnsHE8rK52GY	3	Hey There Delilah	80	232533	0.657	0.291	2	-10.572	1	0.0293	0.872	0	0.114	0.298	103.973
49FYlytm3dAAraYgpoJZux	3JSWZWeTHF4HDGt5Eozdy7	3	Umbrella	80	275987	0.583	0.829	1	-4.603	1	0.134	0.00864	0	0.0426	0.575	174.028
3dYD57lRAUcMHufyqn9GcI	0Uv83rRhY5QvHKkQoULRKk	3	Take Me To Church	80	241688	0.566	0.664	4	-5.303	0	0.0464	0.634	0	0.116	0.437	128.945
4BP3uh0hFLFRb5cjsgLqDh	31q47gQszFt0CddSyMksgO	3	Fortunate Son	80	140773	0.64	0.663	0	-7.516	1	0.0374	0.201	0.00806	0.152	0.663	132.77
7lQWRAjyhTpCWFC0jmclT4	0fYctMs4EvoEqzDh8Kmg5g	3	Gangsta's Paradise	80	240693	0.647	0.514	8	-10.05	1	0.0593	0.0655	0	0.398	0.387	79.974
4llK75pXNWZz6KAho2Gp16	5zClcGCSWj926AMjvBNSLc	3	She Will Be Loved - Radio Mix	80	259453	0.651	0.663	0	-5.569	0	0.0281	0.228	0	0.0994	0.465	102
3ZFTkvIE7kyPt6Nu3PEa7V	5ppnlEoj4HdRRdRihnY3jU	3	Hips Don't Lie (feat. Wyclef Jean)	80	218093	0.778	0.824	10	-5.892	0	0.0712	0.284	0	0.405	0.756	100.024
3dhjNA0jGA8vHBQ1VdD6vV	2ODvWsOgouMbaA5xf0RkJe	3	I Feel It Coming	80	269187	0.773	0.819	0	-5.946	0	0.118	0.426	0	0.0679	0.585	92.99
3eng6TJxpqjvDkxRpnfnhB	085TF4mnNbXQT0m2X05cb0	3	Big Plans	80	179930	0.693	0.604	11	-5.279	1	0.0427	0.0668	0	0.114	0.651	75.014
2iuZJX9X9P0GKaE93xcPjk	2Auw0pTT6EcQdvHNimhLQI	3	Sugar	80	235493	0.748	0.788	1	-7.055	1	0.0334	0.0591	0	0.0863	0.884	120.076
5OCJzvD7sykQEKHH7qAC3C	3tx8gQqWbGwqIGZHqDNrGe	3	God is a woman	80	197547	0.602	0.658	1	-5.934	1	0.0558	0.0233	6e-05	0.237	0.268	145.031
7BqBn9nzAq8spo5e7cZ0dJ	1uyf3l2d4XYwiEqAb7t7fX	3	Just the Way You Are	80	220733	0.637	0.843	5	-5.413	1	0.0432	0.0151	0	0.0876	0.434	109.012
22VdIZQfgXJea34mQxlt81	0P3oVJBFOv3TDXlYRhGL7s	3	Can't Feel My Face	80	213520	0.705	0.769	9	-5.526	0	0.0426	0.112	0	0.105	0.59	107.939
6h5PAsRni4IRlxWr6uDPTP	6Ei5WWek37m1x9AjpSXTcJ	3	More Than You Know	80	203000	0.646	0.741	5	-4.973	0	0.034	0.0275	0	0.312	0.571	123.077
0afhq8XCExXpqazXczTSve	3T4tUhGYeRNVUGevb0wThu	3	Galway Girl	80	170827	0.624	0.876	9	-3.374	1	0.1	0.0735	0	0.327	0.781	99.943
2JzZzZUQj3Qff7wapcbKjc	5FXIqS1XqbpfOKNoi5VUwS	3	See You Again (feat. Charlie Puth)	80	229526	0.689	0.481	10	-7.503	1	0.0815	0.369	1.03e-06	0.0649	0.283	80.025
4hQ6UGyWQIGJmHSo0J88JW	3N7eWDCvfWv34xWNohdHjO	3	Back To You - From 13 Reasons Why – Season 2 Soundtrack	80	207905	0.601	0.724	6	-4.856	1	0.0486	0.0945	1.68e-06	0.12	0.508	102.061
1RGasjWLZ4qMN7wbtkLa3u	7fRrTyKvE4Skh93v97gtcU	3	my boy	80	170852	0.692	0.394	11	-8.745	0	0.207	0.472	0.000191	0.117	0.324	89.936
0jBJIQuToUUOEx7JJkiPzm	7EvmUXEmIRkFwd2nPVmFiP	5	How I Move (feat. Lil Baby)	80	224916	0.826	0.635	5	-5.181	0	0.212	0.102	0	0.245	0.808	119.954
35Xf2ABjPzUXKz19akd7Jj	6KuvJ7yluj7KuMDm9ydXM1	5	Famous Hoes	80	135460	0.732	0.627	4	-5.693	0	0.161	0.346	0	0.261	0.332	81.481
7A20WnLkjtZU2d7hIB6Ziu	52u4anZbHd6UInnmHRFzba	5	Start Wit Me (feat. Gunna)	80	158692	0.886	0.479	4	-8.054	0	0.334	0.077	0	0.135	0.408	130.029
2fQrGHiQOvpL9UgPvtYy6G	4QUNWTw2FsIz722xjUjFJw	5	Bank Account	80	220307	0.884	0.346	8	-8.228	0	0.351	0.0151	7.04e-06	0.0871	0.376	75.016
6PGoSes0D9eUDeeAafB2As	4eLPsYPBmXABThSJ821sqY	5	LOVE. FEAT. ZACARI.	80	213400	0.8	0.585	10	-7.343	1	0.0924	0.264	0	0.153	0.779	126.058
3pXF1nA74528Edde4of9CC	6eZdwrhB97A3EYx9QppGfl	5	Don't	80	198293	0.765	0.356	11	-5.556	0	0.196	0.222	0	0.0963	0.19	97.001
6vWEAOUSxohKxhp0K1BsxL	09b9NC1oQbYaHcacgXn66k	5	Mixed Personalities (feat. Kanye West)	80	230400	0.661	0.44	2	-9.104	1	0.0803	0.457	0	0.128	0.352	149.937
7wBJfHzpfI3032CSD7CE2m	41GuZcammIkupMPKH2OJ6I	5	STARGAZING	80	270715	0.487	0.789	8	-3.69	1	0.044	0.00947	4.05e-06	0.189	0.0564	150.007
76IVpz47q3ghkxoUeTTEKb	77X9PDPmSWyeOrbq5Md56H	5	COLT	80	179813	0.544	0.53	9	-6.168	0	0.428	0.345	0	0.0981	0.184	90.093
6416zJN0FGPmh1Ph4BH2h3	4lvPNGpbLW4MIk3OT4OG3w	5	KEIN SCHLAF	80	200493	0.606	0.715	11	-5.608	1	0.173	0.294	0.000133	0.124	0.393	174.049
2RaKlveGCllSaXloN8kmzV	7FzVARL5hF1iZPpOTCyMpp	5	Alien	80	208947	0.835	0.601	6	-6.411	1	0.0562	0.298	0	0.111	0.853	137.998
5ravc2aiNoYmu9m37diYXW	3UMxQfDm6XBUaPf9zuYCzZ	5	Start Wit Me (feat. Gunna)	80	158692	0.886	0.479	4	-8.054	0	0.334	0.077	0	0.135	0.408	130.029
60SdxE8apGAxMiRrpbmLY0	3HNnxK7NgLXbDoxRZxNWiR	5	Lucky You (feat. Joyner Lucas)	80	244679	0.876	0.786	10	-4.884	0	0.306	0.0627	0	0.127	0.575	153.068
3yfqSUWxFvZELEM4PmlwIR	6t7956yu5zYf5A829XRiHC	5	The Real Slim Shady	80	284200	0.949	0.661	5	-4.244	0	0.0572	0.0302	0	0.0454	0.76	104.504
67XyC1GdSkKb9sbRRkUDXS	0lDRXaECpMSYYCsTYRDulh	5	Shotta Flow (Feat. Blueface) [Remix]	80	176632	0.894	0.511	2	-4.768	1	0.42	0.0251	0	0.14	0.568	120.08
7q3NthaBqFI6s0WnAlnIvq	12jwb6dkXYHWYg2YXvNCuA	5	Velitas	80	225542	0.819	0.596	2	-7.009	1	0.318	0.225	1.19e-06	0.138	0.622	165.951
5ls62WNKHUUrdF3r1cv83T	5UHC2JN3ck4XPYPjngia2G	5	emotions	80	131213	0.63	0.63	9	-6.211	1	0.0395	0.0131	0	0.142	0.163	80.512
0S0vWvyZ6Rc79TXkWxT9QA	33TJ52PuwenGmysJrwMGCe	5	Save That Shit	80	231547	0.534	0.583	2	-8.672	1	0.0288	0.0262	0	0.421	0.145	105.997
41MCdlvXOl62B7Kv86Bb1v	1GYVNOzwhx1nMcIJDogSNp	5	Empty	80	248431	0.745	0.561	0	-4.869	1	0.0807	0.0758	0	0.133	0.449	77.557
3V8UKqhEK5zBkBb6d6ub8i	42wLKnuGyBLGWwH89lnimL	5	Te Boté - Remix	80	417920	0.903	0.675	11	-3.445	0	0.214	0.542	1.28e-05	0.0595	0.442	96.507
1LiN0Z98FkR1t0m8KmLcAH	464FQ8gr0oKlQ1a0TCK4Yj	5	Amanece	80	190005	0.79	0.631	8	-5.549	0	0.0425	0.437	0	0.158	0.889	94.039
5274I4mUMnYczyeXkGDWZN	6P9PZjWXoCRF5b66BafPKY	5	Fine China	80	141587	0.656	0.542	7	-7.358	1	0.323	0.0484	0	0.126	0.551	166.111
2IZZqH4K02UIYg5EohpNHF	5GugLrmYMl5VRoe2zNgLGp	6	Zombie	80	306427	0.307	0.635	7	-8.957	1	0.0339	0.0155	0.00486	0.366	0.305	166.978
0d28khcov6AiegSCpG5TuT	0bUTHlWbkSQysoM3VsWldT	6	Feel Good Inc.	80	222640	0.818	0.705	6	-6.679	1	0.177	0.00836	0.00233	0.613	0.772	138.559
4bHsxqR3GMrXTxEPLuK5ue	43wpzak9OmQfrjyksuGwp0	6	Don't Stop Believin'	80	250987	0.5	0.748	4	-9.072	1	0.0363	0.127	0	0.447	0.514	118.852
4RvWPyQ5RL0ao9LPZeSouE	3myPwaMYjdwhtq0nFgeG6W	6	Everybody Wants To Rule The World	80	251489	0.645	0.795	7	-12.095	1	0.0527	0.347	0.00389	0.104	0.535	112.067
3ZOEytgrvLwQaqXreDs2Jx	6deiaArbeoqp1xPEGdEKp1	6	Can't Stop	80	269000	0.618	0.938	9	-3.442	1	0.0456	0.0179	0	0.167	0.875	91.455
2DlHlPMa4M17kufBvI2lEN	6jWde94ln40epKIQCd8XUh	6	Chop Suey!	80	210240	0.419	0.934	7	-3.908	0	0.12	0.000278	0.0015	0.132	0.286	127.288
5Ohxk2dO5COHF1krpoPigN	1FZKIm3JVDCxTchXDo5jOV	6	Sign of the Times	80	340707	0.516	0.595	5	-4.63	1	0.0313	0.0275	0	0.109	0.222	119.972
2dy3TKVDEbIeWxeIb8JWqZ	0OChMQnL4dpFZQH93uPb1d	2	La Mejor Versión de Mi - Remix	80	229333	0.735	0.712	11	-5.119	0	0.0326	0.732	0	0.302	0.894	131.938
0UQwlF2pRkr1lMN6kNNUj3	01yYW0rRRwlEZx1dMmc5ff	2	La Boca	80	206279	0.618	0.795	2	-1.8	1	0.113	0.0655	0	0.309	0.76	185.901
7MRU4vOkywuhZ9kbFiPuiu	4lmKt00bHLEeqJRTlNOxXS	2	Si Supieras	80	241880	0.691	0.894	9	-1.681	0	0.115	0.291	0	0.104	0.623	184.019
7mWFF4gPADjTQjC97CgFVt	2njbaonul4fuGOFmPchUgU	2	Baila Baila Baila - Remix	80	235284	0.785	0.572	2	-7.504	1	0.123	0.0598	0	0.218	0.49	100.016
7BuHdm4lQqcyG3qTwdkxus	4zbMionGv9W33xjQfoMyuo	2	Aullando	80	226200	0.8	0.74	10	-4.52	0	0.0479	0.184	0	0.0558	0.775	90.035
5pAbCxt9e3f81lOmjIXwzd	4d2oTHRFwGifGFgve7zSGC	4	Be Honest (feat. Burna Boy)	80	207031	0.757	0.737	4	-6.728	0	0.114	0.311	0	0.113	0.635	98.057
\.


--
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artists_artist_id_seq', 256, true);


--
-- Name: collection_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_item_id_seq', 25, true);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 6, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (item_id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (track_id);


--
-- Name: albums albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: collection collection_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: tracks tracks_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);


--
-- PostgreSQL database dump complete
--

\unrestrict ScsgzkwRyj6kH4X4AangzMNQOI4JBUfRyELbvesHX3MpqhfGSUvMpggdVfLYOVv

