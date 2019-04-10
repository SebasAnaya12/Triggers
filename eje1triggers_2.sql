create or replace trigger audiemp after insert or delete or update on empleado for each row
declare	
		cambios	varchar2(100);
	begin
		if inserting then
			insert into auditarempleado values(sysdate,:new.num_emp,:new.nombre,'INSERCION',null);
		end if;
		if deleting then
			insert into auditarempleado values(sysdate,:old.num_emp,:old.nombre,'BORRADO',null);
		end if;
		if updating then
			if updating('num_emp') then
				cambios:= cambios||' '||:old.num_emp||'--->'||:new.num_emp;
			end if;
			if updating('nombre') then
				cambios:= cambios||' '||:old.nombre||'--->'||:new.nombre;
			end if;
			if updating('puesto') then
				cambios:= cambios||' '||:old.puesto||'--->'||:new.puesto;
			end if;
			if updating('num_sup') then
				cambios:= cambios||' '||:old.num_sup||'--->'||:new.num_sup;
			end if;
			if updating('fecha_alta') then
				cambios:= cambios||' '||:old.fecha_alta||'--->'||:new.fecha_alta;
			end if;
			if updating('salario') then
				cambios:= cambios||' '||:old.salario||'--->'||:new.salario;
			end if;
			if updating('comision') then
				cambios:= cambios||' '||:old.comision||'--->'||:new.comision;
			end if;
			if updating('num_dep') then
				cambios:= cambios||' '||:old.num_dep||'--->'||:new.num_dep;
			end if;
			insert into auditarempleado values(sysdate,:old.num_emp,:old.nombre,'MODIFICACION',cambios);
		end if;		
	end;
/
