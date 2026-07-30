--
-- PostgreSQL database dump
--

\restrict b8ZzgEzI8F4LMNhooWXCusbcoSZ3a9R2BH3KJYd3qiJ6x0Acfys9C7OCYyCIQ5I

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-29 03:03:21

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
-- TOC entry 246 (class 1259 OID 16589)
-- Name: adminlogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adminlogs (
    id integer NOT NULL,
    admin_id integer,
    action text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.adminlogs OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16588)
-- Name: adminlogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adminlogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adminlogs_id_seq OWNER TO postgres;

--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 245
-- Name: adminlogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adminlogs_id_seq OWNED BY public.adminlogs.id;


--
-- TOC entry 226 (class 1259 OID 16427)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(100),
    logo character varying(255)
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16426)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brands_id_seq OWNER TO postgres;

--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 225
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- TOC entry 260 (class 1259 OID 33006)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 33005)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO postgres;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 259
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- TOC entry 258 (class 1259 OID 32990)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 32989)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 257
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 224 (class 1259 OID 16416)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16415)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 238 (class 1259 OID 16528)
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16527)
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO postgres;

--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 237
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- TOC entry 256 (class 1259 OID 24873)
-- Name: headphone_specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.headphone_specs (
    id integer NOT NULL,
    product_id integer NOT NULL,
    headphone_type character varying(100),
    wireless boolean,
    bluetooth_version character varying(50),
    noise_canceling boolean,
    battery_life character varying(100),
    microphone boolean,
    weight character varying(50)
);


ALTER TABLE public.headphone_specs OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 24872)
-- Name: headphone_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.headphone_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.headphone_specs_id_seq OWNER TO postgres;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 255
-- Name: headphone_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.headphone_specs_id_seq OWNED BY public.headphone_specs.id;


--
-- TOC entry 252 (class 1259 OID 24837)
-- Name: laptop_specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laptop_specs (
    id integer NOT NULL,
    product_id integer NOT NULL,
    cpu character varying(150),
    gpu character varying(150),
    ram character varying(100),
    storage character varying(100),
    screen_size character varying(50),
    resolution character varying(50),
    refresh_rate character varying(50),
    operating_system character varying(100),
    weight character varying(50)
);


ALTER TABLE public.laptop_specs OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24836)
-- Name: laptop_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laptop_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laptop_specs_id_seq OWNER TO postgres;

--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 251
-- Name: laptop_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laptop_specs_id_seq OWNED BY public.laptop_specs.id;


--
-- TOC entry 242 (class 1259 OID 16562)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    user_name character varying(100),
    email character varying(100),
    subject character varying(255),
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16561)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 241
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 240 (class 1259 OID 16546)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(255),
    content text,
    image character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    admin_id integer
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16545)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 239
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 232 (class 1259 OID 16473)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16472)
-- Name: orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_id_seq OWNER TO postgres;

--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 231
-- Name: orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_id_seq OWNED BY public.orderitems.id;


--
-- TOC entry 230 (class 1259 OID 16459)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    status character varying(50),
    total_price numeric(10,2),
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16458)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 254 (class 1259 OID 24855)
-- Name: pc_specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pc_specs (
    id integer NOT NULL,
    product_id integer NOT NULL,
    cpu character varying(150),
    gpu character varying(150),
    ram character varying(100),
    storage character varying(100),
    motherboard character varying(150),
    power_supply character varying(100),
    case_name character varying(100),
    cooling character varying(150)
);


ALTER TABLE public.pc_specs OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24854)
-- Name: pc_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pc_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pc_specs_id_seq OWNER TO postgres;

--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 253
-- Name: pc_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pc_specs_id_seq OWNED BY public.pc_specs.id;


--
-- TOC entry 250 (class 1259 OID 24819)
-- Name: phone_specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_specs (
    id integer NOT NULL,
    product_id integer NOT NULL,
    screen_size character varying(50),
    resolution character varying(100),
    processor character varying(150),
    ram character varying(50),
    storage character varying(50),
    rear_camera character varying(100),
    front_camera character varying(100),
    battery character varying(100),
    operating_system character varying(100),
    sim_type character varying(50),
    network character varying(50)
);


ALTER TABLE public.phone_specs OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24818)
-- Name: phone_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phone_specs_id_seq OWNER TO postgres;

--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 249
-- Name: phone_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_specs_id_seq OWNED BY public.phone_specs.id;


--
-- TOC entry 248 (class 1259 OID 24802)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id integer NOT NULL,
    product_id integer NOT NULL,
    image_name character varying(255) NOT NULL,
    sort_order integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24801)
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_id_seq OWNER TO postgres;

--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 247
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- TOC entry 228 (class 1259 OID 16436)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    category_id integer,
    brand_id integer,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2),
    quantity integer DEFAULT 0,
    warranty_months integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_active boolean DEFAULT true NOT NULL,
    is_featured boolean DEFAULT false NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16435)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 244 (class 1259 OID 16573)
-- Name: repairhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repairhistory (
    id integer NOT NULL,
    repair_id integer,
    status character varying(50),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    comment text
);


ALTER TABLE public.repairhistory OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16572)
-- Name: repairhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repairhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repairhistory_id_seq OWNER TO postgres;

--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 243
-- Name: repairhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repairhistory_id_seq OWNED BY public.repairhistory.id;


--
-- TOC entry 234 (class 1259 OID 16491)
-- Name: repairs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repairs (
    id integer NOT NULL,
    user_id integer,
    device_type character varying(100),
    brand character varying(100),
    model character varying(100),
    problem text,
    status character varying(50),
    price numeric(10,2),
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_finished timestamp without time zone,
    client_name character varying(255),
    client_phone character varying(30),
    client_email character varying(255)
);


ALTER TABLE public.repairs OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16490)
-- Name: repairs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repairs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repairs_id_seq OWNER TO postgres;

--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 233
-- Name: repairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repairs_id_seq OWNED BY public.repairs.id;


--
-- TOC entry 236 (class 1259 OID 16507)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16506)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 235
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 220 (class 1259 OID 16386)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 222 (class 1259 OID 16395)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100),
    phone character varying(20),
    full_name character varying(100),
    role_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_login timestamp without time zone,
    is_active boolean DEFAULT true,
    avatar character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16394)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4935 (class 2604 OID 16592)
-- Name: adminlogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminlogs ALTER COLUMN id SET DEFAULT nextval('public.adminlogs_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16430)
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 33009)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 32993)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16419)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 16531)
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 24876)
-- Name: headphone_specs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.headphone_specs ALTER COLUMN id SET DEFAULT nextval('public.headphone_specs_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 24840)
-- Name: laptop_specs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop_specs ALTER COLUMN id SET DEFAULT nextval('public.laptop_specs_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 16565)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 16549)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16476)
-- Name: orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN id SET DEFAULT nextval('public.orderitems_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 16462)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 24858)
-- Name: pc_specs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_specs ALTER COLUMN id SET DEFAULT nextval('public.pc_specs_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 24822)
-- Name: phone_specs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_specs ALTER COLUMN id SET DEFAULT nextval('public.phone_specs_id_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 24805)
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16439)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 16576)
-- Name: repairhistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairhistory ALTER COLUMN id SET DEFAULT nextval('public.repairhistory_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 16494)
-- Name: repairs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs ALTER COLUMN id SET DEFAULT nextval('public.repairs_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 16510)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 16389)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 16398)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5196 (class 0 OID 16589)
-- Dependencies: 246
-- Data for Name: adminlogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adminlogs (id, admin_id, action, created_at) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 16427)
-- Dependencies: 226
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, country, logo) FROM stdin;
1	Apple	США	
2	Samsung	Южная Корея	
3	ASUS	Тайвань	
4	Lenovo	Китай	
5	HP	США	
6	MSI	Тайвань	
7	Acer	Тайвань	
8	Dell	США	
9	Intel	США	
10	AMD	США	
11	NVIDIA	США	
12	Logitech	Швейцария	
\.


--
-- TOC entry 5210 (class 0 OID 33006)
-- Dependencies: 260
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, cart_id, product_id, quantity) FROM stdin;
21	2	1	1
\.


--
-- TOC entry 5208 (class 0 OID 32990)
-- Dependencies: 258
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id) FROM stdin;
1	12
2	16
3	17
\.


--
-- TOC entry 5174 (class 0 OID 16416)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description) FROM stdin;
1	Смартфоны	Новые и б/у смартфоны
2	Ноутбуки	Ноутбуки для работы и игр
3	Компьютеры	Системные блоки
4	Комплектующие	Видеокарты, процессоры и другое
5	Аксессуары	Клавиатуры, мыши, наушники
\.


--
-- TOC entry 5188 (class 0 OID 16528)
-- Dependencies: 238
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, product_id, created_at) FROM stdin;
30	12	2	2026-07-27 02:29:22.746994
32	12	5	2026-07-27 02:32:01.424807
33	12	7	2026-07-27 02:32:02.578549
34	12	6	2026-07-27 02:38:53.051048
35	12	9	2026-07-27 02:38:54.170468
36	12	8	2026-07-27 02:38:54.634732
37	12	10	2026-07-27 02:38:55.084279
38	12	12	2026-07-27 02:38:55.6542
40	12	1	2026-07-27 02:38:57.920562
41	12	3	2026-07-27 02:38:58.977262
42	12	20	2026-07-27 02:39:01.955556
43	12	16	2026-07-27 02:39:02.90196
44	12	17	2026-07-27 02:39:03.50553
45	12	18	2026-07-27 02:39:04.080272
46	12	19	2026-07-27 02:39:04.55575
47	12	14	2026-07-27 02:39:05.63704
48	12	15	2026-07-27 02:39:06.307473
49	12	13	2026-07-27 02:39:06.969205
50	12	11	2026-07-27 02:39:07.431735
51	12	4	2026-07-27 02:42:31.100214
58	16	41	2026-07-28 23:39:48.83499
59	16	1	2026-07-28 23:39:49.654153
\.


--
-- TOC entry 5206 (class 0 OID 24873)
-- Dependencies: 256
-- Data for Name: headphone_specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.headphone_specs (id, product_id, headphone_type, wireless, bluetooth_version, noise_canceling, battery_life, microphone, weight) FROM stdin;
\.


--
-- TOC entry 5202 (class 0 OID 24837)
-- Dependencies: 252
-- Data for Name: laptop_specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laptop_specs (id, product_id, cpu, gpu, ram, storage, screen_size, resolution, refresh_rate, operating_system, weight) FROM stdin;
1	3	Intel Core i5-13500H	Intel Iris Xe	16 ГБ	512 ГБ SSD	15.6"	1920x1080	60 Гц	Windows 11	1.7 кг
2	4	AMD Ryzen 5 7530U	Radeon Graphics	16 ГБ	512 ГБ SSD	15.6"	1920x1080	60 Гц	Windows 11	1.6 кг
3	5	Intel Core i7-13620H	RTX 4050	16 ГБ	512 ГБ SSD	15.6"	1920x1080	144 Гц	Windows 11	2.0 кг
4	6	Intel Core i5-1335U	Intel Iris Xe	8 ГБ	512 ГБ SSD	15.6"	1920x1080	60 Гц	Windows 11	1.65 кг
5	7	AMD Ryzen 7 7730U	Radeon Graphics	16 ГБ	1 ТБ SSD	15.6"	1920x1080	60 Гц	Windows 11	1.8 кг
6	8	Intel Core i7-14650HX	RTX 4070	32 ГБ	1 ТБ SSD	15.6"	2560x1440	165 Гц	Windows 11	2.3 кг
\.


--
-- TOC entry 5192 (class 0 OID 16562)
-- Dependencies: 242
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, user_name, email, subject, message, created_at) FROM stdin;
\.


--
-- TOC entry 5190 (class 0 OID 16546)
-- Dependencies: 240
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, content, image, created_at, admin_id) FROM stdin;
\.


--
-- TOC entry 5182 (class 0 OID 16473)
-- Dependencies: 232
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (id, order_id, product_id, quantity, price) FROM stdin;
1	1	1	1	79990.00
2	1	41	1	33000.00
3	2	41	3	33000.00
4	3	41	5	33000.00
5	4	2	1	74990.00
6	4	3	1	58990.00
7	5	41	4	33000.00
\.


--
-- TOC entry 5180 (class 0 OID 16459)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, status, total_price, order_date) FROM stdin;
3	12	В работе	165000.00	2026-07-25 02:41:34.444353
4	17	Новый	133980.00	2026-07-25 21:01:21.035828
2	12	Выполнен	99000.00	2026-07-25 02:40:00.574725
1	12	Выполнен	112990.00	2026-07-25 02:33:12.721877
5	12	Новый	132000.00	2026-07-28 23:28:12.015921
\.


--
-- TOC entry 5204 (class 0 OID 24855)
-- Dependencies: 254
-- Data for Name: pc_specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pc_specs (id, product_id, cpu, gpu, ram, storage, motherboard, power_supply, case_name, cooling) FROM stdin;
1	9	AMD Ryzen 7 7800X3D	RTX 4080 Super	32 ГБ DDR5	2 ТБ SSD	MSI B650 Tomahawk	850W Gold	DeepCool CH560	DeepCool LS720
2	10	Intel Core i5-12400	Intel UHD 730	16 ГБ DDR4	512 ГБ SSD	ASUS Prime B760M	550W Bronze	Zalman S2	Башенный кулер
\.


--
-- TOC entry 5200 (class 0 OID 24819)
-- Dependencies: 250
-- Data for Name: phone_specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone_specs (id, product_id, screen_size, resolution, processor, ram, storage, rear_camera, front_camera, battery, operating_system, sim_type, network) FROM stdin;
1	1	6.1"	2556x1179	Apple A16 Bionic	6 ГБ	128 ГБ	48+12 МП	12 МП	3349 мА·ч	iOS 18	Nano SIM + eSIM	5G
2	2	6.2"	2340x1080	Snapdragon 8 Gen 3	12 ГБ	256 ГБ	50+12+10 МП	12 МП	4000 мА·ч	Android 15	Nano SIM	5G
17	41	1000х1000 	10	intel 5	22 гб	9999 гб	10000 МгП	нету	завтра	321	32123	сегодня
\.


--
-- TOC entry 5198 (class 0 OID 24802)
-- Dependencies: 248
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_name, sort_order) FROM stdin;
1	1	1.webp	1
54	41	d61af1f8-9538-434b-b314-7becc645736b.jpeg	0
55	41	405adc58-5650-49f4-b84f-d835c31a8435.jpg	1
56	41	1745b48f-889a-4209-8f8f-2baa21de7876.webp	2
57	42	324083c0-a1bf-4535-ad57-7fe9ad7b70ab.jpg	0
58	42	d0c542e9-d68a-497d-a4e0-0343af47c79b.jpg	1
59	42	9c780227-9af7-43fd-81e4-fd2c8a99359b.jpg	2
\.


--
-- TOC entry 5178 (class 0 OID 16436)
-- Dependencies: 228
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, category_id, brand_id, name, description, price, quantity, warranty_months, created_at, is_active, is_featured) FROM stdin;
1	1	1	iPhone 15	128 ГБ, Black	79990.00	12	12	2026-07-06 23:54:17.461935	t	f
2	1	2	Samsung Galaxy S24	256 ГБ	74990.00	8	12	2026-07-06 23:54:17.461935	t	f
3	2	3	ASUS VivoBook 15	Intel Core i5, 16GB, SSD 512GB	58990.00	6	24	2026-07-06 23:54:17.461935	t	f
4	2	4	Lenovo IdeaPad 5	Ryzen 5, 16GB, SSD 512GB	54990.00	4	24	2026-07-06 23:54:17.461935	t	f
5	2	5	HP Pavilion 15	Intel Core i7	69990.00	5	24	2026-07-06 23:54:17.461935	t	f
6	2	8	Dell Inspiron 15	Intel Core i5	61990.00	7	24	2026-07-06 23:54:17.461935	t	f
7	2	7	Acer Aspire 5	Ryzen 7	64990.00	3	24	2026-07-06 23:54:17.461935	t	f
8	2	6	MSI Katana	RTX 4060	119990.00	2	24	2026-07-06 23:54:17.461935	t	f
9	3	10	Игровой ПК Ryzen 7	RTX 4070 Super	189990.00	2	24	2026-07-06 23:54:17.461935	t	f
10	3	9	Офисный ПК Intel i5	16GB RAM	54990.00	5	24	2026-07-06 23:54:17.461935	t	f
11	4	11	RTX 4070 Super	12GB GDDR6X	69990.00	4	36	2026-07-06 23:54:17.461935	t	f
12	4	11	RTX 4060	8GB GDDR6	39990.00	8	36	2026-07-06 23:54:17.461935	t	f
13	4	10	Ryzen 7 7800X3D	Игровой процессор	42990.00	10	36	2026-07-06 23:54:17.461935	t	f
14	4	9	Intel Core i7-14700K	20 ядер	46990.00	7	36	2026-07-06 23:54:17.461935	t	f
15	4	10	Ryzen 5 7600	6 ядер	21990.00	9	36	2026-07-06 23:54:17.461935	t	f
16	5	12	Logitech G Pro X	Игровая мышь	6990.00	20	12	2026-07-06 23:54:17.461935	t	f
17	5	12	Logitech G915	Механическая клавиатура	15990.00	8	12	2026-07-06 23:54:17.461935	t	f
18	5	12	Logitech G733	Беспроводная гарнитура	13990.00	12	12	2026-07-06 23:54:17.461935	t	f
19	5	1	AirPods Pro 2	Беспроводные наушники	22990.00	15	12	2026-07-06 23:54:17.461935	t	f
20	5	2	Samsung Buds 3 Pro	TWS-наушники	15990.00	10	12	2026-07-06 23:54:17.461935	t	f
41	1	8	Nokia кирпич 	можно калить орехи	33000.00	22	100	2026-07-17 02:44:16.430434	t	f
42	4	12	си фон	ваыпыпваы	3213.00	32131	21312	2026-07-29 02:08:46.864475	t	f
\.


--
-- TOC entry 5194 (class 0 OID 16573)
-- Dependencies: 244
-- Data for Name: repairhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repairhistory (id, repair_id, status, changed_at, comment) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 16491)
-- Dependencies: 234
-- Data for Name: repairs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repairs (id, user_id, device_type, brand, model, problem, status, price, date_created, date_finished, client_name, client_phone, client_email) FROM stdin;
1	12	Сборка ПК на заказ	\N	\N	dsad	Принята	\N	2026-07-26 04:42:46.211939	\N	BLUE LIQUID	88005553535	pinguinru7@gmail.com
2	12	Настройка ПО	\N	\N	вцфвфцв	Принята	\N	2026-07-29 02:06:52.403924	\N	вуафафа	4535345	pinguinru7@gmail.com
\.


--
-- TOC entry 5186 (class 0 OID 16507)
-- Dependencies: 236
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, product_id, rating, comment, created_at) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role_name) FROM stdin;
1	Admin
2	User
\.


--
-- TOC entry 5172 (class 0 OID 16395)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, password, email, phone, full_name, role_id, created_at, last_login, is_active, avatar) FROM stdin;
14	админ	$2a$11$LeUw7bs9ZIoi1Fs1xiu4lubI1J40YeJQcilFon1o/3oBUKfQ39tcW	dsada@mail.ru	+79998887766	влад	2	2026-07-13 01:45:06.64505	2026-07-13 01:45:22.289659	t	\N
17	vania228	$2a$11$UGiCA3tEwFVd5lGkjLsuCubqqaiLAxOvN6HtUR/BSLJuAIj3FMZOu	invanov228@gmail.com		Иван	2	2026-07-25 21:00:44.289219	2026-07-25 21:00:44.564374	t	\N
18	пася	$2a$11$tUhi7izXcKBoJR0tiVS8G.7TH3xFy9KOTE8YSwmfZCpkwjwNbIlj6	pinguinru222@gmail.com	88005553535	паша	2	2026-07-26 21:00:27.653143	2026-07-26 21:00:27.94603	t	18.jpeg
16	ТЦК	$2a$11$z8ZAR1oVsn3bBDeV197kuOSoheqxrUq0.97VvVby66W9XAsa4mC9a	pinguinru7@gmail.com		глеб	1	2026-07-15 04:40:21.860092	2026-07-28 23:33:24.984616	t	16.jpg
12	никита	$2a$11$pATXLHDFsQxTfLYgpZh3meCgxES5lhL65TCs7VZheIES81K7S/lYK	dsada@mail.ru	+79998887766	влад	1	2026-07-09 18:54:24.38013	2026-07-29 02:26:15.563848	t	12.png
\.


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 245
-- Name: adminlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adminlogs_id_seq', 1, false);


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 225
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 12, true);


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 259
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 21, true);


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 257
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 3, true);


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 237
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 59, true);


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 255
-- Name: headphone_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.headphone_specs_id_seq', 1, false);


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 251
-- Name: laptop_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laptop_specs_id_seq', 6, true);


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 241
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 239
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 231
-- Name: orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_id_seq', 7, true);


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 253
-- Name: pc_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pc_specs_id_seq', 2, true);


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 249
-- Name: phone_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_specs_id_seq', 17, true);


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 247
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 59, true);


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 42, true);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 243
-- Name: repairhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repairhistory_id_seq', 1, false);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 233
-- Name: repairs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repairs_id_seq', 2, true);


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 235
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 6, true);


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 4975 (class 2606 OID 16598)
-- Name: adminlogs adminlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminlogs
    ADD CONSTRAINT adminlogs_pkey PRIMARY KEY (id);


--
-- TOC entry 4955 (class 2606 OID 16434)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 4999 (class 2606 OID 33016)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4995 (class 2606 OID 32997)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 32999)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 4953 (class 2606 OID 16425)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4967 (class 2606 OID 16534)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 24880)
-- Name: headphone_specs headphone_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.headphone_specs
    ADD CONSTRAINT headphone_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 24882)
-- Name: headphone_specs headphone_specs_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.headphone_specs
    ADD CONSTRAINT headphone_specs_product_id_key UNIQUE (product_id);


--
-- TOC entry 4983 (class 2606 OID 24846)
-- Name: laptop_specs laptop_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop_specs
    ADD CONSTRAINT laptop_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 24848)
-- Name: laptop_specs laptop_specs_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop_specs
    ADD CONSTRAINT laptop_specs_product_id_key UNIQUE (product_id);


--
-- TOC entry 4971 (class 2606 OID 16571)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 16555)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 4961 (class 2606 OID 16479)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 16466)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4987 (class 2606 OID 24864)
-- Name: pc_specs pc_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_specs
    ADD CONSTRAINT pc_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4989 (class 2606 OID 24866)
-- Name: pc_specs pc_specs_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_specs
    ADD CONSTRAINT pc_specs_product_id_key UNIQUE (product_id);


--
-- TOC entry 4979 (class 2606 OID 24828)
-- Name: phone_specs phone_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_specs
    ADD CONSTRAINT phone_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4981 (class 2606 OID 24830)
-- Name: phone_specs phone_specs_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_specs
    ADD CONSTRAINT phone_specs_product_id_key UNIQUE (product_id);


--
-- TOC entry 4977 (class 2606 OID 24812)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 16447)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 16582)
-- Name: repairhistory repairhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairhistory
    ADD CONSTRAINT repairhistory_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 16500)
-- Name: repairs repairs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 16516)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 16393)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4949 (class 2606 OID 16409)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4951 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5019 (class 2606 OID 33000)
-- Name: carts fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5020 (class 2606 OID 33017)
-- Name: cart_items fk_cartitem_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cartitem_cart FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- TOC entry 5021 (class 2606 OID 33022)
-- Name: cart_items fk_cartitem_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cartitem_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5009 (class 2606 OID 16540)
-- Name: favorites fk_favorites_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_favorites_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5010 (class 2606 OID 16535)
-- Name: favorites fk_favorites_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_favorites_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5018 (class 2606 OID 24883)
-- Name: headphone_specs fk_headphone_specs_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.headphone_specs
    ADD CONSTRAINT fk_headphone_specs_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5012 (class 2606 OID 16583)
-- Name: repairhistory fk_history_repair; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairhistory
    ADD CONSTRAINT fk_history_repair FOREIGN KEY (repair_id) REFERENCES public.repairs(id);


--
-- TOC entry 5016 (class 2606 OID 24849)
-- Name: laptop_specs fk_laptop_specs_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptop_specs
    ADD CONSTRAINT fk_laptop_specs_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5013 (class 2606 OID 16599)
-- Name: adminlogs fk_logs_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminlogs
    ADD CONSTRAINT fk_logs_admin FOREIGN KEY (admin_id) REFERENCES public.users(id);


--
-- TOC entry 5011 (class 2606 OID 16556)
-- Name: news fk_news_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT fk_news_admin FOREIGN KEY (admin_id) REFERENCES public.users(id);


--
-- TOC entry 5004 (class 2606 OID 16480)
-- Name: orderitems fk_orderitems_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT fk_orderitems_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 5005 (class 2606 OID 16485)
-- Name: orderitems fk_orderitems_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5003 (class 2606 OID 16467)
-- Name: orders fk_orders_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5017 (class 2606 OID 24867)
-- Name: pc_specs fk_pc_specs_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_specs
    ADD CONSTRAINT fk_pc_specs_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5015 (class 2606 OID 24831)
-- Name: phone_specs fk_phone_specs_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_specs
    ADD CONSTRAINT fk_phone_specs_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5014 (class 2606 OID 24813)
-- Name: product_images fk_product_images_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fk_product_images_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5001 (class 2606 OID 16453)
-- Name: products fk_products_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_brand FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- TOC entry 5002 (class 2606 OID 16448)
-- Name: products fk_products_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 5006 (class 2606 OID 16501)
-- Name: repairs fk_repairs_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT fk_repairs_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5007 (class 2606 OID 16522)
-- Name: reviews fk_reviews_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5008 (class 2606 OID 16517)
-- Name: reviews fk_reviews_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5000 (class 2606 OID 16410)
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2026-07-29 03:03:21

--
-- PostgreSQL database dump complete
--

\unrestrict b8ZzgEzI8F4LMNhooWXCusbcoSZ3a9R2BH3KJYd3qiJ6x0Acfys9C7OCYyCIQ5I

