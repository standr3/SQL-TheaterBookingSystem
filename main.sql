--drop
drop table actori CASCADE CONSTRAINTS;
drop table distributii CASCADE CONSTRAINTS;
drop table regizori CASCADE CONSTRAINTS;
drop table categoriivarste CASCADE CONSTRAINTS;
drop table filme CASCADE CONSTRAINTS;
drop table programarifilme CASCADE CONSTRAINTS;
drop table cinematografe CASCADE CONSTRAINTS;
drop table scauneocupate CASCADE CONSTRAINTS;
drop table bilete CASCADE CONSTRAINTS;
drop table rezervari CASCADE CONSTRAINTS;
drop table clienticinema CASCADE CONSTRAINTS;

create table actori (
    id_actor number not null,
    nume varchar2(40)
);

create table distributii (
    id_distr number not null,
    id_film number,
    id_actor number not null, 
    nume_rol varchar(40)
);

create table regizori (
    id_regizor number not null,
    nume varchar2(40)
);

create table categoriivarste (
    id_varsta number not null,
    titlu varchar2(15),
    descriere varchar2(45)
);

create table filme (
    id_film number not null,
    titlu varchar2(30),
    an number,
    lungime varchar2(20),
    rating number,
    id_varsta number not null,
    id_regizor number not null
);

create table programarifilme (
    id_prog number not null,
    id_film number not null,
    id_cinema number not null,
    data_prog date,
    ora char(5)
);
  
create table cinematografe (
    id_cinema number not null, 
    nume_cinema varchar2(25),
    nume_manager varchar2(40),
    oras varchar2(15),
    judet varchar2(15),
    telefon varchar2(12),
    email varchar2(25),
    max_locuri number
);

create table scauneocupate (
    numar_loc varchar2(3) not null,
    id_cinema number not null
);
    
create table bilete (
    id_bilet number not null,
    numar_loc varchar2(3) not null,
    id_rezervare number not null
);

create table rezervari (
    id_rezervare number not null,
    id_client number not null,
    id_prog number not null,
    data_rezervare date,
    ora char(5)
);

create table clienticinema (
    id_client number not null,
    nume varchar2(25)
);



--constraints
alter table actori add constraint actori_pk primary key (id_actor);
alter table distributii add constraint distributii_pk primary key (id_distr);
alter table regizori add constraint regizori_pk primary key (id_regizor);
alter table categoriivarste add constraint categoriivarste_pk primary key (id_varsta);
alter table filme add constraint filme_pk primary key (id_film);
alter table programarifilme add constraint programarifilme_pk primary key (id_prog);
alter table cinematografe add constraint cinematografe_pk primary key (id_cinema);
alter table scauneocupate add constraint scauneocupate_pk primary key (numar_loc);
alter table bilete add constraint bilete_pk primary key (id_bilet);
alter table rezervari add constraint rezervari_pk primary key (id_rezervare);
alter table clienticinema add constraint clienticinema_pk primary key (id_client);

alter table distributii add constraint distributii_actori_fk foreign key
    (id_actor) references actori(id_actor);
alter table distributii add constraint distributii_filme_fk foreign key
    (id_film) references filme(id_film);
alter table filme add constraint filme_categoriivarste_fk foreign key
    (id_varsta) references categoriivarste(id_varsta);
alter table filme add constraint filme_regizori_fk foreign key
    (id_regizor) references regizori(id_regizor);
alter table programarifilme add constraint programarifilme_filme_fk foreign key
    (id_film) references filme(id_film);
alter table programarifilme add constraint programari_cinema_fk foreign key
    (id_cinema) references cinematografe(id_cinema);
alter table scauneocupate add constraint scaune_cinema_fk foreign key
    (id_cinema) references cinematografe(id_cinema);
alter table bilete add constraint bilete_scauneocupate_fk foreign key
    (numar_loc) references scauneocupate(numar_loc);
alter table bilete add constraint bilete_rezervari_fk foreign key
    (id_rezervare) references rezervari(id_rezervare);
alter table rezervari add constraint rezervari_clienticinema_fk foreign key
    (id_client) references clienticinema(id_client);
alter table rezervari add constraint rezervari_programarifilme_fk foreign key
    (id_prog) references programarifilme(id_prog);

alter table bilete 
    modify numar_loc unique;



-- valori CATEGORII VARSTE

insert into categoriivarste (id_varsta, titlu, descriere) 
    values (1, 'AG', 'AUDIENTA GENERALA');
insert into categoriivarste (id_varsta, titlu, descriere) 
    values (2, 'AP-12', 'ACORDUL PARINTILOR 12');
insert into categoriivarste (id_varsta, titlu, descriere) 
    values (3, 'N-15', 'NERECOMANDAT 15');
insert into categoriivarste (id_varsta, titlu, descriere) 
    values (4, 'IM-18', 'INTERZIS MINORILOR');
insert into categoriivarste (id_varsta, titlu, descriere) 
    values (5, 'IM-18-XXX', 'INTERZIS MINORILOR SI PROIECTIEI CU PUBLIC');
    
-- valori ACTORI

insert into actori (id_actor, nume) 
    values (121, 'Nicolas Cage');
insert into actori (id_actor, nume) 
    values (42, 'Adam Sandler');
insert into actori (id_actor, nume) 
    values (35, 'Tom Cruise');
insert into actori (id_actor, nume) 
    values (46, 'Idris Elba');
insert into actori (id_actor, nume) 
    values (113, 'Marlon Brando');

-- valori REGIZORI

insert into regizori (id_regizor, nume) 
    values (25, 'Peter Jackson');
insert into regizori (id_regizor, nume) 
    values (63, 'Andrei Tarkovsky');
insert into regizori (id_regizor, nume) 
    values (16, 'Paul Gerre');
insert into regizori (id_regizor, nume) 
    values (33, 'Ed Wood');
insert into regizori (id_regizor, nume) 
    values (15, 'Tim Burton');

-- valori CLIENTI CINEMA

insert into clienticinema (id_client, nume) 
    values (235, 'Ion');
insert into clienticinema (id_client, nume) 
    values (242, 'Maria');
insert into clienticinema (id_client, nume) 
    values (2245, 'Tom');
insert into clienticinema (id_client, nume) 
    values (2512, 'Alexa');
insert into clienticinema (id_client, nume) 
    values (221, 'Valeriu');
    
--valori filme
insert into filme (id_film, titlu, an, lungime, rating, id_varsta, id_regizor)
    values (3242, 'The Simple Job', 1999, '1h49min', 4.2, 2, 63);
insert into filme (id_film, titlu, an, lungime, rating, id_varsta, id_regizor)
    values (423, 'Xmas Vacation', 2003, '1h30min', 3.3, 1, 33);
insert into filme (id_film, titlu, an, lungime, rating, id_varsta, id_regizor)
    values (223, 'Plan C', 2014, '1h40min', 3.9, 3, 25);
insert into filme (id_film, titlu, an, lungime, rating, id_varsta, id_regizor)
    values (5231, 'I got you', 1987, '1h49min', 4.1, 4, 16);
insert into filme (id_film, titlu, an, lungime, rating, id_varsta, id_regizor)
    values (2343, 'Quite a night', 2001, '2h03min', 4.5, 1, 15);
    
-- valori distributii

insert into distributii (id_distr, id_film, id_actor, nume_rol)
    values (45, 3242, 113, 'Thomas White');
insert into distributii (id_distr, id_film, id_actor, nume_rol)
    values (235, 423, 35, 'John Nash');
insert into distributii (id_distr, id_film, id_actor, nume_rol)
    values (2341, 223, 35, 'Joe Stutter');
insert into distributii (id_distr, id_film, id_actor, nume_rol)
    values (5234, 5231, 113, 'Marcelo');
insert into distributii (id_distr, id_film, id_actor, nume_rol)
    values (3212, 2343, 113, 'Voice of Tim');
    


-- cinematografe

insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (9238, 'CinemaZone' , 'Ion Popescu', 'Bacau' , 'Bacau', '0732889007', 'cinemazone@gmail.com', 150);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (7523, 'Cinema Capitol' , 'Radu Valeriu', 'Galati' , 'Galati', '0734937092', 'cinemacapitol@gmail.com', 200); 
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (2379, 'Cinema Central' , 'Andra Irimia', 'Braila' , 'Braila', '0732826730', 'centralmovie@gmail.com', 170);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (2673, 'CineMax' , 'Andreea Munteanu', 'Roman' , 'Piatra Neamt', '0745667009', 'cinemax@gmail.com', 150);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (2743, 'ArenaCinema' , 'Alexandru Stefan', 'Constanta' , 'Constanta', '0733097764', 'arenacinema@gmail.com', 210);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (101, 'CinemaA' , 'Ion Ion', 'Bacau' , 'Bacau', '0732159007', 'cinema_a@gmail.com', 175);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (102, 'CinemaB' , 'Mihai Radu', 'Galati' , 'Galati', '0732546007', 'cinema_b@gmail.com', 120);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (103, 'CinemaC' , 'Petronela Tudor', 'Braila' , 'Braila', '0722885307', 'cinema_c@gmail.com', 230);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (104, 'CinemaD' , 'Bianca Iosef', 'Constanta' , 'Constanta', '0732863466', 'cinema_d@gmail.com', 400);
insert into cinematografe (id_cinema, nume_cinema, nume_manager, oras, judet, telefon, email, max_locuri)
    values (105, 'CinemaE' , 'Dumitru Popa', 'Constanta' , 'Constanta', '0732098235', 'cinema_e@gmail.com', 450);
-- valori programari filme

insert into programarifilme (id_prog, id_film, id_cinema, data_prog, ora)
    values (233, 5231, 9238, '20-Nov-2021', '16:30');
insert into programarifilme (id_prog, id_film, id_cinema, data_prog, ora)
    values (443, 2343, 2673, '8-Nov-2021', '12:30');
insert into programarifilme (id_prog, id_film, id_cinema, data_prog, ora)
    values (111, 5231, 2743, '2-Nov-2021', '12:00');
insert into programarifilme (id_prog, id_film, id_cinema, data_prog, ora)
    values (25533, 2343, 7523, '19-Nov-2021', '16:30');
insert into programarifilme (id_prog, id_film, id_cinema, data_prog, ora)
    values (987, 423, 2673, '11-Nov-2021', '18:00');
    
-- scaune ocupate
insert into scauneocupate (numar_loc, id_cinema)
    values ('21a', 9238);
insert into scauneocupate (numar_loc, id_cinema)
    values ('53f', 2673);
insert into scauneocupate (numar_loc, id_cinema)
    values ('42d', 2743);
insert into scauneocupate (numar_loc, id_cinema)
    values ('54c', 7523);
insert into scauneocupate (numar_loc, id_cinema)
    values ('23e', 2673);
    
--rezervari
insert into rezervari (id_rezervare, id_client, id_prog, data_rezervare, ora)
    values (37, 235, 233, '20-Nov-2021', '16:30');
insert into rezervari (id_rezervare, id_client, id_prog, data_rezervare, ora)
    values (246, 242, 443, '8-Nov-2021', '12:30');
insert into rezervari (id_rezervare, id_client, id_prog, data_rezervare, ora)
    values (813, 2245, 111, '20-Nov-2021', '16:30');
insert into rezervari (id_rezervare, id_client, id_prog, data_rezervare, ora)
    values (249, 2512, 25533, '19-Nov-2021', '16:30');
insert into rezervari (id_rezervare, id_client, id_prog, data_rezervare, ora)
    values (244, 221, 987, '11-Nov-2021', '18:00');
    

  -- bilete
 insert into bilete (id_bilet, numar_loc, id_rezervare)
    values (3219, '21a', 37); 
 insert into bilete (id_bilet, numar_loc, id_rezervare)
    values (354, '53f', 246); 
 insert into bilete (id_bilet, numar_loc, id_rezervare)
    values (387, '42d', 813); 
 insert into bilete (id_bilet, numar_loc, id_rezervare)
    values (885, '54c', 249); 
 insert into bilete (id_bilet, numar_loc, id_rezervare)
    values (2573, '23e', 244); 
