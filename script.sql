PGDMP                          {            Shop    15.1    15.1 =    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    25062    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    25099    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    25098    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    217            D           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    216            �            1259    25106    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    25105    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    219            E           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    218            �            1259    25168    order_person    TABLE     �   CREATE TABLE public.order_person (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL
);
     DROP TABLE public.order_person;
       public         heap    postgres    false            �            1259    25167    order_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_person_id_seq;
       public          postgres    false    227            F           0    0    order_person_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_person_id_seq OWNED BY public.order_person.id;
          public          postgres    false    226            �            1259    25151    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    25150    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            G           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    25113    person    TABLE     >  CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255),
    delivery_address character varying(255),
    email character varying(255),
    name_user character varying(255),
    phone_number character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    25112    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    221            H           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    220            �            1259    25070    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    price real NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    25134    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    25133    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            I           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    25069    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    215            J           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    214            �           2604    25102    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    25109    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    25171    order_person id    DEFAULT     r   ALTER TABLE ONLY public.order_person ALTER COLUMN id SET DEFAULT nextval('public.order_person_id_seq'::regclass);
 >   ALTER TABLE public.order_person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    25154 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    25116 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    25073 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    25137    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            3          0    25099    category 
   TABLE DATA                 public          postgres    false    217   kC       5          0    25106    image 
   TABLE DATA                 public          postgres    false    219   �C       =          0    25168    order_person 
   TABLE DATA                 public          postgres    false    227   �G       ;          0    25151    orders 
   TABLE DATA                 public          postgres    false    225   "I       7          0    25113    person 
   TABLE DATA                 public          postgres    false    221   2K       1          0    25070    product 
   TABLE DATA                 public          postgres    false    215   �M       9          0    25134    product_cart 
   TABLE DATA                 public          postgres    false    223   [       K           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    216            L           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 100, true);
          public          postgres    false    218            M           0    0    order_person_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_person_id_seq', 5, true);
          public          postgres    false    226            N           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 13, true);
          public          postgres    false    224            O           0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 11, true);
          public          postgres    false    220            P           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 22, true);
          public          postgres    false    222            Q           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 34, true);
          public          postgres    false    214            �           2606    25104    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    217            �           2606    25111    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    219            �           2606    25173    order_person order_person_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_person DROP CONSTRAINT order_person_pkey;
       public            postgres    false    227            �           2606    25156    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    25120    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    221            �           2606    25139    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    25079    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    215            �           2606    25122 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    215            �           2606    25157 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    3220    221    225            �           2606    25128 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    217    215    3216            �           2606    25162 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    215    3212    225            �           2606    25174 (   order_person fkep8v4imh31iqqdxnt5isiuhq2    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2 FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.order_person DROP CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2;
       public          postgres    false    221    3220    227            �           2606    25123 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    219    215    3212            �           2606    25145 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    223    215    3212            �           2606    25140 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    223    221    3220            3   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0�®���^l��.6\�V״��$�(#�Qs/l���¾�/콰�bӅ�@�236�¾��\� 2�� m�U�      5   �  x���=�]7�����;}�F3�r�b!8;i�4���YB���*������}�|<󞧏�>�������o����۳����y{�<o�����}�����?��/������������m��ۛ)E�JB�es�5:�Q�-m&A�x������-�w�<<]bV0�͑����l�t�S�[4�=�#ݏ��3�L��E%�#�F0%�Zg�QW;����j�0�;q�L�^ȃe֖g�y�ݘ9lfo%�2I�m������g77���r?f�3�gZE?9�J�K#p�$�է��s8g(^f&0WM�J]��^�C�sЙ�dk�]gf0�H+�)��9*vee��3���s��3��V\V�8+���,rK.m�"����c)��� ������<�$�Ӳ;�}z��6;�X�D6&����J9i>'']fn�����i�#���7��m���K�99י�>������Ϛ��t'�Ъ��������mO�e5�X����Bm��^G�9��>����}�\9S�(+��H%8i��r��N�\gn���E$ʰ���Ti�]�;�.X�����5u�1(C4`v#%S��c�U{��}p[<�:�=u*1m\k�,ҔB�ak�ʝp�9�������
f�PG��9���N��wػ!Zm�q�8RB?+N�w�m�Hi�.u�`�Pw��@E�R ~�s^�2s;�\(���`&EE��p�	p9�s����n5IL����qP�Ť�X�*��|�x�3�s�kQ��P��`ΤT��4p�W��s.3�vN��*xj;	����RJ)��O�\gn爌"������fQ��9��'��3T.3�s�8���wRo�Z�QiaH}�x����-�\{A����WC?k%�:���,�������wHImgH���:��}+�&�-j|���[AMYcWbH�!�&aU��_&�%���f><����_      =   ]  x��ҹj#A�\Oљd����Ƒ��+廉��!F���Ǜ���������x��zR�ǧ��|��9�oK���\��۫��eP%]��:��A��^�.�:/s��嚮�K?�Os�S~����E��k$a"�F������M-H�Ig����ؚ��8dLָ~�6Ҡ`P��~s�2/�ﵓ�ѐ'�:��K��$� voA'�Ul�K�� ����n���ޙ@�z1�9�����"EK��K����r��z���W{���*�wo�9����Z�4d���fu��URL ��e��k?{�B��]����\��u�X�����!�r��C4ވ��/���7�w���g      ;      x���Mk�0�{>�nm�2ϛ޼�=Fk�kћ!�6%u���$�X�
�x�Y��������o�����zݥ���o��n����t*ov/S�J��Ӵ~��z�=�����v�[�m���5ې���<�u�)�<�������;��+b��)����K��B��EJ�����:�a���*ֳ�ܾC1�S�)�)O��e��y �;'t0TH��5`0Z�G�ǀ:D��8�@0��� ����N.1�Ǔ��3�G��S^�`�&)4� ����5$��ca-������E����v������X�X�����`��S�Qg���C�a�v�%�h��"ݦs�F:|`�_b�G�hX0��"� � �V��#�H�^G�QG�4m��#b�L��AFa��=��!��YBԘSC��蘀ZMj�-�)c���	�Nj&���b鈰��]I�D�Z�tjU �AJ��d���K��~��;{��w)�����/�Z�      7   Q  x�͒ݎ�@���)���mbF�0��eA`\AEo� S�AT��G�;�=vߨؘ��^4�i�$�󓓜���-G���n�6�W~�A���d�Ct���Q֥rT�R���$�K8�j\�V(
\�]
�(J�T�R��J\�3��UV�>.>P��9U��R�Q�i�{�3�}�>ph���V�%6������T�ϸ�L��
���q��q!4:{��y~b��j�8ҭ6��������N�ǈ|�ٹ�^!�ϳ]�(a�MU]�s�;}9�|>",2wz��`I;�� ?-9O�T��8mn�^�+B3,��y�F2Гm(���Ǝ�||�H.�u_6�
�Ʀ�{����"d8���#)U�d� 1�O���p<��Y���PLcm,ƑTp���^Z�p���V��c�|� C6f1w�ݔ�c�cǽɰ±ڛ�%�|������9�j����y'PT���>'�D�B�}���@�8����;�m��#�7���v���5rl�Qh4�kg~L� �����?8��&�8`���J�н=7�I�P�	�i@r�Ϟ���7��r���df����������ww?X��      1   |  x��Z�o�~�_�	�*N���<	��p ���)Pe�& [�,�p�hʊ�J���O�[�i��N$O<���p�u�ٽ;�h�	��������7���~�������g����*��v�?��7�Z�=�x��������_��?��l���vy�������g�[�;����{�v�>�n����{�e�����ڝ{��k��gj�Ʋg��ݹ㙫�_�8饝$�?qz�ߤ��!%gI���$]��N�(	����ӤGsc~��y��;TL�==�1ch���*�%xJ�����/�H���*�i4�1�k�>	�cV'm'}'g��ħ��nzLc��7+U��+�B�U��>�c�kB/"{���'}�Ӄ�k7�X�s��xoY��K������$�?�φ3�WM�>-K�dB��4�G��H"��9=��S��S�Ͽ��a����iq+}�[�L2�H=~�j<$Q�����&��)"^v���W��4�MKUZ1K&��G���O˙��y�VL��{G"��I��H�Ӯ2��9�2}�gz��iqsH
Y�����W��aB��[��l~FSڲP��FGX#d׃��C�������!6T���Z��5:o�>F�a~�5�]�B�+�������ǋ٣h�T�Tl~e��n"<��o`�����+p���͊����i�D�/&y�#�Kxy��ߎI�A���x	�Mz������y*	!U���c��<���H?��ﶞr!��m���R�qo��|e a�|pU�.���<�#]�Tj @X��S������!���$�����Wn���^�]���I�z��X�.-�Vhd����\�ԫ�Z�K����ss�Q����G�&v':�&ڜ�q�F�v�VgP�3^�G��Y&��8J;���B�����wy����{���5�(v�����4a��S1�����Y��tg����5��W���e+@DGB��#~E����d����c^�c��"����PI���ط���A���t
?Ŗ���<�n��N2`�owy���K� �C1@�J�a���(�5��6yl<�]X"-�/�a0~�a�.�u��h����ɮ#H&�=;��Ǟ��9G�6@Ӷ�bj��G
�X���+�:��ȉ`I>A=�]~�9mH8IPA�|���;�������g�84bM��4~z ��T��f �V_�U++Օ�K�����F���8�2O�����2���Gq|R�J��1=��OC6���S�?e���PN$#N����:q��\]d>��x��m���÷${!�D�5�-}v/z+���a�N%��h���IJ(���=��ė%�+��D* ��T��1�`(��,Ϡ>����|
�+�<�I�.t�B���G��3: ����rf�B,���.�Œ�P$s�AgB��<���v�����p��f:'s��I�-��P��e8����DR��`ŰĊ*�+6�s <��4��> \��2(K��Np���3���D9+[��#ֲ�5QW|����\�bϐ:a�����y���Y`�3��dO�:��4[�ٸ̝?�}�mn��6����6shb�$�׬+�	���\�e q�P�/3�P� �1��� 
��0�u�53�.�U���"�-��P����ܜA�zc�y��Ԩ5!���7��(<!�p->(W]�S�X��t�1��j��v!�k�����B�yN� ~��2S�f��(�V�.��|�ʕ��/P�]Z��N�*QFzJ��{���@�s�®s+��z^�l�m�m�I�=q��>H1� ΍�C��u���-S��O
�Hr�M��瀛�ci�ǢL����D�  +
H���O�\Au�V��2���<�h�d��	�s̏K�̲B�L�����s��'�i��\c�ln!�P@ �5c���\<�,Ҫ��%��pr>��78��t�8;�}E��t=8Z�K[�ʣ��5*�'�!�Cd�,V"�Y����&]�k$�/���ʇȓ�,�p�&��0$E;���rXH�tn�����`�Ռͤqz(fS�^M�|$�E:gL	<���S�� a& u":P�K�FlP����6�"�h�ȅ�`9haa� M�6^ ]�b5��AOCM�Er+�;��m��O���w.\q�7��X6����{S6N��O}h�o=�r 1�	���N�}g�Բ���e5�f�s�D꺻����ݭ���ZOB��a�6HW���H�#�Ǚ�AFG_3�k�砼�C��H8�T���ȉb�kq��w2f3����lF�yMW���c2�y
?" K7�GDA���Z�G��u��Zi�z�����5~��3�����|hñ��= rI�;#$�H����3�r� f̰����A5�%�l=�}�!�2��"�vn#tw�$��wG��N��{�4���]W%�[�K��u �<�Ǌ��В-I4���-�6�R����G~{i���"3��RH=t@1�%��!q�˂�7�=^�4s(�?��P=b/��3�^kb��&ʩ��c�#O���ޞ|#e���%m�0 |�����?��N����.�.w����BQӶ�^��O��.]��n�])�+�g���͕��.������ØR煎B�$w#4i��2�=�M`%��_.�I��K�%n�xD��t��K/H�Ѳ�;���� ���I|͗�w��' �]�sjU+D��]�L)��1��/`R�Ӆ��4�.�Zݪ�Do^���P��yPX$T��H��o��P�޳qZf�P�	^�Wo�����@x��jE��W����!"�+v��g���k�x�H��ݸt'ry��{��G�*�0"ߛr{/.���T���Gڈ~�����XY�~.�"F+tw�`nn�_���|񠵿m�7���m������`.䕔.�ѳ׬>4Fh�hTv��?�l"��*�^������]��'�7n����{���1���޼��q�6-ȕ�Q��S���/=Je^�=�x�� }m��{�9���>�F*
�ܕ�,7,��cLoG}�����>d\f�8M�Y
 �Q\�д�6<B��r�Ys�?��"K��u�<0Ӂԛ�i��?� �����$)Å}w�Q��`0�o��BF��6��V���i�L��Ȋ@+�_&�T&�5�ԍ=�qjk!�</��\5�a¬��R�ԩP.�qi��R��?_��d��,\@�X�c8�[{N��)g��_&��J9�8X/=�H�5 5`����SE"���`Yn,` �bO�g2�Yɜ���[��Shs��J3?���ɻ��<(�pa��TJ�$adn��e�/�msTY��29GzA��꜏V�X�5Y��J��䁽�{=S��~=i=7��JM~��,�!��O$.w\�j���v�Ҕ��9W�uʙW���?ҙ      9   
   x���         