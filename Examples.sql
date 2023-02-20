
--1. asfisati varsta si numele celui mai varstnic jucator, precum si numele echipei si campionatul in care joaca acesta
select j.varsta, j.nume, e.nume Nume_echipa 
from jucator j, campionat_intern c, echipa e
where j.id_echipa = e.id_echipa and c.id_campionat = e.id_campionat and j.varsta = (select max(varsta)
                                                                                    from jucator j, campionat_intern c, echipa e
                                                                                    where j.id_echipa = e.id_echipa and e.id_campionat = c.id_campionat);
                                                                                    
--2. Sa se afiseze numele , numele nationalei la care joac (daca e cazul), si in ordine crescatoare varstele fotbalistilor care joaca in campionatul in care joaca jucatorul cu numele 'Tanase Florin'
select distinct j.nume, j.varsta, upper(n.nume)
from campionat_intern c, echipa e, jucator j, nationala n
where j.id_nationala = n.id_nationala and j.id_echipa = e.id_echipa and e.id_campionat = (select c.id_campionat
                                                                                      from campionat_intern c, echipa e, jucator j
                                                                                      where e.id_campionat = c.id_campionat and j.id_echipa = e.id_echipa and j.nume like initcap('tanase')
                                                                                      and j.prenume like initcap('florin'))
order by 2 desc;

-- 3. Sa se afiseze durata in zile a campionatelor si luna in care acestea se desfasoara

select c.nume, (c.data_final -  c.data_inceput) AS DateDiff,
case to_char(c.data_inceput, 'MM')
when '04' then 'Aprilie'
when '05' then 'Mai'
when '06' then 'Iunie'
end "LUNA DESFASURARE"
from campionat_intern c;

-- 4. Sa se afiseze numele si prenumele jucatorilor care sunt in echipe care au numarul de jucatori egal cu 11 si au prima litera a numelui 'S'

with echipe as (select id_echipa
                from echipa
                where nr_jucatori = 11)
select nume, prenume
from jucator j, echipe 
where j.id_echipa in echipe.id_echipa
group by nume, prenume
having j.nume like 'S%';

-- 5.

select id_echipa,
nvl(length(decode(id_stadion, 33, nr_jucatori)),0) Std33,
nvl(length(decode(id_stadion, 34, nr_jucatori)),0) Std34,
nvl(length(nr_jucatori),0) Total
from echipa;

-- in with echipele cu nr jucatori = 11 

--Stergerea antrenorului care antreneaza echipa cu numele "CFR Cluj 1907"
delete ANTRENOR
where id_antrenor in (select a.id_antrenor
                      from antrenor a, echipa e
                      where a.id_echipa = e.id_echipa and e.nume = 'CFR Cluj 1907');


-- Actualizarea stadionului pe care joaca echipa cu id-ul 5
update STADION
set nume = 'Farul Hagi'
where id_stadion in (select s.id_stadion
                     from stadion s, echipa e
                     where e.id_stadion = s.id_stadion and e.id_echipa = 5);

-- Stergerea sponsorului care sponsorizeaza echipa cu id-ul egal cu 5
delete from SPONSOR
where id_sponsor in (select s.id_sponsor
                     from sponsor s, echipa e
                     where s.id_echipa = e.id_echipa and e.id_echipa = 5);
