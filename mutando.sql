create or replace trigger nocambiesnombre before update of nombre,num_sup,salario on empleado for each row
declare
	fila empleado%rowtype;
BEGIN
	select * into fila from empleado where num_emp = :new.num_emp;
	if updating ('nombre') then
		raise_application_error(-20120, 'No se permite modificar el nombre');
	end if;
	if updating ('num_sup') then
		raise_application_error(-20222, 'No se permite modificar el num_sup');
	end if;
	if :new.salario> :old.salario * 1.1 then
		raise_application_error(-20989,'No se puede subir tanto el salario');
	end if;
end;
/

--Ejercicio malo--