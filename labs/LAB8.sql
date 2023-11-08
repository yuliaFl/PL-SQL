-- Yulia Flenova 
-- n01342767

-- 8.1 question 4

CREATE TABLE employees_dup AS SELECT * from employees; 

CREATE OR REPLACE PROCEDURE name_change IS 
BEGIN 
  UPDATE employees_dup 
    SET first_name = 'Susan' 
    WHERE department_id = 80; 
END name_change; 


BEGIN   
    name_change; 
END; 
 
SELECT * FROM employees_dup WHERE DEPARTMENT_ID = 80;
--=============================================================================
CREATE OR REPLACE PROCEDURE pay_raise IS
BEGIN
  UPDATE employees_dup
    SET salary = 30000;
END pay_raise;

BEGIN
  pay_raise;
END;

SELECT first_name, last_name, salary FROM employees_dup;

--=============================================================================
-- 8.2 question 2
/*
Create a procedure that accepts a country_id as a parameter and displays the name of the country and its capitol city. 
Name your procedure get_country_info. Save your procedure definition for later use. 
*/

create or replace PROCEDURE get_country_info (p_country_id IN NUMBER) IS
    v_country_name countries.country_name%type;
    v_capitol countries.capitol%type;
BEGIN
    SELECT country_name, capitol
    INTO v_country_name, v_capitol
    FROM countries
    WHERE country_id = p_country_id;
    
    DBMS_OUTPUT.PUT_LINE('Country: ' || v_country_name);
    DBMS_OUTPUT.PUT_LINE('Capital: ' || v_capitol);
END;

DECLARE
  v_country_id NUMBER := 95; 
BEGIN
  get_country_info(v_country_id);
END;

--=============================================================================
-- 8.2 question 4

/*
A.	Write a procedure that displays the number of countries in a given region whose highest elevations exceed a given value. 
The procedure should accept two formal parameters, one for a region_id and the other for an elevation value for comparison. Use 
DBMS_OUTPUT.PUT_LINE to display the results in a message. Save your procedure code. 
*/
create or replace PROCEDURE get_elevations (p_region_id IN NUMBER) IS
    v_region_id countries.region_id%type;
    v_elevation_comparison NUMBER;
BEGIN
    SELECT country_name, capitol
    INTO v_country_name, v_capitol
    FROM countries
    WHERE country_id = p_country_id;
    
    DBMS_OUTPUT.PUT_LINE('Country: ' || v_country_name);
    DBMS_OUTPUT.PUT_LINE('Capital: ' || v_capitol);
END;