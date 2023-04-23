PGDMP     9    1                {            Shop    15.1    15.1 =    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
   TABLE DATA                 public          postgres    false    217   iC       5          0    25106    image 
   TABLE DATA                 public          postgres    false    219   �C       =          0    25168    order_person 
   TABLE DATA                 public          postgres    false    227   �G       ;          0    25151    orders 
   TABLE DATA                 public          postgres    false    225   �H       7          0    25113    person 
   TABLE DATA                 public          postgres    false    221   mJ       1          0    25070    product 
   TABLE DATA                 public          postgres    false    215   �L       9          0    25134    product_cart 
   TABLE DATA                 public          postgres    false    223   >Z       K           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    216            L           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 60, true);
          public          postgres    false    218            M           0    0    order_person_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_person_id_seq', 3, true);
          public          postgres    false    226            N           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 10, true);
          public          postgres    false    224            O           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 7, true);
          public          postgres    false    220            P           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 14, true);
          public          postgres    false    222            Q           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 26, true);
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
f�PG��9���N��wػ!Zm�q�8RB?+N�w�m�Hi�.u�`�Pw��@E�R ~�s^�2s;�\(���`&EE��p�	p9�s����n5IL����qP�Ť�X�*��|�x�3�s�kQ��P��`ΤT��4p�W��s.3�vN��*xj;	����RJ)��O�\gn爌"������fQ��9��'��3T.3�s�8���wRo�Z�QiaH}�x����-�\{A����WC?k%�:���,�������wHImgH���:��}+�&�-j|���[AMYcWbH�!�&aU��_&�%���f><����_      =     x��λj�@���O��mЈ���I�R�0b'���΂�7d��#�H��Iy8�mw���Amw�Wu����ח1��]e�]�j5�J�8I7'���~J2V�:�<oS��y~�ݐ�����}�W+�Ԓ41h�
C˦5XS������XB����`�IД��SL�E��ܑm�RX)�~Zl��˿���Xk�l��6YD���+!@4�@d����Xh�P�/���E_{���K�\��9��)C�I �w��K�^��ۻX|/��      ;   �  x���Mk�0��{>�nm�2ϛ�G�i����۵H��6	���'7%c�+�b,��-���~x���d�O����_6}�;�p4���1�3��<O��Ҙ��5�Cc��M_��)M�c��%���f��~��w���o?��-6��bb1�b��:O
tS�BJ>$�v�9Z	�m�6�
E����~��1��»/��2�Ȁ�QhC:
d�c�0:+I���Ƅ:� =�dw1�r��A1�5P�h9�|fpp��?�����"��c�@jZ�ِ!;�[L[�<X�wK5tL>%��d6�r����c���ʛ��Q�P������q6Pʞ��I�n�M:~b�^�1�%�nX0i��l������d����$2�ą�G�F�4����^�~�޴k      7   5  x���ю�0 ���
&q61�"f_�ATT�q|1�Vi� ���)��3���3��1M������ڮoM�vO��*�C���Ș�㦐fQ̚GEq���"�R�0I��%�8'E�Eq��dY$�k6#KV�ɿ3ÙZ�� 7��4f�:��^���𠠽*ѭi뀪j��SI��;�SQB �3E�Y�U{��A7�s��s���}����N�����;�?A��9/_ӽ���,�*��;ݗt$�!�;Ն�k>���щLTW�Ye���pKB������=tF�����:����2���4���8]�]<XCnA�v��e��JX�g;&[Q+�={ _`�>y*� rvvz�B�!��<���<}���
�E�\	��0�f�bS�S.�=��<���K�|t,3�UU��-q�8tP��
��P���
X�v�g�ZJ���:����v�ϑ�IN�b2[�6MP�qe_�7+l_��J�C��-���c�P�q�U�D��<�v�ώU7!IZ�~I�^�峰���������8�˪o�ļ���uI�*�j�Opw�@� 9      1   |  x��Z�o�~�_�	�*N���<	��p ���)Pe�& [�,�p�hʊ�J���O�[�i��N$O<���p�u�ٽ;�h�	��������7���~�������g����*��v�?��7�Z�=�x��������_��?��l���vy�������g�[�;����{�v�>�n����{�e�����ڝ{��k��gj�F�3��������/I���NП8=J��o�������$L��h�.Mh��I�ɅI��iң�1?�h�<��*&���ɘ�1��sz�<%LO�R�K$HqZ~��4��՘�5I���1����������e��JI7=��1�뛕*��g����i��1�5��=KH��>��A��K,�9�ъt��,�i�%��[��x��g�͆��F����L2�ub�ID$I���h�)�Ӄ�������~��������-M�
T��d5���X|�����/;IF�+ҁ�`٦�*��%�|�#�	}�����L�׼i+�I�#I�$�H�H�iWH�˜f���3=]������$�,��R���+�
�0�?t��-T�
6?�)mY�k`�#����A�!��M��K���Sox�F�?���`#Ͱ?���.K!��vz�{G����Q4~*~*6�����U7���70O�AC�8���f�@K}�4�w"��<C��%�<N��oǤ� �zF<����&=��`Ai��<���*}A���{�Kl�b��w[O�Y�6\Ab)丁7pd�2�0J>��H�myu��.F*5 ,C�)��b��T�p�Xm��+�Zx�ѮK��$O�Zo,V�k+4�Z]Ym.W��f�~���|��掹����H��f�ңw���d�m��C�Q;a+�3����#�ቬ�~@��UV�!���~�廼{��}�=`}ך�P;�t�il�0Dک�O�~}۬���o���xūq�Ĳ��#��������s�]C��1��1�eci	G_�$�x�[����B�:��bKB�W�F�JW'�����<U��%�  ǡ P%��Eo��}�z�<6��.,��H�0?��H�ֺ�x4i�ǀ�dW�$�՞h�c����#E�i[�V1�j�#�x,���mk��D�$� ���.���6$�$� N>���ssm����3l���@?=��	@��k3 R��֪�����%H�Fx[#��q������Jd������8>)m�Y���!�]��)vğ����m('��B�`O�8��.2	�N�E�6mz��[����a����>������y���m4���%����b�˒���Y" �X*D�g0Kj�gP�]^H\>�M�c��M�B�BI�#|��wM_�T�Af93z!t\|r�bIo(�9��3�c��� m����l�du8�K����{�ʖ{z(S�2��� ZE"��_�bXbE�����9 ��_�@`�.��B���^b'��@��bp����-��kY���+�R��y�Z�gH��K@� x�ټ�P�,0���
�'q�P@�-�l\�Ο�>�67�oJ[]~�94�o��k��
����`q��2����◙_(Y ��fl �rⅺ��b��*U�dƖ�y([�v]^n� n��ڼ^YjԚ��]	��� ������.�H�RP:��n�|�SJ��5���i�uM!�<�Y ?�l�)F
��G�f�]�b>��JW���Ɔ.����L'n�(#=�t罀�ZN �9Ga׹�|=�f6�6[�����8�p����c�F�!_aAٺ]WՖ���'�^$9�&@�s��б4�cQ�YQQE"w ��$LB��@����d+�{�M�tu�p��D2D�9��%afY��E&YR�i�����J����G��y6�
@( 1nd�R.�Yi�H���ym89@���\:P�؁�"WW��ʈ�-B��P�S���}�!2]+��,�G�@�.�5ė�ii�C��~�h�w�\I��Y�WO��,�V:7`Wds}��j�f�8=��T��i>�O�"�3����	zprҩ�mz�0�:��%A#6��{C��N�|�P4V��{
����c�&N/��m��tw����&�"
��������'�?H�;�8�Y�,��O�O��)
'q��>4~�7��f9���܄Z^�s^�ݾ3Kjٿ�@벚T��չ^"u��z����փg�{���@�S��+�|I�$���� � #������p�sP^��!p{$c*A�b�D�ݵ�8��;���}Ys6#׼�+��H�1�<���S�#� ��j����F�:�|�4O={Qio���?{��������>���G� ���ߝb$D@���Z�H 3fX���Ѡ�B����P�CZ;��;E\Ề#�s'o콇dISǮ���-�k�:�IcE�Gh��$�R�t�c)�F��#��4��m��\V)�:��`�U����e���/Q�9D�]r������v�5�x
h��e�1A��'�rdoO���
LO��6X�_^e��L�B'x��r�`�;C�HS��i�k/�[��^�.�]q7ˮ����3��h������Vl}�J_�aL���BG!�T����4AE����&�}�/�������%��Y<"D
|:W���$�hY�d	�Fp Y�	�$��Kλ���.�9���~�.@��Q�R�0)��B��fSM�nU{�7/S`\�|�<(,��e���7�a(z�َ8-�h����7}�A{r	 �_�e����+FX������^޳�y^�5c<P���n\��<���=��#Me���M����Y�yS*V��#mD?Wsb�vm�,e?@���|077��^}b�x���6��O�6w��R��|^0�JJ���kV#4C4*;�џR6��
C_�||ssm��������ƽ���{�wo�Z߸�K���`�(Q�)����2�֞����	 ����D�����v�p#w�JI���1�����Cw�b2� 3J��&���(.zhڇZ����9�9�HV�%B�:p��@�M�4W��U��\�@�g���¾���(�u0��7�S!#UO��Y+����I&R|dE��/u*ٚl�ƞ�8��k��h��0a֎�t)L�T(Ҹ��I�av˟��y�|]. },�1��=�����3��/�u�Q��xJZ���0��E��"�CRd�,70g�'����dN�d�-��)��V����od����RC�0GO�	�H�027nx͏�2��6�9��Zf��#� �ru�G+a,����l��S���
˽��WI�������J�&�	�T��W�'�;.M5��\�^i����+�:��+W�~OҘ      9   
   x���         