-- Formularea în limbaj natural si implementarea a 5 cereri SQL complexe.

--1. Afisati varsta si numele celor mai varstnici jucatori, precum si numele echipelor si campionatele in care joaca acestia. 

select j.varsta, j.nume, e.nume Nume_echipa, c.nume  
from jucator j, campionat_intern c, echipa e 
where j.id_echipa = e.id_echipa and c.id_campionat = e.id_campionat and  
j.varsta = (select max(varsta) 
                  from jucator j, campionat_intern c, echipa e 
                  where j.id_echipa = e.id_echipa and e.id_campionat = c.id_campionat); 
-- 15 rezultate 


--2. Sa se afiseze numele , numele nationalei la care joaca (daca e cazul), si in ordine descrescatoare varstele fotbalistilor care joaca in campionatul in care joaca jucatorul cu numele 'Maftei Andrei'. 

select distinct j.nume, j.varsta, upper(n.nume) 
from campionat_intern c, echipa e, jucator j, nationala n 
where j.id_nationala = n.id_nationala and j.id_echipa = e.id_echipa and 
e.id_campionat = (select c.id_campionat 
                                  from echipa e, jucator j 
                                  where e.id_campionat = c.id_campionat and j.id_echipa = e.id_echipa and j.nume like initcap('maftei') and j.prenume like initcap('andrei')) 
order by 2 desc; 
-- 55 rezultate 


-- 3. Sa se afiseze durata in zile a campionatelor si luna in care acestea se desfasoara 

select c.nume, (c.data_final -  c.data_inceput) AS DateDiff, 
case to_char(c.data_inceput, 'MM') 
when '04' then 'Aprilie' 
when '05' then 'Mai' 
when '06' then 'Iunie' 
end "LUNA DESFASURARE" 
from campionat_intern c; 
-- 5 rezultate 


-- 4. Sa se afiseze numele si prenumele jucatorilor care sunt in echipe care au numarul de jucatori egal cu 11 si au prima litera a numelui 'S' 

with echipe as (select id_echipa 
                from echipa 
                where nr_jucatori = 11) 
select nume, prenume 
from jucator j, echipe  
where j.id_echipa in echipe.id_echipa 
group by nume, prenume 
having j.nume like 'S%' 
-- 20 rezultate 


-- 5. Sa se afiseze id-ul echipei si id-ul stadionului pe care joaca in felul urmator: 
--    vom avea cate o coloana pentru fiecare stadion in cadrul careia se va regasi id-ul stadionului. 
--    Pentru fiecare echipa, vom avea o linie, iar fiecare casuta de pe acea linie va corespunde unui stadion. 
--    Aceste casute vor fi completate cu 0 in cazul in care stadionul respectiv nu este al echipei de pe linie 
--    sau cu numarul de cifre ale numarului de jucatori de la acea echipa. 

select id_echipa, 
nvl(length(decode(id_stadion, 30, nr_jucatori)),0) Std30, 
nvl(length(decode(id_stadion, 31, nr_jucatori)),0) Std31, 
nvl(length(decode(id_stadion, 32, nr_jucatori)),0) Std32, 
nvl(length(decode(id_stadion, 33, nr_jucatori)),0) Std33, 
nvl(length(decode(id_stadion, 34, nr_jucatori)),0) Std34, 
nvl(length(decode(id_stadion, 35, nr_jucatori)),0) Std35, 
nvl(length(decode(id_stadion, 36, nr_jucatori)),0) Std36, 
nvl(length(decode(id_stadion, 37, nr_jucatori)),0) Std37, 
nvl(length(decode(id_stadion, 38, nr_jucatori)),0) Std38, 
nvl(length(decode(id_stadion, 39, nr_jucatori)),0) Std39, 
nvl(length(decode(id_stadion, 40, nr_jucatori)),0) Std40, 
nvl(length(decode(id_stadion, 41, nr_jucatori)),0) Std41, 
nvl(length(decode(id_stadion, 42, nr_jucatori)),0) Std42, 
nvl(length(decode(id_stadion, 43, nr_jucatori)),0) Std43, 
nvl(length(decode(id_stadion, 44, nr_jucatori)),0) Std44, 
nvl(length(decode(id_stadion, 45, nr_jucatori)),0) Std45, 
nvl(length(decode(id_stadion, 46, nr_jucatori)),0) Std46, 
nvl(length(decode(id_stadion, 47, nr_jucatori)),0) Std47, 
nvl(length(decode(id_stadion, 48, nr_jucatori)),0) Std48, 
nvl(length(decode(id_stadion, 49, nr_jucatori)),0) Std49, 
nvl(length(decode(id_stadion, 50, nr_jucatori)),0) Std50, 
nvl(length(decode(id_stadion, 51, nr_jucatori)),0) Std51, 
nvl(length(decode(id_stadion, 52, nr_jucatori)),0) Std52, 
nvl(length(decode(id_stadion, 53, nr_jucatori)),0) Std53, 
nvl(length(decode(id_stadion, 54, nr_jucatori)),0) Std54 
from echipa; 
-- 25 rezultate 


--  Implementarea a 3 operații de actualizare și de suprimare a datelor utilizând subcereri. 

-- 1. Stergerea antrenorului care antreneaza echipa cu numele "CFR Cluj 1907" 

delete ANTRENOR 
where id_antrenor in (select a.id_antrenor 
                      from antrenor a, echipa e 
                      where a.id_echipa = e.id_echipa and e.nume = 'CFR Cluj 1907');  


-- 2. Actualizarea stadionului pe care joaca echipa cu id-ul 5 

update STADION 
set nume = 'Farul Hagi' 
where id_stadion in (select s.id_stadion 
                     from stadion s, echipa e 
                     where e.id_stadion = s.id_stadion and e.id_echipa = 5); 
                   

-- 3. Stergerea sponsorului care sponsorizeaza echipa cu id-ul egal cu 5  

delete from SPONSOR 
where id_sponsor in (select s.id_sponsor 
                     from sponsor s, echipa e 
                     where s.id_echipa = e.id_echipa and e.id_echipa = 5);                                    
                     

-- Formularea în limbaj natural si implementarea în SQL a: o cerere ce utilizează operația outer join pe minimum 4 tabele și 
-- două cereri ce utilizează operația division. 

-- 1.Afisati numele antrenorilor si echipa la care antreneaza, unde echipa joaca in campionatul al carei tari nu s-a califcat 
-- la european nationale. 

select Antrenor.nume, Antrenor.prenume, Echipa.nume Nume_echipa 
from (((( Antrenor full outer join Echipa on Antrenor.id_echipa = Echipa.id_echipa) full outer join 
Campionat_intern on Campionat_intern.id_campionat = Echipa.id_campionat) full outer join Tara on Tara.id_tara = Campionat_intern.id_tara) full outer join Nationala on Nationala.id_tara = Tara.id_tara) 
where Nationala.id_nationale is null; 
-- 5 rezultate


-- 2. Afisati id-ul televiziunilor care televizeaza meciurile care au loc in a 13-a zi a unei luni 

select distinct id_televiziune 
from televizeaza 
where id_meci in (select id_meci  
                  from meci 
                  where to_char(data, 'DD') = '13') 
group by id_televiziune 
having count(id_meci)=(select count(*) 
                       from meci 
                       where to_char(data, 'DD') = '13'); 
--  1 rezultat 


-- 3. Afisati id-ul echipelor participante la campionatul european intre echipe care incepe pe 21 iunie 2021 

select id_echipa 
from participa 
where id_cluburi in (select id_cluburi 
      		         from european_cluburi 
      		         where to_char(data_inceput, 'DD-MM-YYYY') = '21-06-2021') 
group by id_echipa 
having count(id_cluburi) = (select count(*) 
                            from european_cluburi 
                  		      where to_char(data_inceput, 'DD-MM-YYYY') = '21-06-2021')
order by 1; 
-- 7 rezultate


-- Optimizarea unei cereri, aplicând regulile de optimizare ce derivă din proprietățile operatorilor algebrei relaționale.
-- Cererea va fi exprimată prin expresie algebrică, arbore algebric și limbaj (SQL), atât anterior cât și ulterior optimizării. 

-- Afisati numele, prenumele si numarul de pe tricou a tuturor jucatorilor care joaca la echipe inscrise in campionatul 
-- cu numele Liga 1. 

Fara optimizare: 

select j.nume, j.prenume, j.numar 
from jucator j, campionat_intern c, echipa e 
where e.id_echipa = j.id_echipa and c.id_campionat = e.id_campionat and c.nume = 'Liga 1'; 
-- 55 rezultate

Cu optimizare: 

select j.nume, j.prenume, j.numar 
from jucator j, campionat_intern c, echipa e 
where c.nume = 'Liga 1' and c.id_campionat = e.id_campionat and e.id_echipa = j.id_echipa
 
