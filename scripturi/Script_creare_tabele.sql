-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-12-22 17:36:00 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE achizitie_armament (
    achizitie_id            INTEGER NOT NULL,
    mil_eqp_armament_id_fk  INTEGER NOT NULL,
    dep_depozit_id_fk       INTEGER NOT NULL,
    nr_bucati               INTEGER NOT NULL,
    data_solicitarii        DATE NOT NULL,
    data_indeplinirii       DATE
)
LOGGING;

ALTER TABLE achizitie_armament ADD CONSTRAINT data_indeplinirii_chk CHECK ( data_indeplinirii > data_solicitarii );

ALTER TABLE achizitie_armament ADD CONSTRAINT achizitie_armament_pk PRIMARY KEY ( achizitie_id );

CREATE TABLE armament_militar (
    armament_id        INTEGER NOT NULL,
    denumire           VARCHAR2(100) NOT NULL,
    nr_zile_achizitie  INTEGER NOT NULL,
    tip_armament       VARCHAR2(30) NOT NULL,
    descriere          VARCHAR2(300)
)
LOGGING;

ALTER TABLE armament_militar ADD CHECK ( nr_zile_achizitie BETWEEN 1 AND 365 );

ALTER TABLE armament_militar
    ADD CONSTRAINT tip_arma CHECK ( tip_armament IN ( 'AVION', 'CAMION', 'ECHIPAMENT_INFANTERIE', 'TANC', 'VEHICUL_BLINDAT' ) );

ALTER TABLE armament_militar ADD CONSTRAINT armament_militar_pk PRIMARY KEY ( armament_id );

ALTER TABLE armament_militar ADD CONSTRAINT mil_eqp_denumire_un UNIQUE ( denumire );

CREATE TABLE cerere_teatru_depozit (
    cerere_teatru_id        INTEGER NOT NULL,
    thr_ops_tara_fk         VARCHAR2(30) NOT NULL,
    dep_depozit_id_fk       INTEGER NOT NULL,
    mil_eqp_armament_id_fk  INTEGER NOT NULL,
    bucati_cerute           INTEGER NOT NULL,
    data_trimiterii         DATE NOT NULL,
    data_terminarii         DATE
)
LOGGING;

ALTER TABLE cerere_teatru_depozit ADD CONSTRAINT demand_date_chk CHECK ( data_terminarii > data_trimiterii );

ALTER TABLE cerere_teatru_depozit ADD CONSTRAINT cerere_teatru_depozit_pk PRIMARY KEY ( cerere_teatru_id );

CREATE TABLE depozit (
    depozit_id           INTEGER NOT NULL,
    locatie              VARCHAR2(100) NOT NULL,
    tip_depozitat        VARCHAR2(30) NOT NULL,
    durata_livrarii_ore  INTEGER NOT NULL
)
LOGGING;

ALTER TABLE depozit
    ADD CONSTRAINT tip_pastrat CHECK ( tip_depozitat IN ( 'AVION', 'CAMION', 'ECHIPAMENT_INFANTERIE', 'TANC', 'VEHICUL_BLINDAT' ) );

ALTER TABLE depozit ADD CONSTRAINT depozit_pk PRIMARY KEY ( depozit_id );

CREATE TABLE detalii_depozit (
    dep_depozit_id_fk  INTEGER NOT NULL,
    descriere          VARCHAR2(300) NOT NULL
)
LOGGING;

ALTER TABLE detalii_depozit ADD CONSTRAINT detalii_depozit_pk PRIMARY KEY ( dep_depozit_id_fk );

CREATE TABLE folosire_arme (
    mil_eqp_armament_id_fk  INTEGER NOT NULL,
    thr_ops_tara_fk         VARCHAR2(30) NOT NULL
)
LOGGING;

ALTER TABLE folosire_arme ADD CONSTRAINT folosire_arme_pk PRIMARY KEY ( mil_eqp_armament_id_fk,
                                                                        thr_ops_tara_fk );

CREATE TABLE magazie (
    magazie_id              INTEGER NOT NULL,
    dep_depozit_id_fk       INTEGER NOT NULL,
    nr_maxim_arme           INTEGER NOT NULL,
    arme_pastrate           INTEGER NOT NULL,
    mil_eqp_armament_id_fk  INTEGER NOT NULL
)
LOGGING;

ALTER TABLE magazie ADD CONSTRAINT maxim_non_0 CHECK ( nr_maxim_arme != 0 );

ALTER TABLE magazie ADD CONSTRAINT nr_arme CHECK ( arme_pastrate <= nr_maxim_arme );

ALTER TABLE magazie ADD CONSTRAINT magazie_pk PRIMARY KEY ( magazie_id );

CREATE TABLE teatru_de_operatii (
    tara       VARCHAR2(30) NOT NULL,
    nr_eq_inf  INTEGER DEFAULT 0 NOT NULL,
    nr_cm      INTEGER DEFAULT 0 NOT NULL,
    nr_apc     INTEGER DEFAULT 0 NOT NULL,
    nr_tnk     INTEGER DEFAULT 0 NOT NULL,
    nr_avi     INTEGER DEFAULT 0 NOT NULL
)
LOGGING;

ALTER TABLE teatru_de_operatii
    ADD CONSTRAINT tara_chk CHECK ( NOT REGEXP_LIKE ( tara,
                                                      '[0-9 ]' ) );

ALTER TABLE teatru_de_operatii ADD CONSTRAINT teatru_de_operatii_pk PRIMARY KEY ( tara );

ALTER TABLE achizitie_armament
    ADD CONSTRAINT achizitie_armament_dep_fk FOREIGN KEY ( dep_depozit_id_fk )
        REFERENCES depozit ( depozit_id )
    NOT DEFERRABLE;

ALTER TABLE achizitie_armament
    ADD CONSTRAINT achizitie_armament_mil_eqp_fk FOREIGN KEY ( mil_eqp_armament_id_fk )
        REFERENCES armament_militar ( armament_id )
    NOT DEFERRABLE;

ALTER TABLE detalii_depozit
    ADD CONSTRAINT dep_det_dep_fk FOREIGN KEY ( dep_depozit_id_fk )
        REFERENCES depozit ( depozit_id )
    NOT DEFERRABLE;

ALTER TABLE folosire_arme
    ADD CONSTRAINT folosire_arme_mil_eqp_fk FOREIGN KEY ( mil_eqp_armament_id_fk )
        REFERENCES armament_militar ( armament_id )
    NOT DEFERRABLE;

ALTER TABLE folosire_arme
    ADD CONSTRAINT folosire_arme_thr_ops_fk FOREIGN KEY ( thr_ops_tara_fk )
        REFERENCES teatru_de_operatii ( tara )
    NOT DEFERRABLE;

ALTER TABLE magazie
    ADD CONSTRAINT magazie_dep_fk FOREIGN KEY ( dep_depozit_id_fk )
        REFERENCES depozit ( depozit_id )
    NOT DEFERRABLE;

ALTER TABLE magazie
    ADD CONSTRAINT magazie_mil_eqp_fk FOREIGN KEY ( mil_eqp_armament_id_fk )
        REFERENCES armament_militar ( armament_id )
    NOT DEFERRABLE;

ALTER TABLE cerere_teatru_depozit
    ADD CONSTRAINT wpn_dmd_dep_fk FOREIGN KEY ( dep_depozit_id_fk )
        REFERENCES depozit ( depozit_id )
    NOT DEFERRABLE;

ALTER TABLE cerere_teatru_depozit
    ADD CONSTRAINT wpn_dmd_mil_eqp_fk FOREIGN KEY ( mil_eqp_armament_id_fk )
        REFERENCES armament_militar ( armament_id )
    NOT DEFERRABLE;

ALTER TABLE cerere_teatru_depozit
    ADD CONSTRAINT wpn_dmd_thr_ops_fk FOREIGN KEY ( thr_ops_tara_fk )
        REFERENCES teatru_de_operatii ( tara )
    NOT DEFERRABLE;

CREATE SEQUENCE achizitie_armament_achizitie_i START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER achizitie_armament_achizitie_i BEFORE
    INSERT ON achizitie_armament
    FOR EACH ROW
    WHEN ( new.achizitie_id IS NULL )
BEGIN
    :new.achizitie_id := achizitie_armament_achizitie_i.nextval;
END;
/

CREATE SEQUENCE mil_eqp_armament_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mil_eqp_armament_id_trg BEFORE
    INSERT ON armament_militar
    FOR EACH ROW
    WHEN ( new.armament_id IS NULL )
BEGIN
    :new.armament_id := mil_eqp_armament_id_seq.nextval;
END;
/

CREATE SEQUENCE wpn_dmd_cerere_teatru_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER wpn_dmd_cerere_teatru_id_trg BEFORE
    INSERT ON cerere_teatru_depozit
    FOR EACH ROW
    WHEN ( new.cerere_teatru_id IS NULL )
BEGIN
    :new.cerere_teatru_id := wpn_dmd_cerere_teatru_id_seq.nextval;
END;
/

CREATE SEQUENCE dep_depozit_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dep_depozit_id_trg BEFORE
    INSERT ON depozit
    FOR EACH ROW
    WHEN ( new.depozit_id IS NULL )
BEGIN
    :new.depozit_id := dep_depozit_id_seq.nextval;
END;
/

CREATE SEQUENCE magazie_magazie_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER magazie_magazie_id_trg BEFORE
    INSERT ON magazie
    FOR EACH ROW
    WHEN ( new.magazie_id IS NULL )
BEGIN
    :new.magazie_id := magazie_magazie_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
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
-- CREATE SEQUENCE                          5
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
