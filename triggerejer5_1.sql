create or replace trigger insercion after insert on tcliente  for each row
declare
	cont1 number(1);
	cont2 number(1);
begin
	begin
		select count(*) into cont1 from tvendedor where cod_ven=:new.vendedor;
		if cont1=0 then
			dbms_output.put_line('No existe el vendedor');
		end if;
		select count(*) into cont2 from tprovincia where codigo=:new.provincia;	
		if cont2=0 then
			dbms_output.put_line('No existe la provincia');
		end if;
end;	
/