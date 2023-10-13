// LAB 6 
//QUESTION 4
DECLARE 
  v_jobid    employees.job_id%TYPE; 
BEGIN 
  SELECT job_id INTO v_jobid 
    FROM employees 
    WHERE department_id = 80; 
EXCEPTION
    WHEN TOO_MANY_ROWS THEN 
        DBMS_OUTPUT.PUT_LINE('YOU MESSED UP, TOO MANY ROWS');
END; 

// QUESTION 5
BEGIN 
  INSERT INTO departments (department_id, department_name, manager_id, location_id) 
    VALUES (50, 'A new department', 100, 1500); 
  DBMS_OUTPUT.PUT_LINE('The new department was inserted'); 
END; 

//QUESTION 6 
CREATE TABLE emp_temp AS SELECT * FROM employees; 
SELECT * FROM emp_temp WHERE department_id = 10; 
DELETE FROM emp_temp WHERE employee_id = 30; 

DECLARE 
  v_employee_id  emp_temp.employee_id%TYPE; 
  v_last_name       emp_temp.last_name%TYPE; 
BEGIN 
  SELECT employee_id, last_name INTO v_employee_id, v_last_name     FROM emp_temp 
    WHERE department_id = 30; -- run with values 10, 20, and 30 
  DBMS_OUTPUT.PUT_LINE('The SELECT was successful'); 
EXCEPTION 
    WHEN TOO_MANY_ROWS THEN 
        DBMS_OUTPUT.PUT_LINE('YOU MESSED UP, TOO MANY ROWS');
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('YOU MESSED UP, EMPLOYEE DOEST EXIST');
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('An exception has occurred'); 
END; 

DROP TABLE emp_temp; 

//QUESTION 9
DECLARE 
   v_number     NUMBER(2); BEGIN 
   v_number := 9999; 
EXCEPTION 
  WHEN OTHERS THEN  
    DBMS_OUTPUT.PUT_LINE('An exception has occurred'); 
END; 

DECLARE
   v_number     NUMBER(2);
BEGIN
   v_number := 9999;
END;

//QUESTION 11 
DECLARE 
  v_number    NUMBER(4); BEGIN 
  v_number := 1234;     
DECLARE 
      v_number     NUMBER(4);    
BEGIN       v_number := 5678; 
      v_number := 'A character string'; 
END; 
EXCEPTION 
  WHEN OTHERS THEN 
    DBMS_OUTPUT.PUT_LINE('An exception has occurred'); 
    DBMS_OUTPUT.PUT_LINE('The number is: ' || v_number);
END; 


