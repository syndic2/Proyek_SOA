PGDMP          8                x         
   proyek-soa    10.12    10.12 	    �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �            1259    16394    pengguna    TABLE     �   CREATE TABLE public.pengguna (
    id_user bigint,
    email_user character(255),
    nama_user character(255),
    password_user character(255),
    saldo_user integer,
    tipe_user smallint,
    api_key character(255),
    api_hit integer
);
    DROP TABLE public.pengguna;
       public      
   proyek-soa    false            �            1259    16403    user_id_user_seq    SEQUENCE     y   CREATE SEQUENCE public.user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_id_user_seq;
       public    
   proyek-soa    false    196            �
           0    0    user_id_user_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_id_user_seq OWNED BY public.pengguna.id_user;
            public    
   proyek-soa    false    197            n
           2604    16405    pengguna id_user    DEFAULT     p   ALTER TABLE ONLY public.pengguna ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);
 ?   ALTER TABLE public.pengguna ALTER COLUMN id_user DROP DEFAULT;
       public    
   proyek-soa    false    197    196            �
          0    16394    pengguna 
   TABLE DATA               z   COPY public.pengguna (id_user, email_user, nama_user, password_user, saldo_user, tipe_user, api_key, api_hit) FROM stdin;
    public    
   proyek-soa    false    196   �       �
           0    0    user_id_user_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_id_user_seq', 8, true);
            public    
   proyek-soa    false    197            �
   n   x�3����+.u�M���K��Ui ���v����━v�@N 45�
q+5N�4h��44���(MJ-���튁�F���$W�s�
�=... |�     