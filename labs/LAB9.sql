--YULIA FLENOVA
-- N01342767
-- LAB 9

/*
Create a function called full_name. Pass two parameters to the function, an employee’s last name and first name. 
The function should return the full name in the format, last name, comma, space, first name (for example: Smith, Joe)
*/

CREATE OR REPLACE FUNCTION FULL_NAME 
    (P_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE,
     P_LAST_NAME EMPLOYEES.LAST_NAME%TYPE)
RETURN VARCHAR2 IS
    V_FULL_NAME VARCHAR2(200); 
BEGIN
    V_FULL_NAME := P_LAST_NAME || ', ' || P_FIRST_NAME;
    RETURN V_FULL_NAME;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END FULL_NAME;

DECLARE
    V_FULL_NAME VARCHAR2(200);
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE := 'JOE'; 
    V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE := 'SMITH'; 
BEGIN
    V_FULL_NAME := FULL_NAME(V_FIRST_NAME, V_LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('FULL NAME ' || V_FULL_NAME);
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('FULL NAME ' || FULL_NAME('JOE', 'SMITH')); 
END;

SELECT
    FIRST_NAME,
    LAST_NAME,
    FULL_NAME(FIRST_NAME, LAST_NAME) AS FULL_NAME
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID = 50;

/*
Create a function called divide that accepts two numbers as input and returns 
the result of dividing the first number by the second number, rounded to two decimal places
*/
CREATE OR REPLACE FUNCTION DIVIDE 
    (P_FIRST_NUMBER NUMBER,
    P_SECOND_NUMBER NUMBER)
RETURN NUMBER AS 
    V_RESULT NUMBER;
BEGIN 
    V_RESULT := ROUND(P_FIRST_NUMBER / P_SECOND_NUMBER, 2);
    RETURN V_RESULT;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END DIVIDE;

DECLARE
    RESULT NUMBER;
BEGIN
    RESULT := DIVIDE(16, 0);
    DBMS_OUTPUT.PUT_LINE(result);
END;

CREATE OR REPLACE FUNCTION DIVIDE 
    (P_FIRST_NUMBER NUMBER,
    P_SECOND_NUMBER NUMBER)
RETURN NUMBER AS 
    V_RESULT NUMBER;
BEGIN 
    V_RESULT := ROUND(P_FIRST_NUMBER / P_SECOND_NUMBER, 2);
    RETURN V_RESULT;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN NULL;
END DIVIDE;

CREATE TABLE f_emps 
  AS SELECT employee_id, last_name, salary, department_id 
  FROM employees; 
 
CREATE TABLE f_depts 
  AS SELECT department_id, department_name 
  FROM departments; 

/*
Create and execute a function sal_increase using the following two code samples. 
The first creates a function which returns an employee’s new salary if a percentage increase is granted. 
The second calls this function in a SELECT statement, using an increase of 5 percent. 
*/

CREATE OR REPLACE FUNCTION sal_increase    
    (p_salary f_emps.salary%TYPE,     
     p_percent_incr   	NUMBER) 
RETURN NUMBER IS 
BEGIN 
  RETURN (p_salary + (p_salary * p_percent_incr / 100)); 
END; 
 
SELECT last_name, salary, sal_increase(salary, 5)  
FROM f_emps; 

-- WITH FUNCTION
SELECT last_name, salary, sal_increase(salary, 5)  
FROM f_emps
WHERE sal_increase(salary, 5) > 10000;

-- WITHOUT FUNCTION
SELECT last_name, salary, salary + (salary * 0.05)
FROM f_emps
WHERE salary + (salary * 0.05) > 10000;

SELECT last_name, salary, sal_increase(salary, 5)  
FROM f_emps
WHERE sal_increase(salary, 5) > 10000
ORDER BY SAL_INCREASE(SALARY,5)DESC;

SELECT department_id, SUM(salary) 
  FROM f_emps 
  GROUP BY department_id 
  HAVING SUM(salary) > 20000; 


SELECT department_id, SUM(salary) 
  FROM f_emps 
  GROUP BY department_id 
  HAVING sal_increase(SUM(salary), 5) > 20000;
  
  
CREATE OR REPLACE FUNCTION check_dept  
    (p_dept_id  	f_depts.department_id%TYPE)   RETURN BOOLEAN IS 
  v_dept_id         f_depts.department_id%TYPE; 
BEGIN 
  SELECT department_id INTO v_dept_id 
    FROM f_depts 
    WHERE department_id = p_dept_id; 
  RETURN TRUE; 
EXCEPTION 
  WHEN NO_DATA_FOUND THEN 
    RETURN FALSE; 
END; 

