create table TARA(
    id_tara number(2) not null primary key,
    nume varchar2(20) not null
    );
    
create sequence id_tara
start with 1
increment by 1;

insert into TARA (id_tara, nume)
values (id_tara.nextval, 'Romania');

insert into TARA (id_tara, nume)
values (id_tara.nextval, 'Germania');

insert into TARA (id_tara, nume)
values (id_tara.nextval, 'Franta');

insert into TARA (id_tara, nume)
values (id_tara.nextval, 'Anglia');

insert into TARA (id_tara, nume)
values (id_tara.nextval, 'Italia');

select * from tara;

create table NATIONALA(
    id_nationala number(2) not null primary key,
    id_tara number(2) not null,
    id_nationale number(2),
    nume varchar2(20) not null,
    nume_selectioner varchar2(20) not null,
    prenume_selectioner varchar2(20) not null,
    foreign key (id_tara) references TARA(id_tara),
    foreign key (id_nationale) references EUROPEAN_NATIONALE(id_nationale)
    );
    
insert into NATIONALA (id_nationala, id_tara, nume, nume_selectioner, prenume_selectioner)
values (25, 1, 'Nationala Romaniei', 'Iordanescu', 'Eduard');

insert into NATIONALA (id_nationala, id_tara, nume, nume_selectioner, prenume_selectioner)
values (4, 2, 'Nationala Germaniei', 'Hansi', 'Flick');

insert into NATIONALA (id_nationala, id_tara, nume, nume_selectioner, prenume_selectioner)
values (5, 3, 'Nationala Frantei', 'Didier', 'Deschamps');

insert into NATIONALA (id_nationala, id_tara, nume, nume_selectioner, prenume_selectioner)
values (1, 4, 'Nationala Angliei', 'Gareth', 'Southgate');

insert into NATIONALA (id_nationala, id_tara, nume, nume_selectioner, prenume_selectioner)
values (3, 5, 'Nationala Italiei', 'Roberto', 'Mancini');
        
        
create table ASOCIATIE(
    id_asociatie number(2) not null primary key,
    nume varchar2(30) not null
    );
    
insert into ASOCIATIE (id_asociatie, nume)
values (34, 'Federatia Romana de Fotbal'); 

insert into ASOCIATIE (id_asociatie, nume)
values (13, 'Federatia Germana de Fotbal'); 

insert into ASOCIATIE (id_asociatie, nume) 
values (23, 'Federatia Franceza de Fotbal');

insert into ASOCIATIE (id_asociatie, nume) 
values (7, 'Federatia Engleza de Fotbal');

insert into ASOCIATIE (id_asociatie, nume) 
values (4, 'Federatia Italiana de Fotbal');

    
create table CAMPIONAT_INTERN(
    id_campionat number(2) not null primary key,
    id_tara number(2) not null,
    id_asociatie number(2) not null,
    nume varchar2(20) not null,
    mod_desfasurare varchar(20) not null,
    data_inceput date,
    data_final date,
    foreign key (id_tara) references TARA(id_tara),
    foreign key (id_asociatie) references ASOCIATIE(id_asociatie)
    );
    
    
insert into CAMPIONAT_INTERN (id_campionat, id_tara, id_asociatie, nume, mod_desfasurare, data_inceput, data_final)
values (41, 1, 34, 'Liga 1', 'play', to_date('15/06/2021', 'DD/MM/YYYY'), to_date('24/05/2022', 'DD/MM/YYYY'));

insert into CAMPIONAT_INTERN (id_campionat, id_tara, id_asociatie, nume, mod_desfasurare, data_inceput, data_final)
values (20, 2, 13, 'Bundesliga', 'clasament', to_date('23/05/2021', 'DD/MM/YYYY'), to_date('15/06/2022', 'DD/MM/YYYY'));

insert into CAMPIONAT_INTERN (id_campionat, id_tara, id_asociatie, nume, mod_desfasurare, data_inceput, data_final)
values (18, 3, 23, 'Ligue 1', 'clasament', to_date('14/05/2021', 'DD/MM/YYYY'), to_date('19/05/2022', 'DD/MM/YYYY'));

insert into CAMPIONAT_INTERN (id_campionat, id_tara, id_asociatie, nume, mod_desfasurare, data_inceput, data_final)
values (3, 4, 7, 'Premier League', 'play', to_date('20/06/2021', 'DD/MM/YYYY'), to_date('30/05/2022', 'DD/MM/YYYY'));

insert into CAMPIONAT_INTERN (id_campionat, id_tara, id_asociatie, nume, mod_desfasurare, data_inceput, data_final)
values (26, 5, 4, 'Serie A', 'clasament', to_date('13/06/2021', 'DD/MM/YYYY'), to_date('22/05/2022', 'DD/MM/YYYY'));

select * from campionat_intern;
    
create table ETAPA(
    id_etapa number(3) not null primary key,
    id_campionat number(2) not null,
    numar_etapa number(2) not null,
    foreign key (id_campionat) references CAMPIONAT_INTERN(id_campionat)
    );

insert into ETAPA (id_etapa, id_campionat, numar_etapa)
values (100, 41, 1);

insert into ETAPA (id_etapa, id_campionat, numar_etapa)
values (101, 20, 2);

insert into ETAPA (id_etapa, id_campionat, numar_etapa)
values (102, 18, 3);

insert into ETAPA (id_etapa, id_campionat, numar_etapa)
values (103, 3, 4);

insert into ETAPA (id_etapa, id_campionat, numar_etapa)
values (104, 26, 5);

    
create table MECI(
    id_meci number(3) not null primary key,
    id_etapa number(3) not null,
    data date not null,
    foreign key (id_etapa) references ETAPA(id_etapa)
    );

insert into MECI (id_meci, id_etapa, data)
values (210, 100, to_date('13/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (211, 100, to_date('13/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (212, 101, to_date('15/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (213, 101, to_date('15/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (214, 102, to_date('18/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (215, 103, to_date('24/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (216, 104, to_date('25/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (217, 104, to_date('25/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (218, 104, to_date('25/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (219, 104, to_date('25/04/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (220, 104, to_date('25/05/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (221, 104, to_date('21/05/2022', 'DD/MM/YYYY'));

insert into MECI (id_meci, id_etapa, data)
values (222, 104, to_date('19/05/2022', 'DD/MM/YYYY'));

    
create table TELEVIZIUNE(
    id_televiziune number(2) not null primary key,
    nume varchar2(20) not null
    );
    
insert into TELEVIZIUNE (id_televiziune, nume)
values (30, 'Digi Sport');

insert into TELEVIZIUNE (id_televiziune, nume)
values (31, 'Look Sport');

insert into TELEVIZIUNE (id_televiziune, nume)
values (32, 'Telekom Sport');

    
create table ECHIPA(
    id_echipa number(2) not null primary key,
    id_campionat number (2) not null,
    id_stadion number(2) not null,
    nume varchar2(20) not null,
    nr_jucatori number(2) not null,
    foreign key (id_campionat) references CAMPIONAT_INTERN(id_campionat),
    foreign key (id_stadion) references STADION(id_stadion)
    );

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (1, 41, 30, 'CFR Cluj 1907', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (2, 41, 31, 'Fotbal Club FCSB', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (3, 41, 32, 'FC Rapid Bucuresti', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (4, 41, 33, 'FC Dinamo Bucuresti', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (5, 41, 34, 'Farul Constanta', 11);


-- Bundesliga:
insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (6, 20, 35, 'FC Bayern Munchen', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (7, 20, 36, 'Borussia Dortmund', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (8, 20, 37, 'Bayern Leverkusen', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (9, 20, 38, 'RB Leibzig', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (10, 20, 39, 'Union Berlin', 11);

-- Ligue 1:
insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (11, 18, 40, 'Paris Saint-Germain', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (12, 18, 41, 'AS Monaco FC', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (13, 18, 42, 'Olympique Maresille', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (14, 18, 43, 'FC Rennes', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (15, 18, 44, 'Strasbourg FC', 11);

-- Premier League
insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (16, 3, 45, 'Manchester United', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (17, 3, 46, 'Manchester City', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (18, 3, 47, 'Chelsea FC', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (19, 3, 48, 'Liverpool FC', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (20, 3, 49, 'Arsenal FC', 11);

-- Serie A
insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (21, 26, 50, 'AC Milan', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (22, 26, 51, 'Inter Milano', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (23, 26, 52, 'SSC Napoli', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (24, 26, 53, 'Juventus Torino', 11);

insert into ECHIPA (id_echipa, id_campionat, id_stadion, nume, nr_jucatori)
values (25, 26, 54, 'AS Roma', 11);

    
create table ANTRENOR(
    id_antrenor number(2) not null primary key,
    id_echipa number(2) not null,
    nume varchar2(20) not null,
    prenume varchar2(20) not null,
    pozitie varchar2(20) not null,
    foreign key (id_echipa) references ECHIPA(id_ehipa)
    );
    
insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (1, 1, 'Petrescu', 'Dan', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (2, 2, 'Petrea', 'Antnon', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (3, 3, 'Mutu', 'Adrian', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (4, 4, 'Uhrin', 'Dusan', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (5, 5, 'Hagi', 'Gheorghe', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (6, 6, 'Flick', 'Hansi', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (7, 7, 'Terzic', 'Edin', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (8, 8, 'Seoane', 'Gerardo', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (9, 9, 'Marsch', 'Jesse', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (10, 10, 'Bulter', 'Marius', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (11, 11, 'Pochettino', 'Mauricio', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (12, 12, 'Clement', 'Philipe', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (13, 13, 'Sampaoli', 'Jorge', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (14, 14, 'Stephan', 'Julien', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (15, 15, 'Wenger', 'Arsene', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (16, 16, 'Rangnick', 'Ralf', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (17, 17, 'Guardiola', 'Pep', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (18, 18, 'Tuchel', 'Thomas', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (19, 19, 'Klopp', 'Jurgen', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (20, 20, 'Arteta', 'Mikel', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (21, 21, 'Pioli', 'Stefano', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (22, 22, 'Inzaghi', 'Simone', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (23, 23, 'Napoli', 'Nicolo', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (24, 24, 'Allegri', 'Masimiliano', 'principal');

insert into ANTRENOR (id_antrenor, id_echipa, nume, prenume, pozitie)
values (25, 25, 'Mourinho', 'Jose', 'principal');    
    
    
create table SPONSOR(
    id_sponsor number(2) not null primary key,
    id_echipa number(2) not null,
    nume varchar2(20) not null,
    foreign key (id_echipa) references ECHIPA(id_echipa)
    );

insert into SPONSOR (id_sponsor, id_echipa, nume)
values (20, 1, 'eTORO');

insert into SPONSOR (id_sponsor, id_echipa, nume)
values (21, 2, 'City Insurance');

insert into SPONSOR (id_sponsor, id_echipa, nume)
values (22, 3, 'SUPERBET');

insert into SPONSOR (id_sponsor, id_echipa, nume)
values (23, 4, 'UNIBET');

insert into SPONSOR (id_sponsor, id_echipa, nume)
values (24, 5, 'Pepsi');

    
create table JUCATOR(
    id_jucator number(3) not null primary key,
    id_echipa number(2) not null,
    id_nationala number(2),
    nume varchar2(20) not null,
    prenume varchar2(20) not null,
    varsta number(2) not null,
    nationalitate varchar2(20) not null,
    post varchar2(20) not null,
    numar number(2) not null,
    foreign key (id_echipa) references ECHIPA(id_echipa),
    foreign key (id_nationala) references NATIONALA(id_nationala)
    );
    
insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (100, 1, 25, 'Deac', 'Ciprian', '35', 'roman', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (101, 2, 25, 'Tanase', 'Florin', '25', 'roman', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (102, 3, 25, 'Sapunaru', 'Cristian', '36', 'roman','fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (103, 4, 25, 'Steliano', 'Filip', '30', 'roman', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (104, 5, 25, 'Pitu', 'Alexi', '27', 'roman', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, nume, prenume, varsta, nationalitate, post, numar)
values (105, 2, 'Popescu', 'Ovidiu', 30, 'roman', 'mijlocas', 6);


create table EUROPEAN_CLUBURI(
    id_cluburi number(2) not null primary key,
    oras_finala varchar2(20) not null,
    nume varchar2(20) not null,
    data_inceput date not null,
    data_final date not null
    );
    
insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (1, 'Paris', 'Champions League', to_date('21/06/2021', 'DD/MM/YYYY'), to_date('10/06/2022', 'DD/MM/YYYY'));

insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (2, 'Sevilla', 'Europa League', to_date('15/06/2021', 'DD/MM/YYYY'), to_date('20/06/2022', 'DD/MM/YYYY'));


create table EUROPEAN_NATIONALE(
    id_nationale number(2) not null primary key,
    tara_gazda varchar2(20) not null,
    nume varchar2(20) not null,
    data_inceput date not null,
    data_final date not null
    );

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (1, 'Romania', 'EURO', to_date('11/06/2021', 'DD/MM/YYYY'), to_date('11/07/2021', 'DD/MM/YYYY'));

    
create table STADION(
    id_stadion number(2) not null primary key,
    nume varchar2(20) not null,
    oras varchar2(20) not null
    );
    
insert into STADION (id_stadion, nume, oras)
values (30, 'Gruia', 'Cluj');

insert into STADION (id_stadion, nume, oras)
values (31, 'Arena Nationala', 'Bucuresti');

insert into STADION (id_stadion, nume, oras)
values (32, 'Giulesti', 'Bucuresti');

insert into STADION (id_stadion, nume, oras)
values (33, 'Stefan cel Mare', 'Bucuresti');

insert into STADION (id_stadion, nume, oras)
values (34, 'Farul', 'Constanta');

insert into STADION (id_stadion, nume, oras)
values (35, 'Allianz Arena', 'Munchen');

insert into STADION (id_stadion, nume, oras)
values (36, 'Signal Iduna', 'Dortmund');

insert into STADION (id_stadion, nume, oras)
values (37, 'Bay Arena', 'Leverkusen');

insert into STADION (id_stadion, nume, oras)
values (38, 'Red Bull Arena', 'Leipzig');

insert into STADION (id_stadion, nume, oras)
values (39, 'Alten Forsterei', 'Berlin');

insert into STADION (id_stadion, nume, oras)
values (40, 'Parc des Princes', 'Paris');

insert into STADION (id_stadion, nume, oras)
values (41, 'Stade Louis II', 'Monaco');

insert into STADION (id_stadion, nume, oras)
values (42, 'Stade Velodrome', 'Marseille');

insert into STADION (id_stadion, nume, oras)
values (43, 'Roazhon Park', 'Rennes');

insert into STADION (id_stadion, nume, oras)
values (44, 'Stade de la Meinau', 'Strasbourg');

insert into STADION (id_stadion, nume, oras)
values (45, 'Old Trafford', 'Machester');

insert into STADION (id_stadion, nume, oras)
values (46, 'Etihad Stadium', 'Manchester');

insert into STADION (id_stadion, nume, oras)
values (47, 'Stamford Bridge', 'Londra');

insert into STADION (id_stadion, nume, oras)
values (48, 'Anfield', 'Liverpool');

insert into STADION (id_stadion, nume, oras)
values (49, 'Emirates Stadium', 'Londra');

insert into STADION (id_stadion, nume, oras)
values (50, 'Giuseppe Meazza', 'Milano');

insert into STADION (id_stadion, nume, oras)
values (51, 'Giuseppe Meazza', 'Milano');

insert into STADION (id_stadion, nume, oras)
values (52, 'Stadio San Paolo', 'Napoli');

insert into STADION (id_stadion, nume, oras)
values (53, 'Juventus Stadium', 'Torino');

insert into STADION (id_stadion, nume, oras)
values (54, 'Stadio Olimpico', 'Roma');

    
create table TELEVIZEAZA(
    id_meci number(3) not null,
    id_televiziune number(2) not null,
    constraint pk_televizeaza primary key (id_meci, id_televiziune)
    );
    
alter table TELEVIZEAZA add foreign key(id_meci) references MECI(id_meci);
alter table TELEVIZEAZA add foreign key(id_televiziune) references TELEVIZIUNE(id_televiziune);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (210, 30);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (211, 30);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (212, 30);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (213, 31);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (214, 31);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (215, 31);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (216, 32);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (217, 32);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (218, 32);

insert into TELEVIZEAZA (id_meci, id_televiziune)
values (219, 32);

create table JOACA(
    id_meci number(3) not null,
    id_echipa1 number(2) not null,
    id_echipa2 number(2) not null,
    constraint pk_joaca primary key (id_meci, id_echipa1, id_echipa2)
    );
    
alter table JOACA add foreign key (id_meci) references MECI(id_meci);
alter table JOACA add foreign key (id_echipa1) references ECHIPA(id_echipa);
alter table JOACA add foreign key (id_echipa2) references ECHIPA(id_echipa);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 1, 2);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 3, 5);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 6, 8);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 7, 9);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 11, 14);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 12, 13);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 15, 16);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 17, 18);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 20, 22);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (210, 21, 23);


create table PARTICIPA(
    id_cluburi number(2) not null,
    id_echipa number(2) not null,
    constraint pk_participa primary key(id_cluburi, id_echipa)
    );

alter table PARTICIPA add foreign key (id_cluburi) references EUROPEAN_CLUBURI(id_cluburi);
alter table PARTICIPA add foreign key (id_echipa) references ECHIPA(id_echipa);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 1);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 2);

insert into PARTICIPA (id_cluburi, id_echipa)
values (2, 3);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 5);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 6);

insert into PARTICIPA (id_cluburi, id_echipa)
values (2, 7);

insert into PARTICIPA (id_cluburi, id_echipa)
values (2, 8);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 10);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 11);

insert into PARTICIPA (id_cluburi, id_echipa)
values (1, 12);
