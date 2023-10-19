DECLARE
 x VARCHAR2(20);
BEGIN
 x:= 5 + 4 * 5 ;
 DBMS_OUTPUT.PUT_LINE(x);
END; 

declare 
    cursor my_cursor is 
    select * from Employees where salary >300;
    my_emp Employees%rowtype;
    begin 
    open my_cursor;
    dbms_output.put_line(my_cursor%rowCount);
    loop
    fetch my_cursor into my_emp;
    exit when my_cursor%notfound;
    end loop;
    end;
    
    
DECLARE
  CURSOR country_curs IS
   SELECT country_id, country_name
   FROM wf_countries
   ORDER BY country_name;
  v_country country_curs%ROWTYPE;
BEGIN
  OPEN country_curs;
  LOOP
   FETCH country_curs INTO v_country;
   EXIT WHEN country_curs%NOTFOUND;

DBMS_OUTPUT.PUT_LINE(v_country.country_id || ' ' || v_country.country_name);
  END LOOP;
  CLOSE country_curs;
END;

declare 
v_counter number(1);
begin 
v_counter := 1;
LOOP
EXIT WHEN v_counter = 5;
   v_counter := v_counter + 1;
END LOOP;
dbms_output.put_line(v_counter);
end;


begin 
DBMS_OUTPUT.PUT_LINE('The cat' || 'sat on the mat');
DBMS_OUTPUT.PUT_LINE('The cat sat ' || 'on the mat');
DBMS_OUTPUT.PUT_LINE('The cat sat on the mat');
end;


declare 
v_counter int:= 5;
begin 
while v_counter > 5 loop
v_counter:=v_counter+1;
dbms_output.put_line(v_counter);
end loop;
end;


DECLARE
  v_open CHAR(3) := 'NO';
BEGIN
  UPDATE employees
  SET job_id = 'ST_CLERK'
   WHERE department_id = 90;
  IF SQL%FOUND THEN
   v_open := 'YES';
  END IF;
   DBMS_OUTPUT.PUT_LINE(v_open || '   ' || SQL%ROWCOUNT);
END; 