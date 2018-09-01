use SITP

--TABLA PARADERO
create table paradero(
clave_p int,
nombre_p varchar(50),
ubicacion_p varchar(50),
constraint pk_cp primary key(clave_p)
)

-- TABLA BUS
create table bus(
clave_b int,
nom_b varchar(50),
tipo_b varchar(50),
constraint pk_cb primary key(clave_b)
)
-- TABLA CONDUCTOR
create table conductor(
id_conductor int,
primer_nom_c varchar(50),
segundo_nom_c varchar(50),
primer_ape_c varchar(50),
segundo_ape_c varchar(50),
tipo_doc_c varchar(50),
num_doc_c int,
constraint pk_cc primary key(id_conductor)
)
--TABLA RUTA
create table ruta(
clave_r int,
nom_r varchar(20),
ini_r varchar(20),
fin_r varchar(20),
clave_b1 int
constraint pk_cr primary key(clave_r),
constraint fk_cb1 foreign key(clave_b1) references bus (clave_b)
)
-- TABLA USUARIO USUARIO CON CLAVES FORANEAS DE PARADERO Y RUTA
create table usuarios(
id_usuario int,
primer_nom_u varchar(50),
segundo_nom_u varchar(50),
primer_ape_u varchar(50),
fecha_nac_u datetime,
condiccion varchar(50),
tipo_doc_u varchar(20),
num_doc_u varchar(20),
num_tar_SITP_u varchar(20),
clave_r1 int,
clave_p1 int,
constraint pk_cu primary key(id_usuario),
constraint fk_r1 foreign key(clave_r1) references ruta(clave_r),
constraint fk_p1 foreign key(clave_p1) references paradero(clave_p)
)
-- TABLAS PARADERO Y RUTA
create table rut_par(
clave_p2 int,
clave_r1 int,
constraint fk_p2 foreign key(clave_p2) references paradero(clave_p),
constraint fk_r1 foreign key(clave_r1) references ruta(clave_r)
)
-- TABLA BUS Y CONDUCTOR
create table bus_con(
clave_b2 int,
id_conductor1 int,
constraint fk_b2 foreign key(clave_b2) references bus(clave_b),
constraint fk_cc1 foreign key(id_conductor1) references conductor(id_conductor)
)