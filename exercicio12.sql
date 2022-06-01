create or replace package om_pkg_task
is

    type tr_retorno is record
    (
        codigo number,
        mensagem varchar2(255)
    );
        
    function insere_cabecalho_tarefa
    (
        p_nome in t_cabecalho.nome%type,
        p_area in t_cabecalho.area%type 
    )
    return tr_retorno;
        
end;
/

create or replace package body om_pkg_task
is

    -- private
    function obtem_dados_equipe
    (
        p_area in t_cabecalho.area%type,
        p_oid_equipe out t_equipe.oid%type
    )
    return tr_retorno
    as            
        v_retorno om_pkg_task.tr_retorno;
        v_status t_equipe.status%type;
        c_separador constant varchar2(1) default '/';
        
    begin

        select 
        equ.status,
        equ.oid
        into 
        v_status,
        p_oid_equipe 
        from
        t_equipe equ
        where
        equ.nome_b1||c_separador|| 
        equ.nome_b2||c_separador||
        equ.nome_b3 = p_area;
        
        if v_status = 1 then
            v_retorno.codigo := 0;
            v_retorno.mensagem := 'Equipe ativa encontrada: '||p_oid_equipe;
        elsif v_status = 0 then
            p_oid_equipe := 0;
            v_retorno.codigo := -2;
            v_retorno.mensagem := 'Equipe inativa encontrada: '||p_oid_equipe;
        end if;
        
        return v_retorno;
        
    exception
        when no_data_found then
            p_oid_equipe := 0;
            v_retorno.codigo := -1;
            v_retorno.mensagem := 'Equipe não encontrada: '||p_oid_equipe;
            return v_retorno;
    end;    
    
    function insere_cabecalho_tarefa
    (
        p_nome in t_cabecalho.nome%type,
        p_area in t_cabecalho.area%type
    )
    return tr_retorno
    as
        v_retorno om_pkg_task.tr_retorno;
        v_oid_equipe t_equipe.oid%type;
        
    begin

        v_retorno := om_pkg_task.obtem_dados_equipe
        (
            p_area => p_area,
            p_oid_equipe => v_oid_equipe
        );
        
        insert into t_log 
        values 
        (
            t_log_seq.nextval,
            sysdate,
            v_retorno.codigo,
            v_retorno.mensagem
        );

        if v_retorno.codigo = 0 then
            insert into t_cabecalho 
            values
            (
                t_cabecalho_seq.nextval, 
                p_nome, 
                sysdate, 
                p_area, 
                v_oid_equipe
            );
        end if;
        
        return v_retorno;

    end;

end;
/

declare

     v_retorno om_pkg_task.tr_retorno;

begin

    v_retorno := om_pkg_task.insere_cabecalho_tarefa
    (
        p_nome => 'NOVA TAREFA',
        p_area => 'MT_07901/13TRF/E09516'
    );
    
    dbms_output.put_line(v_retorno.codigo);
    dbms_output.put_line(v_retorno.mensagem);
	
	-- 0
	-- Equipe ativa encontrada: 4
    
    v_retorno := om_pkg_task.insere_cabecalho_tarefa
    (
        p_nome => 'NOVA TAREFA',
        p_area => 'AHUAHUAHAUHAUHAUHAUHA'
    );
    
    dbms_output.put_line(v_retorno.codigo);
    dbms_output.put_line(v_retorno.mensagem);
	
	-- -1
	-- Equipe não encontrada: 0
    
    v_retorno := om_pkg_task.insere_cabecalho_tarefa
    (
        p_nome => 'NOVA TAREFA',
        p_area => 'MT_07019/13TRF/E08796'
    );
    
    dbms_output.put_line(v_retorno.codigo);
    dbms_output.put_line(v_retorno.mensagem);
	
	-- -2
	-- Equipe inativa encontrada: 0
    
end;