-- Yulia Flenova 
-- N01342767 
-- QUESTION 1
CREATE TABLE temp (
    num_one  NUMBER(5),
    num_two  NUMBER(2),
    char_out VARCHAR2(30)
);

-- Outer block 
<< outer >> DECLARE
    -- required variables
    x       NUMBER := 0;
    counter NUMBER := 4;
BEGIN
-- first loop for the thousands numbers
    FOR i IN 1..counter LOOP
    -- increase x (work with coloumn 2)
        x := x + 1;
        INSERT INTO temp (
            num_one,
            num_two,
            char_out
        ) VALUES (
            i * 1000,
            x,
            'in OUTER loop'
        ); -- thousands increase inside the insert
        --inner block 
        DECLARE 
        -- required variables
            x       NUMBER := 0;
            counter NUMBER := 4;
        BEGIN 
        -- second for loop
            FOR j IN 1..counter LOOP
            -- continue to incease the second coloumn value
                x := x + 1;
            -- refer to the outer value
                outer.x := outer.x + 1;
                INSERT INTO temp (
                    num_one,
                    num_two,
                    char_out
                ) VALUES (
                    x,
                    outer.x,
                    'in INNER loop'
                );
            -- end inner loop
            END LOOP;
        -- end second block
        END;
    -- end first loop
    END LOOP;
END;

SELECT
    *
FROM
    temp;

DELETE temp;

DROP TABLE temp;
---===========================================================================================================================================
-- Yulia Flenova 
-- N01342767 
--QUESTION 2

DECLARE
-- variables to use
    V_RAISE_LIMIT NUMBER := 2000;
    V_ANNUAL_RAISE NUMBER := 0;
    V_DIFFERENCE NUMBER := 0;
    V_RAISE EMP.SAL%TYPE;
    V_NEW_SALARY EMP.SAL%TYPE;
    V_OVERALL_COST NUMBER:=0;
    
    -- run through emoloyees
    CURSOR CUR_EMPLOYEES IS 
        SELECT EMPNO, ENAME, SAL, JOB
        FROM EMP
        ORDER BY EMPNO;

BEGIN
    FOR EMP_RECORD IN CUR_EMPLOYEES LOOP
    V_RAISE :=0;
    V_NEW_SALARY:=EMP_RECORD.SAL *12;
        -- Calculate 5% annual raises for all employees except AD_VP
        IF EMP_RECORD.JOB <> 'AD_VP' THEN
            V_ANNUAL_RAISE := (EMP_RECORD.sal * 12) * 0.05;
            -- IF THE ANNUAL RAISE CALCULATED IS MORE THAN 2,000, SET THE RAISE TO 2,000
            --	If the 5% totals to more than 2000, cap the raise to 2000.
            IF V_ANNUAL_RAISE > V_RAISE_LIMIT THEN
                V_RAISE := V_RAISE_LIMIT;
            END IF;
            -- calculate new salary
            V_NEW_SALARY := (EMP_RECORD.sal * 12) + V_RAISE;
            -- Update the salary in the EMP table
            UPDATE EMP
            SET SAL = V_NEW_SALARY / 12
            WHERE EMPNO = EMP_RECORD.EMPNO;
            -- keep count for total amount of salary increase
            V_OVERALL_COST:=V_OVERALL_COST+V_RAISE;
        END IF;
        --For each employee display the current annual salary, raise, and proposed new annual salary.
        DBMS_OUTPUT.PUT_LINE(EMP_RECORD.EMPNO || ' ' || EMP_RECORD.ename || ' ' || EMP_RECORD.sal * 12 || ' ' || V_RAISE || ' ' || V_NEW_SALARY);
    END LOOP;
    --At the end, show the total amount of salary increase.
    DBMS_OUTPUT.PUT_LINE('OVERALL COST: '|| V_OVERALL_COST);
END;
---===========================================================================================================================================
-- Yulia Flenova 
-- N01342767 
-- QUESTION 3
DECLARE
-- VARIABLES
    v_language_name VARCHAR2(100):='NOT FOUND';
    V_COUNTRY_NAME VARCHAR2(100) := 'Russian Federation1';
BEGIN
-- JOINING TABLES TO FIND CONNECTIONS
    SELECT l.language_name
    INTO v_language_name
    FROM countries c
    JOIN spoken_languages sl ON c.country_id = sl.country_id
    JOIN languages l ON sl.language_id = l.language_id
    WHERE c.country_name = V_COUNTRY_NAME;

    DBMS_OUTPUT.PUT_LINE('The language spoken is ' || v_language_name);
    -- MESSAGE IF NOT COUNTRY DOESNT EXIST
    EXCEPTION
        WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('COUNTRY NOT FOUND');
END;
---===========================================================================================================================================
-- Yulia Flenova 
-- N01342767 
-- QUESTION 4
DECLARE
-- SET UP VARIABLES
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
    V_YEARS_WORKED NUMBER;
    
    --SET UP CURSOR
    CURSOR CUR_EMPLOYEES IS
    SELECT FIRST_NAME, HIRE_DATE
    FROM EMPLOYEES 
    WHERE DEPARTMENT_ID = 80 OR DEPARTMENT_ID = 85; -- SALES EUROPE AND SALES AMERICA
BEGIN
    -- Loop through the employees
    DBMS_OUTPUT.PUT_LINE ( 'Annonymus block completed'); --MESSAGE FROM EXAMPLE
    -- start loop in cursor
    FOR emp_rec IN CUR_EMPLOYEES
        LOOP
            V_FIRST_NAME := emp_rec.first_name;
            V_HIRE_DATE := emp_rec.hire_date;
            V_YEARS_WORKED := TRUNC(MONTHS_BETWEEN(SYSDATE, V_HIRE_DATE) / 12);
            -- Display employee name and years worked
            DBMS_OUTPUT.PUT_LINE('The ' || V_FIRST_NAME || ' has worked in the company for ' || V_YEARS_WORKED);
        END LOOP ;
END;
---===========================================================================================================================================
-- Yulia Flenova 
-- N01342767 
--QUESTION 5
DECLARE
    -- Declare variables 
    V_MANAGER_FIRST EMPLOYEES.FIRST_NAME%TYPE;
    V_MANAGER_LAST EMPLOYEES.last_name%TYPE;
    V_MANAGER_DEPT departments.department_name%TYPE;
    V_MANAGER_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    V_EMPLOYEE_FIRST EMPLOYEES.FIRST_NAME%TYPE;
    V_EMPLOYEE_LAST EMPLOYEES.last_name%TYPE;
    v_employee_dept_name departments.department_name%TYPE;    
    -- Declare a cursor to fetch managers using an inner join to connect inside the database
    CURSOR CUR_MANAGER IS
        SELECT e.FIRST_NAME, e.last_name, d.department_name, e.employee_id
        FROM EMPLOYEES e
        JOIN departments d ON e.department_id = d.department_id
        WHERE e.MANAGER_ID IS NULL
        ORDER BY e.FIRST_NAME, e.last_name;
BEGIN
    -- Open the manager cursor
    OPEN CUR_MANAGER;    
    -- Fetch manager
    LOOP
        FETCH CUR_MANAGER INTO
        V_MANAGER_FIRST,
        V_MANAGER_LAST,
        V_MANAGER_DEPT,
        V_MANAGER_ID;
        EXIT WHEN CUR_MANAGER%NOTFOUND;
            -- Print manager information
            dbms_output.put_line('Manager:');
            dbms_output.put_line(' First Name: ' || V_MANAGER_FIRST);
            dbms_output.put_line(' Last Name: ' || V_MANAGER_LAST);
            dbms_output.put_line(' Department Name: ' || V_MANAGER_DEPT);
            -- Declare a cursor to fetch employees reporting to a manager
    DECLARE
     -- Declare a cursor to fetch employees using an inner join to connect inside the database
        CURSOR CUR_EMPLOYEE IS
            SELECT
            e.FIRST_NAME,
            e.last_name,
            d.department_name
            FROM
            EMPLOYEES e
            JOIN departments d ON e.department_id = d.department_id
            WHERE
            e.manager_id = v_manager_id
            ORDER BY
            e.FIRST_NAME,
            e.last_name;
    BEGIN
        -- Open the employee cursor for the current manager
        OPEN CUR_EMPLOYEE;            
        -- Fetch and process employees reporting to the manager
        LOOP
            FETCH CUR_EMPLOYEE INTO
            V_EMPLOYEE_FIRST,
            V_EMPLOYEE_LAST,
            v_employee_dept_name;
        EXIT WHEN CUR_EMPLOYEE%NOTFOUND;                
            -- Print employee information
            dbms_output.put_line('Employee:');
            dbms_output.put_line(' First Name: ' || V_EMPLOYEE_FIRST);
            dbms_output.put_line(' Last Name: ' || V_EMPLOYEE_LAST);
            dbms_output.put_line(' Department Name: ' || v_employee_dept_name);
        END LOOP;            
        -- Close the employee cursor
        CLOSE CUR_EMPLOYEE;
    END;
    END LOOP;
    -- Close the manager cursor 
    CLOSE CUR_MANAGER;
END;
