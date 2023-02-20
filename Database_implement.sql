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
    
insert into NATIONALA (id_nationala, id_tara, id_nationale, nume, nume_selectioner, prenume_selectioner)
values (25, 1, 1, 'Nationala Romaniei', 'Iordanescu', 'Eduard');

insert into NATIONALA (id_nationala, id_tara, id_nationale, nume, nume_selectioner, prenume_selectioner)
values (4, 2, 1, 'Nationala Germaniei', 'Hansi', 'Flick');

insert into NATIONALA (id_nationala, id_tara, id_nationale, nume, nume_selectioner, prenume_selectioner)
values (5, 3, 1, 'Nationala Frantei', 'Didier', 'Deschamps');

insert into NATIONALA (id_nationala, id_tara, id_nationale, nume, nume_selectioner, prenume_selectioner)
values (1, 4, 1, 'Nationala Angliei', 'Gareth', 'Southgate');

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

insert into TELEVIZIUNE (id_televiziune, nume)
values(33, 'Prima Sport');

insert into TELEVIZIUNE(id_televiziune, nume)
values(34, 'Orange Sport');

    
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
    id_echipa number(2),
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

insert into SPONSOR (id_sponsor, id_echipa, nume)
values(25, null, 'Nike');
    
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
values (109, 1, 3, 'Ibrahimovici', 'Kylian', 27, 'francez', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (110, 1, 3, 'Deac', 'Ciprian', 28, 'german', 'atacant', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (111, 1, 3, 'Maftei', 'Andrei', 22, 'italian', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (112, 1, 3, 'Petrescu', 'Kylian', 35, 'englez', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (113, 1, 3, 'Neymar', 'Valentin', 24, 'german', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (114, 1, 3, 'Foden', 'Zlatan', 21, 'englez', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (115, 1, 3, 'Kostic', 'Dorin', 25, 'italian', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (116, 1, 3, 'Deac', 'Gheorghe', 22, 'roman', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (117, 1, 3, 'Maxim', 'Andrei', 18, 'francez', 'fundas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (118, 1, 3, 'Fernandes', 'Dembele', 21, 'roman', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (119, 1, 3, 'Haland', 'Adrian', 29, 'roman', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (120, 2, 1, 'Maxim', 'Dorin', 25, 'englez', 'portar', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (121, 2, 1, 'Popa', 'Dumiter', 24, 'englez', 'portar', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (122, 2, 1, 'Raum', 'Kylian', 23, 'italian', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (123, 2, 1, 'Popescu', 'Ilie', 32, 'german', 'atacant', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (124, 2, 1, 'Radunovic', 'Joao', 27, 'francez', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (125, 2, 1, 'Marica', 'Sebastian', 25, 'francez', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (126, 2, 1, 'Tamas', 'Lionel', 32, 'german', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (127, 2, 1, 'Fabinho', 'Emanuel', 33, 'roman', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (128, 2, 1, 'Maxim', 'Antoine', 33, 'englez', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (129, 2, 1, 'Radunovic', 'Denis', 34, 'francez', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (130, 2, 1, 'Marica', 'Dumiter', 32, 'francez', 'portar', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (131, 3, 3, 'Goian', 'Sadio', 20, 'francez', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (132, 3, 3, 'Marica', 'Phil', 31, 'roman', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (133, 3, 3, 'Fabinho', 'Valentin', 19, 'german', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (134, 3, 3, 'Foden', 'Dembele', 25, 'francez', 'atacant', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (135, 3, 3, 'Ronaldo', 'Cristian', 24, 'german', 'atacant', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (136, 3, 3, 'Popescu', 'Ianis', 31, 'englez', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (137, 3, 3, 'Kante', 'Emanuel', 26, 'german', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (138, 3, 3, 'Raum', 'Andrei', 35, 'roman', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (139, 3, 3, 'Ibrahimovici', 'Emanuel', 25, 'german', 'fundas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (140, 3, 3, 'Mbappe', 'Kylian', 25, 'francez', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (141, 3, 3, 'Deac', 'Denis', 34, 'roman', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (142, 4, 3, 'Messi', 'Denis', 18, 'francez', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (143, 4, 3, 'Kante', 'Adriano', 23, 'italian', 'fundas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (144, 4, 3, 'Foden', 'Emanuel', 18, 'german', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (145, 4, 3, 'Ronaldo', 'Denis', 33, 'italian', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (146, 4, 3, 'Tanase', 'Fabio', 29, 'italian', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (147, 4, 3, 'Gardos', 'Ovidiu', 30, 'italian', 'portar', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (148, 4, 3, 'Burca', 'Ciprian', 29, 'francez', 'atacant', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (149, 4, 3, 'Mitrea', 'Valentin', 35, 'francez', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (150, 4, 3, 'Popa', 'Matei', 27, 'german', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (151, 4, 3, 'Deac', 'David', 27, 'german', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (152, 4, 3, 'Burca', 'Zlatan', 25, 'roman', 'portar', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (153, 5, 4, 'Messi', 'Cristiano', 18, 'german', 'fundas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (154, 5, 4, 'Mbappe', 'Teodor', 30, 'german', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (155, 5, 4, 'Manea', 'Ovidiu', 33, 'german', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (156, 5, 4, 'Burca', 'Sadio', 31, 'german', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (157, 5, 4, 'Soarez', 'Cristiano', 24, 'roman', 'atacant', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (158, 5, 4, 'Hagi', 'Fabio', 24, 'roman', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (159, 5, 4, 'Hagi', 'Dumiter', 28, 'roman', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (160, 5, 4, 'Maftei', 'Fabio', 31, 'francez', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (161, 5, 4, 'Ronaldo', 'Adriano', 27, 'italian', 'fundas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (162, 5, 4, 'Mitrea', 'Sebastian', 32, 'englez', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (163, 5, 4, 'Fernandes', 'Gheorghe', 22, 'roman', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (164, 6, 25, 'Popescu', 'Denis', 19, 'francez', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (165, 6, 25, 'Marica', 'Cristiano', 22, 'german', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (166, 6, 25, 'Radoi', 'David', 31, 'italian', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (167, 6, 25, 'Burca', 'Daniel', 25, 'francez', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (168, 6, 25, 'Mutu', 'Phil', 27, 'german', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (169, 6, 25, 'Maftei', 'Antoine', 21, 'englez', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (170, 6, 25, 'Ronaldo', 'Fabio', 25, 'italian', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (171, 6, 25, 'Goian', 'James', 35, 'german', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (172, 6, 25, 'Dele', 'Zlatan', 30, 'roman', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (173, 6, 25, 'Man', 'Daniel', 28, 'englez', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (174, 6, 25, 'Maxim', 'Ilie', 31, 'francez', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (175, 7, 5, 'Dele', 'Vasile', 18, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (176, 7, 5, 'Burca', 'Matei', 34, 'italian', 'fundas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (177, 7, 5, 'Diaz', 'Dembele', 24, 'francez', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (178, 7, 5, 'Diaz', 'Fabio', 26, 'italian', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (179, 7, 5, 'Karius', 'Adriano', 18, 'roman', 'atacant', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (180, 7, 5, 'Marica', 'Cristian', 20, 'german', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (181, 7, 5, 'Ronaldo', 'Ciprian', 30, 'englez', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (182, 7, 5, 'Maxim', 'James', 24, 'italian', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (183, 7, 5, 'Kostic', 'Ovidiu', 35, 'roman', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (184, 7, 5, 'Mane', 'Alli', 24, 'roman', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (185, 7, 5, 'Maxim', 'Romica', 28, 'francez', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (186, 8, 25, 'Marica', 'Adriano', 23, 'roman', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (187, 8, 25, 'Mbappe', 'Zlatan', 30, 'francez', 'atacant', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (188, 8, 25, 'Dele', 'Gheorghe', 35, 'german', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (189, 8, 25, 'Dumitrescu', 'Teodor', 29, 'german', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (190, 8, 25, 'Karius', 'Teodor', 24, 'francez', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (191, 8, 25, 'Ibrahimovici', 'Zlatan', 24, 'italian', 'atacant', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (192, 8, 25, 'Salah', 'Ilie', 17, 'francez', 'atacant', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (193, 8, 25, 'Mitrea', 'Cristiano', 20, 'german', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (194, 8, 25, 'Maftei', 'Dorin', 28, 'german', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (195, 8, 25, 'Foden', 'Denis', 32, 'german', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (196, 8, 25, 'Salah', 'Ianis', 18, 'francez', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (197, 9, 5, 'Burca', 'Teodor', 30, 'francez', 'portar', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (198, 9, 5, 'Salah', 'Fabio', 32, 'englez', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (199, 9, 5, 'Popescu', 'Fabio', 21, 'italian', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (200, 9, 5, 'Tamas', 'James', 22, 'roman', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (201, 9, 5, 'Mutu', 'Gheorghe', 20, 'german', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (202, 9, 5, 'Maftei', 'Adrian', 26, 'roman', 'portar', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (203, 9, 5, 'Salah', 'Lionel', 29, 'italian', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (204, 9, 5, 'Soarez', 'Teodor', 30, 'german', 'atacant', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (205, 9, 5, 'Kante', 'Gheorghe', 22, 'italian', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (206, 9, 5, 'Fernandes', 'Andrei', 35, 'italian', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (207, 9, 5, 'Haland', 'Dumiter', 31, 'englez', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (208, 10, 1, 'Hagi', 'Adrian', 29, 'roman', 'portar', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (209, 10, 1, 'Deac', 'Joao', 26, 'francez', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (210, 10, 1, 'Kante', 'Dumiter', 27, 'francez', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (211, 10, 1, 'Deac', 'Daniel', 19, 'italian', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (212, 10, 1, 'Fernandes', 'N`golo', 21, 'francez', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (213, 10, 1, 'Radoi', 'Valentin', 31, 'francez', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (214, 10, 1, 'Tanase', 'Phil', 30, 'italian', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (215, 10, 1, 'Raum', 'Robert', 35, 'german', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (216, 10, 1, 'Popescu', 'David', 18, 'roman', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (217, 10, 1, 'Fernandes', 'Zlatan', 19, 'italian', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (218, 10, 1, 'Mane', 'Felix', 35, 'francez', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (219, 11, 25, 'Davies', 'Valentin', 28, 'italian', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (220, 11, 25, 'Karius', 'Romica', 34, 'roman', 'fundas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (221, 11, 25, 'Burca', 'Ovidiu', 34, 'francez', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (222, 11, 25, 'Fabinho', 'Matei', 19, 'german', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (223, 11, 25, 'Messi', 'James', 33, 'german', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (224, 11, 25, 'Mutu', 'Romica', 18, 'german', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (225, 11, 25, 'Haland', 'Alli', 21, 'italian', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (226, 11, 25, 'Radunovic', 'Lionel', 18, 'francez', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (227, 11, 25, 'Petrescu', 'N`golo', 17, 'englez', 'fundas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (228, 11, 25, 'Dele', 'Ovidiu', 23, 'italian', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (229, 11, 25, 'Mbappe', 'Ovidiu', 20, 'german', 'portar', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (230, 12, 4, 'Ronaldo', 'Kylian', 21, 'italian', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (231, 12, 4, 'Petrescu', 'James', 25, 'roman', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (232, 12, 4, 'Burca', 'Dumiter', 18, 'francez', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (233, 12, 4, 'Salah', 'Adrian', 21, 'italian', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (234, 12, 4, 'Foden', 'Dorin', 34, 'german', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (235, 12, 4, 'Mane', 'Zlatan', 31, 'italian', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (236, 12, 4, 'Karius', 'Gheorghe', 29, 'italian', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (237, 12, 4, 'Dumitrescu', 'Matei', 19, 'englez', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (238, 12, 4, 'Maxim', 'Adriano', 18, 'italian', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (239, 12, 4, 'Petrescu', 'Daniel', 25, 'francez', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (240, 12, 4, 'Popescu', 'Dembele', 23, 'german', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (241, 13, 5, 'Marica', 'Kylian', 30, 'italian', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (242, 13, 5, 'Soarez', 'Zlatan', 29, 'francez', 'portar', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (243, 13, 5, 'Maxim', 'Zlatan', 25, 'francez', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (244, 13, 5, 'Karius', 'Dembele', 20, 'francez', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (245, 13, 5, 'Marica', 'Romica', 35, 'italian', 'atacant', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (246, 13, 5, 'Radoi', 'Emanuel', 34, 'german', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (247, 13, 5, 'Popa', 'James', 28, 'englez', 'atacant', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (248, 13, 5, 'Radunovic', 'Antoine', 34, 'italian', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (249, 13, 5, 'Popa', 'Ciprian', 22, 'german', 'fundas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (250, 13, 5, 'Karius', 'Antoine', 35, 'roman', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (251, 13, 5, 'Mutu', 'Cristiano', 23, 'englez', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (252, 14, 1, 'Deac', 'Sadio', 26, 'german', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (253, 14, 1, 'Tamas', 'Adrian', 19, 'englez', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (254, 14, 1, 'Mane', 'Erling', 22, 'german', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (255, 14, 1, 'Radunovic', 'Sadio', 27, 'roman', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (256, 14, 1, 'Foden', 'Cristiano', 20, 'englez', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (257, 14, 1, 'Deac', 'Erling', 30, 'german', 'fundas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (258, 14, 1, 'Dele', 'Paul', 22, 'francez', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (259, 14, 1, 'Dele', 'Phil', 17, 'italian', 'atacant', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (260, 14, 1, 'Dumitrescu', 'Erling', 22, 'roman', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (261, 14, 1, 'Foden', 'Ciprian', 22, 'englez', 'atacant', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (262, 14, 1, 'Karius', 'Robert', 24, 'roman', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (263, 15, 4, 'Tamas', 'Ovidiu', 28, 'englez', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (264, 15, 4, 'Salah', 'Cristian', 22, 'englez', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (265, 15, 4, 'Kante', 'Ciprian', 27, 'roman', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (266, 15, 4, 'Popa', 'Emanuel', 34, 'italian', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (267, 15, 4, 'Manea', 'Dembele', 33, 'italian', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (268, 15, 4, 'Soarez', 'Antoine', 30, 'englez', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (269, 15, 4, 'Radunovic', 'Dembele', 28, 'italian', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (270, 15, 4, 'Fabinho', 'Fabio', 18, 'francez', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (271, 15, 4, 'Salah', 'Romica', 19, 'roman', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (272, 15, 4, 'Hagi', 'James', 34, 'francez', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (273, 15, 4, 'Davies', 'Erling', 21, 'englez', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (274, 16, 25, 'Dumitrescu', 'Ianis', 28, 'englez', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (275, 16, 25, 'Neymar', 'Antoine', 27, 'italian', 'fundas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (276, 16, 25, 'Mutu', 'Matei', 17, 'german', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (277, 16, 25, 'Man', 'Alli', 35, 'englez', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (278, 16, 25, 'Haland', 'Gheorghe', 31, 'roman', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (279, 16, 25, 'Messi', 'Valentin', 29, 'italian', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (280, 16, 25, 'Deac', 'Andrei', 21, 'roman', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (281, 16, 25, 'Maxim', 'Lionel', 24, 'englez', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (282, 16, 25, 'Hagi', 'Daniel', 32, 'german', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (283, 16, 25, 'Goian', 'Valentin', 26, 'italian', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (284, 16, 25, 'Soarez', 'Dumiter', 17, 'italian', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (285, 17, 25, 'Fernandes', 'Teodor', 21, 'englez', 'portar', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (286, 17, 25, 'Soarez', 'Robert', 31, 'italian', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (287, 17, 25, 'Man', 'N`golo', 25, 'roman', 'portar', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (288, 17, 25, 'Tanase', 'James', 31, 'german', 'portar', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (289, 17, 25, 'Mutu', 'Felix', 25, 'roman', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (290, 17, 25, 'Mutu', 'Valentin', 22, 'italian', 'atacant', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (291, 17, 25, 'Mbappe', 'Andrei', 34, 'german', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (292, 17, 25, 'Mitrea', 'Matei', 18, 'german', 'atacant', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (293, 17, 25, 'Marica', 'Dembele', 30, 'roman', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (294, 17, 25, 'Ibrahimovici', 'Valentin', 26, 'italian', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (295, 17, 25, 'Haland', 'Ovidiu', 26, 'german', 'portar', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (296, 18, 1, 'Dele', 'Robert', 27, 'roman', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (297, 18, 1, 'Haland', 'Vasile', 19, 'italian', 'portar', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (298, 18, 1, 'Foden', 'Ilie', 21, 'german', 'portar', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (299, 18, 1, 'Salah', 'Denis', 32, 'roman', 'atacant', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (300, 18, 1, 'Tamas', 'Kylian', 24, 'italian', 'atacant', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (301, 18, 1, 'Popescu', 'Paul', 19, 'italian', 'atacant', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (302, 18, 1, 'Mbappe', 'Romica', 34, 'german', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (303, 18, 1, 'Neymar', 'Zlatan', 25, 'italian', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (304, 18, 1, 'Gardos', 'Sebastian', 27, 'englez', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (305, 18, 1, 'Ronaldo', 'Alli', 30, 'roman', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (306, 18, 1, 'Foden', 'Robert', 33, 'italian', 'portar', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (307, 19, 25, 'Mbappe', 'Robert', 25, 'roman', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (308, 19, 25, 'Dele', 'Ilie', 23, 'francez', 'portar', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (309, 19, 25, 'Ibrahimovici', 'Ciprian', 19, 'german', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (310, 19, 25, 'Salah', 'Erling', 21, 'francez', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (311, 19, 25, 'Marica', 'Ciprian', 28, 'german', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (312, 19, 25, 'Manea', 'Daniel', 17, 'englez', 'atacant', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (313, 19, 25, 'Mutu', 'Fabio', 26, 'francez', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (314, 19, 25, 'Dumitrescu', 'Andrei', 24, 'german', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (315, 19, 25, 'Messi', 'Vasile', 35, 'englez', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (316, 19, 25, 'Maxim', 'Vasile', 21, 'francez', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (317, 19, 25, 'Davies', 'Felix', 28, 'englez', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (318, 20, 3, 'Deac', 'Antoine', 31, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (319, 20, 3, 'Petrescu', 'Cristian', 31, 'francez', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (320, 20, 3, 'Maftei', 'Paul', 21, 'german', 'mijlocas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (321, 20, 3, 'Maxim', 'Denis', 25, 'italian', 'atacant', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (322, 20, 3, 'Dele', 'Emanuel', 26, 'german', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (323, 20, 3, 'Neymar', 'Sadio', 21, 'german', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (324, 20, 3, 'Haland', 'Erling', 28, 'italian', 'fundas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (325, 20, 3, 'Salah', 'Vasile', 29, 'german', 'atacant', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (326, 20, 3, 'Mitrea', 'Fabio', 30, 'roman', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (327, 20, 3, 'Burca', 'Adriano', 27, 'italian', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (328, 20, 3, 'Soarez', 'Ianis', 26, 'francez', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (329, 21, 25, 'Deac', 'Romica', 23, 'francez', 'fundas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (330, 21, 25, 'Mbappe', 'David', 35, 'englez', 'atacant', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (331, 21, 25, 'Diaz', 'Denis', 23, 'german', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (332, 21, 25, 'Ronaldo', 'Paul', 22, 'englez', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (333, 21, 25, 'Davies', 'Antoine', 24, 'englez', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (334, 21, 25, 'Ronaldo', 'Daniel', 18, 'roman', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (335, 21, 25, 'Mbappe', 'Felix', 24, 'roman', 'portar', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (336, 21, 25, 'Tanase', 'Romica', 34, 'italian', 'fundas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (337, 21, 25, 'Diaz', 'Antoine', 23, 'francez', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (338, 21, 25, 'Mitrea', 'Ovidiu', 26, 'italian', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (339, 21, 25, 'Fabinho', 'Dumiter', 27, 'francez', 'fundas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (340, 22, 3, 'Karius', 'Cristiano', 29, 'german', 'mijlocas', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (341, 22, 3, 'Mane', 'Robert', 23, 'roman', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (342, 22, 3, 'Gardos', 'Ciprian', 32, 'francez', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (343, 22, 3, 'Mutu', 'Zlatan', 27, 'german', 'atacant', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (344, 22, 3, 'Burca', 'Phil', 34, 'englez', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (345, 22, 3, 'Raum', 'James', 21, 'roman', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (346, 22, 3, 'Raum', 'Phil', 18, 'italian', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (347, 22, 3, 'Manea', 'Dorin', 25, 'englez', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (348, 22, 3, 'Neymar', 'Ovidiu', 18, 'englez', 'atacant', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (349, 22, 3, 'Messi', 'Erling', 21, 'englez', 'mijlocas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (350, 22, 3, 'Foden', 'James', 26, 'francez', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (351, 23, 5, 'Neymar', 'David', 29, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (352, 23, 5, 'Raum', 'Ciprian', 17, 'roman', 'fundas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (353, 23, 5, 'Man', 'Dumiter', 17, 'francez', 'atacant', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (354, 23, 5, 'Salah', 'Dembele', 30, 'roman', 'fundas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (355, 23, 5, 'Haland', 'Valentin', 26, 'roman', 'fundas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (356, 23, 5, 'Kante', 'Paul', 28, 'englez', 'portar', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (357, 23, 5, 'Goian', 'Matei', 30, 'roman', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (358, 23, 5, 'Radoi', 'Sebastian', 27, 'roman', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (359, 23, 5, 'Messi', 'Adriano', 26, 'roman', 'portar', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (360, 23, 5, 'Deac', 'Phil', 20, 'italian', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (361, 23, 5, 'Mutu', 'Dumiter', 17, 'englez', 'atacant', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (362, 24, 25, 'Salah', 'Matei', 21, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (363, 24, 25, 'Petrescu', 'Ovidiu', 25, 'italian', 'portar', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (364, 24, 25, 'Salah', 'Valentin', 22, 'german', 'fundas', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (365, 24, 25, 'Foden', 'Phil', 31, 'francez', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (366, 24, 25, 'Goian', 'Paul', 28, 'german', 'portar', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (367, 24, 25, 'Gardos', 'Paul', 17, 'englez', 'mijlocas', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (368, 24, 25, 'Popescu', 'Erling', 34, 'italian', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (369, 24, 25, 'Messi', 'Ovidiu', 27, 'englez', 'portar', 8);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (370, 24, 25, 'Tamas', 'Matei', 34, 'italian', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (371, 24, 25, 'Mbappe', 'Adriano', 18, 'englez', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (372, 24, 25, 'Marica', 'Andrei', 17, 'italian', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (373, 25, 3, 'Ibrahimovici', 'Gheorghe', 27, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (374, 25, 3, 'Mane', 'Ianis', 32, 'roman', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (375, 25, 3, 'Radoi', 'Alli', 24, 'englez', 'portar', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (370, 24, 25, 'Tamas', 'Matei', 34, 'italian', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (371, 24, 25, 'Mbappe', 'Adriano', 18, 'englez', 'fundas', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (372, 24, 25, 'Marica', 'Andrei', 17, 'italian', 'mijlocas', 11);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (373, 25, 3, 'Ibrahimovici', 'Gheorghe', 27, 'german', 'atacant', 1);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (374, 25, 3, 'Mane', 'Ianis', 32, 'roman', 'mijlocas', 2);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (375, 25, 3, 'Radoi', 'Alli', 24, 'englez', 'portar', 3);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (376, 25, 3, 'Mutu', 'Ciprian', 35, 'englez', 'mijlocas', 4);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (377, 25, 3, 'Kante', 'Ilie', 30, 'francez', 'mijlocas', 5);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (378, 25, 3, 'Maftei', 'Alli', 20, 'italian', 'atacant', 6);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (379, 25, 3, 'Radunovic', 'Erling', 19, 'roman', 'mijlocas', 7);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (380, 25, 3, 'Petrescu', 'Gheorghe', 24, 'italian', 'mijlocas', 8);

insert into JUCATOR (id_jucator, id_echipa, nume, prenume, varsta, nationalitate, post, numar)
values (381, 25, 'Popescu', 'N`golo', 19, 'italian', 'mijlocas', 9);

insert into JUCATOR (id_jucator, id_echipa, nume, prenume, varsta, nationalitate, post, numar)
values (382, 25, 'Haland', 'Teodor', 28, 'italian', 'portar', 10);

insert into JUCATOR (id_jucator, id_echipa, id_nationala, nume, prenume, varsta, nationalitate, post, numar)
values (383, 25, 3, 'Maxim', 'Joao', 33, 'roman', 'portar', 11);


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

insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (3, 'Lisabona', 'Champions League', to_date('21/06/2022', 'DD/MM/YYYY'), to_date('10/06/2023', 'DD/MM/YYYY'));

insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (4, 'Madrid', 'Europa League', to_date('15/06/2022', 'DD/MM/YYYY'), to_date('20/06/2023', 'DD/MM/YYYY'));

insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (5, 'Barcelona', 'Champions League', to_date('21/06/2023', 'DD/MM/YYYY'), to_date('10/06/2024', 'DD/MM/YYYY'));

insert into EUROPEAN_CLUBURI (id_cluburi, oras_finala, nume, data_inceput, data_final)
values (6, 'Milano', 'Europa League', to_date('15/06/2023', 'DD/MM/YYYY'), to_date('20/06/2024', 'DD/MM/YYYY'));

create table EUROPEAN_NATIONALE(
    id_nationale number(2) not null primary key,
    tara_gazda varchar2(20) not null,
    nume varchar2(20) not null,
    data_inceput date not null,
    data_final date not null
    );

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (1, 'Romania', 'EURO', to_date('11/06/2021', 'DD/MM/YYYY'), to_date('11/07/2021', 'DD/MM/YYYY'));

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (2, 'Germania', 'EURO', to_date('11/06/2024', 'DD/MM/YYYY'), to_date('11/07/2024', 'DD/MM/YYYY'));

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (3, 'Franta', 'EURO', to_date('11/06/2028', 'DD/MM/YYYY'), to_date('11/07/2028', 'DD/MM/YYYY'));

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (4, 'Anglia', 'EURO', to_date('11/06/2032', 'DD/MM/YYYY'), to_date('11/07/2032', 'DD/MM/YYYY'));

insert into EUROPEAN_NATIONALE (id_nationale, tara_gazda, nume, data_inceput, data_final)
values (5, 'Italia', 'EURO', to_date('11/06/2036', 'DD/MM/YYYY'), to_date('11/07/2036', 'DD/MM/YYYY'));

    
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
values (211, 3, 5);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (212, 6, 8);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (213, 7, 9);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (214, 11, 14);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (215, 12, 13);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (216, 15, 16);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (217, 17, 18);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (218, 20, 22);

insert into JOACA (id_meci, id_echipa1, id_echipa2)
values (219, 21, 23);

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
