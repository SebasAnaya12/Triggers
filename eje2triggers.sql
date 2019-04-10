create or replace trigger nocambiesnombre before update of nombre on empleado for each row
begin
	raise_application_error(-20374,'No se permite modificar nombre de empleado')
end;
/ 




