create table t_equipe
(
    oid number primary key,
    nome varchar2(50),
    nome_b1 varchar2(50),
    nome_b2 varchar2(50),
    nome_b3 varchar2(50),
    status numeric,
    check(status in (0, 1))
);
create sequence t_equipe_seq start with 1 increment by 1 nocache;

create table t_cabecalho
(
    oid number primary key,
    nome varchar2(50), 
    data_criacao date, 
    area varchar2(50), 
    equipe_responsável number,
    constraint fk_cabecalho_equipe foreign key (equipe_responsável) references t_equipe (oid)
);
create sequence t_cabecalho_seq start with 1 increment by 1 nocache;

create table t_log
(
    oid number primary key,
    data date,
    codigo varchar2(50),
    descricao varchar2(100)
);
create sequence t_log_seq start with 1 increment by 1 nocache;

insert into t_equipe values (t_equipe_seq.nextval, 'ALPHA1', 'MT_07019', '13TRF', 'E08796', 0);
insert into t_equipe values (t_equipe_seq.nextval, 'BETA2',  'MT_11606', '13TRF', 'E08115', 1);
insert into t_equipe values (t_equipe_seq.nextval, 'BETA1',  'MT_07901', '13TRF', 'E09516', 1);

