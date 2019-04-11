create or replace trigger diasemana before delete on empleado
BEGIN
if to_number(to_char(sysdate,'d'))in (4,6,7) then
		raise_application_error(-20374, 'No se permite borrar empleados los fines de semana');
	end if;
end;
/