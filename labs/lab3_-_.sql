//LAB 3.2
DECLARE 
   last_name VARCHAR2(25) := 'Fay';       
BEGIN 
   UPDATE emp_dup  
     SET first_name = 'Jennifer' 
     WHERE last_name = last_name;  
END; 

CREATE TABLE emp_dup AS (SELECT * FROM employees);
SELECT FIRST_NAME , LAST_NAME FROM EMP_DUP;

DROP TABLE EMP_DUP;
CREATE TABLE emp_dup AS (SELECT * FROM employees);

DECLARE
    last_name VARCHAR2(25) :='Fay';
BEGIN
    UPDATE emp_dup SET first_name = 'Jennifer' WHERE last_name = 'Fay';
END;

select first_name, last_name from emp_dup where last_name = 'Fay';

//======================================================================
//Lab 3.3
CREATE TABLE new_depts AS SELECT * FROM departments; 

DECLARE
    v_max_deptno new_depts.department_id%TYPE;
    v_dept_name new_depts.department_name%TYPE := 'A New Department';
    v_dept_id new_depts.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO v_max_deptno
    FROM new_depts;
    DBMS_OUTPUT.PUT_LINE('The maximum department id is: ' || v_max_deptno);
    v_dept_id := v_max_deptno + 10;
    DBMS_OUTPUT.PUT_LINE('v_dept_id: '|| v_dept_id);
END;


//  using v_dept_id and v_dept_name to populate the department_id and department_name columns. Insert NULL into the location_id and manager_id columns.  Execute your code and confirm that the new row has been inserted. 
DECLARE
    v_max_deptno new_depts.department_id%TYPE;
    v_dept_name new_depts.department_name%TYPE := 'A New Department';
    v_dept_id new_depts.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO v_max_deptno
    FROM new_depts;
    DBMS_OUTPUT.PUT_LINE('The maximum department id is: ' || v_max_deptno);
    v_dept_id := v_max_deptno + 10;
    DBMS_OUTPUT.PUT_LINE('v_dept_id: '|| v_dept_id);
    INSERT INTO NEW_DEPTS(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, MANAGER_ID) 
    VALUES(V_DEPT_ID, V_DEPT_NAME,NULL,NULL);
    DBMS_OUTPUT.PUT_LINE(V_DEPT_ID || V_DEPT_NAME);
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;


//Now modify the block, removing the INSERT statement and adding a statement that will UPDATE all rows with location_id = 1700 to location_id = 1400. Execute the block again to see how many rows were updated. 
 
DECLARE
    v_max_deptno new_depts.department_id%TYPE;
    v_dept_name new_depts.department_name%TYPE := 'A New Department';
    v_dept_id new_depts.department_id%TYPE;
BEGIN
    SELECT MAX(department_id) INTO v_max_deptno
    FROM new_depts;
    DBMS_OUTPUT.PUT_LINE('The maximum department id is: ' || v_max_deptno);
    v_dept_id := v_max_deptno + 10;
    DBMS_OUTPUT.PUT_LINE('v_dept_id: '|| v_dept_id);
    UPDATE NEW_DEPTS SET LOCATION_ID = 1400 WHERE LOCATION_ID = 1700;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;

//======================================================================================
// LAB 3.4
CREATE TABLE endangered_species 
   (species_id NUMBER(4) CONSTRAINT es_spec_pk PRIMARY KEY,
   common_name  VARCHAR2(30) CONSTRAINT es_com_name_nn NOT NULL,   
   scientific_name  VARCHAR2(30) CONSTRAINT es_sci_name_nn NOT NULL
   ); 
   
   
BEGIN 
   INSERT INTO endangered_species  
    	    VALUES (100, 'Polar Bear', 'Ursus maritimus'); 
  SAVEPOINT sp_100; 
  INSERT INTO endangered_species  
        VALUES (200, 'Spotted Owl', 'Strix occidentalis'); 
  SAVEPOINT sp_200; 
  INSERT INTO endangered_species  
        VALUES (300, 'Asiatic Black Bear', 'Ursus thibetanus'); 
  ROLLBACK TO sp_100; 
  COMMIT; 
END; 

select * from endangered_species  
 
 
 BEGIN 
   INSERT INTO endangered_species  
      VALUES (400, 'Blue Gound Beetle', 'Carabus intricatus'); 
  SAVEPOINT sp_400; 
  INSERT INTO endangered_species 
      VALUES (500, 'Little Spotted Cat', 'Leopardus tigrinus'); 
  ROLLBACK; 
  INSERT INTO endangered_species 
      VALUES (600, 'Veined Tongue-Fern', 'Elaphoglossum nervosum'); 
  ROLLBACK TO sp_400; 
END; 


