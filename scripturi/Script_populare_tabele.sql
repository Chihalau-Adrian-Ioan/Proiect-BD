--inserare in TEATRU_OPERATII
INSERT INTO teatru_de_operatii values ('Afganistan', 200, 4, 5, 1, 3);
INSERT INTO teatru_de_operatii values ('Irak', 300, 5, 2, 3, 3);
INSERT INTO teatru_de_operatii values ('Lulustan', 100, 6, 1, 1, 2);
INSERT INTO teatru_de_operatii values ('Siria', 500, 10, 10, 5, 10);
INSERT INTO teatru_de_operatii values ('Nigeria', 200, 4, 2, 0, 0);

--inserare in DEPOZIT
INSERT INTO depozit (locatie, tip_depozitat, durata_livrarii_ore) values ('Campulung', 'ECHIPAMENT_INFANTERIE', 2);
INSERT INTO depozit (locatie, tip_depozitat, durata_livrarii_ore) values ('Craiova', 'CAMION', 10);
INSERT INTO depozit (locatie, tip_depozitat, durata_livrarii_ore) values ('Mihail Kogalniceanu', 'AVION', 3);
INSERT INTO depozit (locatie, tip_depozitat, durata_livrarii_ore) values ('Brasov', 'TANC', 7);
INSERT INTO depozit (locatie, tip_depozitat, durata_livrarii_ore) values ('RESITA', 'VEHICUL_BLINDAT', 5);

--inserare in ARMAMENT_MILITAR
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('F-16 Block 70', 20, 'AVION');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament, descriere) values 
('Warrior', 10, 'VEHICUL_BLINDAT', 'Vehicul de lupta blindat pentru infanterie');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('M1A2 Abrams', 40, 'TANC');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('Arma de asalt calibru 5,45×39 MM', 5, 'ECHIPAMENT_INFANTERIE');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament, descriere) values 
('MMPV Type II', 10, 'CAMION', 'camion multi-rol(genistic, transport raniti, spital mobil, transport trupe)');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('F-35 Lightning II', 30, 'AVION');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament, descriere) values 
('CVR(T) "Scimitar" ', 15, 'VEHICUL_BLINDAT', 'Vehicul de recunoastere,echipat cu tunul RARDEN de 30mm');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('M1A1 MAIN BATTLE TANK', 30, 'TANC');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament, descriere) values 
('MITRALIERA CALIBRU 7,62X54R MM', 6, 'ECHIPAMENT_INFANTERIE', 'echipat cu bipod');
INSERT INTO armament_militar (denumire, nr_zile_achizitie, tip_armament) values 
('Cougar 4x4', 8, 'CAMION');

--inserare in CERERE_TEATRU_DEPOZIT
INSERT INTO cerere_teatru_depozit (dep_depozit_id_fk, mil_eqp_armament_id_fk, bucati_cerute,
data_trimiterii, data_terminarii, thr_ops_tara_fk) values
(2, 10, 20, SYSDATE, SYSDATE + 10/24, 'Siria');
INSERT INTO cerere_teatru_depozit (dep_depozit_id_fk, mil_eqp_armament_id_fk, bucati_cerute,
data_trimiterii, data_terminarii, thr_ops_tara_fk) values
(1, 4, 100, SYSDATE, SYSDATE + 2/24, 'Lulustan');
INSERT INTO cerere_teatru_depozit (dep_depozit_id_fk, mil_eqp_armament_id_fk, bucati_cerute,
data_trimiterii, data_terminarii, thr_ops_tara_fk) values
(5, 2, 10, SYSDATE, SYSDATE + 5/24, 'Irak');
INSERT INTO cerere_teatru_depozit (dep_depozit_id_fk, mil_eqp_armament_id_fk, bucati_cerute,
data_trimiterii, data_terminarii, thr_ops_tara_fk) values
(4, 3, 10, SYSDATE, SYSDATE + 7/24, 'Siria');
INSERT INTO cerere_teatru_depozit (dep_depozit_id_fk, mil_eqp_armament_id_fk, bucati_cerute,
data_trimiterii, data_terminarii, thr_ops_tara_fk) values
(3, 1, 5, SYSDATE, SYSDATE + 3/24, 'Siria');

--inserare in MAGAZIE
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (4, 1, 20000, 18000);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (9, 1, 10000, 9000);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (5, 2, 2000, 1500);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (10, 2, 3000, 2500);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (1, 3, 50, 40);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (6, 3, 30, 25);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (3, 4, 100, 75);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (8, 4, 200, 150);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (2, 5, 250, 200);
INSERT INTO magazie (MIL_EQP_ARMAMENT_ID_FK, DEP_DEPOZIT_ID_FK, nr_maxim_arme, arme_pastrate)
values (7, 5, 500, 400);

--inserare in ACHIZITIE_ECHIPAMENT
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (10, 2, 100, SYSDATE, SYSDATE + 8);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (5, 2, 200, SYSDATE, SYSDATE + 10);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (7, 5, 50, SYSDATE, SYSDATE + 15);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (3, 4, 10, SYSDATE, SYSDATE + 40);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (9, 1, 300, SYSDATE, SYSDATE + 6);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (1, 3, 3, SYSDATE, SYSDATE + 20);
INSERT INTO achizitie_armament (mil_eqp_armament_id_fk, dep_depozit_id_fk, nr_bucati, data_solicitarii, data_indeplinirii)
values (8, 4, 20, SYSDATE, SYSDATE + 30);

--inserare in FOLOSIRE_ARME(relational)
insert into folosire_arme values (1, 'Afganistan');
insert into folosire_arme values (7, 'Afganistan');
insert into folosire_arme values (8, 'Afganistan');
insert into folosire_arme values (9, 'Afganistan');
insert into folosire_arme values (4, 'Afganistan');
insert into folosire_arme values (5, 'Afganistan');

insert into folosire_arme values (6, 'Irak');
insert into folosire_arme values (2, 'Irak');
insert into folosire_arme values (3, 'Irak');
insert into folosire_arme values (4, 'Irak');
insert into folosire_arme values (9, 'Irak');
insert into folosire_arme values (10, 'Irak');
insert into folosire_arme values (5, 'Irak');

insert into folosire_arme values (1, 'Lulustan');
insert into folosire_arme values (3, 'Lulustan');
insert into folosire_arme values (6, 'Lulustan');
insert into folosire_arme values (2, 'Lulustan');
insert into folosire_arme values (10, 'Lulustan');
insert into folosire_arme values (4, 'Lulustan');

insert into folosire_arme values (6, 'Siria');
insert into folosire_arme values (7, 'Siria');
insert into folosire_arme values (3, 'Siria');
insert into folosire_arme values (9, 'Siria');
insert into folosire_arme values (4, 'Siria');
insert into folosire_arme values (10, 'Siria');
insert into folosire_arme values (5, 'Siria');

insert into folosire_arme values (4, 'Nigeria');
insert into folosire_arme values (9, 'Nigeria');
insert into folosire_arme values (5, 'Nigeria');
insert into folosire_arme values (2, 'Nigeria');

insert into detalii_depozit values (1, 'Strada Eroilor nr.3; Depozit destinat armamentelor usoare');
insert into detalii_depozit values (2, 'Depozit aflat langa fabrica militara de camioane');
insert into detalii_depozit values (3, 'Aflat in Aeroportul International "Mihail Kogalniceanu"');
insert into detalii_depozit values (4, 'STRICT SECRET');
insert into detalii_depozit values (5, 'Depozit de blindate din Marea Britanie');