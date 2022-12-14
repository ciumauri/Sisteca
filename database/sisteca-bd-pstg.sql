PGDMP     :    %                z            biblioteca-pst    14.5    14.4     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    biblioteca-pst    DATABASE     p   CREATE DATABASE "biblioteca-pst" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
     DROP DATABASE "biblioteca-pst";
                postgres    false            ?            1259    32776 
   serialbook    SEQUENCE     s   CREATE SEQUENCE public.serialbook
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.serialbook;
       public          postgres    false            ?            1259    49184    books    TABLE     ?   CREATE TABLE public.books (
    id bigint DEFAULT nextval('public.serialbook'::regclass) NOT NULL,
    name character varying,
    author character varying,
    date character varying,
    status character varying
);
    DROP TABLE public.books;
       public         heap    postgres    false    211            ?            1259    24626 
   serialuser    SEQUENCE     s   CREATE SEQUENCE public.serialuser
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.serialuser;
       public          postgres    false            ?            1259    32768    users    TABLE     ?   CREATE TABLE public.users (
    id bigint DEFAULT nextval('public.serialuser'::regclass) NOT NULL,
    name character varying,
    login character varying,
    email character varying,
    password character varying,
    type character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false    209            ?          0    49184    books 
   TABLE DATA           ?   COPY public.books (id, name, author, date, status) FROM stdin;
    public          postgres    false    212   ?       ?          0    32768    users 
   TABLE DATA           G   COPY public.users (id, name, login, email, password, type) FROM stdin;
    public          postgres    false    210          ?           0    0 
   serialbook    SEQUENCE SET     9   SELECT pg_catalog.setval('public.serialbook', 37, true);
          public          postgres    false    211            ?           0    0 
   serialuser    SEQUENCE SET     :   SELECT pg_catalog.setval('public.serialuser', 114, true);
          public          postgres    false    209            f           2606    49191    books books_id_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_key UNIQUE (id);
 <   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_key;
       public            postgres    false    212            d           2606    32775    users users_id_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_key UNIQUE (id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_key;
       public            postgres    false    210            ?      x?????? ? ?      ?   1   x??0?tL????LD?`R/9????????"?Y\R???_????? ??     