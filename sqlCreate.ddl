-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-08-06 11:43:17 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE accidente (
    id_accidente          INTEGER NOT NULL,
    hora                  DATE,
    fecha                 DATE,
    descripcion           VARCHAR2(500),
    gravedad_id_gravedad  INTEGER NOT NULL,
    persona_id_persona    INTEGER NOT NULL,
    asesoria_id_asesoria  INTEGER
);

CREATE UNIQUE INDEX accidente__idx ON
    accidente (
        asesoria_id_asesoria
    ASC );

ALTER TABLE accidente ADD CONSTRAINT accidente_pk PRIMARY KEY ( id_accidente );

CREATE TABLE actividad (
    idactividad         INTEGER NOT NULL,
    tema                VARCHAR2(200 CHAR),
    fecha               DATE,
    duracion            INTEGER,
    entregamaterial     CHAR(1),
    cliente_id_cliente  INTEGER NOT NULL,
    hora                DATE,
    cumplida            CHAR(1)
);

ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY ( idactividad );

CREATE TABLE asesoria (
    id_asesoria         INTEGER NOT NULL,
    tema                VARCHAR2(200),
    objetivo            VARCHAR2(500),
    fecha_solicitud     DATE,
    cliente_id_cliente  INTEGER NOT NULL,
    visita_id_visita    INTEGER
);

CREATE UNIQUE INDEX asesoria__idx ON
    asesoria (
        visita_id_visita
    ASC );

ALTER TABLE asesoria ADD CONSTRAINT asesoria_pk PRIMARY KEY ( id_asesoria );

CREATE TABLE atraso (
    id_atraso           INTEGER NOT NULL,
    notificacion        VARCHAR2(500) NOT NULL,
    cliente_id_cliente  INTEGER NOT NULL,
    monto                FLOAT(9)
);

ALTER TABLE atraso ADD CONSTRAINT atraso_pk PRIMARY KEY ( id_atraso );

CREATE TABLE capacitacion (
    id_capacitacion     INTEGER NOT NULL,
    descripcion         VARCHAR2(500),
    objetivo            VARCHAR2(200),
    fecha_solicitud     DATE,
    cliente_id_cliente  INTEGER NOT NULL,
    visita_id_visita    INTEGER
);

CREATE UNIQUE INDEX capacitacion__idx ON
    capacitacion (
        visita_id_visita
    ASC );

ALTER TABLE capacitacion ADD CONSTRAINT capacitacion_pk PRIMARY KEY ( id_capacitacion );

CREATE TABLE cliente (
    id_cliente          INTEGER NOT NULL,
    nombre              VARCHAR2(200),
    rut                 VARCHAR2(12),
    correo_electronico  VARCHAR2(200),
    direccion           VARCHAR2(200),
    comuna_id_comuna    INTEGER NOT NULL,
    numero_direccion    INTEGER
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE comuna (
    id_comuna         INTEGER NOT NULL,
    comuna            VARCHAR2(200),
    region_id_region  INTEGER NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE factura (
    id_factura          INTEGER NOT NULL,
    cliente_id_cliente  INTEGER NOT NULL,
    monto               FLOAT(9),
    descripcion         VARCHAR2(300 CHAR),
    fecha               DATE,
    atraso              CHAR(1)
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE gravedad (
    id_gravedad  INTEGER NOT NULL,
    nivel        VARCHAR2(10)
);

ALTER TABLE gravedad ADD CONSTRAINT gravedad_pk PRIMARY KEY ( id_gravedad );

CREATE TABLE persona (
    id_persona  INTEGER NOT NULL,
    nombre      VARCHAR2(200),
    apellido    VARCHAR2(200),
    edad        INTEGER
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE profesional (
    id_profesional  INTEGER NOT NULL,
    rut             VARCHAR2(12),
    nombre          VARCHAR2(100),
    apellido        VARCHAR2(100)
);

ALTER TABLE profesional ADD CONSTRAINT profesional_pk PRIMARY KEY ( id_profesional );

CREATE TABLE region (
    id_region  INTEGER NOT NULL,
    region     VARCHAR2(200)
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE rol (
    id_rol  INTEGER NOT NULL,
    rol     VARCHAR2(20)
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE usuario (
    id_usuario   INTEGER NOT NULL,
    usuario      VARCHAR2(20),
    contrasenia  VARCHAR2(100),
    estatus      INTEGER
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE visita (
    id_visita                     INTEGER NOT NULL,
    fecha_visita                  DATE,
    hora_visita                   DATE,
    duracion                      VARCHAR2(20),
    asesoria_id_asesoria          INTEGER,
    capacitacion_id_capacitacion  INTEGER
);

CREATE UNIQUE INDEX visita__idx ON
    visita (
        capacitacion_id_capacitacion
    ASC );

CREATE UNIQUE INDEX visita__idxv1 ON
    visita (
        asesoria_id_asesoria
    ASC );

ALTER TABLE visita ADD CONSTRAINT visita_pk PRIMARY KEY ( id_visita );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_asesoria_fk FOREIGN KEY ( asesoria_id_asesoria )
        REFERENCES asesoria ( id_asesoria );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_gravedad_fk FOREIGN KEY ( gravedad_id_gravedad )
        REFERENCES gravedad ( id_gravedad );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_visita_fk FOREIGN KEY ( visita_id_visita )
        REFERENCES visita ( id_visita );

ALTER TABLE atraso
    ADD CONSTRAINT atraso_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_visita_fk FOREIGN KEY ( visita_id_visita )
        REFERENCES visita ( id_visita );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_comuna_fk FOREIGN KEY ( comuna_id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( region_id_region )
        REFERENCES region ( id_region );

ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE visita
    ADD CONSTRAINT visita_asesoria_fk FOREIGN KEY ( asesoria_id_asesoria )
        REFERENCES asesoria ( id_asesoria );

ALTER TABLE visita
    ADD CONSTRAINT visita_capacitacion_fk FOREIGN KEY ( capacitacion_id_capacitacion )
        REFERENCES capacitacion ( id_capacitacion );


-- Secuencias 

CREATE SEQUENCE IDfactura_SEQ INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE IDatraso_SEQ INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE IDACTIVIDAD_SEQ INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE idPersona INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE idAccidente INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE idvisita_sequence MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE idcliente_sequence MINVALUE 1 START WITH 1 INCREMENT BY 1;
create sequence IDCAPACITACION increment by 1 start with 1;
CREATE SEQUENCE idAsesoria INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE idProfesional INCREMENT BY 1 START WITH 1; 

---------------------------------------------------------------
--Insert de prueba 

INSERT INTO profesional VALUES(idprofesional.NEXTVAL, '26733486-2', 'Jorge', 'Lopez');
INSERT INTO profesional VALUES(idprofesional.NEXTVAL, '26711234-f', 'Ramoón', 'Guzmán');
INSERT INTO profesional VALUES(idprofesional.NEXTVAL, '26345698-k', 'Pedro', 'Alvarado' );

INSERT INTO usuario VALUES(1,'Pedro', '$2y$12$Bj3Ph6bve2DFLi0Kc5ek2e710oaccRyaGLN71wuK/Du7m8wGRHsHK', 1);
INSERT INTO usuario VALUES(2,'Juan', '$2y$12$n/u/X2UKwn5UiE3f7b2OmePgJAweXpw0yMitH1XJPlUR45AL2GGRi', 1);
INSERT INTO usuario VALUES(3,'Diego', '$2y$12$IbB3B1di60CgmPDepq/6muksFEZcJ4Xle6xRkn.QOESa8w09H1zzq', 1);



INSERT INTO rol VALUES(1, 'Administrador');
INSERT INTO rol VALUES(2, 'Profesional');
INSERT INTO rol VALUES(3, 'Cliente');

INSERT INTO Gravedad VALUES(1, 'Grave');
INSERT INTO Gravedad VALUES(2, 'Medio');
INSERT INTO Gravedad VALUES(3, 'Leve');

INSERT INTO Region VALUES(1, 'Region Metropolitana');
INSERT INTO Region VALUES(2, 'Valparaiso');
INSERT INTO Region VALUES(3, 'Antofagasta');

INSERT INTO comuna VALUES(1, 'Ñuñoa', 1);
INSERT INTO comuna VALUES(2, 'Providencia', 1);
INSERT INTO comuna VALUES(3, 'Viña del mar', 2);
INSERT INTO comuna VALUES(4, 'Quintero', 2);
INSERT INTO comuna VALUES(5, 'Mejillones', 3);
INSERT INTO comuna VALUES(6, 'Taltal', 3);

INSERT INTO cliente VALUES(idcliente_sequence.NEXTVAL,'Daniela', '23123456-h', 'Daniela@gmial.com', 'Casa',1, 2334);
INSERT INTO cliente VALUES(idcliente_sequence.NEXTVAL,'Maximo', '28543654-3', 'Maximo@gmial.com', 'Casa',3, 4455);
INSERT INTO cliente VALUES(idcliente_sequence.NEXTVAL,'Viviana', '20345678-k', 'Viviana@gmial.com', 'Edificio',5, 5387);

INSERT INTO asesoria VALUES(idAsesoria.NEXTVAL, 'Qemaduras', 'Prevencion','21/07/20 15:45:46', 2, null);
INSERT INTO asesoria VALUES(idAsesoria.NEXTVAL, 'alerta laboral', 'Prevencion','21/07/20 18:45:00', 1, null);

INSERT INTO persona VALUES(idPersona.NEXTVAL, 'Alicia', 'Castro', 34);
INSERT INTO persona VALUES(idPersona.NEXTVAL, 'Javier', 'Gomez', 45);
INSERT INTO persona VALUES(idPersona.NEXTVAL, 'Raul', 'Hernandez', 87);

INSERT INTO accidente VALUES(idAccidente.NEXTVAL, '01/01/70 14:45:00', '01/01/70 14:45:00', 'Caida mismo nivel', 1, 3, null);
INSERT INTO accidente VALUES(idAccidente.NEXTVAL, '01/01/70 14:45:00', '01/01/70 14:45:00', 'Quemadura 3°',2, 2, 1);
INSERT INTO accidente VALUES(idAccidente.NEXTVAL, '01/01/70 14:45:00', '01/01/70 14:45:00', 'Impacto con herramineta',3, 1,2);

INSERT INTO actividad VALUES(IDACTIVIDAD_SEQ.nextval, 'primera', '04/08/20 17:04:28', 45, 0, 1, '04/08/20 17:04:28',1);
INSERT INTO actividad VALUES(IDACTIVIDAD_SEQ.nextval, 'seguna', '04/08/20 17:04:28', 60, 1, 1, '04/08/20 17:04:28',1);
INSERT INTO actividad VALUES(IDACTIVIDAD_SEQ.nextval, 'tercera', '04/08/20 17:04:28', 15, 1, 2, '04/08/20 17:04:28', 1);
INSERT INTO actividad VALUES(IDACTIVIDAD_SEQ.nextval, 'cuarta', '04/08/20 17:04:28', 60, 0, 3, '04/08/20 17:04:28',0);
INSERT INTO actividad VALUES(IDACTIVIDAD_SEQ.nextval, 'quinta', '04/08/20 17:04:28', 15, 1, 2, '04/08/20 17:04:28', 0);


INSERT INTO factura VALUES(IDFACTURA_SEQ.nextval, 1, 44, 'Asesoria especial', '01/01/70 14:45:00', 1);
INSERT INTO factura VALUES(IDFACTURA_SEQ.nextval, 2, 434, 'Mensualidad', '01/01/70 14:45:00', 0);



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             5
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
