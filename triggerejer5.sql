create or replace trigger insercion after insert on tcliente  for each row
declare
	filaven tvendedor%rowtype;
	pro	 tprovincia%rowtype;
	--error exception;
begin
	begin
		select * into filaven from tvendedor where cod_ven=:new.vendedor;
	Exception 
		when no_data_found then
			dbms_output.put_line('No existe el vendedor');
	end;
	begin
		select * into pro from tprovincia where codigo=:new.provincia;	
	Exception 
		when no_data_found then
			dbms_output.put_line('No existe la provincia');
	end;
/
--Exception 
	--when error then
		--dbms_output.put_line('No existe');	
