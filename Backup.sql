PGDMP                  
        {            postgres    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3539                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2                       1255    17154 /   addclient(character varying, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.addclient(IN name character varying, IN surname character varying)
    LANGUAGE plpgsql
    AS $$
begin
	
end;
$$;
 Z   DROP PROCEDURE public.addclient(IN name character varying, IN surname character varying);
       public          postgres    false                       1255    17157 B   addclient(character varying, character varying, character varying) 	   PROCEDURE     =  CREATE PROCEDURE public.addclient(IN name character varying, IN surname character varying, IN number character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
	count int;
begin
	SELECT COUNT("Name") FROM "Client" INTO count;
	INSERT INTO "Client" ("Name", "Surname", "Number") VALUES(name, surname, number);
end;
$$;
 w   DROP PROCEDURE public.addclient(IN name character varying, IN surname character varying, IN number character varying);
       public          postgres    false                       1255    17322    cpu_auditfunc()    FUNCTION     �   CREATE FUNCTION public.cpu_auditfunc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
   BEGIN
      INSERT INTO cpu_audit(cpu_id, entry_date) VALUES (new.ID, current_timestamp);
      RETURN NEW;
   END;
$$;
 &   DROP FUNCTION public.cpu_auditfunc();
       public          postgres    false                       1255    17159 $   deletemotherboard(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.deletemotherboard(IN socket character varying)
    LANGUAGE plpgsql
    AS $$
begin
	IF socket ISNULL THEN
	ELSE DELETE FROM "Motherboard" WHERE "Motherboard"."Socket" = socket AND id > 10; 
	END IF;
end;
$$;
 F   DROP PROCEDURE public.deletemotherboard(IN socket character varying);
       public          postgres    false                       1255    17136    isexpensivecpu(integer)    FUNCTION     -  CREATE FUNCTION public.isexpensivecpu(cpu_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
Declare
	res varchar;
begin
	SELECT
	CASE 
	WHEN "Price" > 15000 THEN 'Дорогой: ' 
	ELSE 'Дешёвый: '
	END grade 
	FROM "CPU" WHERE id = cpu_id INTO res; 
	RETURN res;
end;
$$;
 5   DROP FUNCTION public.isexpensivecpu(cpu_id integer);
       public          postgres    false                        1255    17124    multiple(integer, integer)    FUNCTION     �   CREATE FUNCTION public.multiple(a integer, b integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
	res int;
begin
	SELECT a*b INTO res;
	RETURN res;
end;
$$;
 5   DROP FUNCTION public.multiple(a integer, b integer);
       public          postgres    false                       1255    17141 )   printmotherboardinrange(integer, integer)    FUNCTION       CREATE FUNCTION public.printmotherboardinrange(pricea integer, priceb integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
Declare
	res varchar;
begin
	SELECT "Name" FROM "Motherboard" WHERE ("Price" > priceA) AND ("Price" < priceB) INTO res;
	RETURN res;
end;
$$;
 N   DROP FUNCTION public.printmotherboardinrange(pricea integer, priceb integer);
       public          postgres    false                       1255    17151 *   printmotherboardsinrange(integer, integer) 	   PROCEDURE     �   CREATE PROCEDURE public.printmotherboardsinrange(IN pricea integer, IN priceb integer)
    LANGUAGE plpgsql
    AS $$
begin
	Perform "Name" FROM "Motherboard" AS "Motherboards" WHERE ("Price" > priceA) AND ("Price" < priceB);
end;
$$;
 V   DROP PROCEDURE public.printmotherboardsinrange(IN pricea integer, IN priceb integer);
       public          postgres    false                       1255    17131    printnameclient(integer)    FUNCTION     �   CREATE FUNCTION public.printnameclient(client_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
Declare
	res varchar;
begin
	SELECT "Name" || ' ' || "Surname" FROM "Client" WHERE id = client_id INTO res;
	RETURN res;
end;
$$;
 9   DROP FUNCTION public.printnameclient(client_id integer);
       public          postgres    false                       1255    17158 &   updatename(character varying, integer) 	   PROCEDURE     �   CREATE PROCEDURE public.updatename(IN name character varying, IN cpu_id integer)
    LANGUAGE plpgsql
    AS $$
begin
	UPDATE "CPU" SET "Name" = name WHERE id = cpu_id;
end;
$$;
 P   DROP PROCEDURE public.updatename(IN name character varying, IN cpu_id integer);
       public          postgres    false            �            1259    16399    Build    TABLE     �   CREATE TABLE public."Build" (
    "id Stand" integer NOT NULL,
    "Name" character varying(20),
    id integer NOT NULL,
    "Fans id" integer,
    "Case id" integer,
    "PSU id" integer,
    "Storage id" integer
);
    DROP TABLE public."Build";
       public         heap    postgres    false            �            1259    16542    Build_id_seq    SEQUENCE     �   ALTER TABLE public."Build" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Build_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16404    CPU    TABLE     �   CREATE TABLE public."CPU" (
    "Integrated graphics" boolean,
    "Frequence" integer,
    "Number of cores" integer,
    "Price" integer,
    "Socket" character varying(9),
    id integer NOT NULL,
    "Name" character varying(20)
);
    DROP TABLE public."CPU";
       public         heap    postgres    false            �            1259    16410 
   CPU cooler    TABLE     �   CREATE TABLE public."CPU cooler" (
    "Price" integer,
    "Type" character varying(15),
    "Name" character varying(20),
    id integer NOT NULL
);
     DROP TABLE public."CPU cooler";
       public         heap    postgres    false            �            1259    16532    CPU cooler_id_seq    SEQUENCE     �   ALTER TABLE public."CPU cooler" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CPU cooler_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16593 
   CPU_id_seq    SEQUENCE     �   ALTER TABLE public."CPU" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CPU_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16415    Case    TABLE     �   CREATE TABLE public."Case" (
    "Price" integer,
    "Name" character varying(20),
    "Form-factor" character varying(9),
    id integer NOT NULL
);
    DROP TABLE public."Case";
       public         heap    postgres    false            �            1259    16533    Case_id_seq    SEQUENCE     �   ALTER TABLE public."Case" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Case_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16420    Client    TABLE     �   CREATE TABLE public."Client" (
    id integer NOT NULL,
    "Name" character varying(20),
    "Surname" character varying(20),
    "Number" character varying(11)
);
    DROP TABLE public."Client";
       public         heap    postgres    false            �            1259    16534    Client_id_seq    SEQUENCE     �   ALTER TABLE public."Client" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16425    Fans    TABLE     k   CREATE TABLE public."Fans" (
    "Price" integer,
    "Name" character varying,
    id integer NOT NULL
);
    DROP TABLE public."Fans";
       public         heap    postgres    false            �            1259    16535    Fans_id_seq    SEQUENCE     �   ALTER TABLE public."Fans" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Fans_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16432    GPU    TABLE     �   CREATE TABLE public."GPU" (
    "VMemory" integer,
    "Price" integer,
    "Name" character varying(20),
    id integer NOT NULL
);
    DROP TABLE public."GPU";
       public         heap    postgres    false            �            1259    16536 
   GPU_id_seq    SEQUENCE     �   ALTER TABLE public."GPU" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."GPU_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16437    Motherboard    TABLE     �   CREATE TABLE public."Motherboard" (
    "Price" integer,
    "Name" character varying(20),
    "Socket" character varying(9),
    "Form-factor" character varying(7),
    "Chipset" character varying(5),
    id integer NOT NULL
);
 !   DROP TABLE public."Motherboard";
       public         heap    postgres    false            �            1259    16537    Motherboard_id_seq    SEQUENCE     �   ALTER TABLE public."Motherboard" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Motherboard_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16442    PSU    TABLE     �   CREATE TABLE public."PSU" (
    "Watt" integer,
    "Price" integer,
    "Name" character varying(20),
    "Form-factor" character varying(7),
    id integer NOT NULL
);
    DROP TABLE public."PSU";
       public         heap    postgres    false            �            1259    16538 
   PSU_id_seq    SEQUENCE     �   ALTER TABLE public."PSU" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PSU_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16447    RAM    TABLE     �   CREATE TABLE public."RAM" (
    "Number of" integer,
    "Frequency" integer,
    "Price" integer,
    "Name" character varying(20),
    "Type" character varying(4),
    id integer NOT NULL
);
    DROP TABLE public."RAM";
       public         heap    postgres    false            �            1259    16539 
   RAM_id_seq    SEQUENCE     �   ALTER TABLE public."RAM" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RAM_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16452    Sales    TABLE     �   CREATE TABLE public."Sales" (
    "Gain" integer,
    "id Client" integer,
    "Number of sales" integer,
    "Name" character varying(20),
    "id Build" integer NOT NULL
);
    DROP TABLE public."Sales";
       public         heap    postgres    false            �            1259    16457    Stand    TABLE     �   CREATE TABLE public."Stand" (
    id integer NOT NULL,
    "id Motherboard" integer,
    "id GPU" integer,
    "id CPU cooler" integer,
    "id CPU" integer,
    "id RAM" integer
);
    DROP TABLE public."Stand";
       public         heap    postgres    false            �            1259    16540    Stand_id_seq    SEQUENCE     �   ALTER TABLE public."Stand" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Stand_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16462    Storage    TABLE     �   CREATE TABLE public."Storage" (
    "Price" integer,
    "Name" character varying(20),
    "Type" character varying(3),
    "Form-factor" character varying(3),
    id integer NOT NULL
);
    DROP TABLE public."Storage";
       public         heap    postgres    false            �            1259    16541    Storage_id_seq    SEQUENCE     �   ALTER TABLE public."Storage" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Storage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    17168    cores8    VIEW     �   CREATE VIEW public.cores8 AS
 SELECT "CPU"."Integrated graphics",
    "CPU"."Frequence",
    "CPU"."Number of cores",
    "CPU"."Price",
    "CPU"."Socket",
    "CPU".id,
    "CPU"."Name"
   FROM public."CPU"
  WHERE ("CPU"."Number of cores" = 8);
    DROP VIEW public.cores8;
       public          postgres    false    216    216    216    216    216    216    216            �            1259    17315 	   cpu_audit    TABLE     ]   CREATE TABLE public.cpu_audit (
    cpu_id integer NOT NULL,
    entry_date text NOT NULL
);
    DROP TABLE public.cpu_audit;
       public         heap    postgres    false            �            1259    17160    cpuam4    VIEW       CREATE VIEW public.cpuam4 AS
 SELECT "CPU"."Integrated graphics",
    "CPU"."Frequence",
    "CPU"."Number of cores",
    "CPU"."Price",
    "CPU"."Socket",
    "CPU".id,
    "CPU"."Name"
   FROM public."CPU"
  WHERE (("CPU"."Socket")::text = 'AM4'::text);
    DROP VIEW public.cpuam4;
       public          postgres    false    216    216    216    216    216    216    216            �            1259    17060    creator    TABLE     �   CREATE TABLE public.creator (
    id integer NOT NULL,
    name character varying(10),
    surname character varying(20),
    nationality character varying(30)
);
    DROP TABLE public.creator;
       public         heap    postgres    false            �            1259    17059    creator_id_seq    SEQUENCE     �   CREATE SEQUENCE public.creator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.creator_id_seq;
       public          postgres    false    241            �           0    0    creator_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.creator_id_seq OWNED BY public.creator.id;
          public          postgres    false    240            �            1259    17078    duration    TABLE     v   CREATE TABLE public.duration (
    "time" character varying(8),
    average character varying(8),
    test integer
);
    DROP TABLE public.duration;
       public         heap    postgres    false            �            1259    17164    expensivemothers    VIEW       CREATE VIEW public.expensivemothers AS
 SELECT "Motherboard"."Price",
    "Motherboard"."Name",
    "Motherboard"."Socket",
    "Motherboard"."Form-factor",
    "Motherboard"."Chipset",
    "Motherboard".id
   FROM public."Motherboard"
  WHERE ("Motherboard"."Price" >= 10000);
 #   DROP VIEW public.expensivemothers;
       public          postgres    false    222    222    222    222    222    222            �            1259    17094    prescription    TABLE     �   CREATE TABLE public.prescription (
    id integer NOT NULL,
    need character varying(100),
    advice character varying(100)
);
     DROP TABLE public.prescription;
       public         heap    postgres    false            �            1259    17093    prescription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.prescription_id_seq;
       public          postgres    false    248            �           0    0    prescription_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.prescription_id_seq OWNED BY public.prescription.id;
          public          postgres    false    247            �            1259    17087    results    TABLE     �   CREATE TABLE public.results (
    id integer NOT NULL,
    "time" character varying(8),
    data character varying(10),
    defenition character varying(100)
);
    DROP TABLE public.results;
       public         heap    postgres    false            �            1259    17086    results_id_seq    SEQUENCE     �   CREATE SEQUENCE public.results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.results_id_seq;
       public          postgres    false    246            �           0    0    results_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;
          public          postgres    false    245            �            1259    17368    stands    VIEW       CREATE VIEW public.stands AS
 SELECT "Motherboard"."Name" AS nm,
    "GPU"."Name" AS ng,
    "CPU cooler"."Name" AS ncc,
    "CPU"."Name" AS nc,
    "RAM"."Name" AS nr
   FROM (((((public."Stand"
     JOIN public."Motherboard" ON (("Stand"."id Motherboard" = "Motherboard".id)))
     JOIN public."GPU" ON (("Stand"."id GPU" = "GPU".id)))
     JOIN public."CPU cooler" ON (("Stand"."id CPU cooler" = "CPU cooler".id)))
     JOIN public."CPU" ON (("Stand"."id CPU" = "CPU".id)))
     JOIN public."RAM" ON (("Stand"."id RAM" = "RAM".id)));
    DROP VIEW public.stands;
       public          postgres    false    216    224    224    221    217    217    216    226    226    226    222    221    226    226    222            �            1259    17067    test    TABLE     k   CREATE TABLE public.test (
    id integer NOT NULL,
    name character varying(50),
    creator integer
);
    DROP TABLE public.test;
       public         heap    postgres    false            �            1259    17066    test_id_seq    SEQUENCE     �   CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.test_id_seq;
       public          postgres    false    243            �           0    0    test_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;
          public          postgres    false    242            �            1259    17101    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    age integer,
    email character varying(30),
    results integer,
    prescription integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17100    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    250            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    249            �           2604    17063 
   creator id    DEFAULT     h   ALTER TABLE ONLY public.creator ALTER COLUMN id SET DEFAULT nextval('public.creator_id_seq'::regclass);
 9   ALTER TABLE public.creator ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    17097    prescription id    DEFAULT     r   ALTER TABLE ONLY public.prescription ALTER COLUMN id SET DEFAULT nextval('public.prescription_id_seq'::regclass);
 >   ALTER TABLE public.prescription ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    17090 
   results id    DEFAULT     h   ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);
 9   ALTER TABLE public.results ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    17070    test id    DEFAULT     b   ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);
 6   ALTER TABLE public.test ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    17104    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            �          0    16399    Build 
   TABLE DATA           g   COPY public."Build" ("id Stand", "Name", id, "Fans id", "Case id", "PSU id", "Storage id") FROM stdin;
    public          postgres    false    215   �       �          0    16404    CPU 
   TABLE DATA           u   COPY public."CPU" ("Integrated graphics", "Frequence", "Number of cores", "Price", "Socket", id, "Name") FROM stdin;
    public          postgres    false    216   !�       �          0    16410 
   CPU cooler 
   TABLE DATA           C   COPY public."CPU cooler" ("Price", "Type", "Name", id) FROM stdin;
    public          postgres    false    217   x�      �          0    16415    Case 
   TABLE DATA           D   COPY public."Case" ("Price", "Name", "Form-factor", id) FROM stdin;
    public          postgres    false    218   ��      �          0    16420    Client 
   TABLE DATA           C   COPY public."Client" (id, "Name", "Surname", "Number") FROM stdin;
    public          postgres    false    219   U�      �          0    16425    Fans 
   TABLE DATA           5   COPY public."Fans" ("Price", "Name", id) FROM stdin;
    public          postgres    false    220   ��      �          0    16432    GPU 
   TABLE DATA           ?   COPY public."GPU" ("VMemory", "Price", "Name", id) FROM stdin;
    public          postgres    false    221   ��      �          0    16437    Motherboard 
   TABLE DATA           `   COPY public."Motherboard" ("Price", "Name", "Socket", "Form-factor", "Chipset", id) FROM stdin;
    public          postgres    false    222   S�      �          0    16442    PSU 
   TABLE DATA           K   COPY public."PSU" ("Watt", "Price", "Name", "Form-factor", id) FROM stdin;
    public          postgres    false    223   e�      �          0    16447    RAM 
   TABLE DATA           V   COPY public."RAM" ("Number of", "Frequency", "Price", "Name", "Type", id) FROM stdin;
    public          postgres    false    224   ��      �          0    16452    Sales 
   TABLE DATA           ]   COPY public."Sales" ("Gain", "id Client", "Number of sales", "Name", "id Build") FROM stdin;
    public          postgres    false    225   #�      �          0    16457    Stand 
   TABLE DATA           f   COPY public."Stand" (id, "id Motherboard", "id GPU", "id CPU cooler", "id CPU", "id RAM") FROM stdin;
    public          postgres    false    226   @�      �          0    16462    Storage 
   TABLE DATA           O   COPY public."Storage" ("Price", "Name", "Type", "Form-factor", id) FROM stdin;
    public          postgres    false    227   o�      �          0    17315 	   cpu_audit 
   TABLE DATA           7   COPY public.cpu_audit (cpu_id, entry_date) FROM stdin;
    public          postgres    false    254   ɯ      �          0    17060    creator 
   TABLE DATA           A   COPY public.creator (id, name, surname, nationality) FROM stdin;
    public          postgres    false    241   &      �          0    17078    duration 
   TABLE DATA           9   COPY public.duration ("time", average, test) FROM stdin;
    public          postgres    false    244   o      �          0    17094    prescription 
   TABLE DATA           8   COPY public.prescription (id, need, advice) FROM stdin;
    public          postgres    false    248   �      �          0    17087    results 
   TABLE DATA           ?   COPY public.results (id, "time", data, defenition) FROM stdin;
    public          postgres    false    246   �      �          0    17067    test 
   TABLE DATA           1   COPY public.test (id, name, creator) FROM stdin;
    public          postgres    false    243         �          0    17101    users 
   TABLE DATA           F   COPY public.users (id, age, email, results, prescription) FROM stdin;
    public          postgres    false    250   I      �           0    0    Build_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Build_id_seq"', 1, false);
          public          postgres    false    238            �           0    0    CPU cooler_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."CPU cooler_id_seq"', 10, true);
          public          postgres    false    228            �           0    0 
   CPU_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."CPU_id_seq"', 10023, true);
          public          postgres    false    239            �           0    0    Case_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Case_id_seq"', 10, true);
          public          postgres    false    229            �           0    0    Client_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Client_id_seq"', 11, true);
          public          postgres    false    230            �           0    0    Fans_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Fans_id_seq"', 10, true);
          public          postgres    false    231            �           0    0 
   GPU_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."GPU_id_seq"', 10, true);
          public          postgres    false    232            �           0    0    Motherboard_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Motherboard_id_seq"', 11, true);
          public          postgres    false    233            �           0    0 
   PSU_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."PSU_id_seq"', 10, true);
          public          postgres    false    234            �           0    0 
   RAM_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."RAM_id_seq"', 10, true);
          public          postgres    false    235            �           0    0    Stand_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Stand_id_seq"', 7, true);
          public          postgres    false    236            �           0    0    Storage_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Storage_id_seq"', 10, true);
          public          postgres    false    237            �           0    0    creator_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.creator_id_seq', 1, true);
          public          postgres    false    240            �           0    0    prescription_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.prescription_id_seq', 1, true);
          public          postgres    false    247            �           0    0    results_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.results_id_seq', 1, true);
          public          postgres    false    245            �           0    0    test_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.test_id_seq', 1, true);
          public          postgres    false    242            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    249            �           2606    16403    Build Build_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT "Build_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Build" DROP CONSTRAINT "Build_pkey";
       public            postgres    false    215            �           2606    16414    CPU cooler CPU cooler_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."CPU cooler"
    ADD CONSTRAINT "CPU cooler_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."CPU cooler" DROP CONSTRAINT "CPU cooler_pkey";
       public            postgres    false    217            �           2606    16419    Case Case_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Case"
    ADD CONSTRAINT "Case_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Case" DROP CONSTRAINT "Case_pkey";
       public            postgres    false    218            �           2606    16431    Fans Fans_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Fans"
    ADD CONSTRAINT "Fans_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Fans" DROP CONSTRAINT "Fans_pkey";
       public            postgres    false    220            �           2606    16436    GPU GPU_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."GPU"
    ADD CONSTRAINT "GPU_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."GPU" DROP CONSTRAINT "GPU_pkey";
       public            postgres    false    221            �           2606    16441    Motherboard Motherboard_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Motherboard"
    ADD CONSTRAINT "Motherboard_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Motherboard" DROP CONSTRAINT "Motherboard_pkey";
       public            postgres    false    222            �           2606    16446    PSU PSU_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."PSU"
    ADD CONSTRAINT "PSU_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."PSU" DROP CONSTRAINT "PSU_pkey";
       public            postgres    false    223            �           2606    16451    RAM RAM_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."RAM"
    ADD CONSTRAINT "RAM_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."RAM" DROP CONSTRAINT "RAM_pkey";
       public            postgres    false    224            �           2606    16461    Stand Stand_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT "Stand_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT "Stand_pkey";
       public            postgres    false    226            �           2606    16466    Storage Storage_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Storage"
    ADD CONSTRAINT "Storage_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Storage" DROP CONSTRAINT "Storage_pkey";
       public            postgres    false    227            �           2606    17065    creator creator_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.creator
    ADD CONSTRAINT creator_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.creator DROP CONSTRAINT creator_pkey;
       public            postgres    false    241            �           2606    16409 
   CPU id_CPU 
   CONSTRAINT     L   ALTER TABLE ONLY public."CPU"
    ADD CONSTRAINT "id_CPU" PRIMARY KEY (id);
 8   ALTER TABLE ONLY public."CPU" DROP CONSTRAINT "id_CPU";
       public            postgres    false    216                       2606    17099    prescription prescription_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.prescription DROP CONSTRAINT prescription_pkey;
       public            postgres    false    248                       2606    17092    results results_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.results DROP CONSTRAINT results_pkey;
       public            postgres    false    246            �           2606    17072    test test_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.test DROP CONSTRAINT test_pkey;
       public            postgres    false    243                       2606    17106    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    250            �           2606    16424    Client Клиент_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Клиент_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Client" DROP CONSTRAINT "Клиент_pkey";
       public            postgres    false    219            �           1259    17121 
   name_index    INDEX     >   CREATE INDEX name_index ON public."CPU" USING btree ("Name");
    DROP INDEX public.name_index;
       public            postgres    false    216            �           1259    17119    price_noc_index    INDEX     W   CREATE INDEX price_noc_index ON public."CPU" USING btree ("Price", "Number of cores");
 #   DROP INDEX public.price_noc_index;
       public            postgres    false    216    216            �           1259    17120    socket_index    INDEX     B   CREATE INDEX socket_index ON public."CPU" USING btree ("Socket");
     DROP INDEX public.socket_index;
       public            postgres    false    216                       2620    17323    CPU cpu_trigger    TRIGGER     n   CREATE TRIGGER cpu_trigger AFTER INSERT ON public."CPU" FOR EACH ROW EXECUTE FUNCTION public.cpu_auditfunc();
 *   DROP TRIGGER cpu_trigger ON public."CPU";
       public          postgres    false    275    216                       2606    16543 
   Build case    FK CONSTRAINT     z   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT "case" FOREIGN KEY ("Case id") REFERENCES public."Case"(id) NOT VALID;
 8   ALTER TABLE ONLY public."Build" DROP CONSTRAINT "case";
       public          postgres    false    3307    215    218                       2606    17338 	   Stand cpu    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT cpu FOREIGN KEY ("id CPU") REFERENCES public."CPU"(id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT cpu;
       public          postgres    false    226    216    3300                       2606    17358    Stand cpu cooler    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT "cpu cooler" FOREIGN KEY ("id CPU cooler") REFERENCES public."CPU cooler"(id) ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT "cpu cooler";
       public          postgres    false    3305    226    217                       2606    17081    duration duration_test_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.duration
    ADD CONSTRAINT duration_test_fkey FOREIGN KEY (test) REFERENCES public.test(id);
 E   ALTER TABLE ONLY public.duration DROP CONSTRAINT duration_test_fkey;
       public          postgres    false    243    3327    244                       2606    16553 
   Build fans    FK CONSTRAINT     x   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT fans FOREIGN KEY ("Fans id") REFERENCES public."Fans"(id) NOT VALID;
 6   ALTER TABLE ONLY public."Build" DROP CONSTRAINT fans;
       public          postgres    false    3311    220    215                       2606    17343 	   Stand gpu    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT gpu FOREIGN KEY ("id GPU") REFERENCES public."GPU"(id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT gpu;
       public          postgres    false    3313    226    221                       2606    16492    Sales id Build    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sales"
    ADD CONSTRAINT "id Build" FOREIGN KEY ("id Build") REFERENCES public."Build"(id) NOT VALID;
 <   ALTER TABLE ONLY public."Sales" DROP CONSTRAINT "id Build";
       public          postgres    false    225    215    3298                       2606    16497    Sales id Client    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sales"
    ADD CONSTRAINT "id Client" FOREIGN KEY ("id Client") REFERENCES public."Client"(id) NOT VALID;
 =   ALTER TABLE ONLY public."Sales" DROP CONSTRAINT "id Client";
       public          postgres    false    3309    225    219                       2606    17353    Stand motherboard    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT motherboard FOREIGN KEY ("id Motherboard") REFERENCES public."Motherboard"(id) ON DELETE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT motherboard;
       public          postgres    false    3315    226    222                       2606    16558 	   Build psu    FK CONSTRAINT     u   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT psu FOREIGN KEY ("PSU id") REFERENCES public."PSU"(id) NOT VALID;
 5   ALTER TABLE ONLY public."Build" DROP CONSTRAINT psu;
       public          postgres    false    3317    223    215                       2606    17348 	   Stand ram    FK CONSTRAINT     �   ALTER TABLE ONLY public."Stand"
    ADD CONSTRAINT ram FOREIGN KEY ("id RAM") REFERENCES public."RAM"(id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY public."Stand" DROP CONSTRAINT ram;
       public          postgres    false    224    3319    226            	           2606    16563    Build stand    FK CONSTRAINT     {   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT stand FOREIGN KEY ("id Stand") REFERENCES public."Stand"(id) NOT VALID;
 7   ALTER TABLE ONLY public."Build" DROP CONSTRAINT stand;
       public          postgres    false    215    226    3321            
           2606    16548    Build storage    FK CONSTRAINT     �   ALTER TABLE ONLY public."Build"
    ADD CONSTRAINT storage FOREIGN KEY ("Storage id") REFERENCES public."Storage"(id) NOT VALID;
 9   ALTER TABLE ONLY public."Build" DROP CONSTRAINT storage;
       public          postgres    false    227    215    3323                       2606    17073    test test_creator_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_creator_fkey FOREIGN KEY (creator) REFERENCES public.creator(id);
 @   ALTER TABLE ONLY public.test DROP CONSTRAINT test_creator_fkey;
       public          postgres    false    243    241    3325                       2606    17112    users users_prescription_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_prescription_fkey FOREIGN KEY (prescription) REFERENCES public.prescription(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_prescription_fkey;
       public          postgres    false    248    250    3331                       2606    17107    users users_results_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_results_fkey FOREIGN KEY (results) REFERENCES public.results(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_results_fkey;
       public          postgres    false    250    246    3329            �      x������ � �      �      x������Jӝgo^�� 
u�IG4$:�t��	E�W/t���j�'����o�'�P�<����O޶���^�����]j���������?��8Ҷ�����|�����?�����{�����>H�m������l+�)�ר�����������mН�Q�A���:�f���g���v�����ĳK�?��?���u����Ӫ��[�}�ʼ)�X���:�>m�;V�w�31=���������?����{ڿ�����^֭8}W��e
a�����}��(��{n}:����4m����Y��� `�1�<-��=���]��.��������u�p]��m��j���=�｀'P���9e��>�s��ϕ�{�ҳc㺾o������!����Jp>.�&���ߕ�^�zo���De9��C�����t���{�~o̾��0���S�G뼫'�&<׭��n붾�*<��V]�X�^Ԛ���!���3�e5��
W��)��lY�����~��1�Uo��W��(����ezm[�9qY7���$�_����Y;d�c�^_/���?�E6��,�{]U&s��jMȪ��A�W��.?ⱝ~[�0ʾ��q�U��+��֓��
��~���G�?X���.�e�3̟#��Zc���m�rc��^�v��e?����q	g_߄�H���+���M��۞�G��D�^�Yx>z���l^�)��tf�p�������ǈ������I���l�2�mgq��[e�Һք�f�x�$�G����h_�V�AGZ�V���C�[CUm����}'f��Cx��>�}�\�)��]����c���D���~�<��}eYǶ���5=giNTWqةG6W��H�![v��=z_�2\��{�D�O?������ء�Ƚx�-�:Ug��[�tm����ԚO�xb:N��.��u>�����k/�˱�5H�qI_�N��b]���Hu�{�}=�c[-�=�+A����?T����L� �bܩWt�G�n�x�0��Ⱦ�[�����4ևN��/��іϒ���eat�:9�~��#����M��B���M(�ֲ'߇�W榋�G��m�}��?�u1�\�-��?�K���ӓR�r�|����F������c,;K�U)݋�W��}���M�7S8�������`�v#�K��߯����[�S��/�8����󑾄����bd�
�����ο&ǡ,�f���TP{M_�V����^�4"W���<�z�;�ݻ���L؛n��O��&p�����u�\��by?^�ɏ]�4�)���Ӻ{�V�:W���>�r0����3{
o��+��3j��=�@|F�?%]��R��5����@�����]��i�s�Vulv���$_���Np�fbMg���gBŝ�*I���C��9e6�yB5��̏g{
۞��#���6:��26�}���-����җ�����n����1��Z�M�L�ܞu�@;m���M[}��8Lѹ(Ni�_&�.����{�Ӟ��[�S7E����LL�G;���~�{�$ܸ��XX����A-�-�`���*��Uџ�g�������&e��>��"ٿ�.��Hr �P�J$3S�lD��ȣ�,,:%uB��T��N�I71�^�ۏ ��D��H�KZ0�Π*�8�H[w�(�,Xo/��`ҦC��!���}��"��Mf��}�\v�g1"�摒�o�r�h��*�@����+9�d���]����!S:��Añ�`Go��~��2Of�/�{~d�m��W��AR).$��Y����e8cL���X��W]hQI���Mu!W�Րw:UՃ��ѨyLx]M58cbf���nN����v�g�U�"��T�ʖ����D��C��F��r�v�K�9|���������7Ǳ��4.�{���]���`�}}�<�'��d�?6]��K������J�e���U��j��`�K�˕���z��I\@���c| �#����O���l�嚞�{�M<�Xx�	�Y�鄻N^�D�g��+���bBy��Q���t�E����z��{�l?L�ec�-���܌â�AX��T��cݓ�"џ�dcVt3��kd�-#��"������o�}Y��{�}'���x���ZT�c��ixǮ�)ݢ���e��_b%�ٕ�q��C���>%���;^v$2�fe��M_5"����@o9�ꦌ:,Mܛ��4s�� ȯ���PC�1)�,�#AX�p�����)6�^��p��b�^�b���{v�!�7�w� ������+���$�Z*���Xq��<!�3�ެ����Y�`�o�#�c�η�i�G�(P֧A]�d߄ݙ���#BJ�:�Q��D��K�����d��:���єo��w�|f7�8j2K�"�tE���n.�4�s��Bn�h�c���{�����[�5�V������#��TEh=���k���MۈDGm~�]�o�U�U���裑��V��v�U��k�a��a��q�d�����@]��VK�[sFm�u��L�����M�YK\ϻ�h�g؁�S��誥?w^�F�AA\�+��L��bc����(��*��N\�3��N��H�����U��A���x��y8�#0���&�zb"�ϊ����!|k6�3-�T�x�)�Y}�-m i����#�d�� Be�^�}1@e.��q4 ����]��{O�I���ߢ�Ǖ7�r�[�^꾱�1���3�ۛHC���2X��Բ��� ���~ww�Ey�������;$<!(9��D��9)~D]�c�(N��|�.%�����`��E�	A��h�*��&�w�f�����Mцf<��=-�d�j�yz�XAPr�7Q�/x��|�o�|��GA��v���aEC�Yv���'D��k��0�0���;ݰiK�̗9��;�sv��o��oYκ�����WU�LX�j�q�Ү�6������nP	�$�s��G����|6ǲsݔR~V��0�PU.�.gv.�ѧ�P�&�xu�=�����A��R�xSA�����z��3Q �S B��!���MX����\��Fi�*���b���h�Fb|�������C@��ְ�C2�k���ٺ�-&R�k�h���cB��N�E��a����-A�)����!=v��`�2H~�����<�<h�ʍ�!�M~��z�-��k8��!t�r�~���sg�����[�1�SV-~���{��9�+]��'*�s���[I[ ؝��IdI�S�A��	H���F��f���P�m�(ǳ%e��@{��U����O�������(	�i�U2�z/����Iy	��pB�\����bF�H�(��&<]v��	�U!˘���Yƒ.t/|sI8��ap�������/;<	�洹��ڒvm��$�NMx��9�д��uP2�&�T����̒8"��X%AJ�q�g�
bK�j���<T�����i�&U�I9�Q�yvݎ�Zź��4�:=���WRO�(/�W�r�w<Cji�o}��L�?.�nB9�g�GK� 01��d��^�b�� _��P�d8��]M����~��W�4�n�gŦx��;+-�{<r��y^�����_%SDj�M�����~aA�ou�3���*�w�4��?0�E.|�3��.�c�Š��rH!�0%��-�B ף���{\�k��*���Q���zK���Y�D;�(�NZ1-U�4�w����ְmiP��$��1�YZ�e��<�e�Xߣ	v˥���頛R���H�;Gյ��X��K���K'��)=N���H��l�K�%����V�.Td+�e���Z�Ӱ��䢊��I��+[�D�����XO���.�M�[�
_�����A�U7� ��װ���?�S�[f_�P�y_�#��kƺwu�g�ރt?��M�`Z��#���Ғ9��Т��ffOH��+�7R���ՠ���N꺃��HSմ^T�*��U�B�i[�ӚP�:9"���^-�����j�������ǚ�Ky��W0�BQT13�g܉�[O��z�W�X}= �ŉ�)Gɷ�8<� q�    z@~���C�S�� p�x��!��
�9���r͎���ǿ+��+��]ܢK�er��!�Jɾ�|�J=,{��3��C��'e�
2)�����a�'�+�[��{���i]
鉶2�0�E����`�Ƕ� FK�8����@B��N���2��wP�t���ӭP��W��go�=���
>�
�-51+e�2V��<��=�@~�,�7
����5��6�73oW����h[!��T�� 8¦�Vjf:��k%��o55�Q*5�x��M�{��UM,B�t�#�v�Gh-����e���2yH?�Q�N1[m]��UI�}�i���4N���t�'@�������yg|�^���{V��;U|>����g3���;���`�,O,l8��	�9���WApo�M-�Y�x��<�?x��;K�������O���^�8Z���XVV�ģ��ٶA� �7����i;{��*�?iV�ʽ��K�ȯ=�g̠���:l����R�&�c`.�\3����T�O���q���oã/!�;�+� ��t:�^m
 A}!��b����M�ԠsM��Y��ᬃ~��}v�� �`�� �s�OU|6���#՚lf E�n� W��1�g[Y�.����N�xO���T�\I"Nb�<4����-����[�A�l��6�^�f�{Y�y³���`N[�L1a��fV���$4^�+T��2S�1f(�M������6J�R����x��]A�աLa=��}��Ng]�W��5�F�!�VYC2��85
���I$�WO�-8uD�
U�Y}����NP�_�ۊ<1G�ز�Pĳ���ov&�U�{mT�Y�5*ex�Zs���l0����~��Yi��&��@_��@^���"�,������Y۽G�����NL�M�яδ2�`�/ܬ�x��	OF��*N�E\��h �Pf�Q�>�}B�1��3�ЎK:k�qɼL���JT���Pѵ��F�*B�- �@�[ u�G���իӭ�U���ԀI=I}����������G�։S�
}גW3�~�����=�N����wH�$�j�U9BLA�X�U�~c��+�:ds�žãPv��A�x�';�e��
4`�����盒f�ޣtb�;�Q{�~?��2r�wP/W���v@�ո��v���`��t�V�Y=D��Xݫ�0���䵎�:��J=I���M7kY��`X^��������=e�LI�Z���0����ѱ>����]Ƴz��H�G��r}�#�?ђ�Q]W�;5H�����tS�޼<��B�� Ӏj�Rz��wl��pk8�g�K�Z:q�<%n\T鸉�ʷv�)h�>�na�����b�eu�O�M���
�3����'a���AUht��)���%z�Й�
{�肪cφ���Xn3i�5L������MH5����mw�ޚ� �o�E����1��2���j�L�=�skp"�����g��]�:��B��S@�������o�����=p���EϨ'�G9�[�@[�+�I�j��q����g ���$��M��T�� ��������vw��3tj|Vj5���6-񍢶� ���W
�3�D�XP�{��8�\|�������0�s��8����~���u�N�T?·�G����@`F��nߟ�4���O���_�f6��{�]������r�'~�?璍�޳���V�d)��y/�ˎ����JR?Թw"*�<wM�Ԓc�)������
EP�3��l�3�[��Q�Z��=��N,���\ S��Ou������L�0]�{��mi�c~P6:([p�������y@5wO��a8z!�cX��J�y�9�8�ܗ{���%�iX���^����jn���������	zm���P�y�D��h.������A%�E�>����L��
�I5�'9�.S���ϾwM�sY���c�v���'ڞE�y[T�S����8��6r�
��[��_y��OJ�{SIz_�b\�7oW����F����3��h`7콫���L�Uժj'�˃���3iᙹ~ϛ�g�&��֢�Gf�ό'a��T�5�?��`H�8Ic�'U��H�M�
�����>� ��/��}V���0k�`w
�~�	|�LǳC����dXL��"��z���/��H��`i�"������<9�oe@'g\�w�jSgf�'�2�Gu�
a����c���*~�佇��_����-��1���v��Y|��곛<���enP�ƕ�ʅO~��@3T���q(��UW�������m���|좂b���?T����HN���;� �Et&��tQ��t�H�i���s!`�	qQ���pg��$��fڸ�KK�Ac��ҁ�����(�~�}��ຏ����(V��ZjcB��`�E�����N�¦gp �q/�E�i�.��U�g�dQ��x������9�0���EͻZljhk�^�f�^d�Sd��U�_/^�{�r8P�.J.��w)�WB��h�X�EIE?�rR.�4_���-��WԢ�/s�g횠O�EY����.�"p.� #P�����u��"�X+Ww�� �n�tK�
i�I����/��E�jU�Vi��Ӌ6|*��b]�Ӿ���+�-w��o}�Ԙ�(L-��@����r�0�����y_�jI�w��S���NrPYMKNe��,u��ز[��1[���:{�|*�fɬ���ؼ�������o�Q�ެ��kp���E(�Oz��Ԩ1^������
�,϶S!5�L:1���^5�ٴ2�:��P��D��9���ս��X�A	~�h� �كq�B$:�+�Bب�BW(��߆���R�{Vc�����>��Nů����o�`q뗋02ż� ��|ߠԦ]��_�_�bssY(g��;�-����`��{z�c��a=k�h�&���&�i\�qY��� s�_T����ϋ*����.*p��Sb�	]��Ȯ}S_���f�S0-!q֊a�4��'�����\��z��gOea��~|��77���q���;?��h��i5�vkh��~�������Aq����*.��
Zf.��~@lB���?�z�k10�n�tA�"�]��d!~v1o䫛��pߨ6a/J�6Y�fc��Y2�����=3�f{�A�x���z�ֲ��D���"�1�%�Ǣ�Ƀ����.��*pQ��Pen��������Qx�m�d�|��TVex,FZ`v���h�K�]���N�o�ov�6��0�
ئ����@�r�@����j������Ɓ~:��Tu��h��Kϙ��� ��5�.J
�zU��EX���HY���q��|L�W� ]���X��'I39)�z�����X�eE�� E���9oH/�������u�OC?�)]�qy��g��C�λ!������L�\�lO��f���AW1��;J!^ZH�s���O�}��1��Z3;�Z���ꂻ�� ��!�M�� �V[8m�_�M2\k����]�)%�G�g���U�Pwu}i���**Ǡp2��$��m�A4�r�E+��$5�dA����I;�`ɒIP�;
{��9��.BѮf;mN�d����L>���V�,0��&Y�[�Lk� 4>�����1r�"��F��4���%!L�n`��<��ӱ�x��Uus7Z���IG�:\�J��g�D��u�?�,)���t�ZA�JԯJ�����8=,XF�m������/I�gK��(�n%.Nr��"�)�M�ڗ9ÓY�{=d�YV�������{*��ټy����M-�7�<�"�ܿ�$�7ԅ����N��-��@�#�6�V*��g����߳������f��H5�k��:jX�RO��٘w!�5	�_��J�q9���B�_�f�<�Pz�����Y��|�1A����1*�DOdjP�̤M�����*v���� ��Z [XG�n�M����������v�5�v���=bn�d8�£�͊��8�T��ۃ��n���L�vH�c��T����.}^�	y���H�vT��    "T�:{���>�1�ˀP_��� �gh���;�"�dD�����݇YTd�������v8�XT���D�r\���g���c[S�.��y��JN�����hձ�w�jt�2�2(!M���Bz�Bg���P�+糅��Aŀ���Z������ ן�q� ql����Au$�X�d]$�~�o�]l���L�B��QS/-�>v��S\TN�Pd�~G
���6�:��C���@%�<:�����h{�"x����　a���hn��$�.y��X�W-B���ё��#H��W������m�nA���nY�@�Ed����
j3<m5�o�������}m ������zd����,�&�P��Rc�YJ p��(P����GK�ic��$�&.����+����� qGU�"e&U'�����Bz�7�u��w��Y�M�ӫ�B
����U��(_l�m#�B����a��A��OE�7�1�{!�2��ңE\��u���P��zT��Â�{\h8�	kZ-��}��d9���#���ox��A��[�M�k�����8wV/�+�&л�L���ci���ُ30O��S9��3��OW�Kq��p�\�úx��㬄UqJuʥ��E�zU,�,��^���}퓭$����T�L�%k�jOC��O�K�7�h6�@��p�2�V!l���A�jwd��O����9�=���}��f��.eJy�I����*�f���rV8��1$�B(�5���Sy�
x���a	�e÷k<����b��	��K�l7�/���y3�Z9�}�P�-��d���>��^����P�	�f�� �c(�v�ZY����#@����l�m���5�{�ʠ�O�����| ���t�4���A\��݋Ȼk/�c�0X�.[�l��x�[�L�oe������i97|p�p<Z������0k3lNM���ˢ�hA���������Q��%(�o��\ ߫F[�`����F�������%�e�=�
z�ȕ�Ր0h�c��\![-o�`g�kP��602p�g��/�x�a����_���?ʢ'9
�ӃoA) �!��*�߃�b�Q�*��%�(��4,T@xII����;�Q��{X�U�{j�&L�Ƒ�cu�U~=�_�����Jb�'���༜M��"T���[�999��N:� ��¨�w�>nr�V�0#��`�0
ed��k��.'�W�۪����Q���.���)U�\�+��G��B)V���}/� ���'e+p	햭���c-[s�m¹l�:��3�zOp��o JZ�b�����U��K�����^쾺@&:�BP���δ�����BI�Ԝ��T"&2�S��)Da���v4�?��P�7u`���l[�$席�E!��$.D��D��+f1�����z�� �p.�9��J���AF��J�"�#�ˡ���rz���� =�\���#�����!��>&|  _2��_�K
 G��%���:sp�GW.g�z��*�D	������9W�&c�C�d����N��_w��?��
��h�������!�"V�̱H�]$�2��b"{��$E,E"iWj��b�qt��Ç_���<ma��>�by�5_�ǚ>q=�
�O:´�"���ſ3�s:Sv{�4��̩q�`-��'��۪�6F�C��E�@��W��o�-�F����B��\L5h����� T��b���P�7�Q~��f���p��VO�����Y���a���Zz'���S�&���!����e5�N�&��85��Z�	MYA��"o�S*��AQ�y��/�xl�_��@�iU<��o�*T��'�� ��^ూJ���ީ�X?�9���e�\�*����P�n�S����3���o�0b���P~2(! �X�g�^��~�p�݄A
�Zi��'���[����Oj���Z��+2'��#���j�=E������x�jTv}�Uˮ�U j
��z�RJ�Ȯ?`�'�Z)�|�k�C'x�މo�f�����$���F���\�/��f��u�ؠ�V��A(�%�uU��kH`�V�	Bl���zuך���u�3�Psl�/�d$�-�;����c-74�V��9H8v(p��^�\Q�~Sj18��U �r!P�$Z3	k�܄#Thg�H���6X-�\��s�Z�=�_�jբ��y\v� ��]�������
 ��p]>�0�Z+h ����=����G:b��sg��03%j��kˀ�6�d磨�*�WLi糫j�.�������m�YB}�����q`ۻRp�k��K�9���V����=�M��پ�_M�(����PK��v�͠.�ڡ��_L���4�F�p�;���p�����8��B��gH�j�椩?�����	��NÅ�uB��J:�=d�gw�i��J���'��U��ڴ�%��G4��{��&�u�]�oB%4J37|�y�d���"��}+͒�œ9&ts_M��Y��{7�͗����A�%�H��+�Q�Ι�6�׾x���R�4� m�Π��lf�VL�
q�Q�,\����E�o4V��EK����k��n�Ѧ�s��X�l7�B##�Z@'�%@�2a�d�h��g�r�S1�u[5�{�	���]W~�N;���Z۴�;������z'&y���[�\��x,�Վ �vu�����wXȪ�5M9_�A����f�si��^j.�z��e�7��5�%-��id��5��[�~��Z>B���W#鞢u7|����+��b���l�Ĉ�^���� �\Tk��'�H�r�x�/�C���Q9� ��� M-\Ȭ���"/E�� �֪�mm�{n\�jT���M�����y�IAZ��jf���4�ϰ`��Fڟ%t�֢
XӶ@�y�J�Jg�̭���HgEZ���zvV&.����*�=țZ����u�w�݊�AҬ�ڌ�T���P�r�;n�/���h�f�G�������=��d�/(ٜ�ʙ��F�Sc'i;!5j��Tn~D�
2>\�'�ut�~G���7�$4��&�ϻ�w�/a��_ӷ�6�G���LM���#^� �|gl	�D]9q�p�F�:��XD��l��]��F�W�?kr�w+瀃1be�T��7Uj�xî��<Bqou5Wo۠�j�*�s�~jaزC��w��x�8�j��4�%�\�T1R�PP�/E�If�؂��v/���*"��Ǭ�_��p���G�-��5��� Z
5JB��js�f��C��\+b�u����=�B�VW<� 9��:-4�t�ע�S�f���|�q�(���g@�0H�Gm��Q�7�Jߔ:��� �k�Q��yXL�G�s��;��MGz��:�!6�������CP��K���ԯ�q5�Y� {<^zݝu�W�����u�pA�;��5;7�Q�P���
G�lPB,]������E�B����w���(�|F��c�������-.���R���l�
@QT��rX?q�⭣&s���ԽS�'��z���nxu��!P;(5�0����k�r'|��W]�X�0��o��3I)�=���jv�����H�#��8"��Iɝ�Ң�����W�J���@��y���sM=�ca�w�輋��~��M���r��
�K�toTtI�q�E�_�����Ɠ���K~ܣ�*���,|e��� �����PNͼA�a'uXۈ����z�����B�2���u� u�����s�լ����~Nȉ:��<@�g��Ֆ�&(����Ҡ�%�����:Su�����E��AkV*Τ'fO�@�@U�����?_�h��W?֝>2n����CCK�V��*��7�s����B�웃��������2�|�f�,�>�ed`Y�^�1;n�;��$��3�Av3�gn�@�b��vvF�M�?�
�ĉ�����Yt�س?���&WD�I��]�wD8 }Wc�Q4ֶ�@�,�.�����9S|��7gM��2�ʕ�g`a:|     ����]�!'5RSG�;\X�X��d����a�ɚ9���Dg�8�, �p��U�yS[����u��;^qePfTƷ���I��K��(0�����i�(={�P0��iquI�řnY�ge�|=脊̧�*m�ɾ�i6H+p�ɺ�E2Ϯ�$F@�V����S�	��{gb�jo�ipz�T��Mӳ���l�����f���=���׶���@7��׷��?6t����((%j�5�[~.� ʣ�[|f]㣐����/hz�Gv�6l�>�뿠��j�e�{M�)�l]tAng^vf�*�K���k��}/2�~U���ʡbw]����q,#.;Vd)TnX_$�]��%N��{�{.*8�_���~x8/��Q�E	��)�is98��T�}�fM�aOm[֭�>R� �s��}v$�E�x@�?m���y����E��#:���*�.2p��n���{���7I��i#@;'\��.Rj���}Q�]�U׽h��{d/:p�;{Ͽd����@�U�50)�O7&5���b��"[�8-ɵ��Rg��.Z�����4�:�R]Q�����}�� ����1��H[��M�*6Z�]�gz5�wV �E	�]�_�A-�_T� f��J�1��Ł��/ʠz�7�6r����j�O�O����F��R�A4�8�>�1x��V�)O�E��i�L�����9�8H(ϸ�Yh�}P�$�T��BJZ��,� /R��b�ET�U�E�*��"/������ɲZ��bNH$4��E���ͨ��� �ZK�"����׉..}�'�?EF/J���Q��YH�tY��������k�h?w��|�L�ݩ�����AJ��(A|�+���Ƀ]��sh㢃�E{���[����
rǈ_�w(ή��vw����CYd��ܳܙK�Z(�nV��7B� �;OPz�,_v�A7���p >T�w(A���[%��:��S!9+x��Hw��Q}ݚ E��\T�l��]�.(7�<{�B�$vJ>'W���:�NE�	�}Q�9W��sB�A�D��!�ݴ�u���[ X�W%����X�E�|�/UtW��Ҫ�R!t�1�b�n����"C�"����x��Y�(���h����E��sAL)�ȧ���:yI����^�e$u��9R{ɞ��P�[���b-oYP \{{	Φ�ѐ�n��{/�.� �)ޮ���~Q���A	A���s���	 uQ�"��U�s.\!�+,S3���Zz�(K��?�b���4�p7�5�t�T�}	��?�X�N�J��v+7�c�) �]i�f��� ��on�L�;\tAm�-��߂۟����h2r�̄ߩ`��(����+���נ|Wڋ⢄�N��w�AWK�9�����|B�ǜ^7}�m�d;�~9�}�k�ԢA(��J�A����\��!�59OR2&>�E����m �[b�i��>vi�p@����Y?2֖�f��}�`a!Ka�IA�CY^�y��1̮���q깽�d%���|i��y�x��lfg�lrS����E�ð.��y�j�.���ۡ{���*1��(��FQ�
H	����L�j�h��2(������]Z�$AE	�o�5F�ۥ�����ڪ�{�Y	5B_-�d��)y���]݌���۶zG�I���I;���IuG%�3����j��u��������l+�H9:��d�<
�r�2�Ϛu�o]v
��%"��L��fPj�qU��B*��l܋$p�f*�-���a0w�ݛ]о�x�ܽ���G��J�E���;ݭ�T�e���!R%Y�y(<*�㕽�>k��⃑ZR���b���VZl�����S������Rӧ�]���?�X7�~.HD�Ԡo���U~Kr�신��E��v.������������?�:��#=u�ȢQ������h�A��d�k�7������{�;W���gi��"LkN��9(2�9Q��>Y�oZ?��~���;|f��h�v�|Q��x|QӠ���<�_����,����c ��A�q���wV�=��p�gb���f����eV���̱F��1��ɢ=T�}����{���H������!sO�b�i�c,�Ž/R����;v��a������b�K���(�3=�c?�g�� ��>�{�V��/��A
=<Д9@D��=&z�W�rh�C3�Ѩ<,����
� �2��H�_#� �#p|�*qr�`�� ܺ:�e�rH.�&����P<���Ǳz}Ǯ��j����8�B��a{d^�C#�:�3�����)A�9�p3���rh�7W�6��X0��[>�6��uH���v�T 8e���C���1|�Tu�(�m��E�������:��e-�r�<T;4�Y S��#�]�h�G���zi4c<+׺'V��­B/G�C��lv��փEÏ*��T�-P�*׶^��9��h�5�dP�I��Cqo�b�E�D��b�h�~�͏�⦍G�"ꐸ1ƃȄEW�.�Ҝ�|њ��^(�:C��m�}��'��WY��j{k���i�O��{
w#���&�/�ս���.맇i�Ɲ����{jZ�M�ȠJ��M��6��@w�xB@�=;���|��Ev���1w��
n�|�}}��`��l����T�bV5��S��3b�,��H�:��=�[�؋]�5�̙�����_���=��Լ��n�w��g�����Ȑ�
P��������2 ���螃�c,��6�-��b�<��C_�9��s�i}q�"����n�y����h��%�5H2�)�E%�z0�1',��'NU�e�a�r��	!����f�� ��y�(in,=���gU�Ǘ�l�В�#K2kL�f�ܨv�߄(�=˙ڛaJ`�zn缗Lf���TԼ֛�����U��(�Ȟ��� ^$I�cra�U[8c�]�^��˚�����sّ�
�'4�&����+?z��P#4�I�E�N���^7��Ey�\+fW:�����w�H���d	���#��X!�X!c���<�D��2��5T��0�o5�Y#�ӟ'�/K���%��e��rO����'נ��b3����u��:���]��)�xi����1�LW�[w	xj�E��Yˢ��;�;Y��tcd:�ɭ������M�"��	��r�R6|B&�x�X|L�1��t��7���қ�"
3[f���EQ�<P�w�W垒u�U�����F�ʼ�ePk5H�~ٱO ���$\�Z��S�dҟ_]6���f�,4��Օ�o�D%¢Z� �X��W̼}f�C��;/�V�������%��.��MC*df�^�A%��G�>�0�{g��c��O���Je?]� ʯ$��L;��)��4�{n����@t�M6���jQV_R��<c��,�G����
 ;ZP96x��)ڲl>�{��H<X�Mg3�H�2֩�0�E?/G��1�_9��X�g^ȿ�t�r@җ9�5/�pk�u�B<8ź��0��ci!��~��F��mQג+,aa�Z)�z�^$�9m�KdbZk���-�c?zĪ!+�.�\��+�� t�5{�aL�~�&l�M�Ll���"�_
L�B@qZ
i?��ʐ*4�1�H��nt� ��^��A���so��ͻR����])�P�i�4��;.�� E�,m�'�����[2j��L�	SÍ��!y4���?J�xxpM���sT�4m1wƦ���rx
�׌�gj=`P��[:z64{�.�8+=����܊� ���L�>`����ѵ���栠�3��P�݃9/�!�tj>�%��/i�A\��Y]�r=�l.jx~ �gG9�����췱��qJ�$0� ��R@,u�ʪ�����6_g��Aոc%������+A�̺�g4+�
��]W��7T�����f?��Ч���G��ԣ����yN�-���~(ٸ2������F�ppT�����	���;}�g榪��˛�"A��$�Q�9��AJ��o��9D������&�I��J�    �#�Ω��ZK��#(#�r.K��L�j�˵�� �?ab�� &j��j(�	�,���L�Ä!��99+7u5�9rfW�Q�]���gЍ�
�b�������������j}���
_�"h��+��Ŏ�J=��&-���ԢAS{i������<|�e�MM���~e�f���H������Q���b�Z�|@m�V0��,����wc!��:�Z�����������t�P#y�U%�S�Z�gc�F[�5�V��/M�'�Y-#Y�OR�n}���#=Vk���3=a�e����Y�$n�����}ZZ�×5*Rn �jݽ��7>���v5!�_�Z�蕓m���^<gG/-��u�`Y������K<�e�D/9�q���Kun��t;�Z��E����yl���>c{N.*�g�-��kP���mD�2F�2���6�pP�Ee��/�6H<����@P4�M��i�B�?Ƞ�a��v��o�H�-��S҂wj{���m��&�
Qh;8���:��i� �`U�c���>�wg��h��{ƍ�+6���j�7�S��d���d�L�f��_mve�-���w� �oM*��@��T�7�}8y�i	2�!ب�7񡃂�}*h6���U̬h��/pdj; �I�u;�d��K	If�����9D� �W�1+|V����\�乛���u��89�����UeY͊�����,(�1疁]�w���.˼�Q��ޛ"~q�Zj�.���K&<�9iX��YG�
\�08mڛ�z��A�?�>��â�A� ������َ�;�0������j"6�6�_M�A8��V�+�DtSp�G�T���+!����z��2�5�6��f��/>gE�����ZP ۴����Jq�P�En8�֚����(Nۨ*�� ��*����&|a]|"��١�i��+̼^�����6����u'K�z��.z�9��e���0B;�4��)���1`��[<s4`y�k`�?���	v�&���H�Ч�l�7��� f�*�����:i_?"_��N�ô�;b���w'`� �6g����v��-��A���]9- �O��Z�\��7�N�Y��-Y�}=���J������T�l�4�>ݽ���V�ޥ]!�_K߃gA��S"��=,���|��v�
r�I�-<%���a=��v�� yx�=1�V���D�'�=A��8]ۄm�C���V��j)��zL�PZs��;dq;��a}[��`���*���	o����>Ӌ�B�^%�g�������ݡR7��ʭы{�r���J�yk	�1D����-��JW�9W���C4j�q��N��ߺ�úx��xu2�ље�wd�tm歐���������@�8H/�Z�W��i��ZiS���&���@T�T�<H��*ف��+xnAԠ�&����!�	��a�4�G��XtU\�&����[P)ʥa���p��L���ʕ���1;x���炩Ž9�0���;�:������h���zT����Ѱ�c�� y�k5��_:��E�T�[`���A��髖�=���qn��x��t�{K@t�u2�-�d�'(����Z�����(����NE����ȝ���!cJ�I��ޯ1^�'`b�ܸN燓��x�*�d��������� ��d�I�����A����!讍s���YF�w��#�.V!�N3�A�Lt�r��Gl��A��B�c8�X��_N�Zʙb��
�3�M��3�?,��� �x�g"̛��z���T�ܜ�g���sm�5H�0�ș�#>����X��8�n���"�b~Lcž+=��.V�y�1��<>�de�Ƙj�e��vޓ����}y�X2Hp?���l?��ܼ5'��0�w���?U��^f������=9����zM��A�EM8�.Oꂧ�YSwƽ���b��f��Hp����˸2�����,��}f<��1�G���ST�P�O���7�ޜ�$R�oZ�g߈C��I�K�J����.��`ꤦR��m:�Y�ʼ��K���ba�0sȜ-x���ͩ��i�w8{���(�FU��X�����M��AV��T[3�����}O�z���n�gC���v�^��Ɵ���̸;YEX:[�c��3<ގ�h�,fn�ZƷ!��Sy�fϓ�#`~�Pt��w�Oq���<OУ��ޚ���bVӚ����'�c��Eu����аQ�����G&y����z/��L���E�U+�D.�@��=���Ls�Ț��j�����'�7ұQoMTf��	�eb7�܃�< �v���])qm� �x�/2�,�k|Qu�a�!�	�Y%ѱ%D�ҎOvڲ��Ea�H��q�RS{��H�|I����T�{?trs��E���!�B	����u��㑭����3}��a��V�����w�$�(�a�U?��~{�'��*�{��w���}9���%��#ͻ�w>��D&�\�A�u���Z�}���d�\�a`iշ.J7�����Ca��>�� ��|�TЙ}jEr!�:��[����)����]� �9z�����L�������]׉�t���Q���)�<3��D�\�:��<�T8}u��eg�ڹ�m��TAd��M�C_��يUtT��_�k]T܀U�
[�O��h^NO�E��0���*V��7���n�v��>����1�����f� ��$Lx㢍�~�C�KUQ�:�K��Xy5�L^� �5��;* BqQJ�ҬDNTP���T�\y�5����m���`ޠ�\�3��8��\�P��\�%<�^d�����zi�x�B���_p�
qU+�޵�ڽ)+�޷j��xA_�Eأ�ܪ��[awմL֛oD�.�*�y໋8����o?;��F=�ֻA����l�!D���)w��kv��c���
��j��
�6�/�V���2���RчL�I5Eh��L��5u~7;0��A
�mfeGa��4����P���_TP��,��Ll�uo1����E�m��6��S�0�0�I�E]�����E9dO �f
<K�//mHZB�Ǟ�$<H��!>���5	梂�������^�3T��U(����vşϱ����Z���R�8wg��ԇ{�Wp�H;g�d��
��������\�;��KtE��Ns���pZ��8���ӽ���������ӋO��(��P���U�;s���N�QiZ�XGPU�Y��="�%�����w���>a��oԫw+~N�����՜��I�[���ܵ����w��=KP�"�t�Z��q���
��7�Ջ�|�������B��.���,~��Wwzw�_�µcJa�{�S�t���s���.���OLw�;w�<�^�	6�~���D2���Y��{|��Ԧ�{F��`�p/2Hb2>��K��ħa�"���T��M˭f��dh�Od�0m�Sf{��
��?���i(����b��'�{��;dʘ��,�}��Ûv�e��F��&D��"T6���7��/Jh�T�5cJK�(@������2�.�S�ʅ��HiwW����u�Nc!���f,N������uOQ-0��V0�%%�ّ̰���AӒ.��{�cw����t@o��겁.�҂ߊRU/��{.6c��c�/O� v���.*n�`M��i�����j�m��/�q��`���͘d�6��,�\Ό!�x�����֠��aug�.���޻%���Y����i�� �V4�$7��]*��IځL�H^��]M����CA��,��j���s��+?���{Z�m�r癙%9�S=P~�s��H5��tH�F�j-����W蠛��X:��я7((�:p�1�#�ق��(r��pQR��?*�6���P���#Q'���?�y!+�\px��"n�%�E6����h�o� xQ$?0`��օ�o�YH��z�%��_?����\���zS�%>�؟�m���˸��5��j@�����j	z��pV����&?}��    �g����C�\:����Y@<�w'[{�]��% �ׅ[��������T"]�gc���y�:�e{�{o�*�l�"�n�4?04�Jޱ�D@;��^?��wG��/*n(�ޙc�
��s���+���x&�v�qN�2�Z~/F�Bm��I��3^��t|�����kc��P��}�]��1��	��Cˣk�b|��j�#6�ߜH~Q �R>��IK\��8�oY��������d��~ �Ӷ:����L_?(P����(rQE��?��p?�T ��w���U V�j��#B1*�\/��@�T�����ɗ��4�X��q{��Q-��#�CI��Y39�%��`:�u�7_���bAj�si��%����}��O�e��ͱ%T}X���1��G_�l�ݟ��Q�Q��Z�J�&��H�V�V��\���<��쇦�"��$'��Ay���gHK
W�9Ƞ�����lr�
�R�F�T[�ݲ�u/��N�A)�*�
 I`��u�{M§=g|ڴlq9܃u@���ݡ5���wW�ѳ�����j�r�/�1�uH��X�\Sу�x��tn.:��<�$���&/�k�愶���1��Yh�.��Z��@
�:a';n�<�-�E��",�R:���+��[�Ǻ�T܌W�
ꭹp�Tt�8I��dW+cPA�o9�A�0����2��!q�n�ٗ�w��H��&乂�;x����҆~�y�_�'�,�.Y]y�Β�ϕ��/���6׉L�dI�~���ON	���ʚ�6qH�*0�s�*��y���*�25B�Y���Q�QZǡq=+�	��߽�� G�}���{|<�ST�Lw&!���Ҙ�w4����k��Z^T'�O�,dut)g�K"���1Vw�欅)���3#s&��N}�F�� }%Yw}�0���@>=���{8�|>�8�Z��|L�����m.��Mr��,�@6	�B��J��������cD@G�9I7U�b�YQ[�2��5�
.��t��to��|�l￡�:[���L6 �+��ujcp�4c���z�&[�5q��n1�p:G����~�Q&��r��2�-n� 7��*kf��:`��0��=щ�}���nu�]��
�?G�T@���:��_5wx5j���P&�xr/.��+�5T��PYvBP�L5�4��Z!����\�K�:(�f T��9�=-��:�U�xG��� V"]�˼3�)�^K������>3*��!�V�X�o8'��-�`��
��]��([�m�5[CU�A�F�Uu�`�l�b�p�r�T{P�T���fo�}=��j�[��QA�
���A��j�����M=�EK���������'u�kɊA����au/ ?�B�c�H�����S-),�i�$Hn2u���>���� ��C%��>�/�q�R�Bˡ���[�p���S��X�x�,���(r��l�ӗ8�OX�r����{�mfk>/x��h �Z�Y8�{�lr�fm�T�kM& �A%�uĬ�&k��N�>���s�B�	�V���(�R(�]�'A��f[S�B�hj���R�����j��(�;$� �P�h��t�֏���
e��7��e��k�|�"����G��2��`ɤEc�������]DдAW��ts�`8�5���&�ǌ*֪��{�f����޽�f��Y��r���m��D��$p�&2E�Si�4�7q���X�l���ܸ�72ŋj6��Bz�؛}�7pǔ��W�X�C/�Y��E��59�W���t���G���AN�U�(�G�q-Ő�L>SE#}U;N��`���I�2V�Vp����.�&�b)'����*�X�{�_��p\E�f�Ә]�Z�1��B|�����MI��"��4^e�cn�qi`p�u~�:Z�&YC�"n�'�e�Q����6��i����_�VE�%���V`���nR(�!غs��"�W�Ҫ{ �-秦��X?5��5�C��u�iu���q��uHQ�h���O|���cJ�I�C�d:�C5u�
�d�)p�/�F���z��e�e��j��cSM<\��~5���s�&e��u� ��q����9���W�H�ؚ)�Y�e�{��1dPdoUq�r��b�/<��"�BbJY
�M\���IЎ��x�KW3�#��Rd����3Y����Sc���<&��',G��OW�r�)���s��e�����_���S�O��H���R��4d�P�Z3�{���!�η�!A�z"/��WI�2�Z5���Z���j%l$KD3�: �i�4��gԽ�\K��WJༀ�\ f�A�0WU���<�N>�к�eū�:�=1��! 4�
�`��W������дː^A��ۢ��;h��J���b�V��k�IN��:$������J&8:�6,[��㓔�A'z���c�ٚ�M�k��И�8FVU��}�`+퉽Rs��-(mw�����Ǡ
D80�.o��d������c@��.�Ķ��g�@��A� ��=�i���i*a�!�!�x�#��mგͷ��l{�K6^Pfd� �#@�����z�Kk�-'Ĵ��ʯJO��e�ּאb/����Nn7��ѱԢ�qӏZ���W%�Q3�o[�� G툫#�j����tʇ��r�v�>���)x=��(1�sL��9�a�v`��YY���U�QcFW�[�g�Q�����A�A)i��n�\]M��:{��p��Y��;QB�OP˚6ǜ�V���4"E�P�Jਗ਼��1�pRY�&���w|Rb#�i�������4�F��'�y,��L��ϒ���>_�ffs����*�tM�|����J
�R_�Z�&��4:�en�,HɄ8z�tq弤P�S}�Mk����� �6�z�Y��K|�I��2[�>�ff��H��j��Y�Teg���uhIu��u �*X�Y0��mw�%wp厳v��-���HAņ�$M(�|���>v�xM��/�\p3�g5�s2&��׳���x�=E*親���P���y?so�E�_���8���i[�4-��j��.4&��@�}����"ص�����A�2���]��jO���)�����-(vn�ns�\Ƕ���1��n7O]�7�h�
{n��Y����R��w�)�����%���5� +e�m8
v�5�x�g��ޣ��&�z
�V��~�xN��h���#�}un��ldLOTxϴ�n���7V�&��hg��S ����x�������AN��n��n����j�c��t�r�b��q߭	�� ��������yO�2�r�����s�b�N5�Vac%���#m�U�;��V��Qd���)�u�Ns�S�#H~F|7���<�����_�r0��DB��o������c�Dw�7x�Bԍ���y��J�5 ���',��+6���J8j����~0���W&TIn�èW@]�#o,��Ԧ�vC�]~�/���{!.�g|�LS����d`�X��@����	ѮzP�bevʻ-AS:utm��"k|��0�kSd�/�{_����/�%��]�-c,��̂,A ���KtnWd�c�A�����a��N�:���'xJ�Z���Ԏ�@�����z$g���ʫB���A�R?��U��?^��tW��`���Tl>���.�y�ܠ��*'�z[�s��O�-��g�A�7c���C&�z�OA�t�[P���XO�)'�I�8���"�`�\cL�ι��a���A�2�;d�$���`�\��gd�����`���{1�^��4?í�`�Sc纔AuP�B�U\���Ԡ����SS��6�� �?!3�'g��Yߠ>��k�uZ��@��A��tM����9�N
�������Ӡ�1����?��>5���bc! A��f��3;ƇK~����q���+�g�|�E�=����k3E�!�d�ժP�z"�*�_�����fX6?��V<�N<]��$���1J9e=K\��Y~����cz���2��'
j �#8T�aѢ�|�O`�[eb�	    �9�:�/�^[e��g��^ ��뎍�G ��N�.�}c �i���A�F��w6@Dg���jF9�3$�zv|*(foa䳭~�GD+�x-2Ƞ.n P8��ݣ=vr0��W��Q���;�~V����YxvN���_�^Y؈z=;��A��Q$�0Hlr�b�tqE��9}o\#[Z�=�xB�h}��e���m�?��tRo3���B=ƃ��������}��_���O �<Ur�M4�/���$ϵ��E�[%�1���A����f���9h�4?��T��d�EGھ��[�6�
u��H���ӕI7:�k���
N���EL��\���P<�E�o�*�f�2�T����A�� ޯ��\��cD�l�*o�'P�DF�s�r�	�93�q^�VU�}�E�E(�n�^��ͤ���߅��wL@}&�Y%D��F�Z��ܖ���j����E� P�������"h��.28mwQA�:3���[_?�n�$��"��YtS����W��"S�4�e�`�M�H�u6�E�Ǳ/���;ݼ��I^��xx��'��F��)�])��q�V�p�=g0�g S_���� ��Η�{��(W�#�]t�J�"jKk��E	^B��yFȺeX\�e���*�����.� CV��Kn�}2������e�����~�&����lַ�!�p�C�/Zt���d�3*ˮrP�=��f� ������9k�v;U��`�z=��7T9�˨=�6���!7�sb
Z��1�!�
Z6�u��u~ɋ2��+Gd���J�w������ �R��3�S����^� ����L�?b�O�"�Ѫ�ȸ9�m��;��T�����
r�E����\�|�!҄��ib��#���`���D�o\m�6{ߠ �"D/*@��ܷ�W����r���w��w�ܹ��EA(�(�g@�򼭾��
������ț.�2̵�Enx�8�G����]�ʔ�sߩ/��!١�IT�~�3)�fW��1mBN��*���7zQ(�{��oUZ���E�]����n��c�sk��9�/*��˫?�.��Ϊj�(����J�uW}��MS�l���n#�AAv��!�I%Ϡ@��7k�AMVu;_��P�����C�(����D�,��*�.�������C��c]��o#=��\�N)��P��:�{��*G6^T(h��1/�"�q�Pa��Bσ�!k\�Ӫ�i��;$D��K��SA҆h���kPZ�|{��ɑ�L�����AsO�^�Ԉ�	�W��d�ew�ߥa=I���I�x|[����ܳ3s[��{_<U��u4�Lj���ߝn{[�l?��9�s�H����ex�[�wqKmr۟�ur��������:��Fֳ�V�G��f�E���VJ|]7�����r�>gΊ0�mz'�	��y�����|۪�PP���!�/���'�2%��衮}B)-rQ���&����<!��Զ��K)7��rсi�NĴy)V�d������CN�$>�v�^�J޴�e�*w� ��W�kڒH��QIuQ�ƈ?��]/M"[�j�_�^.i�����~� =�����ۡ��¼�v:��A�:nQ������s
ʯ�N�R �Y��D��o����V���A��4��m�IBIV��(+;��v�nFN:�9�H�t@�z]%��N���s������YE��yt�%���v��+�y(�x;eP��pv�T�^-+e��:�$��Ga�h:3�I>���⊠���P�ǂy�dh�H�����L�A��4TD�S	rh�()b=0S�f���Y(���T
JV�� p�A	qr��tc#QY�(����::���G@�4��C��DU�g��>o��k�֋J�k���T+�6��
� t�E�]��a}ʣ�xj�I���ڇz��� ������Y�F�Hr���ؽ�j�k!�w H�Ք���d4��B��M�_ �kǰ["S]��/��+�>|-�fLh����������(���I��`��Y[re-�Q-7MS���ߣQ�6� �FD�jn�� ��O\���c-I��;V"��D�����T�� 5E��|��-{�JȱE�d�+0xP@Qs�&_��i[�^4 9��L�)�C�06�K,U0}��E�C/ֱ�?&�-����y�����;8~���E�R�H��.�A	q)���~��LJ���%�����>ё��Yy T�M+�]T��m|�E���8ԅ4�p�otl[�r��r&��t'�q �ڼK��-���NVʰ��&��K�V���>Ѵ�E�E��s�"��5�����-����~���/�#'Ff؆k�|N8C���rd���{P�\c`��g�&��1�XGV����{P�T��g��H�(	�Uw9�n�u�r�]K�W��A�c�EX\���W���Ls��ܤ�[�����{�]�o���?G&��B��-Z�M�/
h)&�Qѣ��z���⨁�a�A��Ʃ��p4Pq���� gl�̣�C-���ύSo&� ��G����AX��I��*!p���!�s���T}#X�j�
�G�#���W�*���(>����?Y7���KLa[`�Q%7 ��;c�`}������<74Ae�:�܃
�qgN���*~��~?�����0&q�`�u�'��u���'1|��Zԏ|��7����-�*���;�@���A�v����7I�7�����[�04x��)���ع9�2��Y�u��o$�(�R_������y�9��`5P��r.�3D�佁�i~��&�ҼqAs��P�2���>�x� Y'���)_9�BÙZ�V.�L�m���X�+9i`�H��PG�V�쌵#���?{���e����ģ���)g�X���AC].p iɇE�eJHu7m>��f�Y9�Y���c�X�֚�����0���!��@����ԅ5�	As(��3�'���O���PMu�.�,,9�P�y�M)Z���.�qh��ޏL}�+�J2� ���:���owd�/�B����wk�A_�`�RI���?�o��k�&�p�Q�T��g
�GW!���l��Nk��p0� RbZun\c�f����;�Bof�J(}�+�*���~8��!z�9�0sr��VZ�c��qTޣR1uE�ʠA���NntOw�]�?N2��M]�,T�e���0wA���1�j��l�*��N��)��Yo�G;�Ҳ''�ݨ6�~�@/������ܺ:�:��=��gv|�Flչ �b��'���2�>�����mw��*��e�gy�c��*�����{�}�d(Y�^t����Т2��q�2��)�Op*y;h�Hٷ��ɹ�A�ٻe�6񹨂bV&��}��5c�ʗJ�4���Z�b�z��j�ޔ)PrA�,	D����������� �]X�fR������� ��8�J�dA�b~Q\��b�9��!�jo*���RT�ٜU ��L����N�,�fҲ�)�U��r ��%*��B��\~!P;c(2��� ���F��+�p��t,_t�{_�pj��\�P��X�<bL��qFR� LL��c��x
�/>�¥؍!)�]=>�q��Rm���k6DQ;}�uLT�=��hs�r����O���9?�}���QP�<#/�!j�(���
�h�7B5p������4�� �s��K�z���{��*T׍A)���Ϟ�{T�=�x��^3�+;�@l̗dPs���]es�Li��|�{�ⱮE���$Z��4��p��E��-���Š��J��G��<`Hu.��L���,
��i�p��N�c^��;C�ϾB���?6���I�kPB6 ��*M+�(T=}2V6I�)�����'����[T�
�`��n�~+�=>z�����Lri��	N�Y7k�^�A��K=OJI�Y�I��3�N C�#՚�)���xn��ԝ�;���1@depu/��e@�d2'�T3BU�!��!�@;��nE����D���\�!��j)�.~G#[�"�5y    ��ׄ�u��J�}�RX�T�j���Ok��2	����K���#H��v�a,�N= �	��z�U�V9Zq�Ϟ��U�}��j��ūt�y�E�Yv��W��Zj�`��T�ֽ�OW_�0P_�XsC����W�#b�jo3�ֲ��a�X-P��Um��/] ̔�
COS�>g��>���2\_{�a���1C���e�ӽ@z�ZP=0����Ǘ0XI/aT�8؍W-���t�k��r�Ba7v>��F�1�w���li�z��[�8��h�ͦ<+�sz	��Ƹo�B�+�hzQ~�~���k�E�`8�����>�l��|\�6y%j(=t`n/�ҽ3��L}}��:x��ҳ�C��=�k���P̰�+E��jQ�%�glMwion��8����|���Z��!�j��7�<��x�D�&��)�	h�ov4ƬB��;�F�NG��f��ݠԽ����b��m��� 6�68uU��CO�EL4j������7;�T���68}w�`yp
G���xf�7��i��Azxdȴ}E~�/�YX�w@j���ƶ+�_�XJ���v�\(w�a?����A�+s�ǣZo�çY�q��2���
�mKZ�}&���y��M��b�����;��!����ԩBlK�D#D���j��s�u��Cd���FU�gg�H+��'�7M7}�����L�v@U��T\0�\����,wyߨ���R�Mo����[��>c��ONf��--�ݚ��q{�1�bJ�f˄iP ��Y��4��,7�xp$�9����媍n��f��>��>
�� Fآ���v�ymj���@�\�x��١6���L|�nŻ����$�@���3>
U9��Y�u��1G���u٠���fl�!�.!E��� iܛ������r3>N��4�tP,:�oi̎�8���u�;!T���M�k�hot8u��!��#�Z�L~׬�<�r`-���e� ���̫W�u�#����~3g�b����z�5q�6p����2���պ�SÂz"��*����b$ƐPi��ad�ˣ:!0H��`����ޚ�����:%���f�d-Ͻu;ׅ+�{� ihA�N�u}ȃ�*,���k!���u��e�O�ȹ���7)�ot��H�(��0|�;$>-^����w`c�a�T�-И��z�J��5zP�2^#���	\Y��^J��@�&�P� uð�YA��dk�l���`O"�^W��s�Դ
�E=�+򤠪��3I����uWw>�`�f*�#��'?n�R�I��Zq�P߯�b��cO���t���G5���R<�˜w"x2F�t���ٳ�֛RA����з��ԧ��hnt���k����nD,>��F]���"���2�{%�S�t�^T�B�s/���TcZ.��jKc�q��ը���SnH	����P�s�n���!�3]61�(_/���=2�����{@>�s�p��)x>;�w� S�?��]ok��a㺕\W$�3����3K����$��|�?F�Td�C���{Д�ĒH����e�]>������i�U�����Ճz�#���$:������(۵?�ǳ\L��4���T7E�ރ<���z�q�]
R�[��}hP�!�z�V�{��Sy�/�g�q� ��Wzp�9��q�+���[�CV�v#Y�`JR�xK�w��1b�������r�y�?�e���TtXu���Ro�|����� P�*��\ _!�z�
�:fJu�a��`��q���gS'rǽ���h&�9�pǎ��5�1�Bk�֐�h�L�ك��ή�qBl���5'W�7�j]��)�~�-�I���GhI kVT�;���'��C���E�k�2#A ��!U��eCO)6�V}t��"*+�J�����L%Y�0�gƮ���,/��F	�d�
��R�*��˼��,h_4�F�A���0t��6�ݞ���>p�eY�I��=�,G��O#���x�@�Vv�G?���'%3l��Y9D瀰 ��~Gռ-��G�=`c�B6�EKF��f�o�Pw��ZGnݒG�b�3X�[����kڷ�X��'D���Oծ��ݢ:��N��2�. ow;���~�zNV��iDv�y[���p�����ѼE�죁�^V�P9y:v��*&H2��0�� G��Y�A��5��L�vG�:���Q|}P&�\�fTM�wT�|he�+��j����C��Y�i�zG��)�Q�u����\�_78ш��b�	�h|t������X��ߔ�~3��r�r�������AZPB��?+B����� ��N��_�g�	��"�y&YZ6�����0d��ߠ2ǽ���`�R���{���3�/o:��O�`���~���/���z+���
E���/��ݷ�M쒸��>���-	w��oɱ�����+�3q�ɿ�v���W�8�(1vK:���9f��-G��D?���Lh�o�[@y�i �@�� /��[�Euoɠ}���4e�K1ʣ+�K ���)	~b:� �e㮁�F�:�Kf$�A�;��nQh�р�J�a��a���2�4qK�(;D���ޘ��1!�/qKtwt�|䖓�B�*G�@|�ù�O�dc� ��f�-,܋E�y�f17�Y&�1_:(�6mE������#��VvW��VW���u��nɄ�/�����A��c`�,���lI����?t:}�u{K���b���(�z�����1M���H����~��d�����[��7R�vvduգ���=4@����ZA����޵�tJ�!�U���C�j�X�By�g�l�`ﴪ�77��W���
nAp;V��1�t��}�E��޲��J�9bDN�)rA�2�M�N��Q�[T����� �zs�;�p�̆��[�ԟ�_���Ӑ��b���!M�-�L�4d!p�6­q0���A���z<��ݜ�9c�**���f������e�$�ưn)�έ��)N�H8jn3��T�U޼ғ��(�)	��&�$w�F���3����W�uJ���+�P؞g(
��nI��#���[yS	��}m�{-jr[��-��E4q��NA�[�����hjJJK�Tv+�s#�\p*�:=/
��+s^�ե�4o9��{��7ތ�X٫B���n��j����Ͼ��+�d�+��3˥@�[�odQ6
t�R�؃:�[0���PƸ|�7��Ep>X�t��$����ޅ\Ԃy���p�i����Y�kn��{��)+!�9���H� v��Y!He��WJ��-=+`�<�pQߜ@�L�h\%SZ:��ݒ�Añ��3�/��P���i��/I?�Ȓ9'��SZ�S
�ugӤ�惁�j'p�q>�T�8���Ɂ�K���m^�3Պ{�I߂1����Q;��wW�����DntK���� �8�j�L ������'|�WA��!Dr��d8�_�S{��w�V�}���lC��JSq�T���3����4���i)��`|���^T	��]�,nA��W�u���`��O����k�tX,���:�o���5�j��C��-����C�`�S��H���\=O���.8��x���BS��-�`Ƭs���pۼ	T,З5��q���0oY����FHw.ݺe!>%�t�)�ɖ�M	"�f¥q��~w�Uڳ>M���S���[v�~Y�՞/K+�0���
���� [=a'K���+4��-\1а_��i`m&Ʋ���:���-��i3��R��%Ң�I�R	|�(��2\��*Ak����M9�P�����7G�}.$re�2D�Z�r�
�@e*[t�d^<�R� Jdn(�����f�J�Q�h5
Ձ��*A3�]5Z��{Z��b�<�H��Z��ײZ����>$Y^B�ϴP�s��~d}�ϡ8��OU�Z��Y��ݨ��,��n�P_��6i?DU�Z���\-v�B���{sԸ�LrS�D��Sz�B6E|�n_4�    D�׆"�GR$|�־j�I�Q��^�jO7���j%HQ�:�aP��>4(j��s}�ޖG��#�W��O�Z¾+5����\�K�>]�ۀ<��'��-V�үh�}-l�T�h�-�Z���2Qx�{t.%uX��/w�PT�.=����`�^|W(��p����9�?1����E��� ��:�{8�>^Q�\�����	e͟� ��"v�~�F��0��ե�"�1�t�q�;�e.���n�E*�n�Ct��/܋�s�~]@gZ�Y�ty�·�ݵ��-����\ݖ�R���n(D7�q�mZ��\��^O��2c���3)�p��l�&�]}��+.A�G��7��5�������H�u��a��W��{�JH���v٫9��P1�X���A�׽�+7�涟E����s/�qW�;��o��4��_���q��'ڿ�����K)��U ���W6�%\�K��`��+�^�S����>͛��[9�*HL�lL^�!�}�39
ww�_���=1c�F���8��N����1Ѩ��J��^�����@�Dj�q�_�Lr� �3������S$���wf6�%$v�����M) ^���%Z��=A����z��/�F���_�f�����eY���m��|o�^�wA�ˈ�)�-�i�@-(y��J�9��3�龙�n�tS#�)�Y���4��A�w`T�T�+G@���+ffJ�'��y���n��GVV��:$G�p+S�-�U���ٸ�~y������}y>��Iw_6ϛ��9;qi��t��ju���$;ܦ8�B�O�1ܘ�Rd�4#�T��f����nǱ�L��>�-F�w����.���!��\9�3��L�g�̒�	���J�Peǉ �f+�c��:��������F�D`�3֛�}�/@X�Ȁ��W���rW����p�,�Y�Y�v��R}�W��՝�Y��S��[J��./�~�X�V�<՜o�0�9���t���v*8�
g�X�(Q���q�3+a�i�9d��c�t
ll��h1��ט˔���l��������gL��� ��Q���%�m�\��F�2S
� kfa~C�6w��a;��E��g�*^G���I>�?�����N�����q�A9E�Ѕ%�>P�o���P���7�})슜R�˙�J�2��(i`�Z 7�]SY��q6=7BB�3k�s��s���~���͝�o����C����[���V�o�jrK0�e����.�F�0G�����~w�
��UKu�	����ꔂ���>��φb��8Q�Q �;<\zЁ���=�a5��/Z�8�`B!ɘ��!��ϧ�d_M��/�7]N���z-;�M<'����P��3��|��c�(DK���g�8��ڐ�|e�f�W�{�)�BT��.'4ږ�YFRN���?(�En��nCަ���C:�hz[m�gM-�Mx���_R�[��E(�=$�
^~��7���M�3��h�q���d���+���'����Ǣi��Z|>Gڙ��:]�2��l�����Q?s�s�5�3���&w����CК]Q��A_٫,���,V<N�bU�o��'*�N�s�:�l���V~w�|��W���Е�s���7����tU1nv�.h�=�V��\�y���o���Z�-$�����_����4��oO�OI��h��Ik��^����p�}^��Sk��k��_�g��Ŷ�\�F�/������ku��Rܟ�ԏ�+4�`��G! :zӥix��ܥ���ܷ^��$�Gtat������\�{����5:d���m��91�қ�ى*������d��<|�Y�G؜ ��g���*���~��h��Y���%!+*��k-Q���j��,�c��P�8�΋p�3�l����2��j����#T<�迒J�aN]bo���M�?�၊H��J��Ќ�y��k r�PE^�ب��ƩF��>M=�*��e*4/�Rw� �ڦ��y����D�s�,��=����׷$(/M���:�[:�R�����ڣ�ɀ9=!jm��ֱ���p<�?�	x@�4������ ��3%����	�2;̶�����4�Vf�J<�HqQPI�>P��E==���A�z�Y3JS2a�O��j>�/�MI���sp,.���d�֧N��7�r�K��h�Fފ�H��>�Rs��ȭ�;WxJi�+cj$�&�jȉIk��b�5�����c�ԯ<��U �C���v�L�����\=!��hŒL��_�)�V���s#�[�/}��W��1���*jt���	&�t�n֪�ۃU�����|&�F��Q+���k]��H����c����^�d�5���W|��\�ߐ?���Ԑy���k�q����T��\۔�:$��S
,�5�4�
����6{;�y��o�>��|\W�g� ȱhv���ݵq��.`�����-
��P�CB�˖����c�;�K�ٲ*~�3J�qx$�28��?�h&r��#��Te]���)���^&#����'hRa~\�������q�L�Y��F��`c5�W�9t0�.�v�q�*�v��|����²�
�ߨ�L��2>6��}3��0`�����i���L�D��EhV���f�x1Zy�g�I[J��PV��A��Bh�r
�2m��ó � ]aȖ 5(�|_KA��bb���o�a{x���������,-�g3���e��'��O�w�:8��D��}.Y2aR���~G*_ �.�7Lv���R��������5�Ek��ܮ��}7���2����Vv��x[�T�
C
���zG��ݵ����Vn�L#n���}[1�b�ܷ��Vң_�h�h�k>�j�UL�B5�̆u�Z�2P�Y3{s,u*֣0
���Y ��Q�*@ٵ�pe5�[N��B'e$u͹��k��ãӭ���9��P�R�R�Ⱥ��VF��d�@��̴���''�ǽ���k���2�&@��i��HS3�1����S���}z�^�&��=�ej ��0��ݣHe�!ψ�1k���U���b#'�C(	���y6����L�����4//�V���q���� �8�?���QT8�'��v{�:\ĸJŎ�Vc��- �Y^A����<d����9�D�6��W���V���t)��\�+�O���]��,������|?`AV�<���n�T�<R=�t��@�\�n���	忛?�!�قςE.5�]@���~�ߩV�D�F��~6��Mө({�_�u�&�g� ��Bz
�S|��VڵAOJ��]�ȷ��z����wW:4��_q-'��x����.�~����1��3�����1���`�)�E�xH�k��m,��}���N�1��}��V�~���䳞!�)��Y[�N�g���r��cV$ ���L�ż�wL�1��3��T�9L@��꯿i���*�!�[����/���x`ݚ���"\���H�����+<ɔO�}a>�\�%�]n����8M�* ���m��^��3{Uqf:>�Ju�:��q�cλ��WWw~����J���X�k�d5�<5ۢD���ؠ����� �ވ����]ۈi4aV���x���hT�b�|?P1�n���'�\f�ss���fǢ_��Ӏ`�������q���ݳT�3@oNp���/�I��J�-�w��Z��|�-�)<�,h�^���Ġa�~�j�0
wJY{��k�0�J��~۞�_���{F��q�A�pĠs�������W/h܌CxT��8�E��z�:a��%��ǡ�X��>�)�噆R����)D?�>���J}鸆��	�)��?Ο���	 ��
0�d��KM�!�?���Ñ�Zes,Q����J��?K]�����M���J���&SP6����9#�͜�(�y��u��Ђ�k/�&��ø ~���ȍ_��B"Y1O�%����x��m����"ļW'�a�����?5uu�������*rr$��1#��>�P���������fZ�q��NJ��e�u^���%�    ���̃��G	J�(D>JP�h%C1ߎ��5Sl�j#2m]�ͷS��/S���,@�N&5�^���Gk�:<�s�Ӷ��d�O�L�b��)�d-�7���{���m.���^n�� �P��-�|l�3D��i>�RY�>'Tv}�9�|>G��F�#B�h�w����W�]�||Q���:�a�(/4�ю<�aE؁{<���gG�ϋ��RT%�_`�Q�Q���3�����.bol����A՗H���n���c���;ja"<�W��׫��7G�y����?�a%�Ћ�X�{J
ߙ.j��Yo ����|F�~��l5tn�ӿV���3EHA�-��0��-
1X�໥�|h���X���:��r�?&�w��܂~;|���[�֭��IzisSoM�R��s�۾�%aa��:m��>�����k�ńSc�s�(���
�'�In1(�6��#�e��Z��oX|��oI�]n���?W/;��l��ޒA�k�[6`���nhO�������9A��2�w^S���_?��Vp�-�,l�+�fٕ��)�����U��-�����8��nAeZC��{).��4uv���X9M�ɳS����'斄�g6i��N��^��?3���5o	h|g�=���Ɯ��犊i�ϻ��m1�W���Zew�I∨�o����So� �캢4w������-6�^��F0��,��jcna����|�ƣ��-%��һ%7�'����Et�wC*&�nQ5vٰ#�;�>|� �r�B�\��Ct`C4@�c`�U��5|7G�XT��p�����(&�Z�ȶ�%�;���F�Zm��ߒAٗe�n� �ap�[|����]�S�Z�)qBL�������[�'�\���H&Y���u��@Ԯ�����]Ko� �챰[��b)��
�⡦�(��[�����|�6���·f�_�Ӹ��^��AU}��ilg`}���,�{ �Z�n���P<�-)$ˏ���n!�3E�<���"� YWm������̩y�z������eRv��;�)7�ڧ:�It��Ԇ�`=��)�	�y*�n���u�ڒޒ��㦳ϔ�݄��*o�ޒAb�}N�F�ͧx�5,3?�;Q�tP�Q}�S�t$c�'�������ٗݩ<�z�Š;�G�N���:�j8���v[��E�º�,-.��
�릈��{W���3���'[����]t���e+e�L�}���}[����CH�(!���^9�{��i�uЇ����4J� qK�C�����b�x�e�������uw�O@�G��S[qg��W�9�eϨ�ΐ�[�í��Y��7��Od�U?�~�O��Ku�|"��Ѿ3 ��=1���U?M��Rc���b͗��b����K{���sK����LIËB�H��1}�����O�9�ܹ��V���oJ���[��#�K �x���s{���xh�nܿȍ�ɇ1���@/���s��T��g{%�	�pAX���t��>�����^w�8~P�ϔ����� ���,u�&��-�Y��Kem� p�>Y� A���\r}��Z�6�1�  ����<�*�t�����};�#�������1[.6Y#��nԵg,O7y�2�%���JԊY|-����m�N` �{�;A-٩M��9�Ր���[ɪ�C�/�x�*�9^��==�Hƽ$�״�[�.�䞝<�8��,�8$�v2�斅���y>Y����"�ѭg��`|��e�����bMĘ���D�iA��[�	q�������-<��G�oyxg۟�6 I�}+���&
�"�Y�׺Š�6��o�=�A� S��%��j���e�e���m>̧^��E�� ��Ąt��&K�+�rT����A��_�#�rs7/OM�#T Q��B�?#Z�m@��R�0Z��<[IǵeJ�B��3z��K����V��^���r��j
f%hQ�=j2��#���*�B�b�H��ޫ
1�`���n���޲r����+����4�|ɰ#����Cfi}n�������YnD+������a��YW��&����Zu?UZ���� 󸵆p%Z;��6g��Pr�:����m-�~Gѽ��)Q��j��¾����Zo�����q�$���ro�UR{j�/DZnje�֭
&W.~ʤ�۳���Z� �|���f6�r7G琀1�@A���$k��+@�ٖm�g�:XM��qP�aP�Wje�ĺ����W�_\�[��"�ztq\\AN�bg|q�/rĹx�^Z�����N ���v�zm9����q}e�o1o���� 7�u��R��+�ܓ�䊺��H%�D2��� %�Ek.s�#-t%�>���	����J�3��ˀ���h�;n��qs]���)W�ԂG1�K��gv�9V�ޒԮ�lׅ4.>I�'f_1�y����p�\Je�ge~3`���.���7��9o���O�rrK��W����0^W������+��p���r)���s8"I���!L���.����������<�����6����^.My�� N� ����-����|�-w������B7���`Z�j���1�"Astˌ_5(�s����0��:s/Y��i�E�n��y|�?�y�l.�F���	}/����+���~i��ǂ�k�������>�����S�sE]��[o�[
��n��F����g��Xז�3n.�3]Z�if�]v{�/j�qz�2<�O=n�$琰�
��c�m�W�2����������y&C�]�_*�?�f �@��z���h�DG���9?�C�`7=C�R���|���#h��uƆa��gc]��0��<8�d�T��J>ڼ":����5���|�7M)��?!�M�n�
�}}ˀk��g%N�� �k6�[��˳���z(���(z��Ẹg@���l�t��'�ٷT�bo�ѝK��3�����=�e.nϔR�Z�+4CM�G���3���W�ec`�r��܆�z����|\��������Ȗߗk>�r�	E�9�[�6_��y&0+����Ղ~%_��8�%_���bP���&%����&�[�W`7�����"����|�K�3+�\�կ\Pn�ͬ�ï N�)���3�I[ 0���9�V����[o�9X�0!\��\����A``������K��E���Uz�p��
v��^�a�픛kl���fg�[zi��?tz	`8�v�E�M��j�P��6�Y07[�6�J[�d��V'����n�u�!�Mn���p��l�_��	����#��p��S�)�e����G�
F�r�T5-���E�0�8i2{�clA���d9�����R�CBUD�#��}�=�m~�+���6�dv��#�ق �p��#P;H!fe0_���"t�#2{ԶP�b�V��R��(D��e����B]�Q� �[:`~H�hXG9�{�n��VsK��X�9�N#v���?��W�3h�5���D��S��UG�'�-y�"~6
���8���P	sH����BI�[�[4�P�: $�����=ۘH��x�a��J
ػ�^R�Q��ݠ��%u�]��X�A�&W)m�*��f����iWJ��+�~G|Θ�t��ckY�����qa���%b,�uQ:��Y�wgي��p$��
m��$���<���E�K�L�ڧ��p@��5�g�,D5hJ��i�E��,��N�n��CYkC�=ˢX�Ll?}V����6 4y���<�5����b�5�<
�k˼�"�D���^?4�y�1 �/0�Q���l�
�x �R���i.J��>��g�+�VT�>���-2>�
��) �h�mY�����K��6[��>0H��'�[��0�v��4��"���P��t�Nm�c�݅���_)=��{�'���4��y��4��3��c�FҦ�?@ħd`�Z�� G�y/����(v�m�\>�< �j��2ZG���:�
x�D���L���Qݝ�"�� �s�&a{��3(��=Sࣵ�^%�4�Y� K�@=2�x����    TX�D���S4�&h��%�U���tfT�$T=O�[۵_�*�
��Zy0Ҫ��^�����y�Dang�����Q�f۠��חE����=,�}����%��a���tWx�F��x��q� c�L�q����|l� ��� <�i�q��Je���jK�5��LTj�v�����z���2��dk��̀E���`�W ����ij�k&&GO9UMR�KW��'��E����,47y�?����V���^�~ak��������T�n*�y&�g#�Z�Z
4��~�_I6(�	�4�g�K�X�r��B��t����r��ۜP�hF�
 K3˫��C�왶��F�$��:h�{[���$ss�k������n7f���gn�M9���޺�M������>�V���ekP6���9�jˌ�TJ��g�h�J�n�4n���	��Nh|�*����{e.!�>�C���j*e�v$�Q��CT662Um^��b���[l�R��"��S��N���B���r]}�CZ�q��Y
��zK�� ����m�,�ݎ�:�(���b����-�ȇ�g�恓'1_���o���N՞�v�k��ѐ(�Վꆚ�VM�������V��4�S�t�eP�"!]�۪Lo�fL���p��	�l��WA�z�Vb��oW|�|7�Y1����}bȱ���a�	|S[Mk�;�X
ie�Q̖��[�5����=���	Oxb"�xJ�n��K�>46���MQ 〶mڛ[I{�hq'�o�E=�̬j�r��� ,e@�vAl�sj�R�\	Ϸf�,�6]v�v�bQ$�~k0��֢��_=�J��<�Ѵ$�ªs��%��F����VKːO��h��ݖ#l@��	�ʎ*Њ��]�fH���)�\W�3-Z��4��N��z�l6g5�F{�B��͚UmČ��!ϫ�l@�48�V�ʮ�+�UX�>�Q�oנ�W���;��vRg\����F	Z{�*��m�M ��y�!��|H�"~y7����e�:S
V2"�p�Y�d~ ���np4<pڸ?�,V?��Y`~45�"p9�^�Q�Ru�+�ר+�ۊ�zGWZo����
uM�,o����-���Ɵ]`�� iٴ7��ϑ�ghCl�j����������z�i�e�#�@�$WX�G~��χ!�|�N��޲�HtC�6���*��#��
�'��4_>$@�H�� l����#
�~Q[���,���� �}w�s�~�|d��<��=��	50�/w�ɀ�G��4C⻵���s=�/r�S�ne�|G�ZlL��5�_���PM�	d��gVS���O[��7:$��~_3��O� :�a��e�`���|�A��A��@�ʞ1۴�3�j�
X6-�ީx[�e���G
��F^��ϳ�J^��"][y���<���x��f��j����k�^�ubHc<oW��(��}����3�(���5�:���XZxn��!�=%!;nT_�@���Z��K�2����{�����|/���MX���7n=0/o[�H�f��t������?t�^N ��拢�h��}rEȢ�%��Cd���z85hг�]k��ډ����j��f�_��Ҕ�R� ��1T���tˍ��@Α@U�q�$���&�Tĕ��^�;A��"m ���)�b���;���_\>�ߵ]����ʟ�"YOs�-����Se��A]�,�щ�M>"JT� G5�(�R�zA��_,bVK�i��-����9�2_�#����y���	J�(�!�8�5�c�~��a��o�K�d�gh�+�=�vkizF4�:ŢZ�w��з,@N��x�*���Y�+����'�9�H�0�<N����q�3j'�xE�9��_s+���~hB��~HB����r��XT���a^z Y9�1m�mjo>7�P�&5��7bn��8<ZY���)%3�P� .�1�ø�^���au�2Q�c|m\t��?.#�
�R��Α���2$����;#O���
��c���62����@,����=DU4>4�	(�-:r�т,�Q�͈U-J��5�AM���j���UE�71�(^��]�pz�2M"��Q�n6��[Zn�
��eſA�����m����n�;��NrI}��(�/�� ��*�j�#�؈��W+x�����=(1�#,�8��<����o�������۠(�O~�aѮ��q5�9ZX�o_���Pck����嘖�4���-��[m�����IF��U�rDu�>y�Iֵ�<y䨎1�-#`��}cćDǃ�a�Slݼ�iY���<���/'���ql��1��i�#X8��^n�����D��ނ����M���!)����~��xJp�&�!��I��?��H�-����\$� �zn9 T�8��SS����$_a?߷@���wK Q�*�[.{C�-Y�tĹsY�n�${oJƥ����E�{\h��}�|z�X�Fԧ$U���x��XO߲��>�6�����3�L��[��^��A���-SHϼ\A��oI��Dn�[4l����o�+��,ce�����$}s�]&�
L+W�Ζy��JY�%��A�-��f��W��|���&s׃T�-Y�K�w�����d��RM�yL�\�c���bA�O�
 �m�;����2Tl�+��Hr��cֿo��[��w%�ֳ����pA�\^6����و����6�ޒ`�R��-���Q7�O-��Be�T���sW/�F�!ڿ�N�]la��)�D��F2&����[Y2��uA��|K9����$�Cnq�58r�[�e��H%��zeK����h�����0ֆ,$��e��@><�q��"��,�&x��Ȱa�o@�}>X4�9�� �-t�t�nh$��4n1� �o&>�5�|�������--64DKA�K�(��3x�e}�APE�Ӝ�`A�fl����.k��{Zv\�W�3�N�5W��-���_��<��s����m���6dD�A
a��?�ѻ��m�TАc�X�Ba�JO�y^~;����S^� 0���V��#�Jlކ׸�V*�M|�����cĚ�xl��;�yvJn���s&���4����s,�Q`��v��-E�`����������A!��%�`�n���3ޥ@�5u����ٺC����o�����
8��Z9/��:��I�u�Z�8�v^PEQ�3��蟞�̐��]�5���2��6���}Z�2
��/�^}};�9`�7�����vw�ό>�K�.Ʉ�| �Q��-X� .}���gqdw�E�)�_J����Ә�q6��j���[&:k��Qh�z~�q�����.�Y�î������P�")��+$�=+t���N�9#�nY)�г��py�i�烥񷡷o	!����Vgw��b⼤��\�觾�q�;j��؎�-�G]�S��?O��@����uX��8�����]u��C�|��^�0�Z�0	\�mO�[��V���,��wF8�.�r@ɠӧ(���~�B�C�"���Ųo+����ͷ��Ks�9V�Vbq�s�p�i��N��3�i��K2g0�5�\�8� R��ǸM:� �S;%�VpW� d��I@����[b#[�v��^;y鄴�f���~����)5s5L?���%k����`h!�'��Rl����+K'��.�59��j���-���)�{&m�)���9�l���M��
N8��y>jF�,bb�k)��k�~M�Dm�YS��V���j�b�w���[
z�/������t	���EL�`�q5�L�������4��n;#__4���2�&-t�� n��D���8��3��@4���m�����{�n��щ�4Iڋ��[.��k^O�Nh��T �����ڂW׷$�<uܹ%�rdC�"@���T
��,g���A3��y3֓R�ɽ8��8�f&�i�k�j��&>�^!|�Dv	����O���I�l�nQԀ�d�[b��4)Y���R��6�n�%#i    �A�I�gHR%����б���]��3��2�>��6��^3�h�8~��hQ�"� ĸf�R?}����
Jn-�,g��d.��m�M����z�!�̺�:X�D�sK�M���������%�iG�n�j��y��Eɤ��c�M�Ĵ`���>Ɩ�KB��GG�{@�/��#dt����s�|x�i�� �l��%qr��=�w��:���Gt."�;`���-�_�ࡊ��4]���Ү�+��y$�?��Z�ש)�|�sr���6qS􇤇����բ.퉖�h��Q$��{K5ϡ(����ߵݵ�E�q�4���/��+�+b����+�L
��y��nwՔ�;������	8r
u_�g٠}vl�(��sB��V+sJ�E�Y����.(�Y���K�N����[�_�U�^�W@˾�5F����
�G�"6�u�>��p*��2�G�R���rC�ĕV�Z���1G�ٕcVK5�/ �s���-88��� 3��eWT�n��U �FjŘ����2��2ϋN�R19�:V̒/ޥyr]�g�� ]^nO������������9	�l����2��h��+ά�W���[�0��j����E���S�J�i
n��r?&5����E-֖(�3\�KWm�V�O0y���\0���LI��U�>!N��l1ϥ�6�<�l��ʋBh�-%B�_J��fth����/ʤ;����h-s{u�H��|ގd�?n��m�����=�D�/r˓�����+�q���V���BE�D��ٻ�D���kw�F�8b�K�͔���.�`M�J��{�#��Q_~m�l���Z^,�p��[���8N��� ɒ0����)29�kdj~8}�����9=
�--��g�~�`�v�m�l(wI0�U���b��	-�O�б~��I�a�x���H�|�β 	�L(G��6}�fV`�&�:-[:=��f�'}���mY�M���99��*�H�C�� z���+�&t�0���K�x˨�6jcJbQ����,����Q]wR��]��04��<�|Q� ��0�R�����	��f&�]�>�Ce!,��,EF�êγҗ�}I�A�}wv���d�#wk,�۾Z��c��v��%)��R&�v�$�m�$�;b\\�I�9G�P`�� T��j�N3�;�z�G���	���S�{>vw�3b=]l��\��m�&y�
���ޝ2zY�ѫ�"�[�S����>
{�lS0P��iPap�]#�HD�ţ^kԻ䖌!�b�6;.��e�,����|�D�2L_�h��ҟ�� �d?q
w�����$���=��S�͇��g��K�ő��=�e�k	�|̀ `\�vE_<�DDr~�Z�1�S�s���I���H��CS*`k�A�;�.RS��ϣ��e��y �����+�:��J䤛�Y���4Q������"�p��[��
[7f1|���K(�n�r{���O��z� ����άDM��t-' TNŕh$d><��m@�r���WN�*z��P�5,(�����"�`�@�L�b5��Wdl?��~k"���*��n��|*h%D�DR͜(Vqn�^������ؾ[��ke���-��Q�]�9wB�BmԴ/�-E�`7M�b��2����Z4Q�#�~�Vqj�A�R��+9@����ш��5�TY|��%��yh^��d[(�;\�s�iۨ�d��=J1� ��p��L���D��XD��[��쥀u�_\t��U�K:MT ����97�j)O���ϛ�?�b��ei�O�꫅����S��=.�Y5,� �g
��x�� �u2� M)�x��)�sM�}b���h���~U���-��$�����yΠP}9�'D���͗G�S��q�	Y��&��=ˡy�i���]3�
�C��K��j,?� �B.5�%���!OZ��Х;˂_�F��>h!>���n�r�Bt�6� ��~怚�ǾPr��̝�oYp�{a������G|�{D��O���oX�����hA`���d1A��W�q!v_�4jC(T#s��z�w�'7�U5�Dª��A��#{zσ8����Y� hNN=4��ʾ�����|Q8$�k4�< ;���ٴ�O��i���z����|���6��.Nz�3c���nL�&5��e�*V�d5jh���sjRk*b���l�^�>�~�?�s%�®�D[��bT̬vaU�:WTꠦ���~@~aeG�0���6]���hH�3j�|��P>�[�>e�9�^��MS�<ZKs�*m#B��U"��K��r���y�@Edr|AJ09��ɱ{K��F-@�O�`��%U��g �݁��`�Wʊ�kVDF��%��)�S+T���0��߂��� �kpJ1�R�Fk1J�*܊�zf�V��aDp� �\���u�9\����C���;����ś��
k�R�U����F�¼��|�'.��.j�V�98��{e!\�6�|Հ��<�Jd��d����irH��*���>���LKݡE*��jw[���r�}�T�µ�����Z��U[����)����3!OL��� Ԕo��"	^�,���9GP���0��@Hi�?���~���f!4�����_�x�o�vd�`t�4���P�MV��ܖM���_����XC,?r�3�U;O�v�:��B(�UU��4��E�����7��'��o'l{������C����`�x�S(.,2�4����� �����>h���[��rD��w�5��ȗPZ��#���e�y���(�����@KwoS?|�'��.�}1���ް���� ����[���e�����������9)1Zͼ�&L�KQ�i�n�s[��;�*���pA��׌h���˘��I��������wg�l�E��vͬ��q]��g�h*����:ۯ,`t����2
@��
4�iQZτ �S�Y���#_Y)�C:�V ,�j��`�P�i�bS,�?��QoUp+;Ь8�W�i�z��eA4��'fjݿr5��#5�5��Q	ع
�);G^�54W��ꆛw;Gv�,w��� �s?X*�5�l��=X��Fߗ���-��|j��|gY��n�}����=>��g�l���s�m�:|�ֵ��S,(�?���ɣ� 4ҶR�60�.C�U���V\"SP��:�S�*��Fa�lݤ��\s$�;���.��Q�F�����	��/z7�uM���Ȯ��*�e�w�ˣHJ���o� �Q��Bv��B���я���G��犻S��f��H������|W�w��>�r����g���L��M7�7B1�3 �]��)n8�~6����'�7�NQ(&w�XO��O��'e��L���h�8� =I�v�9�@a�:?4�P���U�2?������vׁ��#){-A 9���/�6�>����lP���o�8�>������:�@Ѿi�eHH�i��V�2��H������<tc���l��57��t˘��5k~�$���^n�����vV�z��ڡM�]��=����g&-�ԍe=��vM�3��]�����&u���y.P~J��M��J���� ���nir:�S{��m+^��@�
�Q��yY���bꦫ*y�2����h�M��8��`l��l�'�`���m�{�!+�%�Q٥o��P��ԮLm��2���o1����q��b���9,�YD!k��#�cS����IR�-�%��ʩeCz�v����>���
)�io����<a>w �E/�ڠ%�e����;�Q�E��9r�M:�z�J��T�bt�acJ���R�����O>eůý�{q�n?b�8�[��"��ju� Cs�U��3"�	͇�g#�����ζ��2"�����Xr�!'P{�6'���q�Tڱnƞ��7ʍ�v�H�V'�Go�qr�LuY�v;���g�أ��{���y��FDҶ�����aw�H��`�mѮI�Am���ʪ2�d$�l@�a.�/<���V���` �{5��.fx���y<�<�����!WY�T�x�|`U��Plpe�J�    \�|��M�����zF>�}�g �2J`d�PM��w�W<�0���A�ydh˴�u� A<:r �͕AyoO3��Hjd���
�[%���UU$���Q�Y���g�	`��o0�Zl�ѦQ�a[M�)B@5?�����d7b��������A�bO�ZЛ1����b��()V�M�`~M`��h���w�]�4�M-YF(�}����p42C�m>���!��4������'�����"�<��3m�>s�ɉ����j���'�OtmFe��I��|nq7�C������כkNs�zw]��F����ɳ��5���`AYD/�1��=�C3�E
΁1�Q��Į�rA(��J�3%@�.����Q���>�a��[�^���RpQC>��j�|�|����ޚ����)!�Z g���W�-��T���"0��Z?�Y��W�넝Xt�=�D�	�/�[��7E�p�]
Z��e��A��	��~���#ؿ��R�K��i	̣��i�1��c#�� �����y�7w����$���ھ� �)6����5<�o�-�(�A�'�Ԏ�$��$��|�2��nр�Yo�[Bʖ2%�o)�[J �r�n�TXl���g��%�'�����<�\g(@�۱���������7�*O��� �L:�0���vye�*�)Ϭ7�z�>"���Mo9�m�G�Dk�J���i-�.<��i���R�ʂ㨽��u����{����Y���
����[�g����n�K����������%�_+t����2��{�X�-֪�'n���n9*��:3���g�ש���$s ���-�����S��W�{��&�������-���]��g1�7B��+� � ������o���}�W�V��0u�n)�F�H�gz S��-	�%��)���}���n)ń���&joрT�-�������t|>#��{��-Y�u���կ;��R��Jt�.�p 0���?�ާ�g�fi{n�k6|?�ܜ� �|K]�h� �-�C��j���e}���?�z˼@���I�q����Ad�H���+Bo1D|-���.;n�\v�N�~ǖީ9j���n�~t�,��C��ܼ�G21��~=�I@+��3�)�R�Os&���s@��k)�-0HXZ���J�E}J��b�͉@f�Ϻe��^v�����W���R�m���c�D_���ʷ������[q\�(T{�ewJj�ZL)q6�$�"橊�~��?���w<�e]�߮o�$���##��u|�E'�pS�,����f��n��i�7���Ӑ	J7�1���ߧ6+��*<Y�(߽~��[�)Į�N����W�0�$ ��z1w�;���[�P4���OB���Oz/T}`� ��>��p��/r� ��$*������ѷ�~�k7+ܳ:k�z�^d�r�;�)筷�|4�@���8(tOIQ�
~>F���R��%�m��UN[�4ǲQ-��\Tөܲ��M�A���!5�޾ŀ��4�^QY��yK���e�⮃y'��t�%�o�@�|rpD L}��#���P��]��ܺ���<��FQ�3��-�1������[�1��[8������A��o�������W��Om:�!��=ɇ�WJ��/�d�r��G��*�����0=�}���`�;b��'� �-"�ɚ~��S:�����8�)ϱ�� fL�3�ڱ<�]=_�3�B5�+Yv�����0D��1��VY��3�D��7��̤8)���I���$�@*����b�o�d��r|�Aż�	����Kư&�3bT��5�,����v�!E�}���d��S�p:`�%K�WmQ�W����v2��߱��:��Y�l��WL.妬�g2�Ug����Ƞ"��	9��f7ϼ_9�B�O�r���y�LYp�[�q�>�ī�􅷔`�`	���S�U� ��%�g�
�l��w1��gu�!\���p�~�53��a��2�.@"�yx�Rյ��	;�9:���7@;R՛8��$+�N�R?�;���V��,������g4������]n�lљԲG*6�=QWn*��qXQ6����u�����SL�7۱^�S��+,"�4�_�]��T5xf���B����1Y�_�s�7�k���Dͷ�+��o3\O�;َ�����=#���9{&�{��p.6Xݳ��\��|K@���A#���\B�3��DIms]����>oKvG/��چ����[.+���ePX���łZ�͒��
F��Bzr��.Œg��T_{��,B�k,�:�2�2�[�"��.�-�ri+��٘ԍ� ��5
u1��������Y����}�4��_�N���a��v�vz���W�E��D��6�����[D�V��;z�W
1��\�c�����]'�&�j�.X��.KmuJIj���t�&�s�W�-���}xu��|}��<�E�.e6�L���-,v��#e/e7Ӽ�.��)E�-�t�eq��ͼ��"^��2�����å��u1��/��՝���E�
�Ov��y��å���<���po*�����YQ#S
�R���EWbJJC�	ϣ+ ���P�������i������
�
��?Y<=����3���LQX�u��e��3_Du�W�+��,�x�ي���W�e��N:%�@��ޠˀ[
,n�>�X^�� ����g��\�������\��]u��`����G��-\p�B�T�C��y�H��<���J ^���tsi	w�`��I~�(Mi�e���T��&�p�(q)��5�?s��[�W�2�މ���r��;~O�ߒ`H!�9S��8���N���WP<T3s&6;�k([��_����\�f>�9�]����؍������@>|���#����zgq�9�X^`���6)�ʣ��|���{冇$h�1��g��p�:'��0��-oLS2n��[A9A)��̿�$D���,�On��Y	[��)U�kX9_@�^�:}$3���u1����]=s�쮐c3w3[/��T�����@���W�zN2��хɚ�f.�[jX���֒{�8>�-��������x�m�\}���e k�Xg�ݯ{�d+�֨�#V��Ԗ��Any��7cv>.�� C1���t�Kږ��GJ�[
�ɔ�uo!�\����ĐF��?�5跽%r�8yJe���2���kܛ^t�������uP�מ�:З7����v7 ��T�����O��\���^z4K�Lɠ�b_ �F٪����/	[M�6h)��;�s3��34���x�<9��I�2��V,��Q�/����Lu���|Չ|�%�G��᐀�j��ox^������A'I�HB�o(�E��������̳�|�<�CH
����-���2���#�mrA�o�RˡJ�����e�̱�Ͱ ��v ԡ[��/n��|��d┃o��N&��U8!r���lr/�eE��U�>�yf��TS��-Ihe�t2T���Sͷ�:b� J��9�)�Q3�kÐE*Nb����EQ�B��6+�ʩ���qV���_Pf8A��b!�r�FIˀ��4o� ��n!_\�'�?d}��oۋ�˃�j�>_������E��\p`������S�AV���آ��
�<2�o��!���Ɉ�2'��IDk
m��ͽ�ݮ*����g��ӄ8:� 7�a[$a��>�:sc<���1J��eJ����K��(�W��,�q���X��6œ�e��ٰ>_q&������!axm�'�����=�^FSJ�pT5`���Oܑ(5��huiA�|�b�ka9|�����4���	oP�b(��Ez'2�MPє *���|WK)w�����Z�j�ߞ�{�7閯�Z���*�� �q�޺s�Y�Nn�)H\�(تL��V@� \�tQ\k���B���O!(E�b�e��g٘ϛ���Ԗ�Y}��ְ��%Z����1D^F��y�@�v`H�Y,/���e�?o����z�JХ=�A�ÕZd:    ����~|�ҭ�V��W�UWe\[m��W���l�j��%��_ ���0;��V)�+{�`'���6EA?��na?'�<hr@�Tj��jm��#�-�ڠu3����~FL��o\������@h	���h����	z¸r�����k��F��p�J�ʷ������:9�}�s.�|�B��Z_����)�J��>�EE�_n�Qe����j���;e��14u�ÚUZS|הs��&��,�Z��@Հ}>9��*���L=�4-=?����jU�t�v�4�©Eb��V��Wn�g���'�jwt�0�D,a�ܹ��p,��D�Q-@���յ ��7U��J<OӶbk.�yZ�ƞn`(�?f\�ܩ|e���\a�u'̏���t�/_��Ktت_�Q���|�u���E���؂"�}�()���XA�EVȚ[��ف��E�Y�jLk�|n�)AK0VcZSc���~�Uh��ڵ
�s������2�~��\��A[+��1�GI�Jk���Z6�h�) �tK��N�2\?Aw�ώ��4>�%-�5���m���k�X�}�}ƂXl%�5�^a&��<��2��X�E��,�?���SuC�Y�1�g����o�^�:�o�H; W�>k;`QV]>ǫ~����5��C?@K8,R��7����5߽�vz�7�8G�@�fڦd����Դ�����7�mz��������E��]F��o�e��O0���� VKlGf']n� �����<��^��ʹD�Z���ߎ��Z���v	�K��VX�}*��?Q0=��j8-g��F���|z�׋�]3�|�vŵK]F6`Qc��]�@O�|6�״k�ǘڇ�p��]�R�p��&�+LN�OP�T�s٨7�)��i4��@e%������sb��k���Vb��hE��_ߐپ�ER�����(����Q��ޓ�s0 {n�|�QsP�5(τ�m��z���ޮ��ݶ�cQ �Q�n�o�c������E[��r��5 ���lu�o�����U<#
����#���#Q�3��Y\�j�Lj�n�u[��Q�*\������~mP��Q�d��߃�Jr4�������սOd'jT��5�4_s�����|����>w��jS3��o�Q�{�Cy�g���Ś����j7:Ʈ��n_m�Z�.�כ��'��2��[��)F|���j��k7���_�xM����n��+xn�h����UG?��Բ�ݜ�����xo����Ew��Ө�:��[b����o{�X]1Ms��J���2V��|���I����H��{��A.i��T�o@p����O}�k1�=so��' ޱ8n���m����O���њ��J��%��7=������m#	�M_���ҝ7�k�1N>�p!2����u}gd��G� AH[�K;d�u#d���y����{����3�ld���|�a�Q�N-�5*�3��/s��P��Ȑ��^���)�:v�k��t���3���~-ZǀQ��9�p/ްǴՔ�E�<�T*]]�5�����~AV���G��n:�����]Q�1o���� E�k��L�m7�{����jq��~	��{AB��qsz��6ӽ��7�F;:��n��Z�����l��CB�
����%yGu�b��Ϥ[���3�s5�����{3���l�.&-�p{���D���nN8ee�1�Oa�����\���U'��p�E tW�T�(����>z�|���Ӣ�}\�:��qdH�����Y9Vך�5R3�$���.n��;�Lwt���ce��8�txɎ�#�R�q�/D������Kb���`�$�c �	(����J4l�8m�eQ�dl.�8O�k�����*�ALlTL0��l�Q�͹�İbg�%�CL3X�Ѡ��!����O>��C=�~w�K#A#�ZO�j*�Fp�U����.U�v����x������I�e,B<vn��3�<``�ee[������.��mp�Am��~��" F�7� ��Ϳ��C�[ѿؑ8��7� Թ��[�8���ΟCA#�vx>:g<�G3W�6��F�\~�t�����3����`����~�T`AhY���6�kU:g~��#*�g�@��:�G��(�jsʈ��)�����R�|UnDm�ͧ���ú����;$��`�X�-�3*�#���C12V���_���Yn镅�ۍ��UF�3���n�9 �}�E�⠭+nK������3>�ǔ�F��|YY���n_<�g��!����f�̟�F=���@[a@��ߑQe��?`]�}#6�r��%(��K7`)�. i��5�Di< �"LW �|U ��{} �Ss�Sr� �c �H�ġ�!���ǸLz�nIX��.��7p٫GyK�+������V��P�&��[��w�*���؄wD��5c՞!c����@���M)X��>�$rEu��TP�A��ݿ�w�%��kᖨOۂ��T�X��-�b�����ۤ.��i�.�-�C����S�עd8�oY �|<���1��_��_��5nxK����%��q�nA���O�veV�����V#o��;��P�rь�-��}o_!呪��b�n}s�㶝�����3?QA�f�=r��jR�R�Ҹ�-�ܞw�H����j�xn)h�*����7��J��ɱ9V �\8�t��r�q��}�oKx�-N]����.q�B
�B|���6؂ԋ�xB��)�CJ\��Sp�5}��9�lQ߲�oW;U���͢����L�:�?�E�	\܂H4���h��؝�KӔ
�ai�h�/|���7�k�ʽ��82hS�U�dP�MZ\��R�o��a�nnm���[ [��	X�45��ueTt�AYY���j(K�-�y���x:���dpm@���ފYu�q���®��"��
�U.;�t��z��A�/��b��� "��OI�x��4%a�34_�ϊYË8<�=�Ц�;������_�~3��_7�<�D���ǖ@�$�t�z=���P7�yhHwM��ד���)9�Wx�%��ΆB#�w�K�nΏ�2�������y����Fڹ��[�/�[����n9��RKsX����]�"h�n�O�L /�2�[R��B;���!�t?�SJ��cJ4�䬥 Rd��j�����/0�h��8����P���_s��R��ɦ9��Ve�(��_ٷ����D��N����YvK6z��H�7{|�S�[g�)���R�����`N#&�����v��Xs1ς��I��'���s*Qz�n��HX��o�]�C�K.�y�Ұ�ʔ >�#Z.j]��{��R�����R���n���k��Xضт"�]�T��.m��7�!�Y!^�y�[
�?7{j� �Y)
E�r_=f���egs��W��8p��m8a�>/Q�[��T�ow�d@�%V���oxf�:��C{6p2��oD.b�i������gԂ�?c`���=.�1��~*dpKA�Z�=Hox�-+W��q��!�<���P_u�25Zy�I���1�+� ��V��˅���d=��5q5������]�)�,�-���(4}p�H�[.����]0��#d�-9������tM`���YI�%x����qK8�E1�����/.6�0�h��X�-�@�]$�Ń|V:��|�t�p8��f�CͬD�p��Ѧ�hTu�%R��Am��dvm�l��_H�o1$Z���h��uy�A��M���S4M��VH	 [X#Y��/�B���>M�B�W ��E��)���� ���3��x�^A��b�
���u��3_yS �fp|>�
�;V�F����wD5��y��,���au�i߲$6�g4ao+�%�Ժ<5�%�Q[�[�b�n�����F�2�И�q'�u,�[N0�_�ΆX؉�m �T Nu�F!Ĉ9 ��ı��\C8��	Ͷ�'�0�����U�.j�~��6+@����T�XUl�G��-n��ϳ������s*�sQ	���'I\��k�-�a���� ���¬O���\0�{    Nb��*�g�_��4q7(З�k��ݧ �5��1q��FjR��0O�$�S�h��˻���-�_Nj�)T?��� #�+P���z O��;=�ְG��d�ITNw�U�c&����ff��m1h"����v�ď��B�MkhR����U1��r^��)��Y�f4��YH~3J/�$4<��P��0e��<������k�'�\x[�4���9?WD�n��u`ݟ(�뀒}����)K��z߮{Vl���&����U�__ש6���������}c]g ٜ��,�F��E�oQ>�f)q�B��$�f�_'������=�#�Y��!����6=�\^J����|�{5SD$wK���{f��Me]	��x{]	�B#��N��;��]��.�K�gy�'B���u*�~�V���ׂ�2��u�r(<����l|�?3���!��gg�����0v���mDo��/���o��_� b	W�8rЖW߯��5/cM�2�q=���8ݘz�W+�Ƿ^�E� ���E9��39��;����x8ZG�Į-�h3{���
�^�Ѧ��g6*T2m���:�G�n����W�u��vv��j�W���Q�Væ��v���~5]�O>�{�ډJG�p���`�#?�Xڶʦ�AĖ9+nY�����z;T@,�e���x�^PDn��+�<�rAc?���9�gD��t95~�;tUt�]]�,:��$wɌ3T�<��,7.�Ô���-Αݻ�X�E,�ȹ�EǨ�5Hg�-��ģ�i���A���/b.����Z�[
z���k<kZ|2L	�D42��țc��_��)��4��� �[�|/H�k9�����m��у O6W isԀN��Y��K$���38���k<f�^@�g]��eۙ��8(�bwdN��fx�m�����Ѷ-�yQ`U��!�������5�t�r�)��l5�Yi���Ȕ�� `�	�����v��F��L u��s���)n��9hبI�Y�����b�q��
����2�BD�j#�_��Ͱ~��z�C����1}��K"O_��S2�I\�/qCwK),N=q(ޯ������!p�ڜ�ϟً9©�:��7��kU��6��s�-mO���:<03�?vw����C*�@ q�M�G�#�,L�)����E��_�?�_Q!#�O.~!nA�lM��}2���s�W�86���B��]@	�\�RR�Q��<鴥��`PK��)�4�@6�1�+�s�Xd���r�%��/*����=ڙ��.�2���*�[�Og�T��F�������}br"��4t�ݯ\<�}`�P8ۜ�)��"�f�x����p��gbiS��󹣄��2`�����d`O�.�9'q�����B�n����|�?��F~T�4��"��(��6K����������I�����H9�3V�(�0���hw��c��N��ϧXi8�^�PO�Yr�l�W�Y@w��a#?Y��U��/'�XjQ���(j<��vf��c�h�������B��C����i��9"����֒`E��^UV�(�Z��4�>%	�a�r�T�Z,Wr�߲��I������lEH����_0���e�2rs*�1�n	��
2R�����b�%�c�yɻ�z,ߙ�n��6o�`���R�3Y�DU,�����U.n]�ܒ�j��K	ԗ�h�+W�9�1�T�!�E���i�0Dq9�~}s���L[��_�Lɘ�J�Y��7��y�*Nh�p<6{xx�t��R���m`d�o|y����>g����U�Iߙ^�c�ۭ�4�}�U�{�ź{�]n�JJ�x�\(?8��c+��\*�[�+[�����by,���nW�*��w�죸t�Ƌ鐖��)�c�s�����RФ&�TH� 3ѷaf�������Iv1�i�W؀
�ă�<���Vfp�i��[^�J�����K��)�s��r��|��%�+���]��SkW~���0|_-�F�6zU�t�_�� P�n�M���OU��j�N�IE����H�K=���4�3�g�XJ��p�)�����J���'�O��܈z��J<m�QV�N���7��;�Ԛ�a������d���M]��~��c����v�	0R��F����E�4�~Ƽ`%�<_'�{��ƞ5�6mey��n�kQ�6��]T�����y	�7��ts����`�=7�z�T5��������bJ��ln~%蹆ޗ��H��+l%�.�Ɲ�xPTf5sЀC�⛵%�J�`!��e_�b��}"�(�<��S�2�S�E�����lZ?��$n�*�W. �wÿZ5��*>�&=�?����f����(ᙜ�}�%�kn��O����y�Y\���,ʆ�N�;��!Mޟ�44�����6o@B�6�$\���3|]� ��Cv�eJZuE��Xm���4�����|k�y�.H)�?}�����*!ͷ�l�/��~�c�l�r��t�ڃ3�&jE�N)��V8��b����F^��1ۂ�;��a���F��N&Ws=�)%�y������j����t�8��Q��r0&�������wS���h���V~�+� ���3�Gus8��j���d
hI�����y|�}�I�l�!�8�!GQS;�Ry�.T� �݌ٞ�,�)���5aB�"�v-,5ǁ�=X4cYs\�#H}«=4��Ό�k��M��5�5�b�
�#1_���~
/��]�I��FjT�����u�4P���f�ޟ���u�!*�D��A��S�r#�@���OWqƮ�vA|=2��pA��4+�N8��
�8[�Y�Z���%kmZ�yn�[[4���G�NZ���]�Kj���f�kӢ�ং��;������Ċ��藘�v9��#�̪�&"X|�FE��#�p]<��R�4� �g1�f.���n�>��y�*0r{�g:"0���Yֵ��8�{�ʼ�<�}EVOrRL���e]H�9�z�#-N��j~e*��|j-�kD��M�Z.	��QnG��-M�k[�� ѝ� ��KB�_��:&�źk�����ok��̭ϻ�\m��̩ �պ����?i�����}�(%`[�wJ,ۮ���[�ꔂ�i^v��Tk>A�g�qz>�����S �Ai^y�;��k�qnR�j��q"_�tZ�m�-��/7��1Ի��������O�`L��}��#��E*�,n�x@��
�=�m7w�<_�'��1ڵȮ���.ھ9;Q�=/����܃o'��WK?�X|C4:�'  .!�ʃ�V?�1�ru�	n��3��^}�u4Muc�����k�)y��f�S'�5Cvs���k�{�/�A��j1z���ʻzT����~�<_lt��6�ۯ����x�C"��W�'�K�-�0��|�^�&eŁ���u�^�j}���
J�9U��B(rK>o�k���=g��v���Wz����<c��%���)�n���α>O-�2]S��u����+Ge�����];�1�gN�	P��=��' !�"$�)	 ! ��	m������ۮ�j-Z�Z����\�W�Piw��1���ɭ�,张���Ҝ�N�.7ɨ�o�����Ɉy�R����"͹dq�N���\�ѣ% �.���ί��%|�"4	j����2<t�CH����&�4�Δ���̖e�����w�p�؈�%-N�Tg^M���$g��M�$p4�$� zo��5����}�H)0�&O+g<5�"���[�_��������D%d�g�2'�����������DjX���ub����������_�F�$�z�L�%
1oC��
Z��֍-����!:����"^8�� l�&�#7S��Ɉ����E]7⥄�R�����������[eYo�����=���q52IX:�1������,I�-/#��Pl���{u<�����;ݩ�e�mz�uQ�MðN�:(�_y,L!/���eb��;xn�� L �  Ҽp���0e� ś�e��� tL�t�g��M�1:�(�SF.b�8��07c�rc���J6+z#$�9yD����~n�}-���;�5O�~m#�sBs*d"���N�r+��~��8O���R��� �ɘ	��$���m2;6w�h�lUA�i��H@�6*�SFw�R�mL����I햠�v~d���q��dv&e�:׹��!
}�̶;�����2 H߷p��┩�`/��c��*9�C��M��̶;��{GP%�1�����Y">���B���`)� ��k7�\���F���⽟V��s��� d�:_{�Lzg��N���h 6����r:漹۷C��e�+�����H �f���	�&H"�J��R;$^{�/�r��
�M���n�ƍ8$�ۄ��~��F|�7�ɜJ�°��� �7n�*%�Gug��E�����8�aN%�Hc��R�s`J�t�����J�����!A	���6�HIQbX+%�|F���$��Cj��v/TR"����_JL"��R��D��C�؉��:��AK������;�V��_h�"m?i�~��ɹ=_���r�͉7oΫ��Cm���X��~���a�{�B2駩>������!�;TC�T7������|�����'��Y��&�4��z�=r88�}x_�Z�LN�~�����gwo��z��.������v�_?����G����m���\��_/�	)��ʗ�L�G�9���>�?=�� 2�#�      �   q   x�3600�0�¾�/l��|���ދ�vr���8���(�;��:FD(��pr�P��R����kdl�iD�Zc�j���MI2ٌ��I2ق�-IPkh����� Ǩ�q      �   L   x�3560�t�/MO,R��066�u���L��/O-�4�2�+oD@ޘ��	yS�f��	�[��$ oh����� C`Wo      �   @  x�EQ[N�0���R��8�ۻp��J�A%�!��7���4I�0��[�b����̮3xC�*칏�ny�1�N��;|�r�]�mn�Vh�m�����	��a0����(<���iM���w�ҵ�#Z^�ѐ����;���/�T���S��Q5J:��P�Y�7����D+a���G�сfp���i���HH���V�ȵbԠ~G���F���`����^��B#G��J���wڅ�X
�2�i-�"V��C1:g����^�ı�����ɿS���/�ڣJ�U��,5�,a1q�$ұQ���g�b���%BsD���Z�1�      �   E   x�370�tV042Pps�Sp160�4�2�.a�K���	.	S\f�$�qIX����%ah����� Y�3�      �   I   x�3�4730�t�twt�qUpQ0406P�w�4�2�-i�O���	>IS|�f�$��IZ����'ih����� Z<q      �      x���[�,���y�k{":^�F�\�F�mH�����('�R|x����IQ��D���\����������o�������������?�����������?�����v��}����^���ۿ������������������`��-�S�K���������O��������K�����S.�/�}��_���?���|�w�����~��o��n�h	(Z��-�h�������4���o%�`�hy=����җ�*�*�d��,{Y�n���]����t�qN7Tb��o�mz�V6���yb|+Q����s��l'r�Čw��9�5�8$�-�C��ILA�:|M�統�J�2�S�cݾ5���+_g3��S�|��~�ђZ~J�V���j&Ln���/��V�"�q�1�r�ݯ�P�ْ�f)
��K�*3��zJ�m���P��$Vj�����6��9~\�K�B-P�3�/Ђ��}ۍ6��!��{�	���n���(�ӡU�-|�g����y}���o&�c�؞.��?�ߒ3�};�O;X���y��q����|W��x<x��S���#n�ܐ=�"�,$9���)�&�}ѝr������#�B��»�vn7��괁�3���ے�s�����7<�}4y�@��w`ǽo�;�7��'��.:ߪ]r?�d�@�ȶ>�D>o�d��;�n�����J9h����>	E�Ֆ����!��mm����{>}�|A_Q����~Zd?y���-�w�#t�����7��K~�r{�}���p̰Pz���sܳk�8�\�{�^��V\2���lx:���c�������O�5)���[��V����Z�\���{�Ղ�Z�v��r�y��?�}��*l|��������������H�p?�n��s��:�^�zK/v�����=��k�������{���$'z8O�v�{�l|����>���c�q���H��[����{�2�h�S=���#rIW�:]�=e� �3E�����l��d���m�ys�o���Dv���d��M�����X���IT�qH�^�=�#_J��*p���t29{�A��cFo�:)�
/�)ycg�㟼����×����oe�+�{�K� ��'%��|�(oN�����);{���]6������gW������f��M�mQ���t���s9�v�K�(��Rdg}���=�	_��s�; �nE��j丝���{{m<?��|�ؼ�m#=�{P
:�Rk�{Sj�'�{�������Kͷ1����a���P�ӥ-zV�&����g��h����|�8�`�������xxq9�F��	ۭP��sA?�ĺ\����	�;F�*P���W��B�~. %Z�����M��4��e�[�۟�2w�U���{�	�:�7�)�r[YO��Z���i�x�\vNĉ��g/��8'�,��>W�T�<����࡫zi�����A� ����c���"�Q1�����輏|�#�ث�\RU����<������mv��-4slH'K�$^E�s��|c!��o���)�{'��/��M~M�z���#��9�z� ����R��G�F��K�v^�����al��9C��0�b�6hWK������lgU��eo_��|M�l!ޫ��E<�>=p [��fֹ�5�ݏ�S�!$廓��C���-Qp��3`lΚ��Ý7_ {�3��ދ|�3��a|R�|��$i�pe,����р�|;#gU���|;�[߻nN΋���ȑ�f~/�БS�חy��G�����኱%���Nd���p@�'�p���&p�\�'��{��Nl��Hf'���2;yF::�I7�s�0S6��Q�A�?���0Z����c�Xԅ���|/�r��|�<$�H�
WQx��K����.����
�&H������=����|�5�3�M���o+%9-�L�Q�~��2[s"���=-�8��wT����G+k�|s���&��$0�� �Wu�i�:�Ùn��mF�7���Tٱ��<����f�h$���רkn�;����j���� ��1W��N_ʖ�=9	�?9��9e��`��8�����p~���H��o��t�>����62z�댈?��M�������𝋝h��g*�X#��p��T8X����@U�y8�����I�m����&�!�"��c��gч*��a5B�[��]vB��"����[�|�^Q�֯i���A��h�,N��^�c���B,Xe���b�r�̀�0�ԮAҴ�ϔ:���Mau�
�iX���f�������9��:Z�9Ws(���L��]�tj��3��yE�����j:���W;�.���`եKg�b�N�Sl���K��>"��L7��!^n��W�2�^����o"�T��.�a��V~��痏���O����
�=)\/NV��M6|�^���1K�ސuhَ�	�I����TEe������;�X�����K瀅�PA �Hey1r���"�د�H�`�o'�\��W�����۹����W-=�wL}|E�2Q|�xrU��ϯ�S';�m�q��L__j&�������}O���NZ��2'҃	���c˲v	��j����@X��?�\K��V�+x��*_Ϯ�^̗�$Lr��y�`��2����3�6� ��_~���W7{�{���S���Yڿ�Yh�Ң�쯏�:;T=B[]L��4�pO���A� l_&������8?KU�w�͐x"��	7�l#��K�v�R�G����oW���]��v!����������)��}�;��n<�U:I�8[�ى�M]#�k7�,� ���ܜk�U!ѧ�5�	��Sr�AƈoZ�1���y;�LeK�'J՞��^`Kj]�����p��k�q�����D���w�2h�,��b�	"�� [oЉ���)I���>��%�9YW��D�C��3�m�O΢2��o%�e�
����k$l�9�3;�+�^pxZQe�;����ktj��Ug��'`���6��%�9vk���c�F#gD.�r.�!/gk���#��xP�G���Jȩֺ��i4!�c��"�~��F�Ѧ�k�Rg���|ϫ)~���M��4VZ����~������rL�l�/��_�hNZ���S��%7B���H��]Ҿ���]�������V%�#����b����}�2+�����g_
=�w�z #U��2��qB7�S���IXE`$�؄1�,M\r����c���ٕ�e�z�%�w/?l���O��]��X#;���ͮ�H��&��K	�
�,�� E/��(sfx0}���K����j]C����zu�8�����g�q�F�lz�yv�Q��)v�[�j�@.��ߏ� �1h���^KU����D��6g�\�
ԭ�ar$t�~,�)A�g�~"����7����>��rj=�N�G�5t\��b�,7./��k�������q��kW��M#;�W(�c�)[fC�'�����%R�`�NZ�����=B�g2��y���5N!����g��ܷ�ԁ�ЖQ8���q��x��X�:a���>���C���gp<�=a�f�<�#�<�ƎCB�����|~�s �h�%���.C�rMK]'D�[�p�������TB�{�ҪM#�1�O�nNm^3߽*O����3|8o��w�>�t�Yq�m�r���5��䫍�}�_0)jpf��s����?]�0�t���y�ܿ������ň��#P��� ��"��,�!��9b�6�u�þ��	�5�'2�C:��Ƶ�ӄ���ƒ�f��p_�̨�g�?�$�wR���	������_��������A��"� @'�ޫΉ��26/�$� zH��	O&�n,%��	/�Əc�m�=��]���]���a�!���Q����!�,��+�Mp����U^J����M�e8L<z�p9|���D��^sT�-pII1a��6��L�j�pr�ԾV�?����ׁV�j`����-��Q=�flm�ZN�b�,�}y�v�j�-��^��|*�Wk��n���6�&���Q��G��x�    q�0��Rf�uT�N�܎���1�<N��_��_UɐY{"q��㛄*"���+v��//1�{��N���>p_�s��I�T���Ӭe`m���i����|/>�89�k��'�(2f�;�Q�7+6�&�I�f�E�����R��|�zӫ��C�T������'��st���~��G�����&�=�X@��bi��� >��]B��o��ފ��	۷]�`p��r� u�hg!Y8��Y6�(�tq�,���,�Oq�6�x�A[�!~��w��y�$0����6��Z
W��,И�i�H���j����|}j,sy6@q���w5K�e1��\+X�������[���ݼ���c	)��ɏ��^"�6N����@���l��4�=#�K)�F~���<eg��1��UE����&4��]�,�s����o��%���h������������O$Kx��c�[��sc�������/�cw��0/�R(E��&<V~q6�����Y���Qt(�z��Ԯ���?�4��?p�Z�?��-J?�DBqz�Ē������.ž&8���b��F��u���{��Z��u��TB�[�L��.S�c<������cZҩ�U�o�C�1W�"��3��n�,�m�,�S4i�ij�W���'4Df<�d�	��+Iȭ�%0����KL�w^7S���l߾�=REh�a�M3O���d�	!o�����@^L1�@�ͯ�4��m�Ӟ���l�|<�w�Ix.H��1�s�����ߞ-HU=��^�+�?� j��F����P�_�'c�K���'��<�	�}g�f��޲�)�qH���$H����5��+}.x,9�lz㇅'��+���O��/�2�M3i=�+���4�~�M�B�9����dVqv�Q<㏉h^ەQ�Pv-��*Uz�I}6���o?�O�z��7�J��U�zS�(5Rm�c/7O��L�o/���o?�6����s*��t�y�x��v���S�I� 8��MH����fv@r�W0>�?����P$�˸*Y����z�����3pY6wا3f��8���F��؍���H��>��}�W,�}6���&8��/'��{U�+���/�KS�i�X��;D�y��ե��D�[;��չ㺣��ol�Ϸ�ϫ� #۝~��	2�*�3�]��/�9��7��`�������<<�D�����p��㉙*^��5��?f5�p�Mx(>6g�����τӧV����3k#��A�u�Y4����4A��hf, AT�z
ߝt���e�n ��}�'6���긕����\>1^�L�?(j�
+��d�Ec�%�!Yh��b�K�A"&U۴C4�K>�\uc���:�;>��:��-���.�t����ӤR�'F�5�b�w��6�<8�+�+Ͻ��O�q�N|�u�=��V&V�bI�y�Ҥ��+��Q�oj٥\,+ou�\��X��W�x��\��{͕�K'5��C��y-
�� ���d��`��ρ���@%a�kU&�[����kڒ�KY�<1��� �"9���.���钜a��$I�j�LS_�����i���9K�6`�EZ1c�}G��ǳ�����S��'�;*�p�7��J����fVWx�R�!<�l����U,�_�p)�̨4V�Q��\m��� z�/n2��"�_��5c'�`�p�>���f��cde�L4;�-�G�=��#H�gVw������!J���H�=.�������'`V�޷~���kϪcl���iy�[o��Ϩ�j �Ar��-:3V)]ë7��&0�N5	���0��)�JRxЗ^��xM�Z�~f�l�Hһlv~��V6,S+hZ�Z�ѽ@�)�Ģc�C�oU��b�P\:\��2s��.���5]=�����4�V��L^���e�hL[!6w���K�s�|��_�ς�$��9��)��������wЊ���_��d�z�l�Pz����l��$? 	�E��*�E���tm,2_���?���]1�����v�|��� ��:f�|[�71����j$�����h2x�����M$)t%�|[*���ٖҀ��G$��] �H�RÄo�$�h�[�s�[�&6���!+h3L�<ޮض�n<��v�~�6[T���.�x�J�^�&����l�R�*>�!߼<�{�ͭ�P0h�JOYe~�H���E�ǉ�ڦ�ë�h���azX���ʚ.�d���'MP2���lg�s�2��?�\<�=�4�[���H�L+��&��R���d� vURЪ28�G��Tԩ!��Va���W��NH��n�s����p��4о5h�x���	Ik�X����vE��V�9�!:�F5���%i�(K�sffi�"*�����z�Q�6���r����{�x7��iV�)���F�}[�hN�Ԣ��6(OJ��CFhvt�;i�V�N��?
�?A��+yүa]�"����1������}����4�&���q]��y�.��3	���v�/FO1�Оb�z�� ����{�/�:�xcvL'���G���J��c��=I/=�������o���2!�>`��89�bv���wD+8P���1G���=�D�F�2�3sI�|��bv�]~��$)��b���ݨ�}�Q5�ĉ����'Ď|���wX�l��sj����C��R�^q5�^�J%��"����b��6('�k��}��Jq���(
E3��;�v:9�w6J@��A��Ҡ� �ZG#�$��]_%�=�{�Q;����6�+I��l��5�8�CD�x8�s_]���>b��
8�?���v�f��HV�6�W�h2�p=�F\�l�븣��qǪj�znE�U�>��u2�����B�_8��B�h$~�]�L�E��~����B����ύo���x@țh���<���� �_�MP���Bx����ٱ��J�P�����>r$Yn����h2������S�T��j?���ڿ�O�ۅ� �k+�{M2K�?�����ntF/�p3�)�L@;*O�Q�b��NQ&;+�+]�.wf�7t����Y�k�P�/��Z��*�b�qU��퇛�h��!���PSn�wX�qi*�m�5��EçXA�j�9B���ͩ)�9�Og��\b����ϖ����6X�M.��p�����Bl�;�`�EmT�W5�y%�	���
�O+���6�ҍs8D��WNT���Z��.'�y3	�Ga�g�]�!���$�.N/���x�i�����9m���>�r�f[���S�,�/�>(3{N��M킏Ѣx	�O|,�}6��g��s 3�)�����,iz���&4B�;�4<cBc��f��i���gb�{���r;��B񱀾ـ�~�����i�x����Px��LEbn"]^�_{(��S,s��S�Z�׸��؇�a?٬�O��!T��B�b�"-*��qImpN|���}9���Is_�����`)"�S&��/~�hy&���'��ξzD���f�-��R��Zgl�EEnS�a�C^�v�X�d�Sl����`\�hL�<��\��i��dByj�9&��V�ɉje���f�K���'BS7�0�ET��oL͢���/�c�8]O�
3I�|J�#ݥE�T��7=J�~R�t����x]T��,��HR��@~1Iu�o��_C�*&>�4&rB�Jn��Y�!�?�-�x��-��r5_}bv�A�-��>Q�*�hbt/͌Qǹ�{N)0s���b��n��r۱�"��N�.��nZ� �d1Ѵ�焞W�U$�ľ�1y�%;<������K�6z
]��!�,�Y�����&7�9���p��8�!�N��3v�%零7p�:�X���0_������J�lr*���i��{��2'�k���Aa�b�-�,��U�Y{����9��*%ޙP��\��=�YEr4�g6�����!s�N��צ=�9�1�أ��� S��̈��pV����3/�K����Ǌ��_$󸄘���'�֟[�W�_�=��6qB�&���:`O    E�a�ܺ��f�fo�55�("������"_j�U���h����o�=Dj6���
���$՛-���Ƶ*�-���F������!�4S�c1�%2�]�U�?�'4���	AD��T��
�M<t�xHf�p�>� ˚3�S�k���(D���{�?w��}6�1�	ҵeDO�̼��Ooρz�1����h^�d�#\s�?wO"��*��9c�/ ��1��(��,-����0�Wo�17����	�PФ'�W	��w�����pB������;T�u�ᓚjS��j� 7��Tt�����le�9/ܧϐ1?\��J�4�X%�ո�\�e:R�M���D��>6Q�H*6r�4�!�0@U��@��j�;sךҟ��;����g�f胷ή�zy�y゜x��)��rzF���P��*0��i�<��3����I���Vh�^�9D�8�P&��c�H_ߖ�3�T��xK�w�q=ߐ�zY�^�$����E�z��K&�xKO�_�O��W��-~�&�u��+��_�zj�;L����|��M�̄�
i2Dn��m��̢Kx�C�m����hz�q0���H�� (�N��P�|
��k9K�OT~v!����=�f?�u%?���,8/T�^λ��=H��ru��F���`$#�cD���N!���Ne4��n4�x��Ln�~�"��,�B%GB�r#òfH�P�얥��y�Yه3ʾ��_qX�ҍ^�0���$���N��9~��N^<�����ȝP�ȃn�b��gH��Ŷ�%����v	����Pt[9�~M�2�,����-���ZDñ�MV��x�*�#K���"d}�82w���V�a�m�������:�����������L4y�(�%~m�?���~~�����`?�uv��F���/'�v���|������6�I�̳�Je���J=���4�������ʍ��NԊ~�4�YR��Q�֩���$��E��/��l�͋���~*�e��;�Y��w�W�P��T:
J[v�\kv"�t�1����.��C�؝{�K�!�*�qY�Q�u���3�X��_����fl�L�*��s��B�I��H�!yKru�5[���v��9�{>{[�Ջ����E�Ru}T�kRo'"�{����v�=������y<'8Ɵ�j:��v|0 ���"E�fM��]�(�6<e�����m�y��Ff��2}(#�L��c�1�_S��hj>�q�y���m��0H���\ysߚ�q۪��v�}�A��Q��9\x�n��8�L_b,����;��M���f���R����^����tϠf���ƚ5�ZS!����pL�-�Wjغa������Wq�M����e�8�_��L+�z�Jr>�Vн�nG��c�ٞ�(��ʻ��x9�IF��D$�@����b�ֹa�>��ʤN���i�xr}��9�&+�MEEӨ4��8(��y?��o���{z5��$�|��6 \�W��)z'Z�M̒��,�D��pL�$�PzrK$^�~�`IvJ/���q�[�<��8��]��唪{Qm�&[��b2D��u6=��fA8��Mr�u�y�*��3;���(�y+~,�"�mٯ@� �������f�<���9�mV�UrUoZ�xB#K��}��ׂTC�׳�XN�x��W:$�@�
F�qkt\�;D�8^<��h==�E����2���Ϫ�U�~��#��=�8	_S(`c��
�x����Z�hQ�1N�~�_V�~�e���/�h\�vbA@���}�7���X�
��i��������fH�c�"�)��i�b�����i&H�	�=ќ�0�M�9:
��N�`�R�EvhX��������,��q֒�@�E�?�j|ιK�#m~H��t�8S�cZ=�`F.F����K,�/��d�2�*�X�~�v���L��,��h6�B)�E����{�D�>u�f�qFb���Kk�Y�O�����(�FT��BR�T�ϩrY���a����)Z*>��p`�R�������3���2s������f<��Ų�#oO������ �n���k�l�ce+:��-#�M�F���v������tub����k&�w����i�s��K�S��{|�W��(3.�����[���KErO��9t$����`M���s��p3Ri�H�m�
|����4+�a�hFo|b�����`)�<�B:��̪}*&�b�IU�e/^�bE�G���҅�� VMv@=�)��kf�u��HQ�@���9�����j��yl�4�deVv������q���4����2�1��?�ٻ ׫H���(�t�Q~�����(<�bxŹ�^��J�
u�f��P ���E�q����E複w��v����L�ƃ�F�r]2�ݎ=�2 ?�"UWW{�,��<�jt�A��\�Ŧ��;��2H�W�R�AN�1�[�vW0�<Wy����ؐ	��<���I�?t�{��X�T�����H��s;�z3R�۔����D�	��xQ�����t�9�m�HZzBa�D�d�C��d��:~.{�6IS ��X�b�������M@Ā*���&��>���SfZ(cBc�f��7v68�s�x?S�Յ�^0~?��<8��J�����̰K(�('�ۀ2۪F���	���UcuWg��{��&�Em�	[4�Z�� �T[c�,��\-�>�ŉG2�VD��ɫ�p������h֖�h�+/9���
>���;l"#�&���HI���f�2�ENf'�d�'�C����b��@�ϋ��7(�,���-Y,�P.'p�$~G<�~�����v|��h��� �9ŦH-�	�>)T5���&v�|!��O|�s6���f&n
��>7�
�A}"�'���k�H��s;l�ߣ;�"u�����G2y&�'W�,�L�|��:�RbBO�>m
����ֱ�Ј?}�aҹ���^u�ơ�~��G��~��S�s�lӆ���$�YdG��<�W�N�C���k�C�o>n�';D=B�8�����I��v6�?� �/���kg#e�&<�5���#��P@��2P���eb��:�W)���t�O��K3]x��^���Nh$m����S�I�_�x���D#O���=��)��+�{�!��{-��\_7�γ����4o\�ob#R'�^�C�)�������o����sl����}��ؖ�D�)�3M�{�bfk��uLuϸ"���d�5�2L\W��fʡ:�}R	��O��b�SbEf�6;���˘�)�d�HCRd�	��1㳉� 9QX=�4ǳEl{����G7�b=�8azi�X0�ڻ���L<(�#���Fh�����H�	1jM|�:�ă?/6@|6Ѵ�ѓ��|f�|�;�R<ԧ5����B�ɋ�锟y�\x���\�\������t���X��\0�PU��saʌ�8�unx^W8��H\ db#������HOA����_�I��I�!edh%��t��l~~5�~���MK�jh��Qm�hݒ�"�(7����@�L/I��/0̬��9��@�a�b��e�"�~VU@�?�.���eWUَ�4ݴԈ���ң�W%�e�:�SZ������Sb	O�S|��t3��o�5�1[�\_b�꽈o���Y�|	�oo���!��q��&�����n���tB|t��u�ҐlA�S�[s{�:c�~Yxz�=i��ԣ�_9X�Z�x�5wp�l�;,�Ɯ���P]�3�9����M�G��}4��/.H� 5��<��|��ߕe�(�d��`S���}��O��f�w�]�� ���|3JZ��+�q���7�Q�Ų�E�Sl��^��nʄ��5R?3��Wu���T~��~��A3��m�=�(I�G��&<HL6/28�5��Sm�^��ќ���sȜ���:ݵb��ќ~�r���js�Ԕ1�[jʬ����n�A4$3sn=���Z��9l�;�UW���Gє�SlRC�J�!0��1JiE���̢�T���g_��^l�;7L���~    �M����h�0Ǚ��l$3��ږ��b`���0ᡸ�<�O���˽Y�#R�z�}*%�\� ��oC�Iy���_�UJ�)N!�o�?�jcV.h��Ɩ;�U����KG����s���{t�#�<NcX�`����3@I�˴��)p�-	��R��`��BQ%9���8������"s��������w�r*Fe����5἖���
(N4��|J��'5i�&��_�2�h��cU8-Ϡk"�s�'Ta�)��U����6T�b��@�H)�])�B�S1�۴���Rc��%�_>�`Kye���b?\SXfI�\,�����#"�Cg������=��d�Wv�]�f=4��?$�t��Sk�tԯ=�G���!�sr"m(�;�0����w�ߖ� ��L ����A;?"u�&�ak1�됢eF�k�jW�
�z��r�E* �[ƨ'��m'���Z��W���DG�L8�8=��zj�Nth��7%�{���/��*V\ Y���'��ֻPLKMph�@�����cui��I$>ZD�l�z���� U�Q��%�T6l��;����R�aq�5��#ҵ� vT�N��� PV�H��fƔ���ct`��Pg,�Pn�y��	ƥt'�.�%�pZ�����_��w�[��(}�]�2��2�ۊ� pY�XY��~>����`�@o�x���D��;Xub9��FI�'�e-�06�(����\-ޘ_8t����c)F�
:��S����O�������Am�����c@3�G�ƶTiO�K����bG�hf���g�#����v�;�z����l&l���~`��@�K���G��%�Tv�ֻݡSiD{����G,�B~��L6�L�=�v�l)��Z�>��D�ft�<����0��� �J�N����1��*��*����M�|�}��?Ԉ�7 �"p�;��pI)��m���k�¹ϡ�$�zXBŞ'>���bd��#4F��S�`"���Tp�j�7+<��tPnX���^� ��k�X�Kk����]�5^*����tS!��w.JVoD,��)[���K�h��4*^��Q�o�[�� gsIm�i9�	�π�#L�w�X>�ʤ�F�1:����6�T��ppG��<��Ӡ�տ?��po3C�/j�~�t�u�����k�}-Q�>lǛΐ�]�q3���coW������Ħ�����S������{b��M��ZT>��)>�H�ݪ�[�q�m�:�'3��+��C��8�L���������|����T����?(A�#U8���<�P�cnri�f�-�)�*�P+�PZ�Z�~̘"�;�[�ψ��[s/�SY�:R�N��d/d���7�l֬����!+-�*���L�~��]7p��� �kG�!?��SŖ-�d��fY7�h�n�27,f��>�z?�:�^W�!f�#{��|D�VQwN=Fy�$���P�˪8�I�������j�z������'rN������%��ž�A���Vf\�:-�m�����׮�
�w�q����é��'gܜW|b4�Tz���
�;Xe8���z��BHgq��W�M�� ��� �W�A���0�x��sóxd�nơ�e����޲<�WwΕ�6a�&�Mh��2
ͼ���T���4v̜'jd>2~�^�a��O�l����D�To�Ǔ��%��0J�^���R�}A�:�QI⏚�p�3}t*"�At$kvTF.�h�S0�k{e��hp��eZl�:��	�
*��(����Ӏ(Bk�;�"�;���S����X�_�@:8b�����m�9p��q�z1���lׂf`��d�9��_��u�'�5AfX^b"#��'��S�1��R�c&�X9Fèl1�M���wh��xXE��j�RL<L=�o��!�h�x۷IK�P�����3�D���#L��~�>��|(�ڧ�t!���Ѓ�������nM8�ȇ�����#}�x�(zdz��E�c�h���ؐt�a��C��O�ĴA����B�&��3+��Ѷ]d�32�<��m<��X����b���EK+���qo��4XjBYr���5�B���PJL����<�rX,�%\���|o}��7*��]{8�$��/Ȅ���KBym�bT8����Pp��Wxb��8�K3U`Z����O��]^�'_��F�ʈ�T��uh�}J<�$�z3:�4�o�}S=gZ�wY�"�*'�"~,x_�N�t�<41tBC��۫|n��1����~&�>_,}k|�̍�j�*����\�o��lR�Ώ��W�;Q>?�`bo�/���[m`h�+���-h��	��*�e~5�}I_ ������G�]&��~��	���j�,H��9��d�)ԋ4؇�@sc�G�g'�yup����F7h�z��S�d0���ο㐖���k�BC�G{Y�`e;� �Vt�b��kt0��&�Y?����e����+Z���FG�:-.=[�@����+�'�)Y�l�fOd$o�cǶInʷG)�M�S]�݀�R�O(,?�8#Ou��_��ϷJ����{@�U��%��8�N�u6p����ɴ�!j��wrH-��.t:��~��k+�z��i��~�ْN7p;���_��ֿ���7���BU�V���ӻ*!؉�a�b� �7�}��sx�d^6�1!�l�P���4����tE5���؝��E:���y���f�`M��?#$��jz�c����~��0��t7G^��?�S��r_���[��J�˿������}������ٝ �}�s�ƛ�y�������P�b�5��©��N�p�N>����ـq��Ia�OsAz���"-T<y���SUw�Z�fU#a�ڸ���B"��~.:8��Ƈ��mv�L�Wx�!4�؇���+3�r(����q�?9�P�ǉuD�sD�C`��<����+���Y�� BQ���Vnx��~���L��b�X6�*Zå�����Bi)L0������{�K��ꂚ�4aT�o[���[� �^,y�<�e�;�"- E��r~+��Y���C�zR{'7��C)����o�1\������j?��\t	�)��.���B�p�A\½+�����qu�L�ܚ��FT�&Ú��{ly�G�f&��rk;[���x+b4��%��P��L�J\�xHO��2���@��sH�5��ҏ�j3h_��f��hu��)VCT��=[��b1_���G�d�#$bm�@�MLKSE@W�Rg��Q0��a���?Z�@t�ʫ��Z�h�V�>������P"S��m��z7Q����]�H�	w&�f� <�ɽ��g�|��5��+5_��i���0������
��N���1�]n���É�4����������I�]F�pq�6)��ͬW۟�x�	�0�3���5����*>v;�O��p�a��k�S���L����2a��3�N���ʶL,|,{����D�SN�6��÷E�ac6����i�E�j����,�l�(�m��UP��?T�4�d�K�+2�����Խ����M�-��1�#t5s�]������j�?�˧PO3\�ե;ykf��\-��;M0#U���+���$�՜���ƻ�u����b5f���3@>�Z'Z.�[,������Sq�D�gp��g��W.J�"�An�BR�"���S��P��+��l���i��OI��������#�*	�m��'L(�>���}K��	`2s����2Jnx��'X�f���`%VEr�s#t�KD/��Ge��eJvF�-b��%��:񰄍t���t��)- ?�U��?^f�{�f�q�[�p�o{�9_J���2��t{��}�m �>���p�7�gp�Q%�_j��wz^�Bx4\��-�0P�/���&���7ѐ�VF�+иY���X�/$��R�X�H�d��éU�^��/����Ř�w�
�f�@������+Y����.ZO�&��y����WoxU8a ]��y-�	�r-�;�,]�C��Y<5!��懔0;m��=���    T<�����M��HY�\�$Z<��nF_�	&J?��k=��HFZ>SE���ME��s�V���jT:�hh�Jw�b��������c�cE��?��l�+WK�g�B����Lp�Tq��Yҕr����rmǥ��\с� W�'dې��s/��LX/��.�M��I���$�TQ���B��M.��Q�?�yة��v���镛7���b��k����fĶ�T�cbi1���]4+O�hh%�p
`��oEj��g�R�h�.�$���$0ح�]���aFM������1ΎPs	=�7��nx
�U���#$��գh7�&+>TRj�)%s2����,�-��ЭF�N~,�"#�(Z�=�7P`B�`��c�����"ޫIaz������G�Ș�Q��u��6|�&Qx �MZ`��X�P�X0�b<��l�����,Mf��a6sϭhp9<Ț1,�i��ofD�@��˷��5� ��9��J���^�`ي�+t�(�S����C�t3��f�?;ޟ��.���N G�5J�#��j��ir�t��B�-*������P��眎˒=���F$r��!���@<tbɁ?d#�!24���������6�!E�D�~���k������j��wB��h�7|^_�܇�n��~��n�|�KFP�C?���3���nO0tF�� Ӱh������t��F>ᨂ��ޡ�L�R�+<�$�y�u����%mF\�C��"����mG΀D^�`5�Up�3�{TF����8_y������*]�N23�.%�ݍ\�����R��g�p�m���
Ǵ�b����w����,�R�NN�������Y�;d��vp=Yh4�����O8�/Z��zn�}�:���"rj�Yx�%�t��;�Wz,ݸ���1a�>�W�q�x|S���[[z8w�G�@������'�3h��p����=⻟�u�Y�a�Iƍ���M�-�(7%UV��U$.�-�H��q�4}��K�kq������.'��@�gu	di��Dro��a /�+��M�`)�ٞs2�=�H�l�^��zY_�0�]��G\�w6:22����2(�*�R�#����R�_4}se`��O~�]��,�4(�N�z��گ� ��(�a���1�6{+�lهz����x�e���2@��V����4�Q�݂�(�@�gUǁ��K�ea�.�L��g�Dog�Lu�f���*9�?\z��~��1�����[����D�������%[����q�N�e�LU�V��|*��P평絮&���&���5�&4p@��ߏSVn��\��C�Z4N?�J�BE��J����|w��P
�ry��H&���� �\�
�yT���B=�s#�	1*L<�����O����t]�M`ƨhAj���1�H�r |c��wfi�~nk/qS<5?�z���&��T���h�H4�t��l3���<amQ���������j��A���J]o�����W�w��	r[���_f�)B�b�JTU��jf�Kh��a�U��쵫�����~ّj��ق����X:Vo�ئ����׉�ǯk�z�I;�4�Y�^a�}�x����6��&���Ѵޣ�ǉn� �FK�;�8��w_��fB!��D�j��P�̉��ޱЎ���W~��b�}R��o�@�R��C̀��Z`�rRÌ)�Q�O�aVt$�b��K5	e�N|��j�zqW�_�NUqc͎�DH<'<��?�����M~�uRŒى���KH���%:jmK�G5������+w	��L|ȋ8񿟬�/E�@��؃��r� 4S؋G4�gw���Gh�{�ž&3z�hZTa����(ѧ9����{��B�F���[϶�Z�3��J�	�زC�dѻ�R��3�&8��u�*y��]�Y�1�1�`�[��qn�%;����t����hX\�U��t��_�TO^>�w7�u�:NFZ3�3�邕 &��w�&�n͇�k��M]K>.�x����Pᐉ'��i�vy��Ȫ��R(�{�#��&�1��2�-:%���#�%=��m���T>t}�hd�W�y;�����������4�cj&�����I�2�1��4U߯��B��'4�YYR�*�l����-B9~�CO&8��9ᱳNr�JFz=OH;�(�JE{�'��a�]�+ѿ�S���:׋�+}KR����]4j��̲'vV��P1��w�U��B1�%��#��ee�d�o��wb�7�a"ai�W2$9�H|��(ۍ�#��2�3Ҁ�j��+����4��̈��'r�����@��=���{RV�7��� �	�g���Ռ1��� sЊAb�s����;������5*���A�HL���L&�o���{�6�c��'�Gl�!�W������S8�4�Q�ҿ/>�;ѐrp"���UV�H�N���M�]F(
e�Խ��^����[��q�[8d�Z��+��
�~�,5��GO��^B.���t�}���O$�9�Hg�����|��2bU���-"Y��i�� ��(����M�����^٘�m�¡��v2r��l7�;�� B���N~��ތ��G����X}D��M8��(4���Oi�-�N�����}o����]�g����9����pzɜvB$〺|�]7�4�g���i�'E3/;�Q�q���	��F	G2��3�j�.�����\]�G�k�{�o㚰'�U�ի�d\^�<�J��E�ܝ��&�)/�+����⧖ʠ�1|V��	�&?{�Q0�્_Q�R��dZF�:���\I�Մ��Z%�֔OT���P�j�j����T�jЋ�+��_�xE���~������K5a\ro!;�Su^��|��cx>esYh8�-7����aq?1����T�^���Nǎ�|p�b)vnȇ3��\ 3���d1�˂����Ä�O�G�r*&l�]"�o+RdJ��Զ6)':;Uˁ��L��/Ej��)�s���x6��,���w(7�eQ<�hWm@����9�7K�ز.	n�b/SȬ�c��d�MhL���A�~x]���q��f��K�Q;T�i׆��5K${��L�L���8�3@�^|���9t�*%�79�+�~��g����^��z,�Y�饸��׺�ٻԩ<i��
$��!��*���3Li_i8���������W~���p;���n�g���K��t�Z���-��_�E%#:5�����Ξh'��A��@_gv�M���3�����mk�*=�p�o5�R~��ǳ���+�SX�X�a�b���Qh0K�^0�P�n��g�+&�[:��NA��w�V���ē���/��5���~p��S<m�d��<:c��O�j,Q?�E���Rߋd3��+���C#D�Oau���� ;R|�T5b�LKzLh�[���s�{M���׌�2Z���%
yL�>%�LVK��v�+�r��0�X�{ȴ�49WD7���ɭ�JoK�Kr��>Q�x�����;j�X@|���@���*�(4��R�<�^Z���U�����#��&<��Z�M�f��f�0/{M�Lp� ?IM2!K���Z&&w�Y�:T�|+lW '�]Aww�ht�G�v��v}�v��rd��~���w��9asV�!j�{a�S]�7EU"@S�%�P{�"�%���k�sV���k<]F;�
���6�<�:C�|�v�?�G�v��6S��L7Q�j����vO�o��m6K�!�\˴~�k�X(p+����j�M487)n�
�O��f�b��e��+��[F[��i�p¹̢��	v��S�������Y�	�����6�Kgߑ�"TCͻ�YH�"=�f�:��о�`f|�ԅ�P<�J�4��O/�ƨ2p\�6���P�լ�A�O���J���˙V���-d�ٯ��s?�J�Oa�B�T���y
��-�ܱoK?���eâЂ�������+�j�5��aE�.���N$.��h����b�@A��\�}Z&����h�*(�_c�k��azhd�j�T�P1���"�y>|^�X����g���w��?��7���"��Ĭ    ��I�AMV�w��0��_+���^U���'��%�V�{�2�w�ڶM��0{�\�#�Q�\Fp��5�ƙ+��b���!^�~п*ˊZ���Ew�"��=�ջwk�ƱG*�􎾆b�PQ�y�,�������>�� ��\��P���94�����V��m�$����`����_��'���m�A<��4��P֧�G0_z\t��t��Y������J���*���H_q��5�x,��C�v�E�Ԓ��A:|���qp�9�@�P���Frb|�tHͷ���J2��EG9��ɰ�@��\$2�Ѩ���"���{�6�b���C|D�塳=�Aj��8�̶q*�dzZ`X�j������_���fU��k�N�jD�E���|�Z��p�#���C���>AfnW���ҡ�Gm�Qxox��Z9;�="�Yi�nh���vͩgXƨϰB髆����e�{K/��	ڱ��mH�	��(���?�i��}��� ��
%�Vb7��L��`����u�N��Rc"q��=�;0�,
30�ԝ�H��G�M��ξ���M$��N�l߾{z�g�	Ů����+��t'A3�<�"�N�s�ݦx:\�wp$��Q��ʦD)
w�?Э��~��>5�!���Ó�DRB[�9�A�hrZ�HFң*`fG��o�:�g8�-0�Ă�R�����/��B��T/��%�-4�S r0�p�3��ܿzU�����G�7�9Qb��z=�0kM��mK+�|Ҳ�`�����nǇ��'>J2���Y�������`䆒��8�ob)��c��N8xy����=pL�����C�����8`1����Љ:D1Y�+H�3[�f��W���lpp��es_8�M��x�EI����kP�r�-un�*�t�q5�	��1�����$0�A񸠑��~_�7��/�>݈�QV�S��D*qD��)�Ba1(5����JB =}�M�d�s��9�~y���˚��1����!Y؎4w��b�C�U�7h{閎ݾ(�;�]�Ư�s�5�]S�@vL�Lk����l��>%j�W!):�!F����Nx�\΄�ε����^u�f�>-I6�J�	�T*�pZ�m���:��а2��ٛ���4���	?GB��q�����0�g*����d�}�{�o�����f�x�93�N/��<`Vh�"}���>N8-eT(e+㒮��w68g��Y�8K�����M�@����$jo�>gO�0�Lx��;/\v��Ӆ�{'7W��[�n���� R0�p6 �*��+L(��)4���.֢s��i�ri���������&�:�G����x{ؖ%v�m�1�'Q,�d�2-��T"�j���/��~zY~�v-`��Dҳ��1���#�YN�o������V�c�x�I�I,*�l��ޒ�=�}��U)w���s�U<G�6s�(^�����x��B5��
�Er�=���`�M�^N8U���8?_����pM�����/���3HQ��T��I��T?��2&�O�8|j�d�R�l�%��B���=W� f6����Bd��e��<�C;m��}5c������
w��]nZ T�rC�n������]�'�\�����V�!�Or���I�S��1m�Ĳ:����6��I��H���*�*��V��G���G�������Y�I�Q��@!Q���Jx���z���i�ϑ����[�ѽ<�j �%T�O	&��0|M�.0(IfX��N�=��E�0��U��r�hr�6����϶%VwH-͐����6[������O�|	{��@zۘ_�Y�Uт,�IE��/7��c4ˣ�4�w��lW'F7��&�Ք��@g@�%��ԃ��A��CK�M$��Q��At>P��5p2���Π�x>d�}}>U{�P'B������m�bǐ�:�.8�w�s3BuEC�,�|�"w�)�1�g�|;'��řo�YW�p�mN��	p���e�h��*>Y��3�^� 3���v�O��w6=��'�4?|�z�Dc�S�j3ǟPtZ~p���wn�#�Q��ɔ�gBC�����4Fq�G[MBQf�֪M
%��#��\ _�ʆ{T:0�Z%Ϝ�|�m*z�M3	j�#�k�L�l����1o�	0�N4��0���h�蜽�W+;R8��=�J�
e����E�s߳��{���i�i4H4�~����#Q��{n�m�xwP�!ޢ�|+̨D��h����3ᔳN��;�� �]-c��k�}�(�hE�2'hr2��c�y�B	r�����s��z�jkۙ��3'�ǭ������ *��p�pyo���8�/͠�%�%A'�+�|���|Jr���CX�����C)�'4%U��YN�6�YBڽÔ�l�,{d�`�V�����#��[�zoJ�*��,��f�/�L��c�J�	����~<
�q6���Z��؁�%�l'�򯯚f���g��p�:\�9ff�r�� #��)�Jr�H�E��O,NF�NR'��ᣜ��ׂQ����Z۹�l�4�uq�����q�ع�݅v�a�31� ો�|E��P/XPg"��Y���m?cY/Xb�V�v��.Uo�4)}�Q����V\�mpx�2�s;i������]��������D��Ձ&�h/��JkU&��tE}�#�����ׇ�,���8U����hZ��B̭��ɾ���ꩰ��N�.���7�<��m��s(���ː�C�6�J ,x�*b��+G]g#�	�a���2N95�I�У��S�*��V�ߕDu����m4�@�h��hW(�Q=z�M�]��:�y[�o��j���/�v��� �H��L���֏m{�Ծ�6��a�(�<T0}O���P�������S����v��X��Ŷ\�e�oW��.���U�Yg��@/-� As�ꙙ^�������v��_�����V����Ux�X�S���D�����['y�Xh��i��{%ǎw�����N�vr��m�=���d�l�fE�ikêQ��з�eR�AM}pΘ����+:t�i9+�N���qpИn���f�K����C�J��[�z�G�űU^Do�j�"��Ը�v��[����Z�n��+����y�ZC�	*�[&#b|�[�Q�G��T�l[t=��0����,T<	S�tp�}�0`��s>'��`)����CFiNÃ�}��
߆�V؅��C
�L��2�:oIV�~��
V��-��E+�˖�{@k~�:���~Gjs�;�4��Hɣ~�4�����{"�$W}ϕՓ U-p8fO�����5$�{@��+����	>z�-x���C�eK�a*��㇩��c~��i��h�q8I�l�R�0B�U<z�駫�����1.�^"��'�V�_��	E����b[ѧش̗�t�P���ҧ6�$�?�l��R�q��2"�8�w;���IL3~{	k^Od���X�t	1j�2]�B8�����ֽ�Ic����)��|^}Џ�ۀ��^�_�DL2�9cf��P/3�#�E7����`�����d��W�������@��9��ս�!��ŷC�D�5�t)�W@x���&G�3R��f����;Z{P���ȟG4vn��7�x�{�[������k`�쩿{�O���8�Z��L�F /G�ȑ콑��LlN��TsJ���� hO)3�R��J��R�-/���:ଫP��7�{�U"Z�f��cKv�e��_~�燲�,'6pȟ��#���}���9�6هl�}UbE�3_����ꉱo��AiF����:<�)s�
�����f��WlW%�5N���n-<�=c����ʳ��ȱ���cp�|��l��,�����H���W6��h�	��뎑3���������ӄ�*�O�1ilr��!&�w6�Yha����JnWfT�)�v5Ѡ��+9V+`6�$yN����z����	D-L4�Q��P�N�'x�-��H�v �s�.�����/    G]�aX��+>Th{�sA��9�jIT�Q�6���95K�k;���TMO�U���Q�N�ңk�ӽ �5Z~��}&zYe�<4�D:[�3eBqD�6pH�΍�l�ߟ�*Ubr�"��<[�2�r��`�l<��@�׉~L{��t�Cnщ��SO8	�վ�X��l��$���d:<�(�ͨ��!���F0�m���Y(1�!���w��\݋�7��B����E���}���� �Ѽ9���:�J�"�Yj���eL�=�����g���l���݄�7e`�xš���} �3J{�����p���(�_&:�=��s�t��e�<�h�#�Nh!���W(|�z��nw�ԃ��P���gy"bC�P�63,.�p�j_i֗
GT�j���^,�1�F���m��_4��z3f��ԟ�4BoBc	`�����>R5Vlf6棴;�8�RV�F'o�ց��pJ��xN�>� �a��]^��#�NԎ��w���h�������G��L8=z�*9]x�	6����VAQx�={�#��~Ζ5�0�E5w'��H,'�䧋�b�h��=�����V�ڶ�t�2�K�;f;�B��=��a�l �M��̦E�ZK���
wi 7� 	�D���� �\L�~ݍ���T�Ҩf�5�����'�W��g=�����Ah�:�ˈ�t���XEZ��ˇ���f�Lr�E�C��A(g���W~����yS�[���<��`{���U_t	��s]�mD�J��뛛/#!BWɇ��z����kxw�0��XTbK�e�al�]_M��� +�4��z�ɑe��@�ؤS�	��ڥDG!�
��o���ye��N�$Nh$_�%��¢�k���ݱ��Ҿ��ш:�B%�&��N�(^uh�w{|������S���ᢷ�HDהz.�u����,Xǅk5A�	"�f��L2-[,*�^�M3x��P���h��&���$XZT��`)�"K A��X%�\,Ň���-�9\ڌ��S�J��J_�MŇ(�&�ki�WF�no��j�ôUQ=	��P��P�u�A��Wo��Ez��7:�\[�=�*ځqc�9J����C�҉�mc�oOu����a�����s M4K���:�5�<��p§:����]~C%�D8-8��c���l~覌cc7�!t�~Z$R�i�#b������{Qrk�M$�%Z����",�QdsO�N�S�U���2$�Q�܅�69?�Q�okȽ�Ŝ/���O����G���Z8T'����/'�&�`eZL�g�+9xy�W$0'��C3J�X����SU�2��IpG6�|�l">v�ϱ�c>�7ډ���Q"��	U�3�jp�V(���PX�q"�>�}��sƆ�Ш�11�A#vzP}p��L��Ԫ�wq�"�E?�oc�ӻ7�A�PDtv����2�<7��Z��Rx,�v֍x��±��P��X���Z��ڧCH�ɝg�g�
�$��:�� ^��8��H�&<p��O?�sZm2��=�����A����s���;p�l5�mD%��f��3�f=|�\��������Ak\-�X��� ��Mdt�+MKZʗ=���AH�R�\Ab��»`��	�,�:�c�B�c�g�7l��>g���-�'*���D�>���=8�V!J%'p���JBO�2p�ZI����I��*AUoϧ�x4(یwxP�~�ШA��DJ�M8�߮�>�6I���Sm�`ʇ�x.�����L��D��H9T8��W{d�����8p�:��S��]�����t�Z �ūI��y�C�I��3�"4%SF��/1��"b�Xyp�4�fx�tr���
w�i�0&#���u��m�~6����I<��L�DuJ6��bi�Y�w4��(�G��<{���ت<>-�.�+�1�S���E�+�h��<N�t��Yy�5rP��J>|����Y� {c��xߣY/|o���W�g�����&�	��S�hPaClB�	E�(�E��,)<��ī'��f�FKX
����T����6��Ɗ*��j�I5�C'�+���*/�R���C���p�0J�����5ۊ_x��W3N��c�p7��|j	D���cW��d�Yp~=��v-H��*@UgU���]h�mE1�
���M2�-�+<�NZ$����Zi�(J�(ip�W6�9�Tm�]�$�	5X�O�F��G���s�m:��6�t���< �v��U�y���pꞙc�_47���Di������u'��)�=ځD����[�3�]��9�,:~��hX�s"��V�4�]�I����7G�v�Q�������˦�0��LC�d
z�;+?A2�e�������Dq8�_�#j'<+�H�~��vokO ��=4��=x>�ɮ�$�Z��@��OИ+D�>�ص�铯���5�ng'S�q��4�������e��
�
�/Q���hH̱�^ƗU�s��H�	�!@�"&�y���d͋�A�X/�����ܚ�Y��];�'Z���/0/<$�z���u��	����d�����]�E3P�\+u�t;%�^�A��Ks/^��AЪ�q8EU�|���A,-���.tܪ���c[F�o�XY.H~ ����L�\��ع���Q�6�����<xX8y�xu��Uu����R��g��q>�9�������X�'�?@ʆ(6B�����ӭEm�f�^�Czb���q����_����h����i���qN�,�S����K�9[=xI�r�����)��B���Wgv;���y�����X:�j][CX����x"mPC�0�»�X��h_1��E�:f�X�S^��H��1���ݲv�=0k��u����n�����λ��	!��F�-̀���̀t�Ϣ-Bn��2_X��������jF�t�F�+�e:����pޘ>bu9;'��Q��>�DI}DE����=�����=J���hf�b<V�i������9�Y3\�~��
���;��#�w�T6n�6� i��c����7����<���~�q�m�-ENi#�D%��{��n����.�^��n�'t��R��C�r��9�; b�"��_���#1-�-��h陑�G(�DO!�V��!i�����#���L/#�&c���y#���@�K�N��*����~9��Zz�f�8͢�<������M�ʆF��v�JK}��=#L�?=p�/@W����|C�]7N}h��ce�2�$���˦2�����#F�=��"3e��� ����Đv6 ,�cB#����K_�?P���L�p?�K�H�-29j']G�1��ϟh�=�lG�ݬԝj}>nX4"�W��|[PX���X2H�8�MY������.f�/�ă�?�>4/dB!%�DR"�	���䪞��|��>�W���g6�=S�+c�݉����nAf�+^U�݉���W:d��W��~�����"��1�Ĺ(����r��IX�pE�2,��0�]d����s�ַI$�}�i �ۀ>�j���_��v��xą�$h�:ݦ�y[.��/�p����s�6�x���j���f:�NW=��c��ܬ��D�ls���c��PclF����p&���eq�A(:}�a���Ι�������}��R+�cO(-���w��p�1�ـŵ���؋Ǝ}�n�6���=�X�"�p�+�����bLx�Ay��^�/�A~�~?�:��A�ly?~��h�6gQ�*8�E;ᡧ����,��o��L��&4��pg??���ax���7Є�dU��t����'U�X��#�a��t��k���M<��W�!3�ky��p/q���� t�uj��|��MW��r��UϛdFʽ�_��QBW����f��?@+F-�3�O0|�U:&AQ�c�x��z�-؉R��mE�#p�>_��Ľ��@c����gf�W��{�HW�5n�#L�Nca'�P ��$�H�'��﯑O��a�>�߁���'ң��o�j�x"u�U4��h	����\Ӊ���9��K����J�nT,����	���@��� ᑕqy��B%����3Ļ}��    � +��τ��?
��������$�$2}J=ڗY�U�"Ź
oz�Ҫ"ă(���ir���H��-�^c����x?�Q�m�x��0�}�T^EB~�Q뉄���l(3��-N0�l��*B+�1x��X��<�"��X�y���|Ue�c��|���
=�,�S���:D�Y&�q��ڢ��be\�J���\Q���D=�@���K����3@υS�v��������I��b?�y*�A�a2Z�����ϡ��6�N͎�y�(&|M����v�$�xl�B
~���= �w��l��"����{��`�����W#�Ό�)�l[H����nj��7 ��={J�2͑�N�Պ�����%�5�Q_�(���(|�y��|d�*�����zաDkJc�"�k}Bqy�e�
ö^��X��7b��<�I ������6W*�����gU����7��X��%m�q��$*�\i@�+�N�3����7ѿ#!̼�Au�=ww,x�Se	�!�g׭�ܠ���	�"���ćج&>�:�l�;נ^v��!W$%
��b�������SLl('w�i��Z����
��+ދ�M�,!�t��#i���^.}fZ,�C�7-�C����HN��hN��Q�8�4'g��r�pYٔM�g���ٹ��^i�"O4�>?��ZT?����pf��.g�Q�sr���ڲ�^��/��5��#�������P�u�g&|k����%7�8Bٳ�
��悦�v�b�@͕���&�m�L��+ML,-e�s���v�v�(��F�3������-R	d�)���=�����:�C���'��	�� yy�~�J9z>x¶^yuv͔��O��dU]�p��]�#�dY�؋@��w0; �s�M,Mu~��&:��6�����r�?ě��ۍ1��{mZd0��܁�i8����/(�h�	EA�K�ޤ�����S]R�_R�aQ,�2���Ғ�Iz�����T�R��R;�?T$6u����Ĳ6�óW�|�5F̰\��5':��]2�1�������4{)��.�P�eqh"�EQ���?�������dS���2�{7��iLQ��G�R3���B��E�Rm���D��T4���-KK���C`&>P�u�q�t���1]��w��1N�ـV"Ѯn�[7��d��p�^�~J�T<��>�F$��@�^/��fӦ^����},��s�U�wcg@%H�wzV������=�Gu�F����G0E��ރ���+ ��C��2}��~W~V|�<Rq�\�?��F�&�5}�ku�T�ܺVQr�1�`H�*�<��t[�O�M�>�~�`N�h��׫>��|H��h�_����9�T�L�zD�DξJ��@�L��K��^��P�f��3��?P)2/�!��Z�c�ң	�w�I[��O�x� Wh����	'�nJ�Y���6e+�|��Ա��@��^=>w�9����U�φR8U�VmN$������}F��zWU���ݯ=�
�/�*�/"m+=7�<T���Z3�!���`������-u��n5戞���X�6�Ξ�jW,�]���c�v��q�#�޴�{�l�I�db�u�*)5�l��d�kܿ�㶏�"Y�Kl��� ��
�j�X��8�u��B-�E�,�=[�ε������^��]��YPP�U��*:���~�n�ְ���a[�����Z˘NN���"�P��lD�ӏ��c>���5ZTJzZ�����<8��w$�L������A��@��Iu.�M`a)��!rjK��3z��΃��&t����G��_7l���8��L�M���-�Ш�P��9��#��
=O/���O�w�7��qԁ�����oc������:.�mʎHh���,�a��S�_4��_d���~ׂ�S(>�'v74��Bݭ��=; ��	�o�����(;�w�N8�Tl:G>CJL}o��o�J���ۈ{iP['c�i��e^�*(���<Е��Ai4U����U?�����������gdg��f\�Mz(��@�a�K��ULI.=Q����ӳcp��G�a�ܔ^���{w�m8�����%�K�(�%�9YF����R�#'4k͹���|+<G�����Ov�G�5�W��D�M�C*�U�9e�4���N|�l�ũ���Ϥ}�~o&�1�%L;*����ˆn���7Y�xn�_���iz���y&��\7�m�C�=ǅ*.㌃�ی�"�D���S�Ǆ�,*���ĸ��wU�����軩qG���}��[e�:�2�7�ܿF	T�8���N�%��I��x$�^�F���L,�Y�?�za�P�w3�=�6�h���t3���Y�9u��d��(�C�'F�A�N,�d�p���A�ʠl
_;Յ�h��za�{?]JC;w���&���G�P���k�<Ǩ�ik����:*e��Ts�E��4�0N\�;��gp#��MEr��x�P�h��<��H�·չ�g���At�!�������1~�q�e&� a8
=����j�ed�� �2Q�Ƽ
���z�#�����. B%;w+��c���HH�6%����ڒ�iU������7v����%���D�"Z�
d�(Z/!��1o*��p3}��X���z��ī+	wY�Nq�0A���wWĉ�I��
Ֆ,����e}��
���,P��R৵���Kn}0�`7�T��T*?P�ᘄȂI��e&}Kđ�-���GPR��8�_�52��I4�O$��Q���DX�f2^�-�ʌ�!(�і�l�BTP֟?�R(�Ʋ��p�����s(��,� ?���e9��9F�a
2U8��n�$��h0�"~�)��|��p�"�Vr�ys����>S� f`�1C�A ��H���%�����T,��������Ȗ��;!
0=�� �ES��]�B��_���k�J@��"����x�����+�Y��y�I$�c��A��bbl"V!�8:$
 ��n��RJv5��#�W�����,|��ܿ�ʕdD���^7�+
J�( ���6�%>�	4{"K�f�����q�=�����Ƃ��oQ+g��L6���'��MU~�8
�����{p�gQ8o:�`�����Ja}��A;h��ā̟%���i�#j	n���k���|�0h���ot�:�k��R����uN���?���z�K�h\mo,I����nA'�'���u�	���q�M�)�=`6�vX��F��D��ۍb7��
���y���a&�'�	��3z���-�QnnW'�x~AM�Uw��=s]xI�n�pZW��꼓&�z��9�K3��"�ni�0Z�* ��?�g�/~G�f�l�������s��>��PU���Iro/���dV������p��}�����n�/^-�ЂUS`X5D�@�]w	��P6����ED9���$�.ёL�1y��P�Г�����\�g�)*gܝ0L������Y����IM`�çW����7a��r�gx4Q��#y�t������@��=�<�)�?D��;��g���DY��]4��d��rI�j�~*ht����yL�9�<��.( ���2T' �+Mo������#Kޖ0l����(��[�~յu����T�{R�"��I��'��+�`��Y�m�u��q/Č�ۋ#@�*���΋x@w�S4"O%c݋L�(0��ߢ,��S�[���"�c��( ��k�|���-~Q<"�ߨ����T��T�\(�(�|�"ʝ2�?��f���Sz�ePDݏ�8.7S�"�ݵȣ�Is������uT�Q��(�D���
{�,}�����{��:`����%VQ����ˉ�<��x�,�ߎ̠|�4U�NL$��=�	��3<�����w��+��Ϊ��[:�(u��<�.��a���U�"��KmC�����z�� �5D��V�O�o:�$�egi�ޞ�-��^:�����*�a\�4z��Q�hA"
������,2��پ�&<d    Kc�������U��d�9��\1X������R�����~�Z��8P3��CH����~Ȫ��I6wp�^ų{�P"E�3,���p����%�=�)W�p����z%�!��ag�Mp����>|l���Qű��J7r�̃:D&��(����tô�(An6�:Ym�B�y���3Z�I#D6'GPъ�w׊�����,�*���1�?_#��6��eI�;lf�ݎ<$;G6�Q�60v��ؘ�z�zI�[���ެ�2�������u��-,��;�u�os�; \��uE�xé��Zy�A�A�k���V�c����o���Ë$��R'��v˿�3�^
�wU4���_��F�a�V6�uNvr+�����[��>�8�1���噾]��Z�qH�v��y?7���N�܂! (��_�aZ�]����r�����M;jI�ϛ�CY�}h���� (ӟ�0g���߽�!�=E��EbW�I-��*�튌e��m���)��%�Ur~)$��hd�[�;%I�p��&mϧ�CџpΩv���
�۝�wQ��:P��.�!g������x�7���o�(u�k�Y$�vp#�f���^?nt�Ъu�`�����O|���ہ �m�P��E��Ɩ��"���b�za�� /�[:Cp
�։y�7ΡW���A�9��(l�\�4�|wp ��a�U-ۛ��%���-�N�*>������l��F�x�@�)�<���O׷g�g���-�C�va�o����Hxy7��K�-�N���^(��/��DO��v��o�_�}���H�D�;��L����-}��G���H�MGyS?��tA��'U�*���\��Rp~���L�d߮��;y��)]�mW�L�z�����f<������o8�ã�wH��[ny��"�J�\z��p�a�P׀��&���8�]����\���_���=t���l��y����$����x��pO�|��1[�& ��8����9mS&2�٥)�s:�P�-��)���DY�O�[<�sg,���'h*q��<����r���H�D=�[�_����'K�.�o��䵳��#�~E;/�{b��S̿�p|�P�����#W����T�!�挾�� m�v�=���	ՙr*i��T0n
�z�9&�ڐ��; D��� ��v�(�'X�ƙq�����h�(�����M�������6����gFINzn�CB����ۨ ��s����_�G��ԑp����9��e��P�Xm
���Jn|ΟO�25�c�Y��\:U�9���Js��ѡ�ƞ߄}���'8
���Uc��6�=�0ځa��-�����<V�����_�����X�2�m�Ċ��0��?����g)!����a�?/�$��m�Y�Э����y�Px�#��.�Y��N�aIf��n��|a�-�F-�����.��OV�����I>� �%��e~�8�5�%���燢���{�?��������.�q��6/��:/�g^�^����4&�%j����17vW��tc����>�6zQ2�n�y�ڌ��Kp9S!���!1Β�2Ԍ�y��*��i��a���k�w¢o5��GW�K�g��Ļ��V�	Glf���R��"O����`&�o9al�-��n�4��q��O7�嶦�?�=�c�Q?��Cھe�%Jw/��+��2d�d��wN��۔�`&���&�h<�|G�@�MU,����Q�d0����{,�AfOl���u��'j��73N�1�����pn�pG����9������ȷ��f�OF����E~?Y��Y~ph:Ͷ;E�w�ׅ"�C⥳�"s��z��@���ar�?��S�-���_wψ
�7�4e�a-����*�G�U��!����V�����EN�mVo��n�&�A��)�w��*�d��&U� p[���Z'�ef�/�w`�/�
.�Zdloe��nq�A��z?���Q�,� �R� o5Zr�����P���G�֌��(�2@J��RY��0���@��r��k@�}��T�7ۦO�oM*�x�$�}?���Kv�w3�EY`)���2�<P����/��L����U`ꞿ�h���U ����ufP�(�b�
��p ��� �*>��8���U�S{���z>�?�X"z3h@_y$A�I�E��"y޿\��W&�se�����q����O���Fa���Y��;'�	����Wd�0y$���Aa����j(�ޞ����< ��h ���pB7���+V�l�d%h�� ć�gO�A�2y8�+������AFv�gjxv���N$i'X*���^����W|����"�U��_ρ!7�5	d'
��\��W#�6<�!0��LD'DZ�O0��@����1}5�T�	�u�\z�W~����q�z<�k8�������s���J����0�MâzƊF��`����=\'��^��V偣�cX*��|��(�¦�Mg��~�Yb4�"���*T>�W��<��C0�&ͽ>\�K�f
p��j�ɱ�E�|r���;�uB1�~0�pk,������CA1�L��
Xf=��"^!T`m� c���r�++��i�U	<կ8����IBO�y��#{�U��j_Y*��UH��z!�m�@�z����)7�R�e�N�*�;�z���7���\�W-�xF� 	~�IX�
�|,����}�4�߶���#u�#K9}*�I�F�<_�,`����^�Q���^ͮ�/.� �8K\�;�D�܏��aiY*��U Kƾ*�{�������p���S�̟	O��l-�,��3��_y䂷���+�������m�MF��ت�?7�W|�2y�<K�/o�+���;/��B=��h��]����=�=�EQV���Oų�ntiv�#��_�������i��E�*$��q���܅z�����S?%�Y|��K�'��L���+}�������k�IRwX�xUߣB���P����Ft)z }40(x]�2�h���/��~�,X���+���4�>e����
C8�u�'������#��@�����dA�ǁ����E�Az�{�|����Ҩ1cM�}#%U�?d��..�	�J}EQ��l��gk��fK����,�'g� ��bR2uo��R���	\/� 
L��W;�*%����V>�J~7����fJ�m��/��������N���@�TEm�����Ë0
ʢ�hq�WI��/����i��\(hЯ<X�����}݆�A��(�dSn���#ߊ0T$h�p=�i$�6a�%I��~/@���R�r_���+
�|�ѯ<Z���S���sS(�ϯ|R�\�ڇ�*�$�\���3���zJ����cih�� �?}���_Y���`%F��O�8i��ө\����D�aP��l��t�^-:ѢY���4@(��(��MgE����f�eW%�z��y)��0�����O���+�2�n��m�,��+�O�0�K�c%�n�BF9K
��>��8�ϱ~P��??U�H�,���'����(��+�f҅�?��,�\p���p(��G���_���Bw3]B7򆨲l�P�	bЯ8�j�pb_,���3����T�����Z��:ī��J��#��?]P�� �&�p+�C�t����Ӡ��?Ny�q�$����É�/�Q��M���I���p0Gk����>/��4UF];D�����Yq��!o�59��N�ȡ�MNF��[�x�-%���Q!�&��5Y0��1�(b���+�{��p���!f�M�{vf�����u�&��^S��8U�����P��IT!��2�/po�46r�P�o������~~?׿5O�ڇNsm��9,�T�t �B�ȵ��0~&hY�^���[{'%���mw�m�ug�X/��N����-ݖ��<jc�S
�ư�gds����ؚG
��
���
 5��#��{1�����q��E���y%x�r;7^\���8�X�(�G    Zh���o��O�i0<W;��� ̘	�i����Z�a��q���a����:m6S��mt�����K5�2�� ӯ��_�7'�	��WC犃�H���` X�f7N�n�ӏ -�t��5~�:x��K��;�;�_�QN }]e�TBS�H��
@~�#|�}zY�0�YO��~���~`����mo4=Kt�I�*�B_i��������v���o�DŢ��Pp~� UOʰ܏l���!�!���n���+rM>�mxl��Ce�CO��2(X��T�bt]���bl��� �F�t�T=S�p.��l�>�t$sÄĠ^��^��g��V�0`�qC*��ihփ�C2u5H\�ޒD���d<�~���J .��1��)��˩$+x�b�����f2U��3rn��`R��@��y;�
���N�;ǀw��q���/��*���	l�x������T_q�:9F���Q��HE_h�ܣ���E����|B�x�&�承�}��pw^�D���Ń�,��62 D?�G�W�.��b�BQ��m<�|J�SY���� �C��7�7���h0	�F*K<��"c�g�9�:�������t6��F�;����2��8�D��o �����w,�*Yc<\�fF5$�c��!�����0t�����h礆�Z\��'�<azO��h}G`*��\�cI���`2�BFb�?����0�R���Z�
j�Z��W��^�=�}�j���HYf?%3�<��ܹ�*���__���Qf@ófIR���0U �EƂ�[c~�,B����!�����w��&Z���R��A j���,p{�~���Oj�����	�D����<��q<�L�{�����BI���e3C[w������y���:R���,&��*�ω�^P����e�KL�sMઢ������*����
W%O4Z򌓢J�*p83���+�e���;il��l�M�/��π�R7�yH��!���{�/eI���@��݂flY�x��3Z4-�� �Cg
��`v��ĵ��9��yg���_Q�XƚN�Z�)	�pt�H�{��`v�L~�0+�i�)�s�7	���ۮ�gq�zsaH�:�� 9��+u4��r�G��{��G�¶sA���y6T�a�M�����:��9��n�>�����n�/�v��I���!-y��C������t0�t�w�..�f]��[����ʺ� 5�L�[ S�cw�Y��_� P�5O��hγ�����+N���$�!��
Թ�\ο�kLq)�**4��*y]��n�6e�tBo:[`�*�_�F�]|�y��O?���)�r0��1yp���fQ;���ͨ�A�����O� �D��]�XN�q�4W5ȟ�>�D���ќVު{���"��R�<���Aj� s��@�w��Fv^��`j�Wv�� �O�(X壁�j�����K��[x���	��<
I��0'�b��#+hIB��'�a�~M�ɂ8���`t�GfT|TH�̵����n��C���U�P�H紐-���'�
~͉Ve`����ŝ�t��g����.���xf��J���te����*�/����c�6�dYԚ��+��'C������F���C�GY��/����e��C,_�����]'�_r��䋀M]�� �ԙ�d̼<}�k���r�9)�/� ���-����9)W�+NB5��,T��7���C�z|�b��/d	��������%YH/�Bt�-?!=s:z�Q?v�[�G%�}�Њ�o�QH����^�e-�N�e��o1!*�:�l�2ԏ[�S/�t�����=ߌX�8~[��9�z�oz��2az�o�;U�� ����(M��[����HrA,�v��_Y�T8�,���A�`�%�X	��α�t��F��\ �[B��'XN���b�,��9����"��b�@���羯�BR��:�h��;C_���㺖?��]'�"аe����_�(P�Ƀ>�;y����&���cο�Qj�M��M�\v]%+$�T��Z�lh�"$"�8��0��3�QH@Y���	��)���o������Q���g����+��~���������[��qV�E�T�ba��M.(��o�nlI�D��vxA����<�ܳn��
ӯ�N�Y�<@�a�D|n�HV�s���D�@V�L"��'��/&%�����WD���h���v��0�5N�a���2y�L"m;gr,Dr
���E�*-y�D[4 �t��;&���^w�8�w�	���yͼ?�����g���Զ+7|���KP�?\	�b���a�Wr��_0I��BXE�8�z���y�gWn�����Rݘ�.���s"�_�V�`;\�c��?d&z �k��_�Ua�Sc
1���#`L�E�O�j*�I�W/k�y��+˲�:	���߻"�:Ҋ=��H	��A}2atW߆7�C��T�u2<'�x�}7Yēm�y����Q�P��ū�D�Y+i=�˯����k�=8�SQH~��(c0�8���Ǔ��$�uO��jw�^���BVK�d[�8�� �2T�߄�/��t�{q<X�M����\�cU~;�҅��x7̸��^�3ǜh����*�f�
^�a�p���p8��!_�%u����{}���).��T.2I�\���u�UҚw��f�A�7� I,�y��G���������<{���!ps"�ٛ�@~����Y�E-m�,����AW��6�n�����q;�(W��ruWW�A�����(��Y��@�?�ǟ�C,)�Ì��j���ɣ�_�hQ��q|�hM@9T+�������p�lbhAqI�:����0��?p�.�y$Eg�VǠg����c�e�hE"�֚Y��=Ą��ԫ���^9e9������lTZ^-�hn����؇��~�.�~�RS��xx���Ϧ
�������\��A���_?���p��K��07{��� ����1^ ����/jQ�G�y�ϯ�� ���|`u��ĉ��uv�+�o�~Zo�����L�Z���G�%�DaA"F���9hڡ�&����HNpMV0��|e��E/��6�6O�U��%|_�;�ik���4�Ȩ���Z�AkC���C�����?��V.�#�h*�l�I����� �QT��T�D��N����[���j�>��k���^Y�	��_��Ҷ�&?�Å*N�<�G�(0<�"�=�e��{]� 樮�,��� �|��7,��������w���#���2f��c���>L �}�m�ʾư!���[���ӯ���Da\"U _�u�7���9[�MO���<Ry0=��Ahu(�ђ��_�~�7 5ͼ_�҃�Bo��1��D�V�߈�.����*���R(�0iYM�_�\�� �=��ʪ,],ג\�7��L��;��o��8��N��aY�83�8���+�����C�'k�T�"˽��C��0T�-se�mr0]��~6��M6��&�m)�ȒyF@¯����V2/0��B�{*�f��%�_[�}5��Cj�_m��R���^��SJ�������I ���B
=+"r{q�p�q=+#����|�(S�^f��H#�X/����H�{���3�;��<��r����LUG�f��%�6k�DUȳd��4Z�av���P�8%��L��8��Q�C�
gm TH�W�5���m�r&�W���F
�T�	f:����i�g6����R*�8[WpO�ս��k����%'�r��#�!�8 n��w� �A�4]��U���Qpe�a O�{��lp�=��_9�w\���6��&��i#H���F�c��,BN�����Kt�v���@���l�'L�~A �y&�u���w ?�c^Vd͢Eq*������!��Rj�'?�mg�?,�q@&�m��hf#���6z�Ӷ�n�u��n�xY��:l�G�<�������rh��K�N@�7p:z�A�=
,�܀�ŷX	a&����_�����¯�r>���E��*+���    ���/8���R�=�|)�#п�0 m.�?��
p�~���'F��0G���q��0�A\��M�{�CA��>�=��h��$.��`�����`��SE��l��a���	���1��#�B���@l��=�{��m�[��ie�W�,�K"�c�ܠ"/M�L����rs�2�5��g�E���78�3R����A�낥F+����ya,����"2�z&�e��;?t�ä�*'�af���(�����lv�ij�;������Ł���6�1�x���DٟY3,�+;��Me�$�ѼQ��|^���q���9��s�Lμ��!��dd.x?��`y���	�?��Y�3��0�� �S���r���ూ⸿f#��%���7�=�
'�<��?����āx����<�������/��1�+�k������C��&}>��E�їt��'��4{C���C��oz�s𑺙�>�AغԹJ��75�t�ejQ���$y�x�q�j�~#��Ԣ�@��6NQp�8`:\@iX��t�[ꞥ���[:qu�9Ec���E����{��簄��>h��P�g5��P����e X��}���uq�+���a]pu�u��l-������4��w���
1�[�H��o2������}��%��Q�!����D��n2kR������բU�x�`�
Z�C�}i{/��
{�^\v�J�O�E�|��K�&oa��&a8�ΪH�YeQ`���,_�w�pֆ��[�2�×fH0�4�{z��B�:R����aDSA�.�ݙ���`IWW�e5���x?�x�\����:����"1s(!�i*�3�,�?�4��`O�k�?��[�_eT�Z�Q�z蹻�Z�%e�U�+)]�󴲣]P��&�rݮ�P�<�����V�ȿY��_�x�DmBa�T>CJ�$<�R�a�U@K����ۉ,��`3v�0��,�@ρ��(����%J��@�{5$Zۭ�����'7�@o��V�ɨ�h`uC�E��u��ϐ:�cl�?�-d���s5ܢpx/�n�3mM�-(���tB�
r�k0_�u Fj�3�\�n��������qy�-
�YD8�EQ`)DD����,�ï��B5�I(~{����I�Q��P�D��S�?�=�d �,�z���~���v<x��B4H�[� ���τ������O�d�tE��zqأ�
\���0/��'�Aq4��a9�E�r�3�LG3o�Ɠ&��^	�M�����\�!���� �%k����`��I>�h;QH$
(�����_YƧ��=j<=��t�Mᆪ'���릈�D��~�A9OD[�O�@n�N�֮͝B�-�.
�2�}�" ��'SN��l7'�-���:��w/���a����+ɡ�ˡ%�֋�Cah$��h�?�O�\!�(�\ʪ��dtk�#�8�C�&M�=�tD5�d'��)�~�xe�N����Ǎ,
 �٣�U"ژ�bu��&ZqdC�!hD�E���ȳ��?kl�."%Z���N��5��p*�Y���>@��=d��)���ۋ�0�f
u��?Q䞪;C���� ��o�M�r���n��W�Z���w�#������^P���Nc�7�'*9�����t�+A���H9��:��:s	�t-n>�mM�Y�D�Q.MI�4.
��h�KDq�Z��{���m�'�ΰ!V�Z�Q�:S@!g{p�.T��t�&����I�/^v�󫧝)"��l��,��A5�xN0O6��X4(�}��d��C�\�r���bn���5&(Y�Y�ˏ8ɋ�{ɠ�!D>;L�p�ߢ��t�3�^D�+蔟Y�6V�� �����*�B�ۋ<P���ɘ�}����l��26�`���
��������倎��^pD��u�R� U��T��n�J�&���a),�H
�TN�1\��U�P^�MiQ]٤�E��]G�n�Td��G���PY~�@�T�Y�Q��bVm��4J"{�yi9)T�~?0]�O��g
G\%
V���Y:ފ��աI�˯�,a0���`�� ^~-R��0:�T.���¾֨��ā�DK�_�ǣj�e�1̧Ps:�!�9ç���pm��݋9�O�)�	�6�,��l�Lb"K1�<��'�+�H#�2���N�e&E�~�@�>hZ���E�a���.۔|Hh<���VRF�B6�,�uN����}����
��h`�@��� ����'+�	R��֏%௤��D��\^/
\�s�?3�J~#��4���^pDVM���}���L�ɛ~��Z�m��]LM�L��7�|��s'!�0�Bվ���H!~OY�R4���ip�4�:��ɒ����Y~�QE��b�=�
ei��+����=*�9��� ����!t%@mܵ���9��&���xl=�j�};��x�w&�v���v�cQ䓋���Ne{U��H�s�z���v��6�,WW^�CNI	�o�L�q{��ȓ�b���<C�M�N�kD�N
���)6�7���~`I
lQ8dmx�,�>E���d��F��y�h8��v{��f3�F��C��z�� �Kۉ��m-����j���aOh\�
�CCK��.��HD9:
Q�a3w7��b�ɡ.�t�%��Er�t[a����
0���r�BwK��|0k��|�!�\7����B��
{��w��nK�t�T�8�U�š�0
&��u��Y6Y�J��PՖ��6�NL(��K���*�n�+��.�V#����*uKgPXE����s*���STk"O��ZO��.=�� 5h$?�/<hNH���*��~�o͋��_kLU{�Q��m�j��n��u�%!��ٝ	���j�������������s �@����$��0\J�
����N�?y�C�L�Џ&��]�'�'	6���?p���9?`<@�f��m9��|���k�_�t��Ĕ�������8����N�T��<v��\F^����Zm��<XJ� ��樐���A��{!jp:�b��,�?�v��?K�cG�R���#�.�i�fW�DY;`�':
�g#N��_�����q�qz�Vv�W�<i�s���;��E�J�y4�G;H����Y�o��[���Xf[�Գx\X#I�Svʥ��>���[ۅsl�l Y��.����Z1	��=��"�N�9��ʧ��: fu� њ���l��H��~�t
m�5��8��h��
�sx>ƌ;0N.���� ���g� !��I��o��)W�/�j��s%�q�ո0~9�������6�Pc�8.���y��y2����D��2Q��U�;�A���	,�q�P��f7���fAaOuE�Xi�hB��?4<�%OZd�R�*�#eT.�|�eJ�#� G�c�3*���􀾝Y0]��SC�q̞F�S-���Df6�J��K���s�f���c4Z��'�a|>۞ =���@���_�� ՘#�.����I�jѢC���J±�h�9�c$9���N�:Z#e�	E�7�B��5*��M2ofL�������7k4���Y0��X�<Q!Y�D��^	K�_�(����|~�8��L)��*�YJ��L��p������R�ĉʙ]�03�<'}�V��ϣ;/����G� k��h���(�<�jR��J��3�e����Л�0��&N�&��f�,m����=�J��ј����&D�l�(!��~v���ʛ\!*��aX[م��ex��vt yL�D)^4�f�(x����ynmq16�)u���qh�8&;�����ROv �KE����駢��j��	xsǷ5;�c�y�*��؀O]/��>��50�]}d�%A�U}����Ypzݜ�wx��1	Bm�7ph�,�t�q�,S#,��C��9p��i�Pi巎u���ջ�����?��d8��%Q'
���ׇ >\��:�y^+��
`��v����k?�D��Y	A�DO]�����e��4�س���&MBu�xeI�ޝQŵ.���    �����^��d�׎���h�hƻ��~���A�!�ߣ��a�tv�u��j�ں{(0��vq(i�y���u�6�$�P�q��u�p��_�Uѯ���}����/ū�k���죂su�J�;���«h��W#"W#7�����4NB ���M�P���=��O���\��T����A,����G���ɠ@"X�4-�ů#Id�?�'�ٞ:���=A�%��^��(h�tB���wB/���֯s�s�N�뿜���=0 �*ШQkqiA�{�g�W��Y��*b87���E���,u�y2}G4�GQ9\R�3��E�(�i�.iO�^P��$&¿��j�Θ�/�ģ�"C��7���3�s"~>����v{����D���ρ~-������<���X�ߔYJ@�5^_��/��9J-��iST�TWQ��E���+�F�CE�w-��β,�0ÄȂ�B�K>���ZN嫕O�_�T�O���\f�:��%�矐����n3�k�߯�l���ojt�`2�D�y�Ө|&���_6L8m] �*
���-$!�h���6�~�ٜ�LE^Zi*L~��C�z{�p��"����<�hΞ���a�#R��3��As%՜�T�x{S�cA0M.Ql���@��t��S��\(I����km�BH����f��a���\i�,�vW���Lr�ޅL���^h�� fF�CF�?�](׵���Б��fLI
��/`9� ƨ�^b��5J"ʐl�8�3`�07�����[�-*�D=}��(:���6p4�L����j3'07� ��ۂ���76���z`7������,L��)���/UT�������QZam���跴A1ƈ<��
;��ӱ/с��"G-�E�!�:`3��5��R}
$s�({!W�3$���:A~��9I|�r-<t-��K�k	�� 
ذ�c�&���p�'��������
Z�]d(r��wV����S�1PQM�цu�xpm�8a؎�ql�ޢJ�F{�u��{�C�i�E�J�y8��z��Y��%����h=�b�� ц�z&�ug�,�x4��h �+�����m�we8�E�K���n8�����g@��c��؂G+Z�;h _�5��_k���=J�߲��>V��3��"����AVS�d�ǝA���N��E�Q���4��RG��Lcx~">W>�Sp'"O�Љ<���X�g��9�.E/��ur�Ģ Q��4�/� ��3F	�/��B����Xx��c	\�T�Ǵ���|��݋w�-h���$�(n�*'�˰����+ah�D�C=�����\�#�r=��	=\�ͅ]�M�����P�8�k�(�$<�C���<��k"�~3
�Bٓ����I@K���<��`��`Ga"�$��h�����"t���WU����/>:a���������0�hf���ڗJ������*�f`��Z�3o�Q�;�%l?~�-9���f!�D��.oN�+̰U^4@x��C��zG��M!��yYCdh� I�&K���%� ��
�.#�F�#9 ��]����S�ˉ���8��V�2#�8'J6�Gz��|���D5�T�"�G�|��Mj[?B6�T��l���/g\^���\�c�5N�*�E�\K��}�ԇlc�NI�]�+�~h�#���9�ʚr���_? ��ߊ��<#X[�r$�3a�rSH~�I�B���S@�{�P�~�+�)����Rބ+3���&�>����d��C�����u�Df�\��ׁ�!NU���T�ۚ��v�b�(�4������8QPΰT�ܸ�������pf�6��v��C��"0���eh��~�Ea���}3�- ��Y��ls:�A$H���r��� SW�l+�fi��R3~<oΉ� '�;�`S��&�T���G	-E�������N۟���]�J~�$&̐��1X�2ˢ��������d��i(Re��&� ��j�>���3�ZZ���\\	hޖ�vѥ�gM�������a&������$��n��|q'�va��jF��P�����Z�Oi�6 Uo��h�}S����o7t���1�b��e;�����pt-�pxp�����J���M���o�]h���C+6ŏ<R��P��"��ډ|������dU�u�0�Y�\w;E��8ԝ���r��0�7['�`����	"�Ҧj�ȑ�1�~Uc(�T��/�u.�u�`��ei���s�9���e$�F�=�ej�M��7u�	:�/�	�K[�(�5a�q������8��I[�SK�^�^�^��i������Қ�6��ΎߥT�w�Lh��M�6U�9����xLI6K��q����_y���M;��eB��?/X� x����m����!8x��P����
ӀhG[8�����ZN	Tp�}��Q;Llg���{A��*fN�-�s�9�^���ijI���zR���'� ��,�ڹ�Xod�Qo�Y��*;qE�)�F0'�`�K��X[��ӥ+~�h���<�ol]p��~�=�s�I8�~���-	.���A�o]=%OQ�V��Q��m�`_����̷;�z��z��'Q��'����j;� `��/��CI�f~�Z��;����,I? B��U�ӯ�E`E��'�D~_�-ܯ�,�4>l��� �W&�I��"8�R+�ɫ��H�0oo�)dA��F����A%��+���� �i|��H�D�����ȘՃ���Ck Qe��8WƯ��_�MKP���3��qݐ�����
^A2x��Q��������Z�JG%>]�#5�eoT�t2?i��hr�� 9����AE�/� yg�h���g7��5I��8*9zr�˫�x�*O/:���(���:�q~"	=⌭]d����eP_�Dyl����-�,<��H��Lp��v��K.<��7���(�U%jS;��/��Ugfu�����t�C5Z��fL���\:a�l��&^��F]����<��O��[�;Ir�� %������xcn�3�lb7�y�I�4ϾJL����xU@3��X�/_Jv�s\�d-��[�7Q�`Mes9f���~�s��e*Q�;+�Φ�0���Ӱt�G�s��`�p�ocH�i��F�O8Ƶ��,��c:��1�+�i��	f��"<���iK�\a�&�ap7�9�Zu]�r3?��<���4Hi�H�pb���>�H��V
�o�S@8s2��"N��ω���(֋��%�+O %ќ4��{���L c�1���]�T�Vʁ��Z��h Ũ�0{�_"�`e8�nv���>����'�q M�+ue����+gz͝�֕���w�n�2l&�X��fЌ���*�Ĉ��~A|F��B��Dg���o/~Hm���q��b�D�����Tg��l&O|W���{F��f�E�d���9�v)s����OQ�~�W��E�M(��:�ቺ�I;x��Ot��8�]	%��k�Q�RFe�7�~H��빓��&y���EuP?v�uql��w|�'�LVV��y�K�ӚDo���~����u~j}���E�KY39���fB�_ۏ��h�D ���'	g�&6k �f%&R���n��
6҅�k�
�8��EXG����=�~��5���DʫıگG�ɚq tf�I�kh;�r�w�D!Ɂxs~z2�`��m։"�&?7��S[Fm��+u3s��Ȃ��m8~O6�XC��Z����t�Q���*��~2�˗�-�v+�X֪����u �fߣ_o�H{��ý�E�����O�~��s�T�!Q~Ϭ�i�<���O�7�vx4y�� ��EibP �"��?�0�j�]�|u<��酊��<��!�(����I����� �����<���#N�4��7������1�)��,��*���km" �j���9DQ8g��O~��'�s8r��Yx�`���{8��*�>o�m!����] U�:��Ӷ_�4��~&.$�h������������8}X    �>���E.K�8}[�.��P�Q*b�����֩��u��W� �p��u��E6���[���AQ�E��5���?��;���K)�7�۷L�ˈ��0���xe&��$��~�wh��-��f�7�ʑ�ի���q~���.B~��o�(���M�MBs�d��LT�q�D� ۨڟ^��&�p��Eб*'5(���쿓��oH"�ze�0](��4�_��AN2g�g��~-4=��E���&���.:&�h��)��G���#�1��/*H��ٟ�!^4@({.��/�`[mYhͤ��m�Wr��� Wf=����"ʐ��8ZŶM�O�8������Y��q��� ��jÙ�+�wB�f��P)Ũ��O$:悱�E��0�\h$��Ɂ#M��E�/*~�߿a��I�s��G������T0g��;��}�G�����-S�.��	�(��g��먎?�ҽ�-���	��RY�/Q�h�:RBb�,�1F��Ȕj|re�?d�6�0Ll?�H�X�3�Y(�J�;
�.�����s�k��a���� ��1���.��0�
�X΀��8�3�p"�zO�T? ��4Nz���b{MB�~��k�w��n��@�d���{X(������E�A��`����c`q���6�~^ ��/������\��|t=*��i\*���:^�AXS8\ڢ��xh�eU���$��$%�{g�}^��~�W ��U}-6��2S��������`�V�e�^(bL���Y��R6l0%���>��$��;=�\ź(�H���n��W� 
\m�(��9�@+�̨Fz�|�e����BY�8����ȇ�����-��M-=�|�2*��Qw�fV�)�<��C�1��4P^�ZЂ7����T>����lof������9�$QsE�YK �?�	�*C���i���L��V�zqŭ��Ra|���� ���t��=��}y�9�������T4e�TO!,?���IE�By<��~~� �+ʪ�f�	��W|�SH����yx6;�@_��i�<U�HI�*�@��� �'[{H/u�s�w�!j�T�x��:kL���Q�u$�k	���$U�ޗ�u.�su�@�V�:W��2n�~�+zt�2��8�J&�׊΃mY�0*௒6���7uN.mF��6�cF7�<_M�@��t��(�,�2:k�2*��v�*$Y	ޅp6�)�9�{��`^ŁgE�2��BN�&�5m�?�)��H��բqA{�'w�s�)z�4�2���1�îʳ�:)``�O.�qIN0��&6)�q�u���+���`C]�O%Ȣ`��υ��h�Ti�D�)�X;��9�Tw��`��e 'aɷ�*���L�!NRá4ꍮ]H���8���n�L�ڽ��vg)v~����0&e�Ŝ���n|Ȳ�^$�b.8.N+$�h�����d�/�����C���<�C����w��@�p�LO0U�V�j^	`~�H���m��M4�֐�7�U�A��-d�RC�7M�5�d��10�r9=�Mx��m������ZʨW~V���OS���2�N�;)/�_s��q>�F���O0�.��\�M[y�a�D-	c�o� ��� ����[��$�h$�*���(��2�P:�}��Vm�����!�T
[��Ҽ�jY���z�������g7�0��T��d���`�t5v#�H*K�|zv��]d|}/�Ɋ���ѯ���i-dU��G�~ex&/�D끷5x�*�����p������'��>Ɍ$�<i�rn�
KU�������(�p�Kh빠��A��f��T�W�Hf�QQ/�@+P�k����O�(<����L��>�M�;�v��[�y�D���3���q�d1W?����W�%��_L'��zϞ�o��B�2Z�nʆ<��㞰�����i�	����-����b@5i�+�FP�p(N����>Ŷ|1���U:'mv��_}�w�mMʦ�ׁ_��"3F#�O�H����^���Ǉ\����}�n9�r��w��?��︖7�_�v�	����ϊq��Wr
&!��-�!���<n�����E�~4�x�.�� ���=��p�b(h�Gm?�۽�R��GB�ߎ)��P��4��;��6[�6
��>j�*�3Z��;�s�Q�b�|Ɓ{=���������ɘM�0���c�*�ά>��G�^G�ʹ���5Ym`�a�`Vi��jt������C��}�|�;.�0�|gS���D�G��sݯ72Fő�#3��C�yHg�a����8�*��0ڇ���u��(����1�p���7Xl�';C4�|^�?s��	��J�w\��N��0��Y���9�P��y�����A��L�C>���M���$��Ef����O�:�Wr�?*��l�	��Q_�'��ĝ6y�aW�qc7rf������x>
د�#�������l�8�L(F6Y�:�S����r��o��k&��~9f���A���On��75�*6Q+p�u6�3w���*|��[����;��y�өf�˕M4Iύ&��D�i�E{���t�D(H��CAB��P��Y��0��i �PjPg��Eaj:��8쪽��җ_�vMt[ƾV� A�t��74�W݃mj6d�W�F����@��G<�a�?�L��~ʙ	�7=c�u��}�8q��Ł�0�9�f/�l����P!�&��ցc=,��aq`V���j���T-,����fϭC��m9�s �9ׁ_�O 1j������j�uH�q��R0�t���+�����X2�J�vLh8���I:00Q�6��!ȅ�Dቷ|A�̠�=��pIX�U�0k!�ѡb,�&�n��C�Z�P��R��hmõ;���:��3P�,�������m�_@_Vo��'5I�|��S��l�4oOA�;)(���6���W'cWO�p0��)\=?�-�*�\Do�d��X=��"���2�8�aZ���S�t�ꓫYGY�L���Xxa��� x|�ӻ �]k����o��9[0���|h[��.BPH{�,r�}24�К(	.'� ���E�����E�ŉ��b}@�r��x�I�E�PZ� ���"&�B�ڮ����6��!�M���l��m�����SO�xF/�����RP3)9��!P�6"�^=C��6b���z����i�?Td���C�!���9��8v_���P�h�%����Bn����E�o�4Ag�� ��"�d��h�j&��ۧO{�0��/�]8N���2���'���^�sك�e�E��!f���fɘ��i��E"{xX�ځ��1s�+��ٴ�<%mƕ8�x���,淦ID�њaځ��ʞ��w22?���,֧���2ꠕ1�hr	��Iq�_��h�)�ϑ�������ԍ��������b�m���J�-d�I(���*YD���`�s�ME+D��Mq�z%�xa��;��^7�:ڮc���Q��=�r��^ڧr�E�lvB��em6WF�zT`�85��	Т��3ꌥL~�kVhｊ���`���C@�jNJ���Q�ͬ���<(�Ɔz1���K�k�)����y`O~J�:�ftuI��r�ϩ.tA9�*מ���J��Uk�Dk&tQ��D �Zm�è�=�J�_^�� Jwl0싚?����krD��^Z�D��H���"���,�v�[^(Y���֦�|+v�Qa3�6��t(E�U=�m���.��)u���~���O���~/���1�՝ ��8�|�M�2o/�s.�0C�&�X����y<�ݺ��(�K�xg�I.�~N��aP y,��iQ�ОUơ��V�����`7�G�����,{Ϲ�� 
,X^��％�T�F�I/��CxCWS�����4�j�^�BSL�"��;0dm�j�:�oZ:\����g�Eڐ���o
L�1�7�{ ٳO�pޣ�`�9����>:��c�O�X��;�w~]=f&|�Il�`    '\��F%�h~ ��zV�M=�͏�34?"�lk(�ȶ�d(�A�`�����}�Pd"K�x��J-�\e`��@/�%�*��[.dV4 ���y�'����a��'u�ҋG��:���S��"�eh뇩��D�lɃ�f��d� ��&�N�*���Z�g�G���y��i��y(�u�?����К����7�<e��qٜ2�����W*�R\Nu_/�p]S+.�Y,̆٨�ޒ��7�^��p���%�i
l~cInz~w�XK��NRC������hɄY���8@Nd~����!�2����qDƒS�Vēb��N�R~/	w���!<t<WZ@QEq�s�n0[�逫*��+(��zg�|V"E>q�҆
Q�4Z#�(R��fLeN�~�R�R����C�Zؚj�8L�,+@8�����/
@��#��l*���=�^��ȓT���\+��To����� ���\�!�F�A�:��,
X���ӢT��4���5�'�G�-���-��i��Ghk��ǃZA�Χm�(�Q��;k����V��ᷩ=���eo5�x���EŃQ8�dp��Ml�1a���;z�x4��Cm�]�-a XE}�0���h%��0�wJ]f�a��Õ��q����<�Qƽ,�IW�׉R��2�8���������8���iV �O��E$�Tq,������ø:�Xg{�)�U�=љm�����	
���'O�|��3�"v�>���Vf��M#@r��tiI�¶J5��U�6�v���v�qφ"����pl��!S���a%�BR�{��a�0���T(�R��~{^�����<�,�AC �m�d�`+�c����h�4W+\�!���u�hƚF���;�%H�S^�8 1�NpĹD���dM뀻&�SN�_�~(�����/���t��:Ԍy�/��Q�%@�ʾn^��9��Ḁ=�A�B}�� ��}�~O���4!�+�����3g�i�!�M!���9���\K���*KY��7a�O�Ͷ��w`�� �u�;�UЃ����p�C������%[&�Z�,E+��!���rPS�Em@9����xx����Z]�ge�!d�1�v$8f���O�����I^� .���� � �FP�ֽzn�5Pp�l�"�4�]p��Ȗttl� ��	�an"q#�)��7����/h��L?aEzC*�I�]���x�T K��c�Պ!�����Ȼ��Wy��~��8�n�H���52����F-�	D?��/�-	 �Ks�����ށ�Bm�}�Ꝼ��Na+�}#�z��!fv���4��m����~�����Y��Nу�>)�d�����$ءD��Lq��������"Q�� ������BW6u�k����Pp�����i�!�q��Yd�ȏ��[��f$����"�)��~��}���ZO^�Qb\Y��e�`��y���8�ٝD|�n �K���ơ�,��>d��Hs�>����,7ϻ��X�`@��[|X\�Q�g��	��^v��ls��1��*�T;*x���J@��+S�k�xLd�xv�hI-w4�qh�l/�4L�1Z�[f��Ρәr���;wI�sh?�^��N��}B����'�5/�#�j� ���@R�U��y�w���jP�y�m8��끎��4�e�S��n���E�_c��C�"��Cc�5W���,�Yn����OL%����&�{s&i��ÜD�������&t���������{vX���$f�
�b>��>��Ҽ�3o�ݼ�w�y��e��w�.*8X�,�+��4�ӭ�My��:ɒ-C'�O���D����q�����Jd&����<EJ0+�1����Q@UO:�dh60�U����Jqz�Q��f?���d gC��w�)��������١B#o��fv�%/���?��B���M棁B���X��98���bқ���d邔9~��^�܉�,|���m;s��&�n���]��{&���3�����e@�~}�(��,��>������?z�7c����U
�#�H�Ls/�if������'��(C_��fe9�~�]��D�N�1�:w�\�����|���@x{�傹��"�u]�×�؋]�����M�֩^A����rGc,��7��c~O�(�@�R5}�Uy�gy�$��*�+oI!C���2�'K���/��|��{
�Ra We�L��=��%O0���;��&��C��� ����1	&��)�@����w!��J�<Jӭ�$0�B�
��~�'��,��A��.� O'�s�KXT�d	�މ�����A>�,�5l�c�l�k&E��5I��������9�5LB~���QEO7��`�^h�*@R�+��o��cp�Ѷ�hƀۑ��&N�׾�3��"��6�B�{e��Y�"�'��0J���\�S�����6��{�8P*� d����9��	o�e����S��"���u�7�t������Oa�E��Y�(�`倚�>�? )ej{�,u��^b7��`{7V�2j;�B(�j~E_^̍IQY/��"�3�(��|�6��4TYi�-	r����Զ=�)�u�M��E��-y�xZǜ �����/Z�u8z��g�~�I�ż{�+����"�����Л��s�� �-t�p�g��k#E�\}3q,S��T}�Py#Sē�����x�b,E�rY��H���J5#	�����W��>�/�߷{��ɢ���<�0��"~�e	��u f��N��/M�Ո"��]�?�l�/���653�w 64{�^�+́'�(��Bt��c����$R:��]_7�2�n��G��uh����?�|��� �j�=m
\:�(pt�����Q�rM~��V҉FV>0���_Y��_�J�y��VıB���ī�}<v+���hK~�%��jT�Q�aV]��2{�_�<2��~۹zrhzY��YyT(�3�?dSY���1|yH.o��w�=�)��K',N`�|�2�,ߡH��u��h�F��O{�\g��Ƅ�D�A4�WJWȇ�k԰���W�k�����M�pW�[��E��4\Pa�o�~�ZxB�?TL]�يfQ�2+D�R�����}��t*V}ۈ�H��h�(�i(@��.�
ʬe�\ĉ�X5(?����K�Y�B�Q�ٜ���w�(����@������;�;���I1���Ȭξm�fJ׉���|M��JP�t��vW5F�q�C�.�q��] �k�_#��Df��>~{=�2C~|i�L��O�$A���wg��D�/P�t�O�s��T�i	]RX8i)[�#)f�;��Khԟ��������E�B4y���hm���T�6�IP����_a��a.
�B�A��}����%�0؞��q��4����,�寃���=�/j�
��WqA���|2˯\�K�7�:�K�_���G�E�w���#�qK����3���ˍ�2�,��h
��\e��RW3������4�ek�T{')�j��$�LL̻�A����f��p���p��Q�@�6�R��"ϱ�z�}4��U�x������78*b��E*�x�˲e��ӕ^�^��F=^4����pn��	a$�4���3ց{��c��ny�?Xf�`*KE��	0��(�I�e�k�������f�����5���'�K�r�w/,`Y7�qމ^�+�E)�u��;��\ɏɋ9��(�<U"˱��1MYA��R�^��i���5�|y|����~�Hk���A?큎��O(޳[�nr�E㱊��?X���ݖd�_A�*�c�T��d��1%���c
�-TKr���Z 

k�ӂDv���K4.�RSj����K�M�v�Z�%S�O��4�t�����a�B�ٍ$��QL"ϝ�j�C#ɣD���.���[u��S�:��\�ѡ�s���0��KD�ӓ��'!N��;�c��@�VD`ӆѝC'>E+~9Ő�T�lZ�kH���2ϙ�ޕ���i�Dn���N����Crm�eȝD��Ry�A��BZ���<�8    o���=(H�j��{�9�}��v�,���e�����V�p.�3[v�rk�}8dQ �m͢�98��.[l)�s�i
���t����۲۞��i�]/������J�=�H��v�)������vg\��z�M�Y�8Q�k���ï����<@�dk��yz@A}���o/����i�(Xo���y����9h�:>	���at�gI`-,O�ҫ�7<7�e�]q�i�����(���D����كB7i���2c��R]`o����|��g��}|����qy�wEj ��3 �E]�Ov��}<>���͛�@��#�^����m��J�l)w�_3GѴ0���6����C�h��7�s~q��9��{�Wv�|�X�&�o4[���[=�w�w �����o�4�j�?��?�ӣ�����:�d�Z�ٹEX��.���/�چ�m��w�PE��T�>d���Pg�r���@�|3}3S0\kd���B7[xɕ5����[S(�i�?C��* w���`�"��"�@��H��W�Z�4��%Z�x�k'2,{=����F��=C�ix�w����`�L�wO���.��Y�`���a�L�@�����.vҩ���sV�� �FWN?�dD�����^��ȍDZ��=dYbϒN��������\L�0h�,'p01���ܢS�/R=:����Q�������3�0o��]�~PZNb�s�F}������=�i���r
���cH�]�,��0��6||H���!S�}�X�ۛϝ���j*XdI�s=�7W�$�v�q�y���	��?u�ag��|\�������4x�������e)m�Ӕذ�oG�Q�#�{)"��� ���;����E����i-,������T�,���u�,�2� � W*����YȊ��*�-f����c�!�}���Oɹ*z��E�z�`�R
��<Y	9���uY�(`����#�6������!���A�����A=��B�2�dd
\��D�`f(-C�xJ�YCy��i
x����1�Bʺ�7�IA��	>�8��g��O(�z9&���qx+V�EF����m���ߨ�᱒3ؗ�\1���XDa�d9 f � ���4Y�:���r�� 
=�����KӋ�W@��?/��c&��0�h=�@�Δ�!� ���뇫jgJ���P��(��y��i��p��jfW�8���8�r���%nV80�G��4c�,��:�ۣ�Ua����g!�5m�Y��j��n�$9�h$����dW�`��� 4���'+f���g�����;��1{�����(^* ��h
�z��=���_#_��L4�{�|Ԥ9���N_�@��1�����'�6�G#m{2Ls�Y�U�O �����M��i����̅]�y�h.��s�Pu^�u��������!-+�e��i%\�q�j�Űp���!�}����,0ި�gp�/��H��4O��+y���9$�Ƶs�a��z�hA��*{He�惜�&�����î��~�X7�����f�.�s�m'�~��*y��3ɜ}�L.f~�V��-��D��J��qפH+8+�ԡV4������ՙ��R�,�6:��IV���٬���o�4�A�1d�3'a5�&��ۈ�J����e5�H�5�t8�e�wZ�����P�,���o����B��M�@��'sUGf$xޓ�`����n��4Y?�	� ��4ח	�p�Σ��rğ�� 5-��b-07C�Xļ�p��@L�?�HWy��n[�Ř��*�������L����ñ�$��*�����_`��czc�sp�1�� ��l�8���@a%�ϝ���w�X����wMg�=���"eޟ��lxY�UGdq>f�Q��Wi����DЬA�&�ʇ$��T��p	|t�T c�چo�"�`�	���I
����f�(��W4���h0,�ũD18��I*f�Фn�a�z8����;�#�p��RT"�Bj�H;Ui �dѤh�\��3(`*�� �����I�ƒ�LJ�PӉ�����u4��h���d��$����$0��)��*���¼�� �MR�5@��#F����A��{Z��";�!hT_D�R������!��E�,���6����㼲z>��냑%��_���L��^j����S�-�\��(Ph�"��ʊ�ٮɈ�97�4b����l��Y"}���b�-k>�-u�Wr=�Tq��#���6�< �w�7i�t@�9jVQ�_�E��ߞ��7$�G�X��D�!3q<��Ss �����+�
g�C=��E�7*gB��G����]��x�
�-�Qu&����9�CЋ�����-�1�E�����������CH<��Ŗ"�D��H�G%u	�.o6p`p���\��Gr0������gs�A}B0���:����dL����� f�+pra��@EU���Xu�;z����-Z Y>X�h)���s������'�0Q�� ������zE�: �)���åj\D�w*����BVD4�O�V��z�����j���4O����[��rkOb�~�����DQ�)ȕdC-g^���B&�����tA�v4��h���(w���PC���ǋ�R�1ģ�]�z�q
��&� Ak�z��W��azt[6irb��/�c:Vc-3Ƀ"�B���y��z�+������:k�.IJ�Bӿ��q"3�O
�G�ي8QI���Ɨ�&�a ����	���&�,�q��O��\d���鐼�_Su]M_w��<S� �hh/�z3�'W�/Y�ۋS+���|XpQ���򡨽E��M'C�Ӗ����
̳T��2�9	�(7������)	���-7�.�H ���Н�8ʒ��؏��A���9O�9-�#K=�$OQ��3�J�.����6��xt�	�Z�(����6�Mb�i��W��Pfg/O*i�b��'/\X����bOn.~��� ���`q�ͳ�L�ɳ�LCQ�`Pe��{�N�~���Hh�Gyƕ��A{�'G!
��Ą�"���7k�7§0�T����EU{+�yL�KVu�,.�[؍��Jd!��?���B���RY��+�vJ�����FQc��j�`��MMP3�r��뇟�z�yT��>�Qt��Y��`�@P/zרd�#Nx�p��߹WL}�l&�mB�����S��
X�(�!Q���¯���e�(!�*���@�]Ԛ��QW�Mz�8�,�J�`k���Wg%w�Jݯ�L�2^�@њ�Oɜ������(�.��?��D|�z�8�D�O�H<�fw�#�,~HTG�@�sHC^G�/�

�n�I<f�d�2+t�1a�}SG�H�tT�,ʋ���w�sXf4�HS@������lr1��r��,���4�`
Me�̰2��o�p�Oo������,JMe
d1Q;1��8�& � 4�5(;rg�v�څ�N�mފ�0,��vqx��p���v�l`"�S8�(}Yk7w%:��LtSx;"O�t��x�����m
i������:ue�P�G��Yy�CȂj=럚#��y�f+��!z�R��l������d�fk0��Z�!��.���#�J�=(|��g�N�4H��s�����'d��W���ѓ�����٬u�k�0@^[�`2�_VPh��a0`9�5zL�ȱD��WgR�"�<��xCl���N�Z;�4�KNM.�j+y�zY��J��r���ݤ ���"N8X��b�~�<�X��`ӔWȨ5����-��!p��"h�_4:���G8�0SP�1��+͐�h��D8�����b���t`�_��,�����p6��o"��g`�~b�<�J���mG`�y7T6n⇸�7M�!�V4`rR5)yJ�T`�~�(�%�T��p;���|���j<LE���
ΐ߬���7�^�7���a��ƞ�{;�o�d����9�Q��zO�d��:Uu�O�����;�C�31���!7�&�}�pX4�ͧ@    ���0�[�L�QA���6~&6$���3��	���<�!e��H���}"5���Ɍ���C_���������t����K���c9��c��ř<JԳ����C�)Y1���K�MJ��V�a���������uL�Ȱĸp��qb�q]�+��𩌋ҏ��'7� a=09_�ƪ���������o�'�#���G�z?��=ȍ,�2X~X��l�}*�b@�H'W�?*�׻-�S��O�7����n%!B�!��X�ʞM<�{tf#�R̦.Oa��,e���kj�;����T�q@׈^�xZ��p�-����CX���1��U��lęE/v6�\��I.�W��
���a���kϰ��1�y����6Q ^�d��R�X�D����$N,Zh����Ǉ8a��?F�	������k��c�&�����	��'�+Þ�h~P�m��٨M!�h��f�V��oL�S�<�M�Y�>7�k���9>��K�@���B�͔��d���x�õ�'H�N@�8�[1 ���3���FY5����������,R�~�:ߦ�$'�<�[x|R5؅���޸�
��[5�#�#�0���L�.��=n�D筝�U^� e�� R8{��N��`;��8u����>��@�/!�Q�C9�j=
�����X?��f�B�����>��?�,�5�?�X��Yr��*����J���*:$�z�RX�hP����L�ScN�*���9,���^`F�.�E<��1/�1��_LF�\��Z��E��Н}w���bXy�sx�Z����d/Y/�`i�{�)}�/����QV�������:'�y�.��7��1	�Y��.�k�_ۺQ�/m�&�uV
��2�H���{e%W+�z���=���^}M��zQS�p]W�s�U�һf%�:VE��h`�f?��f���]+��y�7�N�����+I��l���L���x{�� ?�jKO��qi&�`/朿D�5��_��Y�Vǫ_�ȃ@j8V�gҬ�7���m��`*
���`g�͙�1i��7g�����Z�8����̉}M}�{�9�q�i����ui����|�� P� γn�u�?cEO��L���:��߹"Q"D��y
�R����b�v�P�%T/���U��d�.� ���Mf��:�(Y��+�(����������[tj_&���E!�ձ���c�m-�(��bU�&�q��ڢ��5�xQq�>-
���f�P�D)v���Pj�eM��'�Ab�|r��Ȥ��!��p�
QH�T^�@��������N�4O˿3��bH_^T�H�h05"֨m{�˫_�Y���,
� �G耳2�0 �NMT���t���5@[Yp,� ��NeAyCRД���
��
��k�S؏"��Y��O`V���p�m��}~ʵ+�8�}�7����"�<v5���Ȣ�B"
Bo�+�n�2�67��1�90}�:��?�W���]}�둅n�6T� �ھ�`�#ϢC�
H��@_�<Xףs�&p���8=Q�L��B���2�w�?e��ǔ�y6EW쩽$�'�Y����#��pv��c�f;����E4a���S%nW�M>�?�
<y���U��k��R�@��Ù�:7)�\p�����@4~���M"X��XD���Y���DczN<�+����
�hy�����Ajv�&�2R�Q��a��D�<WQa����Ց��SS����Q.�r#h%t�0X��:�I3I�;I�
�{˕�/�����}�T6��SmQ�k"���PX��+�^j�K��O'S��&1e��� 8��;�O�N�?��o� ��ü�Wٙ%K��Z���;us����t��b��DH�-��AE��rΤ��v�	nM�3���Ibf<���A���-K @���P�9�z�QW��k�C\�e�\��{��"Y�+8U�#{Q����S���W����t��I0{��=�oHRH�S>&�8L���C�D6ۛ<U ��
�:e�ݫPJU $�bN�Seʳ'`��B&W�5�� ʓ}��v�K�ge��zU�#(��Y,i�*��ݐ�}I�p�k}���S6�Wپ�z����T�ݺ�h�$I��H�DN����������f��Y��k}�t��	8�)�.�-��� %5j��b�w@1`޲�A���S������^�܄N�� NM�}`�-�}��R�a���䘔u���|�*Q����E<F�W�mز��xc�U����Qݷ��s�߰Ps)�����c� �������a�o$|�n0��w��n�`f�'nQ��%��15p���?�Ea�o���tXP�!��=@�E'{��l�k���N��7��'��wMP�M�x}t`��AX�.k��x:>Y"��U@�����������}�-��q���	W��1L���dˤ	A��@ ��xy�%^>Vx���|��qj��:����~�(��̶��c�|�ճC�0O�]q��ϑ�Gy6�TΔ��T�ce���s�fa��\�ڳiղ���_�|)pj�)�j-�򩎠��"m�v�\�H���]�h����D5�s厛��&������Ft'kd����n���X_�@W.Z.���o�(���%%b\��t8����k�Д�*�x��|�cϝ'�B[�D�2r��e�%:R��S>���G� �yUĚ�L�Z��Dd�[��g��ώ�͍L��D����G�'}��YU�!,� &ڹ6�.��C^i�%E�"�MQ�zӟ����8�|�r����.]��IPN�^��ӏNa���8��ꆖ;1F��\��U:�&[�G�b���S6y�.G�O�8|^���{��a&J ��1�Ӕ��$�o�b_Nt�.q�I!����)�8�T�w�V�]Г�3��7�9s���޶Ŕ v���W��|�y�_Q�� CpW����6��6�Sp*�$K#�-~��F��sJ�օ|��������0�L�h5%q�ZA�$Q�U6�i�+Q���=$O�7�/Y�u�>V�(�j�S_�r�wT�<'�W��#��	A{$G�n� @ꨲi�W�^ ^�ۉeԖõ*a��_���:|�x�dxզ4�N*���ڳ�l%��y�;l�S��,R�6��)���`5���c/=L�D�W�K�{�
/if�5m�����cY��A�0ެG�Td*d�2�
l3Q�]����Ɋ]_�0p��Sb�e{l�r���<�Xa�N�)�_�Ak�;9+�U�M��~mA=����v�|�h�nJ*��Q�t�S��jX%i��ƨ#2�V�G�(U�1\UWo\+�����ك��^��(ڪC*Q����51����1'����Nɾ>K6�_K�����'�
!8�M���J�uK��yN�k�����Rsd�S!��Y8�&M�-��]!m�ε�6��i�G�Vg�|�:�6H�*���BckώP��)	������s�C���Fՙv/�,Fm� ]��<�֔��i�
(��ɜ�b
gI��J�X͑)�#Uy�"4��������z��g���v*�w�V�|����U�?9k��^k���h�th�l�[�����$�~������:�W6x�n�A�ϝy��M_�?ru]��Љ97Khw����- ޷��K�9���Qgs��C��T9���щ<���)U�B�>�?�s����K!M��[@����|9��v(�a��D�f�2�vJ3���A�qS���<k��`t�U�i��P'�ggj�3�-�Y/F�lʫ5\.
��uk�U���{X�p_�毷���c��
i]�c{�H��NC�ݗ�c�U���eGX'��C(-���v�p+ �E���ϖ��:W������~d(a�x�,��m�� ���Cj�W��y�t
���9fĩ o���g�=t*$�~F����`�����o;�d��{�|�&p���s'g��KvX���7����雴�_\H�s�~e�:T�$ް�L�{STF��w�OQ�?{t����t�yo>����Cs4b    >�{տ 8:</4��5�$��z�'t�1 �,o���md��Г�$^��F̩ ���&�=��x�*���@��L ��B�q�G ����T_sZ�+$��7	L����e�UǤ��zK}���ӓ���`��s�;" 렎
�U:YEؓ=�}dk�������,LoӾ>���b�B�C��>��B��c�*hv���\֊�7�8rA��!ks��8���	yk���@�Q�[KN���~�1����`rډ�4�%�<�"�a ��P�)#gÅ#��u~�WL��0e�ם{G����"���x��SQ�q0�k�;.�{�[�;�0�l�mܜl�xH��X"���U<�=�T�M�d�7�xH��s��L~�����LZ��%Ǔx%y�ET�Bx_�(h�\h{�*p^�Q�[���rf�z�d�i�T����cC�Y!ݎ�3�����l�d)����4�_ϩ;���o?�������-��5Z�;�e�s���˞<��h�׌},;@��;�F��������G�	[U4(���P��p��q�� �P�a��<��M�pY�OSk�4Z� �����p�b�WL�\�v*�ڦ<�O�ߪ���ƿ'l�f[��q�t�*�d�I�Ծ���f&]ӝ��x�ٹ�l�2>�������xF��\�F�ɾ��J�6p����N0�����7�g��ɼ��H��Mz�O��VmwΆĞ ��OHoq.�1� ����CP��9��o;SP��	�5���]��V|�X]S#:��dqLx�f���Q�h�=��d�S�4�1�>���V<��0=x#x�6|'֑�"��nb��ɫ�w���5���Oa��.U���MF���k�Zf�2M�SeBT�Q&�d[�)i9҄� �}�%�=�{t�r
I<��e+��SgH�jl�w�[����f�l��h����O]���P��qd�m�
>ɗJ�%�� R�Ҕ�ϣ�/,�;�< 6�ڃ�#Ԣ�A�����r	xO��Lq�y�^�T��9w���T8�T�ϔ��E�\֬�:/̲�V���� :1W��v�dW��6��z6š=�3��8-��Q��>Ww��������\Q��s�*S3.�fR��,�*��q��UyZ�4E���{�E�Uw�<�GQ��Qa�(�qʂ�P5>����%E�0���w�}�7�a{F� �c����w��De76}u�sM���]�s� Х�p��l�KL��lS8�>{�f{J�qk��*�A��uฤL�R
���V��P9N�,9�8G
e��.��3ˤD�Ҕ���5rL����m��_EW5�A�/�(7�]yQ`�� �b� �������L6S���<�+^ټ�37+�<�� �n�+v��ښwiO�����
X���ו�X��3�S<$1O~� ���)4�*�h�f9Y�����
ܙ�)�?�������7K���qE��b�5Sp�|��\��<Eo
C̞� j�eM�oF��Κ�ӽ��&.k���~�
��Ty�"^�o�zR,6`dp;�J��xq|���ע�*���4ޡ
8=�S����%�s�?h�M��������ǁ�`�O��ثE�Ag9f�WG5����.��T�M�����]��4B�1q�,�m�MB�ʜG�8P���&Ȏ�]9�zg��j��a��J�?�;Y8{<u���}d)�
��?l�A����c/f��'��Ty|��N|���l�y�o�C��
���.�Ei�t|t��4^�A�m��]Ci������G�sӒ1)"f���k�
��c��x������?<����������,�;W�$��Ԁ,��A�.�)�U�(l𔧷���q#�R�w�]�Sv5�K�7}�C5���������kѴ��M��y��g���Q(M��$A�����\eM�Ꚉvӿ�67��$I����Ǳ��F���y��r%5wCH'"��ZK"�M�̎��)8�)�0}t����qG Fn]Ɵ���Ӻ~\~do[���
XV��nN��gӳ�(�=�0��y����@�AJ�D6��,3�w6��㩲�.��:śצ�?�4p�1G��^�Ы�7�C/�����'�Se@�[���5�l9�sQ>&Q�5�2��Db�>��7?���A�i_���DO��)��xPj���2�w��`�ݬw�zL��x ̲������Q�N+I�ߩ�nzv���A��Oa�����7��;놫��O�BTV�Ƙ�*
�J��9���@�j.�XFm�%va���vQ�uP�I٥��U~��$���� �9���dw�d����7ং�.'�_]fS�N�v�*p�9�MK+�ӱ3�oS�M�l��30i��}��R�<N��S�,��`��G�(�Ӽ JԀ��O!�N���THSf�r&�է4;:�<m}��	
�Ed�_���*N!W�[�\�;CJԃh��bS��+}+*<߸TR�S>,���ȅcʅ1#E#��P 5�*�rd�w�ө����%�kx���P �X,y8:��NQOe�=8_�,d��(�����8�G�Q�@�f�h��!�B��(cx]Y�����Az�7�6¼�RY�L6�������}uL%�:r�{���e� q�
�b���,�]ȿ
R�ǥ�K%��q�� �8��r禎�Wdz�xJ�ǧc��=׃׿���!�Ս:GP� n)��)O>B��d�y�6����G���	 �J1T�B�\�Ǧ{¼+,1}�YFB�LOFNZh�Z��\�{2�Y�%�ߴOU���j��_�#!�
�M�	O)��+���MW��\�A]����9���}��� �`2��`K�N��k�^XoDb��E�c��d�\}X�����O�Ƴ�z?>�[L�8=�fx8@�u(~��:t�	y��|ר�4F�P-"A�x���K�c�}y��f0�`PXg7��hP��v��s�u��:0l�[�s��)���m�a��|Dt�ao׫����.˵�K�j�_K!�8��ߙC}מ�-�;`Q�tL/3���G���G(����]���=���N�!oqc\��;5��4�m�
����oZ5r��&U���9�E��f+���k���>�_sN��%��E�5�c���3�"�g��,s�ş��MX%�LI���Į���hc�{v�8�?!���|�,8K�}���#:�q�]�ܻ�]������2����N4��������tλf���s�Jյ��'��<8��� �Qm<���M��Y���<�N�3���{^J�4�Eu������Zp7�(��0�0E��MQ1*�kԮ��Ϲ�x"Z�MS���l*Vߴ߽�v�5�z͈0[��FiL�����]�(��� ���Z���E9Ϗ�G���?�>����}��GR<5~7'��e��5&@���60����k����7?����� �5:)2�y������o�W_�e�e/���z�~$p�:l�T�1����q��`������;&���}�OĴ��g��	�D4�I��dGK�HC��<�%J���߈|�����i�,�k�20��≩q_:�;��!���7럐��A�Ŀm;`���q�e��3�/q���91T����\7e����BH1�@8>7��?D�	7�#({��X��e�����=�%�EO�sI�^����ƷBX*˻z�m$�0��G��An$����z��W듖�2����K��B�]�����Zw���?t��&�O @����;�*�#���Gp�Z�0:}�����ы����,J\(���c�G�E�� `PSG�c�CM�C2�qpX��L����u�<!\��'�ǎ��]�F������r�q�v&!P��=QQ�;��	1?��ٰq"^-1�J_����X�3ʃ�J��`�t?$�vǕ�=�?�/��כ����q��QjF�}gz�<���H�a~��r�S�2J�<q�x�f=F�޴+��E__>���xu����v����N50�MH@iώ��� �V�#"�9���UT��;$"���8cvwn��F7n�H��rCQ��� �   ڟ���G$�7�BP�D'�;�Fq���UF��nR��QDw����	�J?�k�)�,A�jK�%ltޭ��O&nGO�c�A7�Lb�ldM�q��� ��:I�"�I*�*��':4�?������x�_a
ү�C�>It�
n �T~�_�ͅ�<��JӞ�e�?������M�B      �   J   x�375�4350�LJU(,�L-QT075�t��4�2�#k�W���	^YS��fxe���Z����+kh����� �tF�      �   T   x�3�4620�41ޙy��%�y
n�A�
N���%�..A&��\F�(3"N�1q�L�SfJ�23┙�̂8e��)34������ Jd�      �      x������ � �      �      x�3�4CNC.sN#(Hr��qqq H�6      �   J   x�3�40�N�-.�KW��0P��v��5�4�2�#k�W���	^YS��fxe���Z����+kh����� �dI�      �      x���=�DMSFAV�����S�U���	'ƞ�:ք��2�-Y�������_�����M�o�?�����^��޿~�_������`�#��~�ego��`4X���i��Ak��������������������������������������������������G%�J�<*yT��Qɣ�G%�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J�J^��*yU��Uɫ�W%�J^��*�T��Sɧ�O%�J>�|*�T�d��2~j?Ō�j�O9�����������Ǧ����������6��c��=tO>A���O?A���O@A	4PAAtPBA	)�PCA9�PDAI4QEAYtQFAi�QGAy�QHA!�4RIA%�tRJA)��RKA-��RLA1�4SMA5�tSNA9��SOA=��SPAA	4TQAEtT�QIG%�tT�QIG%�tT�QIG%�tT�QIG%�tT�QIG%���� ��$6�gH�ɟ"�c$���訤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���J:*騤���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:���<%����×���_������<3�_ͣ���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���*:�訢���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:���o��#'���?s����Կt�O��['�؉�j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:�騦���j:��CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG��g#�n����x:�M�x�_���tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:tԡ�u�CG:��Q��:t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5t��QCG5~����%>?�����^�cS����訡���:j訡���:j訡���:j訡���:j訡���:j訡���:j訡���:j訡���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j騥���Z:j����6���~�ܯ��ys�o�����O��QKG-�t��QKG-�t��QKG-�t��QKG-�t��QKG-�t��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��Q���tԥ�.u�KG]:��V��E�Z��E�^�F�b�OF��f��Q���tԥ�.u�KG]:��Q���tԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���GG=:��Q��ztԣ���������� �/���o������������.����n������������� �/��|��盼?���*��gy����aޟ/��|���ۼ?���:���y����ޟ/��|����?���J��gz����ޟ/��|���[�?���Z���z�����ޟ/��|��盽?���j��g{�����ޟ/��|���۽?���z���{����ߟ/��|����?������g|����!ߟ/��|���[�?�������|����Aߟ/��|��盾?������g}����aߟ/��|���۾?�������}����ߟ/��|����?������g~����ߟ/��|��g����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jk�������jk�������jk�������jk����    ���jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�����ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�Z�h�o���Du���~��&��MT����7Q�o⺴�7q]Z훸.��M\�V�&�K�}ץվ��.��?��ui�ﯮK�}u]Z-��7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��MX7l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱ��V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm��ծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڣ��G�}��&��MT����7Q�o���Du���~ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훰n�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ    �jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�G���V�&��MT����7Q�o���Du���~��&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7aݰ��V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V;?Z훨�7Q�o���Du���~��&��MT���.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j߄u�V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����    VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m��Վ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=Zm~��7Q�o���Du���~��&��MT����7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ	놭�Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�����ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{���h�o���Du���~��&��MT����7Q�o⺴�7q]Z훸.��M\�V�&�K�}    ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}�[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����Vk[�m����V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[ml����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm����V[[mm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��h���վ��~��&��MT����7Q�o���Du����j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��M\�V�&�K�}ץվ���j��ui�o⺴�7q]Z훸.��MX7l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-l����V[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[-m����VK[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[�l����V+[����I�t=����
�Pf���,�_z6�����I��7bs�@�՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm�� 4  �ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jK�}TӺ_�u�D�~�����%Z�K��h�/Ѻ_�ui�/�ڗx]Z�K�.��%^�V��K�}�ץվ���j_�ui�/�ڗx]Z�K�.��%^�V��K�}�ץվ���j_�ui�/�ڗx]Z�K�.��%^�V��K�}�ץվ���j_�ui�/�ڗx]Z�K�.��%^�V��K�}�ץվ���j_�ui�/�ڗx]Z�K�.��%^�V��K�}�ץվ���j_�ui�/�ڗx]Z�K�.��%^�V��{l�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V;�ڱՎ�vl�c�[��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ�vm�k�][��j�V��ڵծ��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��j�V{�ڳ՞��l�g�=[��ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ja����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�ji�����Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�je���V�Z�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jm���ֶZ�jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jc���6���jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������jk�������j��ob��Ѿ?��i��O��m��h�F+�4����o�L��4���	��濱3���\c������׍_��燵~��?�_����]���<Ͽn����{?������_S������/���ɬ��?����~���_��?�����_]����q�;�����_�+��Nt㯻�ޭ�{�?'�οgȟ�8���G�R��N���?���������B���=�����O��?M��y����������7����U�s����ﯩ���y����?������߳W�s�#���߷���m���G��X�;���O�~��_���]�0�      �   9   x�. ��1	Макс	Люшер	Швейцария
\.


�+�      �      x�30�20�20�4 2�@C�=... ;�+      �   #   x�3�0��M{�8/,����(�+F��� ��      �   0   x�3�40�20�20�40�30�32 2/,�����[.6\������ �8O      �   *   x�3估�¦[/6]���]ة dn��x��Ӑ+F��� ���      �   %   x�3�46ନ�r�H-�M���+*�4�4����� }E     