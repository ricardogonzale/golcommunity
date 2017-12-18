--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-23 17:00:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 301 (class 1259 OID 18391)
-- Name: persona_amigos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persona_amigos (
    id integer NOT NULL,
    persona_id integer NOT NULL,
    amigo_id integer NOT NULL,
    estatus character(1) DEFAULT 'S'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE persona_amigos OWNER TO postgres;

--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE persona_amigos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE persona_amigos IS 'Almacena un listado de todos los contactos asociados a una persona';


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN persona_amigos.persona_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN persona_amigos.persona_id IS 'Almacena el codigo de la persona que agrupa a los contactos.';


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN persona_amigos.amigo_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN persona_amigos.amigo_id IS 'Almacena el codigo de la persona que desea adjuntar a la lista de contactos.';


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN persona_amigos.estatus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN persona_amigos.estatus IS 'Almacena la letra del estatus del contacto S-Solicitado, A-Activo';


--
-- TOC entry 302 (class 1259 OID 18397)
-- Name: persona_amigos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_amigos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_amigos_id_seq OWNER TO postgres;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 302
-- Name: persona_amigos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_amigos_id_seq OWNED BY persona_amigos.id;


--
-- TOC entry 3083 (class 2604 OID 18589)
-- Name: persona_amigos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_amigos ALTER COLUMN id SET DEFAULT nextval('persona_amigos_id_seq'::regclass);


--
-- TOC entry 3209 (class 0 OID 18391)
-- Dependencies: 301
-- Data for Name: persona_amigos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (28, 44, 31, 'A', '2017-08-23 18:33:36.438952', 61, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (29, 31, 44, 'A', '2017-08-23 21:57:43.205752', 36, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (31, 37, 31, 'A', '2017-08-24 03:26:58.893886', 54, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (34, 31, 37, 'A', '2017-08-24 09:11:08.870637', 36, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (43, 44, 65, 'S', '2017-08-27 12:05:09.659792', 61, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (47, 40, 37, 'S', '2017-08-31 16:39:19.035021', 56, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (48, 40, 31, 'A', '2017-08-31 16:39:26.744413', 56, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (50, 31, 40, 'A', '2017-09-01 06:07:52.29295', 36, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (51, 90, 31, 'S', '2017-10-14 17:39:38.095122', 101, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (52, 90, 37, 'S', '2017-10-14 17:40:14.508963', 101, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (53, 90, 44, 'S', '2017-10-14 17:40:21.525897', 101, NULL, NULL);
INSERT INTO persona_amigos (id, persona_id, amigo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (54, 90, 65, 'S', '2017-10-14 17:40:41.08654', 101, NULL, NULL);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 302
-- Name: persona_amigos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_amigos_id_seq', 54, true);


--
-- TOC entry 3085 (class 2606 OID 18713)
-- Name: persona_amigos pk_persona_contactos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_amigos
    ADD CONSTRAINT pk_persona_contactos PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 19327)
-- Name: persona_amigos fk_persona_amigos_personas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_amigos
    ADD CONSTRAINT fk_persona_amigos_personas FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3087 (class 2606 OID 19332)
-- Name: persona_amigos fk_persona_amigos_personas2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_amigos
    ADD CONSTRAINT fk_persona_amigos_personas2 FOREIGN KEY (amigo_id) REFERENCES personas(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2017-11-23 17:00:34

--
-- PostgreSQL database dump complete
--

