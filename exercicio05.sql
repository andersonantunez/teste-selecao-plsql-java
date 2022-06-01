create table alunos
(
	id number primary key,
	nome varchar2(50),
	valor number
);

insert into alunos values (1, 'Julia', 81);
insert into alunos values (2, 'Carol', 68);
insert into alunos values (3, 'Maria', 99);
insert into alunos values (4, 'Andreia', 78);
insert into alunos values (5, 'Jaqueline', 63);
insert into alunos values (6, 'Marcela', 88);


create table notas
(
	nota number,
	valor_min number,
	valor_max number
);

insert into notas values (1, 0, 9);
insert into notas values (2, 10, 19);
insert into notas values (3, 20, 29);
insert into notas values (4, 30, 39);
insert into notas values (5, 40, 49);
insert into notas values (6, 50, 59);
insert into notas values (7, 60, 69);
insert into notas values (8, 70, 79);
insert into notas values (9, 80, 89);
insert into notas values (10, 90, 100);


select
alu.id,
(
    case
    when nts.nota >= 8 
    then alu.nome
    else null
    end
) as nome,
nts.nota,
alu.valor
from
alunos alu
inner join notas nts on alu.valor between nts.valor_min and nts.valor_max 
order by
alu.valor * 
(
    case 
    when nts.nota >= 8 
    then 1 
    else -1 end
) desc; -- Pensei numa forma de não utilizar UNION

