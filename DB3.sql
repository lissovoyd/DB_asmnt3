--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-16 22:24:56

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
-- TOC entry 4934 (class 1262 OID 16429)
-- Name: assignment3_yjnt; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE assignment3_yjnt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE assignment3_yjnt OWNER TO postgres;

\connect assignment3_yjnt

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
-- TOC entry 5 (class 2615 OID 16430)
-- Name: asmnt3; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA asmnt3;


ALTER SCHEMA asmnt3 OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16465)
-- Name: country; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.country (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE asmnt3.country OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16496)
-- Name: discover; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date NOT NULL
);


ALTER TABLE asmnt3.discover OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16473)
-- Name: disease; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE asmnt3.disease OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16462)
-- Name: diseasetype; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE asmnt3.diseasetype OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16530)
-- Name: doctor; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.doctor (
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL,
    degree character varying(20)
);


ALTER TABLE asmnt3.doctor OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16509)
-- Name: patientdisease; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.patientdisease (
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL,
    disease_code character varying(50) NOT NULL
);


ALTER TABLE asmnt3.patientdisease OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16431)
-- Name: users; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE asmnt3.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16762)
-- Name: patient_diseases; Type: VIEW; Schema: asmnt3; Owner: postgres
--

CREATE VIEW asmnt3.patient_diseases AS
 SELECT u.name,
    u.surname,
    dt.description AS disease
   FROM (((asmnt3.users u
     JOIN asmnt3.patientdisease pd ON (((u.email)::text = (pd.email)::text)))
     JOIN asmnt3.disease d ON (((pd.disease_code)::text = (d.disease_code)::text)))
     JOIN asmnt3.diseasetype dt ON ((dt.id = d.id)));


ALTER VIEW asmnt3.patient_diseases OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16454)
-- Name: patients; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.patients (
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL
);


ALTER TABLE asmnt3.patients OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16522)
-- Name: publicservant; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.publicservant (
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL,
    department character varying(50)
);


ALTER TABLE asmnt3.publicservant OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16576)
-- Name: record; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.record (
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer
);


ALTER TABLE asmnt3.record OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16548)
-- Name: specialize; Type: TABLE; Schema: asmnt3; Owner: postgres
--

CREATE TABLE asmnt3.specialize (
    id integer NOT NULL,
    email character varying(60) DEFAULT 'default_email@example.com'::character varying NOT NULL
);


ALTER TABLE asmnt3.specialize OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 16465)
-- Dependencies: 218
-- Data for Name: country; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.country VALUES ('USA', 331000000);
INSERT INTO asmnt3.country VALUES ('Brazil', 213000000);
INSERT INTO asmnt3.country VALUES ('Canada', 38000000);
INSERT INTO asmnt3.country VALUES ('China', 1439323776);
INSERT INTO asmnt3.country VALUES ('India', 1380000000);
INSERT INTO asmnt3.country VALUES ('Russia', 145000000);
INSERT INTO asmnt3.country VALUES ('Nigeria', 206000000);
INSERT INTO asmnt3.country VALUES ('Egypt', 104000000);
INSERT INTO asmnt3.country VALUES ('Mexico', 128000000);
INSERT INTO asmnt3.country VALUES ('South Africa', 59300000);
INSERT INTO asmnt3.country VALUES ('Kazakhstan', 20000000);
INSERT INTO asmnt3.country VALUES ('Uzbekistan', 50000000);
INSERT INTO asmnt3.country VALUES ('Turkey', 100000000);


--
-- TOC entry 4923 (class 0 OID 16496)
-- Dependencies: 220
-- Data for Name: discover; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.discover VALUES ('USA', 'D013', '2006-05-29');
INSERT INTO asmnt3.discover VALUES ('South Africa', 'D004', '2018-04-04');
INSERT INTO asmnt3.discover VALUES ('India', 'D011', '2001-01-15');
INSERT INTO asmnt3.discover VALUES ('USA', 'D001', '2000-02-16');
INSERT INTO asmnt3.discover VALUES ('South Africa', 'D008', '2015-10-05');
INSERT INTO asmnt3.discover VALUES ('China', 'D009', '2004-07-22');
INSERT INTO asmnt3.discover VALUES ('Nigeria', 'D010', '2001-06-24');
INSERT INTO asmnt3.discover VALUES ('Nigeria', 'D002', '2018-11-26');
INSERT INTO asmnt3.discover VALUES ('Canada', 'D003', '2010-02-26');
INSERT INTO asmnt3.discover VALUES ('China', 'D004', '2002-04-16');
INSERT INTO asmnt3.discover VALUES ('Mexico', 'D008', '2008-05-26');
INSERT INTO asmnt3.discover VALUES ('Mexico', 'D006', '2017-11-27');
INSERT INTO asmnt3.discover VALUES ('South Africa', 'D009', '2015-12-30');
INSERT INTO asmnt3.discover VALUES ('Brazil', 'D011', '2002-03-30');
INSERT INTO asmnt3.discover VALUES ('Brazil', 'D014', '2022-03-20');
INSERT INTO asmnt3.discover VALUES ('China', 'D006', '2006-08-01');
INSERT INTO asmnt3.discover VALUES ('India', 'D008', '2018-01-29');
INSERT INTO asmnt3.discover VALUES ('Nigeria', 'D011', '2006-03-05');
INSERT INTO asmnt3.discover VALUES ('Canada', 'D015', '2010-11-16');
INSERT INTO asmnt3.discover VALUES ('Nigeria', 'D006', '2010-03-13');


--
-- TOC entry 4922 (class 0 OID 16473)
-- Dependencies: 219
-- Data for Name: disease; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.disease VALUES ('D005', 'Virus', 'Severe cold, sore throat', 7556);
INSERT INTO asmnt3.disease VALUES ('D006', 'Bacteria', 'Chest pain, high fever', 6122);
INSERT INTO asmnt3.disease VALUES ('D008', 'Bacteria', 'Severe diarrhea, dehydration', 4933);
INSERT INTO asmnt3.disease VALUES ('D009', 'Bacteria', 'Persistent cough, weight loss', 2696);
INSERT INTO asmnt3.disease VALUES ('D010', 'Parasite', 'Malaria, chills, sweating', 9731);
INSERT INTO asmnt3.disease VALUES ('D014', 'Virus', 'Headache, joint pain', 8221);
INSERT INTO asmnt3.disease VALUES ('D015', 'Virus', 'Acute respiratory infection', 9766);
INSERT INTO asmnt3.disease VALUES ('D001', 'Virus', 'Infectious, flu, fever, fatigue', 2686);
INSERT INTO asmnt3.disease VALUES ('D002', 'Virus', 'Infectious, high fever, muscle ache', 9787);
INSERT INTO asmnt3.disease VALUES ('D007', 'Bacteria', 'Infectious, skin sores, fever', 5932);
INSERT INTO asmnt3.disease VALUES ('D011', 'Parasite', 'Infectious, severe headache, fatigue', 2820);
INSERT INTO asmnt3.disease VALUES ('D012', 'Fungus', 'Infectious, sitchy skin, infection', 9270);
INSERT INTO asmnt3.disease VALUES ('D013', 'Fungus', 'Infectious, fungal growth, skin irritation', 2805);
INSERT INTO asmnt3.disease VALUES ('D003', 'Virus', 'Dry c0ugh, respiratory issues', 9027);
INSERT INTO asmnt3.disease VALUES ('D004', 'Virus', 'J00int pain, rashes', 6908);


--
-- TOC entry 4920 (class 0 OID 16462)
-- Dependencies: 217
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.diseasetype VALUES (2686, 'Flu');
INSERT INTO asmnt3.diseasetype VALUES (9787, 'Ebola');
INSERT INTO asmnt3.diseasetype VALUES (6908, 'Malaria');
INSERT INTO asmnt3.diseasetype VALUES (7556, 'HIV');
INSERT INTO asmnt3.diseasetype VALUES (6122, 'Tuberculosis');
INSERT INTO asmnt3.diseasetype VALUES (5932, 'Dengue');
INSERT INTO asmnt3.diseasetype VALUES (4933, 'Zika');
INSERT INTO asmnt3.diseasetype VALUES (2696, 'SARS');
INSERT INTO asmnt3.diseasetype VALUES (9731, 'MERS');
INSERT INTO asmnt3.diseasetype VALUES (2820, 'Cholera');
INSERT INTO asmnt3.diseasetype VALUES (9270, 'Measles');
INSERT INTO asmnt3.diseasetype VALUES (2805, 'Polio');
INSERT INTO asmnt3.diseasetype VALUES (8221, 'Rabies');
INSERT INTO asmnt3.diseasetype VALUES (9766, 'Hepatitis');
INSERT INTO asmnt3.diseasetype VALUES (9027, 'COVID-19');


--
-- TOC entry 4926 (class 0 OID 16530)
-- Dependencies: 223
-- Data for Name: doctor; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.doctor VALUES ('user2@mail.com', 'DO');
INSERT INTO asmnt3.doctor VALUES ('user5@mail.com', 'MD');
INSERT INTO asmnt3.doctor VALUES ('user8@mail.com', 'DO');
INSERT INTO asmnt3.doctor VALUES ('user11@mail.com', 'DDS');
INSERT INTO asmnt3.doctor VALUES ('user14@mail.com', 'DDS');
INSERT INTO asmnt3.doctor VALUES ('user17@mail.com', 'MBBS');
INSERT INTO asmnt3.doctor VALUES ('user20@mail.com', 'MBBS');
INSERT INTO asmnt3.doctor VALUES ('user23@mail.com', 'MD');
INSERT INTO asmnt3.doctor VALUES ('user26@mail.com', 'PhD');
INSERT INTO asmnt3.doctor VALUES ('user29@mail.com', 'PhD');
INSERT INTO asmnt3.doctor VALUES ('user1@mail.com', 'MBBS');
INSERT INTO asmnt3.doctor VALUES ('user4@mail.com', 'MD');
INSERT INTO asmnt3.doctor VALUES ('user7@mail.com', 'PhD');


--
-- TOC entry 4924 (class 0 OID 16509)
-- Dependencies: 221
-- Data for Name: patientdisease; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.patientdisease VALUES ('user3@mail.com', 'D009');
INSERT INTO asmnt3.patientdisease VALUES ('user6@mail.com', 'D009');
INSERT INTO asmnt3.patientdisease VALUES ('user9@mail.com', 'D001');
INSERT INTO asmnt3.patientdisease VALUES ('user12@mail.com', 'D006');
INSERT INTO asmnt3.patientdisease VALUES ('user15@mail.com', 'D009');
INSERT INTO asmnt3.patientdisease VALUES ('user18@mail.com', 'D006');
INSERT INTO asmnt3.patientdisease VALUES ('user21@mail.com', 'D010');
INSERT INTO asmnt3.patientdisease VALUES ('user24@mail.com', 'D010');
INSERT INTO asmnt3.patientdisease VALUES ('user27@mail.com', 'D008');
INSERT INTO asmnt3.patientdisease VALUES ('user30@mail.com', 'D011');
INSERT INTO asmnt3.patientdisease VALUES ('user1@mail.com', 'D003');
INSERT INTO asmnt3.patientdisease VALUES ('user4@mail.com', 'D005');
INSERT INTO asmnt3.patientdisease VALUES ('user11@mail.com', 'D012');
INSERT INTO asmnt3.patientdisease VALUES ('user14@mail.com', 'D002');
INSERT INTO asmnt3.patientdisease VALUES ('user3@mail.com', 'D003');
INSERT INTO asmnt3.patientdisease VALUES ('user14@mail.com', 'D004');
INSERT INTO asmnt3.patientdisease VALUES ('user6@mail.com', 'D010');
INSERT INTO asmnt3.patientdisease VALUES ('user15@mail.com', 'D003');
INSERT INTO asmnt3.patientdisease VALUES ('user12@mail.com', 'D002');
INSERT INTO asmnt3.patientdisease VALUES ('user12@mail.com', 'D008');


--
-- TOC entry 4919 (class 0 OID 16454)
-- Dependencies: 216
-- Data for Name: patients; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.patients VALUES ('user3@mail.com');
INSERT INTO asmnt3.patients VALUES ('user6@mail.com');
INSERT INTO asmnt3.patients VALUES ('user9@mail.com');
INSERT INTO asmnt3.patients VALUES ('user12@mail.com');
INSERT INTO asmnt3.patients VALUES ('user15@mail.com');
INSERT INTO asmnt3.patients VALUES ('user18@mail.com');
INSERT INTO asmnt3.patients VALUES ('user21@mail.com');
INSERT INTO asmnt3.patients VALUES ('user24@mail.com');
INSERT INTO asmnt3.patients VALUES ('user27@mail.com');
INSERT INTO asmnt3.patients VALUES ('user30@mail.com');
INSERT INTO asmnt3.patients VALUES ('user1@mail.com');
INSERT INTO asmnt3.patients VALUES ('user4@mail.com');
INSERT INTO asmnt3.patients VALUES ('user11@mail.com');
INSERT INTO asmnt3.patients VALUES ('user14@mail.com');


--
-- TOC entry 4925 (class 0 OID 16522)
-- Dependencies: 222
-- Data for Name: publicservant; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.publicservant VALUES ('user1@mail.com', 'Epidemiology');
INSERT INTO asmnt3.publicservant VALUES ('user10@mail.com', 'Epidemiology');
INSERT INTO asmnt3.publicservant VALUES ('user13@mail.com', 'Diagnostics');
INSERT INTO asmnt3.publicservant VALUES ('user16@mail.com', 'Emergency');
INSERT INTO asmnt3.publicservant VALUES ('user19@mail.com', 'Pediatrics');
INSERT INTO asmnt3.publicservant VALUES ('user22@mail.com', 'Epidemiology');
INSERT INTO asmnt3.publicservant VALUES ('user25@mail.com', 'Pediatrics');
INSERT INTO asmnt3.publicservant VALUES ('user28@mail.com', 'Diagnostics');
INSERT INTO asmnt3.publicservant VALUES ('user4@mail.com', 'Diagnostics');
INSERT INTO asmnt3.publicservant VALUES ('user7@mail.com', 'Pediatrics');


--
-- TOC entry 4928 (class 0 OID 16576)
-- Dependencies: 225
-- Data for Name: record; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.record VALUES ('user1@mail.com', 'Mexico', 'D010', 505, 14624);
INSERT INTO asmnt3.record VALUES ('user4@mail.com', 'China', 'D014', 2559, 27924);
INSERT INTO asmnt3.record VALUES ('user7@mail.com', 'Mexico', 'D009', 1249, 40294);
INSERT INTO asmnt3.record VALUES ('user13@mail.com', 'Brazil', 'D008', 590, 47129);
INSERT INTO asmnt3.record VALUES ('user16@mail.com', 'China', 'D002', 2232, 22758);
INSERT INTO asmnt3.record VALUES ('user19@mail.com', 'Egypt', 'D012', 180, 19451);
INSERT INTO asmnt3.record VALUES ('user22@mail.com', 'South Africa', 'D009', 644, 42052);
INSERT INTO asmnt3.record VALUES ('user28@mail.com', 'Mexico', 'D007', 2812, 15181);
INSERT INTO asmnt3.record VALUES ('user28@mail.com', 'Russia', 'D014', 1072, 49270);
INSERT INTO asmnt3.record VALUES ('user25@mail.com', 'USA', 'D005', 2946, 21053);
INSERT INTO asmnt3.record VALUES ('user28@mail.com', 'Nigeria', 'D015', 2726, 27978);
INSERT INTO asmnt3.record VALUES ('user25@mail.com', 'India', 'D007', 1169, 17904);
INSERT INTO asmnt3.record VALUES ('user1@mail.com', 'Egypt', 'D014', 1184, 31000);
INSERT INTO asmnt3.record VALUES ('user7@mail.com', 'Brazil', 'D015', 1170, 22040);
INSERT INTO asmnt3.record VALUES ('user1@mail.com', 'Nigeria', 'D001', 270, 45975);
INSERT INTO asmnt3.record VALUES ('user4@mail.com', 'USA', 'D010', 939, 30298);
INSERT INTO asmnt3.record VALUES ('user7@mail.com', 'Egypt', 'D011', 662, 1000);
INSERT INTO asmnt3.record VALUES ('user10@mail.com', 'Nigeria', 'D003', 632, 16483);
INSERT INTO asmnt3.record VALUES ('user4@mail.com', 'Mexico', 'D003', 999, 4732);
INSERT INTO asmnt3.record VALUES ('user4@mail.com', 'Canada', 'D003', 8, 65);
INSERT INTO asmnt3.record VALUES ('user10@mail.com', 'Brazil', 'D003', 122, 454);
INSERT INTO asmnt3.record VALUES ('user4@mail.com', 'USA', 'D003', 131, 333);
INSERT INTO asmnt3.record VALUES ('user7@mail.com', 'Egypt', 'D003', 2160, 20339);
INSERT INTO asmnt3.record VALUES ('user16@mail.com', 'USA', 'D003', 87, 87);
INSERT INTO asmnt3.record VALUES ('user16@mail.com', 'China', 'D003', 1529, 44933);
INSERT INTO asmnt3.record VALUES ('user25@mail.com', 'China', 'D003', 1386, 13310);


--
-- TOC entry 4927 (class 0 OID 16548)
-- Dependencies: 224
-- Data for Name: specialize; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.specialize VALUES (2696, 'user2@mail.com');
INSERT INTO asmnt3.specialize VALUES (9731, 'user8@mail.com');
INSERT INTO asmnt3.specialize VALUES (2686, 'user11@mail.com');
INSERT INTO asmnt3.specialize VALUES (7556, 'user17@mail.com');
INSERT INTO asmnt3.specialize VALUES (2805, 'user20@mail.com');
INSERT INTO asmnt3.specialize VALUES (7556, 'user29@mail.com');
INSERT INTO asmnt3.specialize VALUES (7556, 'user1@mail.com');
INSERT INTO asmnt3.specialize VALUES (9270, 'user4@mail.com');
INSERT INTO asmnt3.specialize VALUES (2805, 'user11@mail.com');
INSERT INTO asmnt3.specialize VALUES (9766, 'user2@mail.com');
INSERT INTO asmnt3.specialize VALUES (5932, 'user20@mail.com');
INSERT INTO asmnt3.specialize VALUES (6908, 'user23@mail.com');
INSERT INTO asmnt3.specialize VALUES (9027, 'user2@mail.com');
INSERT INTO asmnt3.specialize VALUES (4933, 'user11@mail.com');
INSERT INTO asmnt3.specialize VALUES (6908, 'user11@mail.com');
INSERT INTO asmnt3.specialize VALUES (9787, 'user5@mail.com');
INSERT INTO asmnt3.specialize VALUES (8221, 'user14@mail.com');
INSERT INTO asmnt3.specialize VALUES (9027, 'user26@mail.com');


--
-- TOC entry 4918 (class 0 OID 16431)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: asmnt3; Owner: postgres
--

INSERT INTO asmnt3.users VALUES ('user1@mail.com', 'Lewis', 'Johnson', 59146, '123-456-7863', 'Egypt');
INSERT INTO asmnt3.users VALUES ('user3@mail.com', 'Fernando', 'Alonso', 116207, '123-456-7828', 'South Africa');
INSERT INTO asmnt3.users VALUES ('user5@mail.com', 'Daniel', 'Ricciardo', 105530, '123-456-7893', 'USA');
INSERT INTO asmnt3.users VALUES ('user8@mail.com', 'Neymar', 'Jr', 92220, '123-456-7842', 'Russia');
INSERT INTO asmnt3.users VALUES ('user11@mail.com', 'Brad', 'Pitt', 119970, '123-456-7891', 'Brazil');
INSERT INTO asmnt3.users VALUES ('user15@mail.com', 'Leonardo', 'DiCaprio', 65398, '123-456-7882', 'China');
INSERT INTO asmnt3.users VALUES ('user18@mail.com', 'Denzel', 'Washington', 113093, '123-456-7872', 'Mexico');
INSERT INTO asmnt3.users VALUES ('user21@mail.com', 'Keanu', 'Reeves', 52242, '123-456-7854', 'Nigeria');
INSERT INTO asmnt3.users VALUES ('user22@mail.com', 'Robert', 'Downey', 70549, '123-456-7845', 'India');
INSERT INTO asmnt3.users VALUES ('user23@mail.com', 'Chris', 'Hemsworth', 112219, '123-456-7898', 'Brazil');
INSERT INTO asmnt3.users VALUES ('user24@mail.com', 'Hugh', 'Jackman', 71524, '123-456-7834', 'Russia');
INSERT INTO asmnt3.users VALUES ('user25@mail.com', 'Mark', 'Ruffalo', 68555, '123-456-7883', 'Brazil');
INSERT INTO asmnt3.users VALUES ('user29@mail.com', 'Lionel', 'Wilson', 113142, '123-456-7825', 'Egypt');
INSERT INTO asmnt3.users VALUES ('user26@mail.com', 'Beyonce', 'Swift', 90054, '123-456-7849', 'Nigeria');
INSERT INTO asmnt3.users VALUES ('user28@mail.com', 'Shakira', 'Ramos', 119976, '123-456-7868', 'Nigeria');
INSERT INTO asmnt3.users VALUES ('user13@mail.com', 'Sandra', 'Bullock', 53463, '123-456-7868', 'Egypt');
INSERT INTO asmnt3.users VALUES ('user19@mail.com', 'Julia', 'Roberts', 102347, '123-456-7811', 'South Africa');
INSERT INTO asmnt3.users VALUES ('user2@mail.com', 'Sebastian', 'Vettel', 69156, '123-456-7819', 'Canada');
INSERT INTO asmnt3.users VALUES ('user6@mail.com', 'Cristiano', 'Williams', 51315, '123-456-7862', 'Brazil');
INSERT INTO asmnt3.users VALUES ('user12@mail.com', 'Angelinagul', 'Jolie', 97502, '123-456-7831', 'Russia');
INSERT INTO asmnt3.users VALUES ('user14@mail.com', 'Tom', 'Cruise', 104438, '123-456-7875', 'Canada');
INSERT INTO asmnt3.users VALUES ('user17@mail.com', 'Will', 'Smith', 63428, '123-456-7845', 'Canada');
INSERT INTO asmnt3.users VALUES ('user20@mail.com', 'Scarlett', 'Johansson', 69792, '123-456-7858', 'China');
INSERT INTO asmnt3.users VALUES ('user27@mail.com', 'Sandragul', 'Smith', 56249, '123-456-7870', 'Egypt');
INSERT INTO asmnt3.users VALUES ('user30@mail.com', 'Cristianobek', 'Ronaldo', 75720, '123-456-7873', 'Egypt');
INSERT INTO asmnt3.users VALUES ('user9@mail.com', 'Sergiobek', 'Ramos', 94263, '123-456-7842', 'Mexico');
INSERT INTO asmnt3.users VALUES ('user4@mail.com', 'Christina', 'Aguilera', 95528, '123-456-7818', 'USA');
INSERT INTO asmnt3.users VALUES ('user10@mail.com', 'Kimi', 'Raikkonen', 211328, '123-456-7824', 'Mexico');
INSERT INTO asmnt3.users VALUES ('user16@mail.com', 'Morgan', 'Freeman', 2025600, '123-456-7840', 'Russia');
INSERT INTO asmnt3.users VALUES ('user7@mail.com', 'Lionel', 'Brown', 1915520, '123-456-7891', 'China');


--
-- TOC entry 4757 (class 2606 OID 16595)
-- Name: specialize Primary Key; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.specialize
    ADD CONSTRAINT "Primary Key" PRIMARY KEY (id, email);


--
-- TOC entry 4759 (class 2606 OID 16597)
-- Name: record Primary key; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.record
    ADD CONSTRAINT "Primary key" PRIMARY KEY (email, cname, disease_code);


--
-- TOC entry 4744 (class 2606 OID 16485)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- TOC entry 4747 (class 2606 OID 16487)
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- TOC entry 4742 (class 2606 OID 16472)
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 16547)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- TOC entry 4749 (class 2606 OID 16735)
-- Name: discover pk_discover; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.discover
    ADD CONSTRAINT pk_discover PRIMARY KEY (cname, disease_code);


--
-- TOC entry 4740 (class 2606 OID 16712)
-- Name: patients pk_email; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.patients
    ADD CONSTRAINT pk_email PRIMARY KEY (email);


--
-- TOC entry 4751 (class 2606 OID 16714)
-- Name: patientdisease pk_email_code; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.patientdisease
    ADD CONSTRAINT pk_email_code PRIMARY KEY (email, disease_code);


--
-- TOC entry 4753 (class 2606 OID 16575)
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- TOC entry 4738 (class 2606 OID 16435)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 4745 (class 1259 OID 16757)
-- Name: disease_disease_code_idx; Type: INDEX; Schema: asmnt3; Owner: postgres
--

CREATE INDEX disease_disease_code_idx ON asmnt3.disease USING btree (disease_code);


--
-- TOC entry 4760 (class 2606 OID 16623)
-- Name: users country_cname_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.users
    ADD CONSTRAINT country_cname_fkey FOREIGN KEY (cname) REFERENCES asmnt3.country(cname) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 4763 (class 2606 OID 16741)
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES asmnt3.country(cname) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4764 (class 2606 OID 16736)
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES asmnt3.disease(disease_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4762 (class 2606 OID 16725)
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES asmnt3.diseasetype(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4768 (class 2606 OID 16669)
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.users(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4765 (class 2606 OID 16715)
-- Name: patientdisease patientdisease_disease_code_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.patientdisease
    ADD CONSTRAINT patientdisease_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES asmnt3.disease(disease_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4766 (class 2606 OID 16720)
-- Name: patientdisease patientdisease_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.patientdisease
    ADD CONSTRAINT patientdisease_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.users(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4761 (class 2606 OID 16674)
-- Name: patients patients_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.patients
    ADD CONSTRAINT patients_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.users(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4767 (class 2606 OID 16664)
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.users(email) ON UPDATE CASCADE ON DELETE SET DEFAULT NOT VALID;


--
-- TOC entry 4771 (class 2606 OID 16704)
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES asmnt3.country(cname) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4772 (class 2606 OID 16699)
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES asmnt3.disease(disease_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4773 (class 2606 OID 16684)
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.publicservant(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4769 (class 2606 OID 16679)
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES asmnt3.doctor(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4770 (class 2606 OID 16694)
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: asmnt3; Owner: postgres
--

ALTER TABLE ONLY asmnt3.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES asmnt3.diseasetype(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 4934
-- Name: DATABASE assignment3_yjnt; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE assignment3_yjnt TO lissovoyd;


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE specialize; Type: ACL; Schema: asmnt3; Owner: postgres
--

GRANT UPDATE ON TABLE asmnt3.specialize TO lissovoyd;


-- Completed on 2024-11-16 22:24:56

--
-- PostgreSQL database dump complete
--

