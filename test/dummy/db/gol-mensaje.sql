--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-16 20:22:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 19524)
-- Name: adm_maestro_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm_maestro_tipos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE adm_maestro_tipos OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE adm_maestro_tipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE adm_maestro_tipos IS 'Almacena una lista de los tipos de listados maestros que pueden existir. Ej: "Temporadas / Grupos / Tipos de juego".';


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN adm_maestro_tipos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_maestro_tipos.nombre IS 'Almacena el nombre del tipo de Listado Maestro.';


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN adm_maestro_tipos.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_maestro_tipos.descripcion IS 'Almacena una descripcion mas detallada del tipo de Listado Maestro.';


--
-- TOC entry 197 (class 1259 OID 19530)
-- Name: adm_maestro_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adm_maestro_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm_maestro_tipos_id_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 197
-- Name: adm_maestro_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adm_maestro_tipos_id_seq OWNED BY adm_maestro_tipos.id;


--
-- TOC entry 198 (class 1259 OID 19532)
-- Name: adm_maestros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm_maestros (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    adm_maestro_tipo_id integer NOT NULL,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE adm_maestros OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE adm_maestros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE adm_maestros IS 'Almacena una lista de los Listados Maestros, asociados a un tipo/categoria. Ej: "Cesped Artiicial", "Grupo 1", "Futbol 11"';


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN adm_maestros.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_maestros.nombre IS 'Almacena el nombre del item del Listado Maestro.';


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN adm_maestros.adm_maestro_tipo_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_maestros.adm_maestro_tipo_id IS 'Almacena el id de la categoria/tipo a la que pertenece.';


--
-- TOC entry 199 (class 1259 OID 19538)
-- Name: adm_maestros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adm_maestros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm_maestros_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 199
-- Name: adm_maestros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adm_maestros_id_seq OWNED BY adm_maestros.id;


--
-- TOC entry 200 (class 1259 OID 19552)
-- Name: adm_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm_roles (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    nivel integer NOT NULL,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE adm_roles OWNER TO postgres;

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE adm_roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE adm_roles IS 'Almacena una lista de roles (TIPOS DE USUARIO) a utilizar por el sistema - Super_Administrador / Administrador/ Jugador / Entrenador';


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN adm_roles.nivel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_roles.nivel IS 'Almacena el número de rango de importancia del rol, - importante para no mostrar los roles superiores a los que el usuario este logueado.  ';


--
-- TOC entry 201 (class 1259 OID 19558)
-- Name: adm_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adm_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 201
-- Name: adm_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adm_roles_id_seq OWNED BY adm_roles.id;


--
-- TOC entry 202 (class 1259 OID 19560)
-- Name: adm_territorios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm_territorios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    abreviatura character varying(5),
    imagen character varying(50),
    nivel_superior_id integer DEFAULT 0 NOT NULL,
    nivel integer NOT NULL,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer,
    gentilicio character varying(50)
);


ALTER TABLE adm_territorios OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE adm_territorios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE adm_territorios IS 'TABLA MAESTRA - Almacena un listado de los Territorios Geograficos que manejara el portal';


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN adm_territorios.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_territorios.nombre IS 'Nombre de la región';


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN adm_territorios.nivel_superior_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_territorios.nivel_superior_id IS 'Relación con su nivel superior';


--
-- TOC entry 203 (class 1259 OID 19567)
-- Name: adm_territorios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adm_territorios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm_territorios_id_seq OWNER TO postgres;

--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 203
-- Name: adm_territorios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adm_territorios_id_seq OWNED BY adm_territorios.id;


--
-- TOC entry 204 (class 1259 OID 19569)
-- Name: adm_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm_usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    password_digest character varying(100) NOT NULL,
    adm_rol_id integer NOT NULL,
    token_activacion character varying(150),
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer,
    refresh_token character varying DEFAULT ''::character varying,
    uid character varying,
    CONSTRAINT usuarios_nombre_check2 CHECK ((length(btrim((nombre)::text)) > 3)),
    CONSTRAINT usuarios_password_digest_check2 CHECK ((length(btrim((password_digest)::text)) > 3))
);


ALTER TABLE adm_usuarios OWNER TO postgres;

--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE adm_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE adm_usuarios IS 'Almacena los usuarios para acceder portal';


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN adm_usuarios.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_usuarios.nombre IS 'Nombre del usuario (correo electronico)';


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN adm_usuarios.adm_rol_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN adm_usuarios.adm_rol_id IS 'Almacena EL codigo del rol que puede tener un usuario';


--
-- TOC entry 205 (class 1259 OID 19581)
-- Name: adm_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adm_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adm_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 205
-- Name: adm_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adm_usuarios_id_seq OWNED BY adm_usuarios.id;


--
-- TOC entry 206 (class 1259 OID 19920)
-- Name: perfil_mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfil_mensajes (
    id integer NOT NULL,
    perfil_envia_id integer NOT NULL,
    perfil_recibe_id integer NOT NULL,
    mensaje_id integer,
    asunto character varying(100),
    descripcion character varying(250) NOT NULL,
    leido boolean DEFAULT false NOT NULL,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE perfil_mensajes OWNER TO postgres;

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE perfil_mensajes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfil_mensajes IS 'Almacena un listado con todos los mensajes que se han intercambiado las personas registradas en el portal';


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.perfil_envia_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.perfil_envia_id IS 'Almacena el codigo de la persona que envia el mensaje';


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.perfil_recibe_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.perfil_recibe_id IS 'Almacena el codigo del perfil que recibe el mensaje';


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.mensaje_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.mensaje_id IS 'Almacena el ID del mensaje inicial, el registro actual es el mensaje de respuesta.';


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.asunto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.asunto IS 'Almacena el tema a tratar en el mensaje';


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.descripcion IS 'Almacena el mensaje en si';


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN perfil_mensajes.leido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfil_mensajes.leido IS 'Indica si el mensaje ya fue leido por el usuario receptor';


--
-- TOC entry 207 (class 1259 OID 19927)
-- Name: perfil_mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_mensajes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfil_mensajes_id_seq OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 207
-- Name: perfil_mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_mensajes_id_seq OWNED BY perfil_mensajes.id;


--
-- TOC entry 208 (class 1259 OID 19977)
-- Name: perfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfiles (
    id integer NOT NULL,
    persona_id integer NOT NULL,
    tipo_id integer NOT NULL,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer
);


ALTER TABLE perfiles OWNER TO postgres;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE perfiles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfiles IS 'Almacena un listado de todos los perfiles de las personas que estan registradas en el portal';


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN perfiles.tipo_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.tipo_id IS 'Indica el tipo de perfil: Jugador / Directivo / Aficionado / Entrenador';


--
-- TOC entry 209 (class 1259 OID 19982)
-- Name: perfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfiles_id_seq OWNER TO postgres;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 209
-- Name: perfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfiles_id_seq OWNED BY perfiles.id;


--
-- TOC entry 210 (class 1259 OID 20007)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE personas (
    id integer NOT NULL,
    primer_nombre character varying(20) NOT NULL,
    segundo_nombre character varying(20),
    primer_apellido character varying(20) NOT NULL,
    segundo_apellido character varying(20),
    apodo character varying(20),
    sexo_id integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    adm_usuario_id integer NOT NULL,
    biografia character varying(250),
    territorio_nivel1_id integer NOT NULL,
    territorio_nivel2_id integer NOT NULL,
    territorio_nivel3_id integer,
    telefono character varying(50),
    nacionalidad_id integer,
    nacionalidad2_id integer,
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    usuario_creacion_id integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone,
    usuario_actualizacion_id integer,
    foto character varying(100),
    direccion character varying(150),
    codigo_postal character varying(10),
    territorio_nivel4_id integer,
    movil character varying(50),
    nivel_estudios_id integer
);


ALTER TABLE personas OWNER TO postgres;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE personas IS 'Almacena un listado de las datos basicos de las personas que realizan alguna accion dentro del portal';


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN personas.adm_usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personas.adm_usuario_id IS 'Almacena el codigo del usuario que esta registrando los datos.';


--
-- TOC entry 211 (class 1259 OID 20016)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 211
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- TOC entry 2717 (class 2604 OID 20135)
-- Name: adm_maestro_tipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_maestro_tipos ALTER COLUMN id SET DEFAULT nextval('adm_maestro_tipos_id_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 20136)
-- Name: adm_maestros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_maestros ALTER COLUMN id SET DEFAULT nextval('adm_maestros_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 20138)
-- Name: adm_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_roles ALTER COLUMN id SET DEFAULT nextval('adm_roles_id_seq'::regclass);


--
-- TOC entry 2730 (class 2604 OID 20139)
-- Name: adm_territorios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_territorios ALTER COLUMN id SET DEFAULT nextval('adm_territorios_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 20140)
-- Name: adm_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_usuarios ALTER COLUMN id SET DEFAULT nextval('adm_usuarios_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 20175)
-- Name: perfil_mensajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_mensajes ALTER COLUMN id SET DEFAULT nextval('perfil_mensajes_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 20181)
-- Name: perfiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles ALTER COLUMN id SET DEFAULT nextval('perfiles_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 20185)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- TOC entry 2900 (class 0 OID 19524)
-- Dependencies: 196
-- Data for Name: adm_maestro_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (1, 'Destinos de URL', 'Listado de destinos validos para las URL''s', 'A', '2016-11-07 14:39:40.21171', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (2, 'Tipos de URL', 'Listado con los tipos de URL a seleccionar: De un articulo o URL en general', 'A', '2016-11-07 14:39:40.21171', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (3, 'Sexos', 'Listado de tipos de Sexo', 'A', '2016-11-07 14:39:40.21171', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (4, 'Tipos de Categoría', 'Listado de tipos de Categorías', 'A', '2016-11-07 14:51:16.667723', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (5, 'Tipos de Enlaces', 'Tipos de ENLACES a mostrar por las tiendas. Ej. Imagen/Texto/Mixto', 'A', '2016-11-07 15:20:46.618145', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (6, 'Pierna Buena', 'Señala la pierna que mejor maneja', 'A', '2016-11-07 16:18:47.26784', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (7, 'Tipos de Foto Jugador', 'Listado con los tipos de fotos del jugador', 'A', '2016-11-07 17:33:52.041717', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (8, 'Tipos de Superficie', 'Listado con los tipos de superficie de los campos de juego', 'A', '2016-11-07 21:18:34.603364', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (9, 'Tipos de Campo', 'Listado con los tipos de Campo- Futbol 11 - Futbol 7', 'A', '2016-11-07 21:20:02.480191', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (10, 'Posiciones de Juego', 'Listado con las posiciones en el campo de juego ', 'A', '2016-11-07 21:46:19.092017', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (11, 'Tipo de Jugador', 'Listado con los tipos de juagdor', 'A', '2016-11-07 22:00:57.315123', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (13, 'Temporadas', 'Listado con las temporadas de juego', 'A', '2016-11-14 22:02:02.642158', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (14, 'Tipos de Novedades', 'Listado con los tipos de novedades a mostrar', 'A', '2016-11-21 22:54:52.078754', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (15, 'Tipos de Encuentro', 'Listado con los tipos de encuentros a mostrar', 'A', '2017-02-09 18:15:25.655936', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (16, 'Tipos de Comentarios', 'Listado con los tipos de comentarios que se pueden realizar', 'A', '2017-02-21 16:54:11.080864', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (17, 'Tipos de Opiniones de los Comentarios', 'Listado con los tipos de opiniones que pueden tener los comentarios: me gusta / no me gusta', 'A', '2017-02-23 20:53:42.782958', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (18, 'Tipos de Perfiles', 'Listado con los tipos de perfiles a crear en el portal: JUGADORES / ARBITROS / ENTRENADORES', 'A', '2017-03-22 15:44:36.889673', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (20, 'Nivel de Estudios', 'Listado con los niveles de estudio', 'A', '2017-04-17 16:33:53.327175', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (19, 'Categorías de Tiendas', 'Listado con los tipos de categorias de tiendas', 'A', '2017-03-22 17:34:52.61731', 0, NULL, NULL);
INSERT INTO adm_maestro_tipos (id, nombre, descripcion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (21, 'Categorías de Productos', 'Listado de categorias de productos', 'A', '2017-04-26 22:15:32.868826', 0, NULL, NULL);


--
-- TOC entry 2902 (class 0 OID 19532)
-- Dependencies: 198
-- Data for Name: adm_maestros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (1, '_blank', 1, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (2, '_self', 1, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (3, 'De un Articulo', 2, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (4, 'De una URL en general', 2, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (5, 'Masculino', 3, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (6, 'Femenino', 3, 'A', '2016-11-07 14:42:47.880222', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (7, 'Diapositivas', 4, 'A', '2016-11-07 14:53:08.339435', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (8, 'Enlaces', 4, 'A', '2016-11-07 14:53:22.490361', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (9, 'Imagen', 5, 'A', '2016-11-07 15:21:52.37865', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (10, 'Texto', 5, 'A', '2016-11-07 15:22:03.331272', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (11, 'Mixto', 5, 'A', '2016-11-07 15:22:10.96271', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (12, 'Pierna Izquierda', 6, 'A', '2016-11-07 16:19:15.218221', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (13, 'Pierna Derecha', 6, 'A', '2016-11-07 16:19:28.250089', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (14, 'Ambas piernas', 6, 'A', '2016-11-07 16:19:43.106187', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (15, 'Foto de perfil', 7, 'A', '2016-11-07 17:42:08.080878', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (16, 'Foto de cabecero', 7, 'A', '2016-11-07 17:42:26.690106', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (17, 'Foto General', 7, 'A', '2016-11-07 17:42:34.754689', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (18, 'Hierba Natural', 8, 'A', '2016-11-07 21:19:01.106551', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (19, 'Hierba Artificial', 8, 'A', '2016-11-07 21:19:11.089757', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (20, 'Portero (PT)', 10, 'A', '2016-11-07 21:59:27.833931', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (21, 'Líbero (LB)', 10, 'A', '2016-11-07 21:59:37.122108', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (52, 'ha invitado a', 14, 'A', '2017-01-23 13:49:32.595419', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (22, 'Defensa central (DC)', 10, 'A', '2016-11-07 22:01:15.23273', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (53, 'Tierra', 8, 'A', '2017-01-24 20:23:17.579309', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (23, 'Lateral derecho (LD)', 10, 'A', '2016-11-07 22:01:21.737307', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (25, 'Lateral izquierdo (LI)', 10, 'A', '2016-11-07 22:26:32.867031', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (26, 'Carrilero (CRR)', 10, 'A', '2016-11-07 22:26:53.369697', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (28, 'Mediocentro defensivo (MCD)', 10, 'A', '2016-11-07 22:27:13.354101', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (29, 'Mediocentro (MC)', 10, 'A', '2016-11-07 22:27:31.067513', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (30, 'Interior derecho (ID)', 10, 'A', '2016-11-07 22:27:45.618245', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (31, 'Interior izquierdo (II)', 10, 'A', '2016-11-07 22:27:59.051228', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (32, 'Mediapunta (MP)', 10, 'A', '2016-11-07 22:28:11.914517', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (33, 'Extremo derecho (ED)', 10, 'A', '2016-11-07 22:28:24.850344', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (34, 'Extremo izquierdo (EI)', 10, 'A', '2016-11-07 22:28:38.643353', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (35, 'Segunda punta (SP)', 10, 'A', '2016-11-07 22:29:01.602478', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (36, 'Delantero centro (DC)', 10, 'A', '2016-11-07 22:29:14.890959', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (37, 'Titular', 11, 'A', '2016-11-07 22:29:59.218669', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (38, 'Suplente', 11, 'A', '2016-11-07 22:30:04.594766', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (80, 'Primaria', 20, 'A', '2017-04-17 16:34:19.494115', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (55, 'Fútbol 11', 9, 'A', '2017-01-24 20:27:12.29015', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (54, 'Fútbol 7', 9, 'A', '2017-01-24 20:26:56.418517', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (56, 'Amistoso', 15, 'A', '2017-02-09 18:15:54.052727', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (51, 'ha añadido a', 14, 'A', '2016-11-21 22:56:21.334496', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (57, 'Torneo', 15, 'A', '2017-02-09 18:16:01.297955', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (58, 'Liga', 15, 'A', '2017-02-09 18:16:08.690159', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (59, 'Texto', 16, 'A', '2017-02-21 16:54:33.559836', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (60, 'Imagen', 16, 'A', '2017-02-21 16:54:42.92575', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (61, 'Video', 16, 'A', '2017-02-21 16:54:51.98171', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (46, '2015-2016', 13, 'A', '2016-11-14 22:02:35.105158', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (47, '2016-2017', 13, 'A', '2016-11-14 22:02:43.090172', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (48, '2017-2018', 13, 'N', '2016-11-14 22:02:50.090525', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (49, '2018-2019', 13, 'N', '2016-11-14 22:02:56.010642', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (62, 'Opinión', 16, 'A', '2017-02-21 16:55:21.678053', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (64, 'No me gusta', 17, 'A', '2017-02-23 20:54:16.350953', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (63, 'Me gusta', 17, 'A', '2017-02-23 20:54:03.647362', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (81, 'Secundaria', 20, 'A', '2017-04-17 16:34:25.7645', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (50, 'comentó', 14, 'A', '2016-11-21 22:56:07.60749', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (66, 'le gustó', 14, 'A', '2017-03-07 22:04:46.318015', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (67, 'no le gustó', 14, 'A', '2017-03-07 22:05:02.433947', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (68, 'compartió', 14, 'A', '2017-03-07 22:56:04.102435', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (69, 'hizo una', 14, 'A', '2017-03-07 23:40:02.606233', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (75, 'Agente', 18, 'A', '2017-03-22 15:45:59.098934', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (76, 'Empresa', 18, 'A', '2017-03-22 15:46:06.298542', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (77, 'Zapatos', 19, 'A', '2017-03-22 17:35:18.001596', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (78, 'Camisetas', 19, 'A', '2017-03-22 17:35:26.354413', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (79, 'Implementos', 19, 'A', '2017-03-22 17:35:42.033646', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (82, 'Universitaria', 20, 'A', '2017-04-17 16:34:36.974069', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (83, 'No duraderos', 21, 'A', '2017-04-26 22:17:22.835843', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (84, 'Duraderos ', 21, 'A', '2017-04-26 22:17:35.683868', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (85, 'De servicio', 21, 'A', '2017-04-26 22:17:46.979973', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (86, 'General', 16, 'A', '2017-08-12 22:06:47.511359', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (90, 'Otros', 20, 'A', '2017-08-29 18:17:40.975201', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (71, 'Club', 18, 'A', '2017-03-22 15:45:09.922433', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (91, 'Analista', 18, 'A', '2017-09-26 14:44:51.057756', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (70, 'Jugador/a', 18, 'A', '2017-03-22 15:45:02.936793', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (87, 'Preparador/a Físico', 18, 'A', '2017-08-29 16:29:54.215984', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (72, 'Entrenador/a', 18, 'A', '2017-03-22 15:45:23.825832', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (73, 'Aficionado/a', 18, 'A', '2017-03-22 15:45:30.474382', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (74, 'Arbitro/a', 18, 'A', '2017-03-22 15:45:39.979271', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (89, 'Delegado/a', 18, 'A', '2017-08-29 16:30:13.964113', 0, NULL, NULL);
INSERT INTO adm_maestros (id, nombre, adm_maestro_tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (88, 'Entrenador/a de Porteros/as', 18, 'A', '2017-08-29 16:30:03.627112', 0, NULL, NULL);


--
-- TOC entry 2904 (class 0 OID 19552)
-- Dependencies: 200
-- Data for Name: adm_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_roles (id, nombre, descripcion, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (1, 'Publico', 'Publico en General sin sesion', 20, 'A', '2016-11-07 14:47:01.707089', 0, NULL, NULL);
INSERT INTO adm_roles (id, nombre, descripcion, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (2, 'SuperAdministrador', 'Administrador TOTAL del portal ', 1, 'A', '2016-11-07 14:47:01.707089', 0, NULL, NULL);
INSERT INTO adm_roles (id, nombre, descripcion, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (3, 'Administrador', 'Administrador general del portal', 2, 'A', '2016-11-07 14:47:01.707089', 0, NULL, NULL);
INSERT INTO adm_roles (id, nombre, descripcion, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (4, 'Usuario', 'Usuario General registrado en el portal', 3, 'A', '2016-11-07 14:47:01.707089', 0, NULL, NULL);


--
-- TOC entry 2906 (class 0 OID 19560)
-- Dependencies: 202
-- Data for Name: adm_territorios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (4, 'Argentina', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Argentino');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (7, 'Bolivia', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Boliviano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (11, 'Chile', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Chileno');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (13, 'Colombia', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Colombiano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (15, 'Costa Rica', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Costarricense');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (16, 'Cuba', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Cubano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (18, 'Ecuador', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Ecuatoriano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (20, 'El Salvador', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Salvadoreño');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (21, 'España', 'ES', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Español');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (30, 'Guatemala', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Guatemalteco');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (33, 'Honduras', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Hondureño');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (46, 'México', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Mexicano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (47, 'Nicaragua', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Nicaragüense');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (50, 'Panamá', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Panameño');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (51, 'Paraguay', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Paraguayo');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (52, 'Perú', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Peruano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (55, 'Puerto Rico', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Puertorriqueño');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (56, 'Republica Dominicana', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Dominicano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (65, 'Uruguay', '', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Uruguayo');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (66, 'Venezuela', 'VE', NULL, 0, 1, 'A', '2016-11-07 17:15:55.359663', 0, NULL, NULL, 'Venezolano');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (119, 'Álava', 'ES-VI', NULL, 117, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (103, 'Aragón', 'ES-AR', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (104, 'Asturias, Principado de', 'ES-AS', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (105, 'Canarias', 'ES-CN', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (106, 'Cantabria', 'ES-CB', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (107, 'Castilla-La Mancha', 'ES-CM', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (108, 'Castilla y León', 'ES-CL', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (109, 'Cataluña', 'ES-CT', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (110, 'Extremadura', 'ES-EX', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (111, 'Galicia', 'ES-GA', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (112, 'Islas Baleares', 'ES-IB', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (113, 'La Rioja', 'ES-RI', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (114, 'Madrid', 'ES-MD', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (115, 'Murcia', 'ES-MC', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (116, 'Navarra', 'ES-NC', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (117, 'País Vasco', 'ES-PV', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (118, 'Valenciana', 'ES-VC', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (120, 'Albacete', 'ES-AB', NULL, 107, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (121, 'Alicante', 'ES-A', NULL, 118, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (122, 'Almería', 'ES-AL', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (123, 'Asturias', 'ES-O', NULL, 104, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (124, 'Ávila', 'ES-AV', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (125, 'Badajoz', 'ES-BA', NULL, 110, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (126, 'Baleares', 'ES-PM', NULL, 112, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (127, 'Barcelona', 'ES-B', NULL, 109, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (128, 'Burgos', 'ES-BU', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (129, 'Cáceres', 'ES-CC', NULL, 110, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (130, 'Cádiz', 'ES-CA', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (131, 'Cantabria', 'ES-S', NULL, 106, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (132, 'Castellón', 'ES-CS', NULL, 118, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (133, 'Ciudad Real', 'ES-CR', NULL, 107, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (134, 'Córdoba', 'ES-CO', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (135, 'Cuenca', 'ES-CU', NULL, 107, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (136, 'Gerona', 'ES-GI', NULL, 109, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (137, 'Granada', 'ES-GR', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (138, 'Guadalajara', 'ES-GU', NULL, 107, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (139, 'Guipúzcoa', 'ES-SS', NULL, 117, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (140, 'Huelva', 'ES-H', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (141, 'Huesca', 'ES-HU', NULL, 103, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (142, 'Jaén', 'ES-J', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (143, 'La Coruña', 'ES-C', NULL, 111, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (144, 'La Rioja', 'ES-LO', NULL, 113, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (145, 'Las Palmas', 'ES-GC', NULL, 105, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (146, 'León', 'ES-LE', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (147, 'Lérida', 'ES-L', NULL, 109, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (148, 'Lugo', 'ES-LU', NULL, 111, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (149, 'Madrid', 'ES-M', NULL, 114, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (150, 'Málaga', 'ES-MA', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (151, 'Murcia', 'ES-MU', NULL, 115, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (152, 'Navarra', 'ES-NA', NULL, 116, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (153, 'Orense', 'ES-OR', NULL, 111, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (154, 'Palencia', 'ES-P', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (155, 'Pontevedra', 'ES-PO', NULL, 111, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (156, 'Salamanca', 'ES-SA', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (157, 'Santa Cruz de Tenerife', 'ES-TF', NULL, 105, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (158, 'Segovia', 'ES-SG', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (159, 'Sevilla', 'ES-SE', NULL, 102, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (160, 'Soria', 'ES-SO', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (161, 'Tarragona', 'ES-T', NULL, 109, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (162, 'Teruel', 'ES-TE', NULL, 103, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (163, 'Toledo', 'ES-TO', NULL, 107, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (164, 'Valencia', 'ES-V', NULL, 118, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (165, 'Valladolid', 'ES-VA', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (166, 'Vizcaya', 'ES-BI', NULL, 117, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (167, 'Zamora', 'ES-ZA', NULL, 108, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (168, 'Zaragoza', 'ES-Z', NULL, 103, 3, 'A', '2016-11-07 17:16:59.143323', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (102, 'Andalucía', 'ES-AN', NULL, 21, 2, 'A', '2016-11-07 17:16:35.300619', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (169, 'AJALVIR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (170, 'ALALPARDO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (171, 'ALAMEDA DEL VALLE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (172, 'ALAMIN', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (173, 'ALCALA DE HENARES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (174, 'ALCOBENDAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (175, 'ALCORCON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (176, 'ALDEA DEL FRESNO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (177, 'ALDERETE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (178, 'ALGETE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (179, 'ALGODOR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (180, 'ALPEDRETE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (181, 'AMBITE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (182, 'ANCHUELO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (183, 'AOSLOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (184, 'ARANJUEZ', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (185, 'ARGANDA DEL REY', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (186, 'ARROYOMOLINOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (187, 'BATRES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (188, 'BECERRIL DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (189, 'BELLIDAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (190, 'BELMONTE DE TAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (191, 'BELVIS DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (192, 'BERZOSA DEL LOZOYA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (193, 'BOADILLA DEL MONTE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (194, 'BRAOJOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (195, 'BREA DE TAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (196, 'BRUNETE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (197, 'BUITRAGO DEL LOZOYA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (198, 'BUSTARVIEJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (199, 'CABANILLAS DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (200, 'CADALSO DE LOS VIDRIOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (201, 'CAMARMA DE ESTERUELAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (202, 'CAMORRITOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (203, 'CAMPO REAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (204, 'CANENCIA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (205, 'CANTO DE LA PATA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (206, 'CARABAÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (207, 'CASARRUBUELOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (208, 'CASTILLEJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (209, 'CASTILLO DE TAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (210, 'CENICIENTOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (211, 'CERCEDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (212, 'CERCEDILLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (213, 'CERVERA DE BUITRAGO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (214, 'CHAPINERIA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (215, 'CHINCHON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (216, 'CIEMPOZUELOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (217, 'CINCO VILLAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (218, 'COBEÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (219, 'COLLADO MEDIANO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (220, 'COLLADO VILLALBA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (221, 'COLMENAR DE OREJA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (222, 'COLMENAR DEL ARROYO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (223, 'COLMENAR VIEJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (224, 'COLMENAREJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (225, 'CORPA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (226, 'COSLADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (227, 'CUBAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (228, 'DAGANZO DE ARRIBA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (229, 'EL ALAMO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (230, 'EL ATAZAR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (231, 'EL BERRUECO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (232, 'EL BOALO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (233, 'EL CAMPILLO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (234, 'EL CUADRON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (235, 'EL ESCORIAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (236, 'EL ESPARTAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (237, 'EL MOLAR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (238, 'EL PIMPOLLAR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (239, 'EL VELLON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (240, 'ESTREMERA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (241, 'FRESNEDILLAS DE LA OLIVA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (242, 'FRESNO DE TOROTE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (243, 'FUENLABRADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (244, 'FUENTE DEL FRESNO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (245, 'FUENTE EL SAZ DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (246, 'FUENTE LA TEJA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (247, 'FUENTIDUEÑA DE TAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (248, 'GALAPAGAR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (249, 'GANDULLAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (250, 'GARGANTA DE LOS MONTES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (251, 'GARGANTILLA DEL LOZOYA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (252, 'GASCONES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (253, 'GETAFE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (254, 'GOZQUEZ DE ABAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (255, 'GOZQUEZ DE ARRIBA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (256, 'GRIÑON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (257, 'GUADALIX DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (258, 'GUADARRAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (259, 'HORCAJO DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (260, 'HORCAJUELO DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (261, 'HOYO DE MANZANARES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (262, 'HUMANES DE MADRID', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (263, 'HUMERA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (264, 'LA ACEBEDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (265, 'LA CABRERA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (266, 'LA CEREDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (267, 'LA FLAMENCA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (268, 'LA HIRUELA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (269, 'LA HOYA (Santa María de la Alameda)', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (270, 'LA HOYA (Valdemanco)', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (271, 'LA MARAÑOSA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (272, 'LA PARADILLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (273, 'LA SERNA DEL MONTE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (274, 'LAS HERRERAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (275, 'LAS INFANTAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (276, 'LAS ROZAS DE MADRID', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (277, 'LEGANES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (278, 'LOECHES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (279, 'LOS HUEROS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (280, 'LOS MOLINOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (281, 'LOS SANTOS DE LA HUMOSA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (282, 'LOZOYA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (283, 'LOZOYUELA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (284, 'MADARCOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (285, 'MADRID', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (286, 'MAJADAHONDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (287, 'MANJIRON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (288, 'MANZANARES EL REAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (289, 'MATAELPINO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (290, 'MECO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (291, 'MEJORADA DEL CAMPO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (292, 'MIRAFLORES DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (293, 'MONTEJO DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (294, 'MORALEJA DE ENMEDIO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (295, 'MORALZARZAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (296, 'MORATA DE TAJUÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (297, 'MOSTOLES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (298, 'NAVACERRADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (299, 'NAVALAFUENTE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (300, 'NAVALAGAMELLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (301, 'NAVALCARNERO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (302, 'NAVALESPINO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (303, 'NAVALQUEJIGO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (304, 'NAVARREDONDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (305, 'NAVAS DE BUITRAGO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (306, 'NAVAS DEL REY', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (307, 'NUEVO BAZTAN', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (308, 'OLMEDA DE LAS FUENTES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (309, 'ORUSCO DE TAJUÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (310, 'OTERUELO DEL VALLE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (311, 'PAJARES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (312, 'PARACUELLOS DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (313, 'PAREDES DE BUITRAGO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (314, 'PARLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (315, 'PATONES DE ABAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (316, 'PATONES DE ARRIBA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (317, 'PEDREZUELA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (318, 'PELAYOS DE LA PRESA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (319, 'PERALEJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (320, 'PERALES DE TAJUÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (321, 'PERALES DEL RIO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (322, 'PEZUELA DE LAS TORRES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (323, 'PINILLA DE BUITRAGO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (324, 'PINILLA DEL VALLE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (325, 'PINTO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (326, 'PIÑUECAR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (327, 'PISCIS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (328, 'POZUELO DE ALARCON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (329, 'POZUELO DEL REY', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (330, 'PRADENA DEL RINCON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (331, 'PUEBLA DE LA SIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (332, 'QUIJORNA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (333, 'RASCAFRIA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (334, 'REDONDO DE ABAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (335, 'REDONDO DE ARRIBA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (336, 'REDUEÑA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (337, 'RIBATEJADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (338, 'RIVAS DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (339, 'RIVAS-VACIAMADRID', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (340, 'ROBLEDILLO DE LA JARA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (341, 'ROBLEDO DE CHAVELA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (342, 'ROBLEDONDO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (343, 'ROBREGORDO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (344, 'ROZAS DE PUERTO REAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (345, 'SAN AGUSTIN DEL GUADALIX', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (346, 'SAN FERNANDO DE HENARES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (347, 'SAN ISIDRO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (348, 'SAN LORENZO DE EL ESCORIAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (349, 'SAN MAMES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (350, 'SAN MARTIN DE LA VEGA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (351, 'SAN MARTIN DE VALDEIGLESIAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (352, 'SAN SEBASTIAN DE LOS REYES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (353, 'SANTA MARIA DE LA ALAMEDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (354, 'SANTORCAZ', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (355, 'SERRACINES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (356, 'SERRADA DE LA FUENTE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (357, 'SERRANILLOS DEL VALLE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (358, 'SEVILLA LA NUEVA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (359, 'SIETEIGLESIAS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (360, 'SOMOSIERRA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (361, 'SOTO DEL REAL', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (362, 'TALAMANCA DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (363, 'TIELMES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (364, 'TITULCIA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (365, 'TORREJON DE ARDOZ', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (366, 'TORREJON DE LA CALZADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (367, 'TORREJON DE VELASCO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (368, 'TORRELAGUNA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (369, 'TORRELODONES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (370, 'TORREMOCHA DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (371, 'TORRES DE LA ALAMEDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (372, 'TRES CANTOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (373, 'VALDARACETE', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (374, 'VALDEAVERO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (375, 'VALDELAGUNA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (376, 'VALDEMANCO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (377, 'VALDEMAQUEDA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (378, 'VALDEMORILLO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (379, 'VALDEMORO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (380, 'VALDEOLMOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (381, 'VALDEPIELAGOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (382, 'VALDETORRES DE JARAMA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (383, 'VALDILECHA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (384, 'VALVERDE DE ALCALA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (385, 'VELILLA DE SAN ANTONIO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (386, 'VENTURADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (387, 'VILLA DEL PRADO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (388, 'VILLACONEJOS', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (389, 'VILLALBILLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (390, 'VILLAMANRIQUE DE TAJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (391, 'VILLAMANTA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (392, 'VILLAMANTILLA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (393, 'VILLAMEJOR', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (394, 'VILLANUEVA DE LA CAÑADA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (395, 'VILLANUEVA DE PERALES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (396, 'VILLANUEVA DEL PARDILLO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (397, 'VILLAR DEL OLMO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (398, 'VILLAREJO DE SALVANES', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (399, 'VILLAVICIOSA DE ODON', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (400, 'VILLAVIEJA DEL LOZOYA', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (401, 'ZARZALEJO', '', NULL, 149, 4, 'A', '2017-01-24 23:41:36.387992', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (402, 'Abla', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (403, 'Abrucena', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (404, 'Adra', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (405, 'Albánchez', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (406, 'Alboloduy', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (407, 'Albox', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (408, 'Alcolea', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (409, 'Alcóntar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (410, 'Alhama de Almería', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (411, 'Alcudia de Monteagud', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (412, 'Alhabia', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (413, 'Vera', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (414, 'Alicún', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (415, 'Almería', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (416, 'Almócita', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (417, 'Viator', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (418, 'Alsodux', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (419, 'Antas', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (420, 'Arboleas', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (421, 'Armuña de Almanzora', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (422, 'Bacares', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (423, 'Bayárcal', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (424, 'Bayarque', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (425, 'Bédar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (426, 'Beires', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (427, 'Benahadux', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (428, 'Benitagla', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (429, 'Benizalón', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (430, 'Bentarique', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (431, 'Berja', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (432, 'Canjáyar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (433, 'Cantoria', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (434, 'Carboneras', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (435, 'Castro de Filabres', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (436, 'Ejido (El)', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (437, 'Chercos', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (438, 'Chirivel', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (439, 'Garrucha', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (440, 'Cóbdar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (441, 'Cuevas del Almanzora', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (442, 'Dalías', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (443, 'Fiñana', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (444, 'Enix', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (445, 'Felix', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (446, 'Gérgal', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (447, 'Fines', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (448, 'Fondón', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (449, 'Gádor', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (450, 'Gallardos (Los)', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (451, 'Huécija', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (452, 'Huércal de Almería', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (453, 'Huércal-Overa', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (454, 'Illar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (455, 'Instinción', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (456, 'Laroya', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (457, 'Láujar de Andarax', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (458, 'Líjar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (459, 'Lubrín', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (460, 'Lucainena de las Torres', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (461, 'Lúcar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (462, 'Macael', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (463, 'María', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (464, 'Mojácar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (465, 'Mojonera (La)', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (466, 'Nacimiento', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (467, 'Níjar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (468, 'Pechina', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (469, 'Ohanes', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (470, 'Olula de Castro', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (471, 'Olula del Río', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (472, 'Oria', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (473, 'Padules', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (474, 'Partaloa', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (475, 'Paterna del Río', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (476, 'Pulpí', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (477, 'Purchena', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (478, 'Rágol', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (479, 'Rioja', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (480, 'Roquetas de Mar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (481, 'Santa Cruz de Marchena', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (482, 'Santa Fe de Mondújar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (483, 'Senés', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (484, 'Serón', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (485, 'Sierro', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (486, 'Somontín', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (487, 'Sorbas', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (488, 'Suflí', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (489, 'Tabernas', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (490, 'Taberno', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (491, 'Tahal', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (492, 'Terque', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (493, 'Tíjola', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (494, 'Tres Villas (Las)', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (495, 'Vélez-Blanco', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (496, 'Turre', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (497, 'Turrillas', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (498, 'Uleila del Campo', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (499, 'Urrácal', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (500, 'Velefique', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (501, 'Vélez-Rubio', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (502, 'Vícar', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (503, 'Zurgena', '', NULL, 122, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (504, 'Alcalá de los Gazules', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (505, 'Alcalá del Valle', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (506, 'Algar', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (507, 'Algeciras', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (508, 'Algodonales', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (509, 'Arcos de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (510, 'Barbate', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (511, 'Barrios (Los)', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (512, 'Bornos', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (513, 'Benalup-Casas Viejas', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (514, 'Benaocaz', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (515, 'Bosque (El)', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (516, 'Cádiz', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (517, 'Castellar de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (518, 'Chiclana de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (519, 'Chipiona', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (520, 'Conil de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (521, 'Espera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (522, 'Gastor (El)', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (523, 'Grazalema', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (524, 'Jerez de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (525, 'Jimena de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (526, 'Línea de la Concepción (La)', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (527, 'Medina-Sidonia', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (528, 'Olvera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (529, 'Paterna de Rivera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (530, 'Prado del Rey', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (531, 'Puerto de Santa María (El)', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (532, 'Puerto Real', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (533, 'Puerto Serrano', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (534, 'Rota', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (535, 'San Fernando', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (536, 'Torre Alháquime', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (537, 'San José del Valle', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (538, 'San Roque', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (539, 'Sanlúcar de Barrameda', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (540, 'Setenil de las Bodegas', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (541, 'Tarifa', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (542, 'Villaluenga del Rosario', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (543, 'Trebujena', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (544, 'Ubrique', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (545, 'Vejer de la Frontera', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (546, 'Villamartín', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (547, 'Zahara', '', NULL, 130, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (548, 'Adamuz', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (549, 'Aguilar de la Frontera', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (550, 'Alcaracejos', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (551, 'Almedinilla', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (552, 'Almodóvar del Río', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (553, 'Añora', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (554, 'Baena', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (555, 'Belalcázar', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (556, 'Blázquez (Los)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (557, 'Belmez', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (558, 'Benamejí', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (559, 'Bujalance', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (560, 'Cabra', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (561, 'Cañete de las Torres', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (562, 'Carcabuey', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (563, 'Cardeña', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (564, 'Carlota (La)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (565, 'Carpio (El)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (566, 'Castro del Río', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (567, 'Conquista', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (568, 'Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (569, 'Doña Mencía', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (570, 'Dos Torres', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (571, 'Encinas Reales', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (572, 'Espejo', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (573, 'Espiel', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (574, 'Fernán-Núñez', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (575, 'Fuente la Lancha', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (576, 'Fuente Obejuna', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (577, 'Fuente Palmera', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (578, 'Fuente-Tójar', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (579, 'Granjuela (La)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (580, 'Lucena', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (581, 'Guadalcázar', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (582, 'Guijo (El)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (583, 'Nueva Carteya', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (584, 'Hinojosa del Duque', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (585, 'Hornachuelos', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (586, 'Iznájar', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (587, 'Montilla', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (588, 'Luque', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (589, 'Montalbán de Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (590, 'Obejo', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (591, 'Montemayor', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (592, 'Montoro', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (593, 'Monturque', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (594, 'Moriles', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (595, 'Palenciana', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (596, 'Palma del Río', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (597, 'Pedro Abad', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (598, 'Pedroche', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (599, 'Peñarroya-Pueblonuevo', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (600, 'Posadas', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (601, 'Pozoblanco', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (602, 'Priego de Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (603, 'Puente Genil', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (604, 'Rambla (La)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (605, 'Rute', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (606, 'San Sebastián de los Ballesteros', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (607, 'Santa Eufemia', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (608, 'Santaella', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (609, 'Torrecampo', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (610, 'Valenzuela', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (611, 'Valsequillo', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (612, 'Villaralto', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (613, 'Victoria (La)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (614, 'Villa del Río', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (615, 'Villafranca de Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (616, 'Villaharta', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (617, 'Villanueva de Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (618, 'Villanueva del Duque', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (619, 'Villanueva del Rey', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (620, 'Villaviciosa de Córdoba', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (621, 'Viso (El)', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (622, 'Zuheros', '', NULL, 134, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (623, 'Agrón', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (624, 'Alamedilla', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (625, 'Albolote', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (626, 'Albondón', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (627, 'Albuñán', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (628, 'Albuñol', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (629, 'Albuñuelas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (630, 'Aldeire', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (631, 'Alfacar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (632, 'Algarinejo', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (633, 'Alhama de Granada', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (634, 'Alhendín', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (635, 'Alicún de Ortega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (636, 'Almegíjar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (637, 'Almuñécar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (638, 'Alpujarra de la Sierra', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (639, 'Alquife', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (640, 'Arenas del Rey', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (641, 'Armilla', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (642, 'Atarfe', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (643, 'Baza', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (644, 'Beas de Granada', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (645, 'Beas de Guadix', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (646, 'Benalúa', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (647, 'Benalúa de las Villas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (648, 'Benamaurel', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (649, 'Bérchules', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (650, 'Bubión', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (651, 'Busquístar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (652, 'Cacín', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (653, 'Cádiar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (654, 'Cájar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (655, 'Calahorra (La)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (656, 'Calicasas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (657, 'Campotéjar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (658, 'Caniles', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (659, 'Cáñar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (660, 'Capileira', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (661, 'Carataunas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (662, 'Cástaras', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (663, 'Castilléjar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (664, 'Castril', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (665, 'Cenes de la Vega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (666, 'Chauchina', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (667, 'Chimeneas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (668, 'Churriana de la Vega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (669, 'Cijuela', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (670, 'Cogollos de Guadix', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (671, 'Cogollos de la Vega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (672, 'Colomera', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (673, 'Cortes de Baza', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (674, 'Cortes y Graena', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (675, 'Cuevas del Campo', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (676, 'Cúllar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (677, 'Cúllar Vega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (678, 'Darro', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (679, 'Dehesas de Guadix', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (680, 'Deifontes', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (681, 'Diezma', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (682, 'Dílar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (683, 'Dólar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (684, 'Dúdar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (685, 'Dúrcal', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (686, 'Escúzar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (687, 'Ferreira', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (688, 'Fonelas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (689, 'Freila', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (690, 'Fuente Vaqueros', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (691, 'Gabias (Las)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (692, 'Galera', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (693, 'Gobernador', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (694, 'Gójar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (695, 'Gor', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (696, 'Gorafe', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (697, 'Granada', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (698, 'Guadahortuna', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (699, 'Guadix', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (700, 'Guajares (Los)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (701, 'Gualchos', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (702, 'Güejar Sierra', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (703, 'Güevéjar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (704, 'Huélago', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (705, 'Huéneja', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (706, 'Huéscar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (707, 'Huétor de Santillán', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (708, 'Huétor Tájar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (709, 'Huétor Vega', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (710, 'Illora', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (711, 'Itrabo', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (712, 'Iznalloz', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (713, 'Jayena', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (714, 'Jerez del Marquesado', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (715, 'Jete', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (716, 'Jun', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (717, 'Juviles', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (718, 'Láchar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (719, 'Lanjarón', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (720, 'Lanteira', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (721, 'Lecrín', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (722, 'Lentegí', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (723, 'Lobras', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (724, 'Loja', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (725, 'Lugros', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (726, 'Lújar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (727, 'Malahá (La)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (728, 'Maracena', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (729, 'Marchal', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (730, 'Moclín', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (731, 'Molvízar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (732, 'Monachil', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (733, 'Montefrío', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (734, 'Montejícar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (735, 'Montillana', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (736, 'Moraleda de Zafayona', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (737, 'Morelábor', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (738, 'Motril', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (739, 'Murtas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (740, 'Nevada', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (741, 'Nigüelas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (742, 'Nívar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (743, 'Ogíjares', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (744, 'Orce', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (745, 'Órgiva', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (746, 'Otívar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (747, 'Otura', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (748, 'Padul', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (749, 'Pampaneira', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (750, 'Pedro Martínez', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (751, 'Peligros', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (752, 'Peza (La)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (753, 'Pinar (El)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (754, 'Pinos Genil', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (755, 'Pinos Puente', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (756, 'Píñar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (757, 'Polícar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (758, 'Polopos', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (759, 'Pórtugos', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (760, 'Puebla de Don Fadrique', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (761, 'Pulianas', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (762, 'Purullena', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (763, 'Quéntar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (764, 'Rubite', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (765, 'Salar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (766, 'Salobreña', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (767, 'Santa Cruz del Comercio', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (768, 'Santa Fe', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (769, 'Soportújar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (770, 'Sorvilán', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (771, 'Taha (La)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (772, 'Torre-Cardela', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (773, 'Torvizcón', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (774, 'Trevélez', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (775, 'Turón', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (776, 'Ugíjar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (777, 'Valle (El)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (778, 'Valle del Zalabí', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (779, 'Válor', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (780, 'Vegas del Genil', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (781, 'Vélez de Benaudalla', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (782, 'Ventas de Huelma', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (783, 'Villamena', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (784, 'Villanueva de las Torres', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (785, 'Villanueva Mesía', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (786, 'Víznar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (787, 'Zafarraya', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (788, 'Zagra', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (789, 'Zubia (La)', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (790, 'Zújar', '', NULL, 137, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (791, 'Alájar', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (792, 'Aljaraque', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (793, 'Almendro (El)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (794, 'Almonaster la Real', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (795, 'Almonte', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (796, 'Alosno', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (797, 'Aracena', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (798, 'Aroche', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (799, 'Arroyomolinos de León', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (800, 'Ayamonte', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (801, 'Beas', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (802, 'Berrocal', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (803, 'Bollullos Par del Condado', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (804, 'Bonares', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (805, 'Cabezas Rubias', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (806, 'Cala', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (807, 'Calañas', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (808, 'Campillo (El)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (809, 'Campofrío', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (810, 'Cañaveral de León', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (811, 'Cartaya', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (812, 'Castaño del Robledo', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (813, 'Cerro de Andévalo (El)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (814, 'Chucena', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (815, 'Corteconcepción', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (816, 'Cortegana', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (817, 'Cortelazor', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (818, 'Cumbres de Enmedio', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (819, 'Cumbres de San Bartolomé', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (820, 'Cumbres Mayores', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (821, 'Encinasola', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (822, 'Escacena del Campo', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (823, 'Fuenteheridos', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (824, 'Galaroza', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (825, 'Gibraleón', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (826, 'Granada de Río-Tinto (La)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (827, 'Granado (El)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (828, 'Higuera de la Sierra', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (829, 'Hinojales', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (830, 'Hinojos', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (831, 'Huelva', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (832, 'Isla Cristina', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (833, 'Jabugo', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (834, 'Lepe', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (835, 'Linares de la Sierra', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (836, 'Lucena del Puerto', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (837, 'Manzanilla', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (838, 'Marines (Los)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (839, 'Minas de Riotinto', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (840, 'Moguer', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (841, 'Nava (La)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (842, 'Nerva', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (843, 'Niebla', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (844, 'Palma del Condado (La)', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (845, 'Palos de la Frontera', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (846, 'Paterna del Campo', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (847, 'Paymogo', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (848, 'Puebla de Guzmán', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (849, 'Puerto Moral', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (850, 'Punta Umbría', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (851, 'Rociana del Condado', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (852, 'Rosal de la Frontera', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (853, 'San Bartolomé de la Torre', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (854, 'San Juan del Puerto', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (855, 'San Silvestre de Guzmán', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (856, 'Sanlúcar de Guadiana', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (857, 'Santa Ana la Real', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (858, 'Santa Bárbara de Casa', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (859, 'Santa Olalla del Cala', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (860, 'Trigueros', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (861, 'Valdelarco', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (862, 'Valverde del Camino', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (863, 'Villablanca', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (864, 'Villalba del Alcor', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (865, 'Villanueva de las Cruces', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (866, 'Villanueva de los Castillejos', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (867, 'Villarrasa', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (868, 'Zalamea la Real', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (869, 'Zufre', '', NULL, 140, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (870, 'Albanchez de Mágina', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (871, 'Alcalá la Real', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (872, 'Alcaudete', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (873, 'Aldeaquemada', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (874, 'Andújar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (875, 'Arjona', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (876, 'Arjonilla', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (877, 'Arquillos', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (878, 'Arroyo del Ojanco', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (879, 'Baeza', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (880, 'Bailén', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (881, 'Baños de la Encina', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (882, 'Beas de Segura', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (883, 'Bedmar y Garcíez', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (884, 'Begíjar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (885, 'Bélmez de la Moraleda', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (886, 'Benatae', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (887, 'Cabra del Santo Cristo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (888, 'Cambil', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (889, 'Campillo de Arenas', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (890, 'Canena', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (891, 'Carboneros', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (892, 'Cárcheles', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (893, 'Carolina (La)', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (894, 'Castellar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (895, 'Castillo de Locubín', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (896, 'Cazalilla', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (897, 'Cazorla', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (898, 'Chiclana de Segura', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (899, 'Chilluévar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (900, 'Escañuela', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (901, 'Espelúy', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (902, 'Frailes', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (903, 'Fuensanta de Martos', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (904, 'Fuerte del Rey', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (905, 'Génave', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (906, 'Guardia de Jaén (La)', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (907, 'Guarromán', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (908, 'Higuera de Calatrava', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (909, 'Hinojares', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (910, 'Hornos', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (911, 'Huelma', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (912, 'Huesa', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (913, 'Ibros', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (914, 'Iruela (La)', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (915, 'Iznatoraf', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (916, 'Jabalquinto', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (917, 'Jaén', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (918, 'Jamilena', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (919, 'Jimena', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (920, 'Jódar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (921, 'Lahiguera', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (922, 'Larva', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (923, 'Linares', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (924, 'Lopera', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (925, 'Lupión', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (926, 'Mancha Real', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (927, 'Marmolejo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (928, 'Martos', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (929, 'Mengíbar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (930, 'Montizón', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (931, 'Navas de San Juan', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (932, 'Noalejo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (933, 'Orcera', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (934, 'Peal de Becerro', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (935, 'Pegalajar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (936, 'Porcuna', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (937, 'Pozo Alcón', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (938, 'Puente de Génave', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (939, 'Puerta de Segura (La)', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (940, 'Quesada', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (941, 'Rus', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (942, 'Sabiote', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (943, 'Santa Elena', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (944, 'Santiago de Calatrava', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (945, 'Santiago-Pontones', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (946, 'Santisteban del Puerto', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (947, 'Santo Tomé', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (948, 'Segura de la Sierra', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (949, 'Siles', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (950, 'Sorihuela del Guadalimar', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (951, 'Torre del Campo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (952, 'Torreblascopedro', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (953, 'Torredonjimeno', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (954, 'Torreperogil', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (955, 'Torres', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (956, 'Torres de Albánchez', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (957, 'Úbeda', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (958, 'Valdepeñas de Jaén', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (959, 'Vilches', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (960, 'Villacarrillo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (961, 'Villanueva de la Reina', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (962, 'Villanueva del Arzobispo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (963, 'Villardompardo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (964, 'Villares (Los)', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (965, 'Villarrodrigo', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (966, 'Villatorres', '', NULL, 142, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (967, 'Alameda', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (968, 'Alcaucín', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (969, 'Alfarnate', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (970, 'Alfarnatejo', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (971, 'Algarrobo', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (972, 'Algatocín', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (973, 'Alhaurín de la Torre', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (974, 'Alhaurín el Grande', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (975, 'Almáchar', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (976, 'Almargen', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (977, 'Almogía', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (978, 'Álora', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (979, 'Alozaina', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (980, 'Alpandeire', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (981, 'Antequera', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (982, 'Árchez', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (983, 'Archidona', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (984, 'Ardales', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (985, 'Arenas', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (986, 'Arriate', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (987, 'Atajate', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (988, 'Benadalid', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (989, 'Benahavís', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (990, 'Benalauría', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (991, 'Benalmádena', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (992, 'Benamargosa', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (993, 'Benamocarra', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (994, 'Benaoján', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (995, 'Benarrabá', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (996, 'Borge (El)', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (997, 'Burgo (El)', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (998, 'Campillos', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');
INSERT INTO adm_territorios (id, nombre, abreviatura, imagen, nivel_superior_id, nivel, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, gentilicio) VALUES (999, 'Canillas de Aceituno', '', NULL, 150, 4, 'A', '2017-08-23 01:47:44.779821', 0, NULL, NULL, '');


--
-- TOC entry 2908 (class 0 OID 19569)
-- Dependencies: 204
-- Data for Name: adm_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adm_usuarios (id, nombre, password_digest, adm_rol_id, token_activacion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, refresh_token, uid) VALUES (1, 'danieldgv81@yahoo.es', '$2a$10$7vYrUaRu970HXXvlgf9WlepH4aH38zrAaTyB4vNAUntAfSbT7tKny', 2, '4dd1bc17f3399ecf39cd5e73c4bb241d', 'A', '2016-11-07 14:48:50.474595', 0, NULL, NULL, '', NULL);
INSERT INTO adm_usuarios (id, nombre, password_digest, adm_rol_id, token_activacion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, refresh_token, uid) VALUES (98, 'juampa.sposito@gmail.com', '$2a$10$7vYrUaRu970HXXvlgf9WlepH4aH38zrAaTyB4vNAUntAfSbT7tKny', 4, 'f67c497faa9d0ee08ce487b7a9ecff0d', 'A', '2017-09-21 14:48:03.979283', 1, NULL, NULL, '', NULL);
INSERT INTO adm_usuarios (id, nombre, password_digest, adm_rol_id, token_activacion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, refresh_token, uid) VALUES (99, 'ana@ana.com', '$2a$10$7vYrUaRu970HXXvlgf9WlepH4aH38zrAaTyB4vNAUntAfSbT7tKny', 4, 'ya29.GlvTBK1BP9J1SPVgayf94eTyPy43u4FJNoco3V3aL7HGF5HZEduo2zJB3IyJi3IWr6HrhigMZhDxghs0lLUb_iMzrhPe4N9Un0m6LpC0vcQl8ZHJae_6Zyahvq_u', 'A', '2017-09-27 13:07:49.833901', 1, '2017-09-27 14:41:48.52613', 99, '1/BRXu5O3RZwhcNju6PhePnEL6NqqaWErDATr8lIo9NCBLdHWfuBqy6VOu4iImbkAZ', NULL);
INSERT INTO adm_usuarios (id, nombre, password_digest, adm_rol_id, token_activacion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, refresh_token, uid) VALUES (102, 'frperezr@gmail.com', '$2a$10$7vYrUaRu970HXXvlgf9WlepH4aH38zrAaTyB4vNAUntAfSbT7tKny', 4, '5df5e6fdfa64ea7a33b8372957e545ad', 'A', '2017-11-08 20:55:13.365572', 1, NULL, NULL, '', NULL);
INSERT INTO adm_usuarios (id, nombre, password_digest, adm_rol_id, token_activacion, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, refresh_token, uid) VALUES (101, 'roberto.quelle@golcommunity.com', '$2a$10$7vYrUaRu970HXXvlgf9WlepH4aH38zrAaTyB4vNAUntAfSbT7tKny', 4, 'd5488ab585a780375c85029b146a7e5a', 'A', '2017-10-14 17:15:47.997363', 1, NULL, NULL, '', NULL);


--
-- TOC entry 2910 (class 0 OID 19920)
-- Dependencies: 206
-- Data for Name: perfil_mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2912 (class 0 OID 19977)
-- Dependencies: 208
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfiles (id, persona_id, tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (63, 87, 72, 'A', '2017-09-21 14:52:31.513065', 98, NULL, NULL);
INSERT INTO perfiles (id, persona_id, tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (65, 89, 91, 'A', '2017-09-27 13:22:17.218392', 99, NULL, NULL);
INSERT INTO perfiles (id, persona_id, tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (66, 90, 75, 'A', '2017-10-14 17:22:25.191499', 101, NULL, NULL);
INSERT INTO perfiles (id, persona_id, tipo_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id) VALUES (67, 91, 70, 'A', '2017-11-08 21:04:26.296947', 102, NULL, NULL);


--
-- TOC entry 2914 (class 0 OID 20007)
-- Dependencies: 210
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personas (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, apodo, sexo_id, fecha_nacimiento, adm_usuario_id, biografia, territorio_nivel1_id, territorio_nivel2_id, territorio_nivel3_id, telefono, nacionalidad_id, nacionalidad2_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, foto, direccion, codigo_postal, territorio_nivel4_id, movil, nivel_estudios_id) VALUES (4, 'Daniel', NULL, 'Guevara', NULL, NULL, 5, '1981-08-27', 1, NULL, 21, 114, 149, NULL, 21, NULL, 'R', '2016-11-14 22:00:33.281902', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80);
INSERT INTO personas (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, apodo, sexo_id, fecha_nacimiento, adm_usuario_id, biografia, territorio_nivel1_id, territorio_nivel2_id, territorio_nivel3_id, telefono, nacionalidad_id, nacionalidad2_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, foto, direccion, codigo_postal, territorio_nivel4_id, movil, nivel_estudios_id) VALUES (87, 'Juan', 'Pablo', 'Sposito', '', 'Juampa', 5, '1987-12-23', 98, NULL, 21, 109, 127, '', 4, 38, 'A', '2017-09-21 14:52:31.512907', 98, NULL, NULL, NULL, '', '9000', NULL, '', 81);
INSERT INTO personas (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, apodo, sexo_id, fecha_nacimiento, adm_usuario_id, biografia, territorio_nivel1_id, territorio_nivel2_id, territorio_nivel3_id, telefono, nacionalidad_id, nacionalidad2_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, foto, direccion, codigo_postal, territorio_nivel4_id, movil, nivel_estudios_id) VALUES (89, 'analastaaa', '', 'ANALISTAAA', '', '', 5, '2009-01-05', 99, NULL, 21, 108, 167, '', 21, NULL, 'A', '2017-09-27 13:22:17.218323', 99, NULL, NULL, NULL, '', '6565', NULL, '', NULL);
INSERT INTO personas (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, apodo, sexo_id, fecha_nacimiento, adm_usuario_id, biografia, territorio_nivel1_id, territorio_nivel2_id, territorio_nivel3_id, telefono, nacionalidad_id, nacionalidad2_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, foto, direccion, codigo_postal, territorio_nivel4_id, movil, nivel_estudios_id) VALUES (90, 'Roberto', '', 'Quelle', '', 'kelle', 5, '1988-03-05', 101, NULL, 21, 112, 126, '', 21, NULL, 'A', '2017-10-14 17:22:25.191439', 101, NULL, NULL, NULL, '', '', 7753, '', NULL);
INSERT INTO personas (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, apodo, sexo_id, fecha_nacimiento, adm_usuario_id, biografia, territorio_nivel1_id, territorio_nivel2_id, territorio_nivel3_id, telefono, nacionalidad_id, nacionalidad2_id, estatus, fecha_creacion, usuario_creacion_id, fecha_actualizacion, usuario_actualizacion_id, foto, direccion, codigo_postal, territorio_nivel4_id, movil, nivel_estudios_id) VALUES (91, 'Freddy', 'rafael', 'Pérez', 'ramírez', 'willow', 5, '1983-04-04', 102, NULL, 21, 105, 145, '640538363', 66, NULL, 'A', '2017-11-08 21:04:26.296851', 102, NULL, NULL, 'd4ccf733c8.jpg', 'Calle Salvador Manrique De Lara, 11 4b', '35010', 7050, '640538363', 82);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 197
-- Name: adm_maestro_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adm_maestro_tipos_id_seq', 21, true);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 199
-- Name: adm_maestros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adm_maestros_id_seq', 91, true);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 201
-- Name: adm_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adm_roles_id_seq', 4, true);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 203
-- Name: adm_territorios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adm_territorios_id_seq', 169, true);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 205
-- Name: adm_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adm_usuarios_id_seq', 102, true);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 207
-- Name: perfil_mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_mensajes_id_seq', 15, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 209
-- Name: perfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfiles_id_seq', 67, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 211
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 91, true);


--
-- TOC entry 2751 (class 2606 OID 20258)
-- Name: adm_maestro_tipos pk_maestro_tipos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_maestro_tipos
    ADD CONSTRAINT pk_maestro_tipos PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 20260)
-- Name: adm_maestros pk_maestros; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_maestros
    ADD CONSTRAINT pk_maestros PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 20292)
-- Name: perfil_mensajes pk_perfil_mensajes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_mensajes
    ADD CONSTRAINT pk_perfil_mensajes PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 20304)
-- Name: perfiles pk_perfiles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles
    ADD CONSTRAINT pk_perfiles PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 20310)
-- Name: personas pk_personas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT pk_personas PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 20332)
-- Name: adm_roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 20334)
-- Name: adm_territorios pk_territorios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_territorios
    ADD CONSTRAINT pk_territorios PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 20338)
-- Name: adm_usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 20610)
-- Name: adm_maestros fk_maestro_tipos_maestros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm_maestros
    ADD CONSTRAINT fk_maestro_tipos_maestros FOREIGN KEY (adm_maestro_tipo_id) REFERENCES adm_maestro_tipos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2767 (class 2606 OID 20830)
-- Name: perfil_mensajes fk_perfil_mensajes_perfiles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_mensajes
    ADD CONSTRAINT fk_perfil_mensajes_perfiles FOREIGN KEY (perfil_recibe_id) REFERENCES perfiles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2768 (class 2606 OID 20835)
-- Name: perfil_mensajes fk_perfil_mensajes_perfiles2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_mensajes
    ADD CONSTRAINT fk_perfil_mensajes_perfiles2 FOREIGN KEY (perfil_envia_id) REFERENCES perfiles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2769 (class 2606 OID 20905)
-- Name: perfiles fk_perfiles_maestros2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles
    ADD CONSTRAINT fk_perfiles_maestros2 FOREIGN KEY (tipo_id) REFERENCES adm_maestros(id);


--
-- TOC entry 2770 (class 2606 OID 20910)
-- Name: perfiles fk_perfiles_personas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles
    ADD CONSTRAINT fk_perfiles_personas FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2771 (class 2606 OID 20935)
-- Name: personas fk_personas_maestros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_maestros FOREIGN KEY (sexo_id) REFERENCES adm_maestros(id);


--
-- TOC entry 2772 (class 2606 OID 20940)
-- Name: personas fk_personas_maestros2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_maestros2 FOREIGN KEY (nivel_estudios_id) REFERENCES adm_maestros(id);


--
-- TOC entry 2773 (class 2606 OID 20945)
-- Name: personas fk_personas_territorios1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_territorios1 FOREIGN KEY (territorio_nivel1_id) REFERENCES adm_territorios(id);


--
-- TOC entry 2774 (class 2606 OID 20950)
-- Name: personas fk_personas_territorios2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_territorios2 FOREIGN KEY (territorio_nivel2_id) REFERENCES adm_territorios(id);


--
-- TOC entry 2775 (class 2606 OID 20955)
-- Name: personas fk_personas_territorios3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_territorios3 FOREIGN KEY (territorio_nivel3_id) REFERENCES adm_territorios(id);


--
-- TOC entry 2776 (class 2606 OID 20960)
-- Name: personas fk_personas_territorios4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_territorios4 FOREIGN KEY (nacionalidad_id) REFERENCES adm_territorios(id);


--
-- TOC entry 2777 (class 2606 OID 20965)
-- Name: personas fk_personas_territorios5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_territorios5 FOREIGN KEY (nacionalidad2_id) REFERENCES adm_territorios(id);


--
-- TOC entry 2778 (class 2606 OID 20970)
-- Name: personas fk_personas_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_usuarios FOREIGN KEY (adm_usuario_id) REFERENCES adm_usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2017-11-16 20:22:09

--
-- PostgreSQL database dump complete
--

