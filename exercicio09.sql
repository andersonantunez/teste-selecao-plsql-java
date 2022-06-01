create table tcall
(
    oid number primary key,
    tipo number,
    subtipo number,
    data_criacao date
);

create table om_record
(
    oid number primary key,
    tipo number,
    subtipo number,
    natureza number,
    data_criacao date
);

create table om_record_natureza
(
    oid number primary key,
    tipo number,
    subtipo number,
    natureza number
);

insert into om_record_natureza values (1, 1, 1, 2);
insert into om_record_natureza values (2, 1, 2, 4);
insert into om_record_natureza values (3, 2, 1, 6);

create sequence tcall_seq start with 1 increment by 1 nocache;

create or replace function retorna_natureza
(
    p_tipo om_record_natureza.tipo%type,
    p_subtipo om_record_natureza.subtipo%type
)
return om_record_natureza.natureza%type
as

    v_natureza om_record_natureza.natureza%type;

begin
    
    select natureza
    into v_natureza
    from om_record_natureza
    where
    tipo = p_tipo and
    subtipo = p_subtipo;
    
    return v_natureza;
    
exception    
    when no_data_found then   
        return 0;
end;
 
create or replace procedure insere_om_record
(
    p_tipo om_record.tipo%type,
    p_subtipo om_record.subtipo%type
)
is
begin

    insert into om_record values 
    (
        tcall_seq.nextval,
        p_tipo, 
        p_subtipo, 
        retorna_natureza
        (
            p_tipo => p_tipo,
            p_subtipo => p_subtipo
        ),
        sysdate
     ); 

end;
 
create or replace trigger trg_insere_om_record
after insert on tcall
for each row
call insere_om_record(:new.tipo, :new.subtipo);
 

insert into tcall values (tcall_seq.nextval, 1, 1, sysdate);
insert into tcall values (tcall_seq.nextval, 1, -3, sysdate);

select *
from om_record;

