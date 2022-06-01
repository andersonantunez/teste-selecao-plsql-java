insert into tab values (1,1);
commit;
insert into tab values (2,2);
truncate table tab;
insert into tab values (3,3);

rollback;
insert into tab values (4,4);

select count(*) from tab;

-- 1 linha retornada


-- Sessao 1
insert into tab values (1,1);
commit;
insert into tab values (2,2);
truncate table tab;
insert into tab values (3,3);

rollback;
insert into tab values (4,4);

-- Sessao 2
select count(*) from tab;

-- 0 linha retornada