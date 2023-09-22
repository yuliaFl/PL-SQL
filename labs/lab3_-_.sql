//LAB 3.1
DELETE FROM STUDENTS;

//Write a SQL statement to create the above table. 
CREATE TABLE GROCERY_ITEMS(
    PRODUCT_ID INT,
    BRAND VARCHAR(25),
    DESCRIPTION VARCHAR(25)
);
// Write and execute three SQL statements to explicitly add the above data to the table. 
INSERT INTO GROCERY_ITEMS (PRODUCT_ID, BRAND, DESCRIPTION) VALUES ( 110, 'COLGATE','TOORTHPASTE');
INSERT INTO GROCERY_ITEMS (PRODUCT_ID, BRAND, DESCRIPTION) VALUES ( 111, 'IVORY','SOAP');
INSERT INTO GROCERY_ITEMS (PRODUCT_ID, BRAND, DESCRIPTION) VALUES ( 112, 'HEINZ','KETCHUP');

// Write and execute a SQL statement that will explicitly add your favorite beverage to the table.  
INSERT INTO GROCERY_ITEMS VALUES (113, 'S.PELLEGRINO', 'SPARKLING WATER');

//Write and execute a SQL statement that modifies the description for Heinz ketchup to “tomato catsup”.  
UPDATE GROCERY_ITEMS 
SET DESCRIPTION = 'TOMATO CATSUP'
WHERE DESCRIPTION = 'KETCHUP';

SELECT * FROM GROCERY_ITEMS;

//Write and execute a SQL statement that will implicitly add your favorite candy to the table.  
INSERT INTO GROCERY_ITEMS (PRODUCT_ID, BRAND, DESCRIPTION) VALUES (114, 'KIT KAT', 'CANDY');

//Write and execute a SQL statement that changes the soap brand from “Ivory” to “Dove.” 
UPDATE GROCERY_ITEMS 
SET BRAND = 'DOVE'
WHERE BRAND = 'IVORY';

//Write and execute SQL statements to create the new_items table and populate it with the data in the table.  
CREATE TABLE NEW_ITEMS 
AS (SELECT * FROM GROCERY_ITEMS 
WHERE PRODUCT_ID = 110);
INSERT INTO NEW_ITEMS VALUES (175, 'DEW', 'DENTAL PASTE');
INSERT INTO NEW_ITEMS VALUES (275, 'PALMOLIVE', 'DISH DETERGENT');

SELECT * FROM GROCERY_ITEMS;

MERGE INTO GROCERY_ITEMS a
USING NEW_ITEMS b
ON (a.PRODUCT_ID = b.PRODUCT_ID)
WHEN MATCHED THEN
    UPDATE SET a.BRAND = b.BRAND, a.DESCRIPTION = b.DESCRIPTION
WHEN NOT MATCHED THEN 
    INSERT (a.PRODUCT_ID, a.BRAND, a.DESCRIPTION)
    VALUES (b.PRODUCT_ID, b.BRAND, b.DESCRIPTION);
    
//LAB 3.2
// QUESTIONS 4-5
DECLARE 
    v_emp_lname    employees.last_name%TYPE;   
    v_emp_salary    employees.salary%TYPE; 
BEGIN 
    SELECT last_name, salary INTO v_emp_lname, v_emp_salary 
       FROM employees 
       WHERE job_id = 'IT_PRAG'; 
    DBMS_OUTPUT.PUT_LINE(v_emp_lname || ' ' || v_emp_salary); 
END; 


DECLARE 
   last_name VARCHAR2(25) := 'Fay';       
BEGIN 
   UPDATE emp_dup  
     SET first_name = 'Jennifer' 
     WHERE last_name = last_name;  
END; 

CREATE TABLE EMP_DUP
AS (SELECT * FROM EMPLOYEES);

SELECT FIRST_NAME, LAST_NAME FROM EMP_DUP;

DROP TABLE EMP_DUP;

DECLARE 
   V_last_name VARCHAR2(25) := 'Fay';       
BEGIN 
   UPDATE emp_dup  
     SET first_name = 'Jennifer' 
     WHERE last_name = V_last_name;  
END; 

//QUESTION 6 
CREATE TABLE HELLO_TEST(
HELLO_TEST INT,
V_VALUE VARCHAR(25)
);

INSERT INTO HELLO_TEST (HELLO_TEST, V_VALUE) VALUES (1, 'HELLO_TEST')

DROP TABLE HELLO_TEST;

// LAB 3.3
CREATE TABLE new_depts AS SELECT * FROM departments; 


DECLARE 
   v_max_deptno new_depts.department_id%TYPE; 
   v_dept_name    new_depts.department_name%TYPE := 'A New Department'; 
   v_dept_id      	new_depts.department_id%TYPE; 
BEGIN 
   SELECT MAX(department_id) INTO v_max_deptno 
      FROM new_depts; 
   DBMS_OUTPUT.PUT_LINE('The maximum department id is: ' || v_max_deptno);
   V_DEPT_ID := V_MAX_DEPTNO +10; 
  DBMS_OUTPUT.PUT_LINE(V_DEPT_ID || ' - ' || v_max_deptno);
  INSERT INTO NEW_DEPTS (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, MANAGER_ID) VALUES (254, 'TEST', NULL, NULL);
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;

// QUESTION 8
DECLARE 
   v_max_deptno new_depts.department_id%TYPE; 
   v_dept_name    new_depts.department_name%TYPE := 'A New Department'; 
   v_dept_id      	new_depts.department_id%TYPE; 
BEGIN 
   SELECT MAX(department_id) INTO v_max_deptno 
      FROM new_depts; 
    DBMS_OUTPUT.PUT_LINE('The maximum department id is: ' || v_max_deptno);
    V_DEPT_ID := V_MAX_DEPTNO +10; 
    DBMS_OUTPUT.PUT_LINE(V_DEPT_ID || ' - ' || v_max_deptno);
    UPDATE NEW_DEPTS
    SET LOCATION_ID = 1700
    WHERE LOCATION_ID= 1400;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;

    SELECT * FROM NEW_DEPTS;
    
// LAB 3.4

CREATE TABLE endangered_species 
   (species_id  	NUMBER(4) CONSTRAINT es_spec_pk PRIMARY KEY,  
   common_name  VARCHAR2(30) CONSTRAINT es_com_name_nn NOT NULL,    
   scientific_name  VARCHAR2(30) CONSTRAINT es_sci_name_nn NOT NULL); 
 
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
