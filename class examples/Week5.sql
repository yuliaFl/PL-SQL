DECLARE 
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE; -- Use %TYPE to infer the data type
    CURSOR CUR_EMP_FIRST_NAME IS
    SELECT FIRST_NAME FROM EMPLOYEES WHERE SALARY < 6000;
BEGIN
    OPEN CUR_EMP_FIRST_NAME; 
    DBMS_OUTPUT.PUT_LINE('Row count = ' || CUR_EMP_FIRST_NAME%ROWCOUNT);
    LOOP
        FETCH CUR_EMP_FIRST_NAME INTO V_FIRST_NAME; 
         DBMS_OUTPUT.PUT_LINE('Row count = ' || CUR_EMP_FIRST_NAME%ROWCOUNT);
        DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME);
        EXIT WHEN CUR_EMP_FIRST_NAME%NOTFOUND;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Row count = ' || CUR_EMP_FIRST_NAME%ROWCOUNT);
    CLOSE CUR_EMP_FIRST_NAME;
END;

//=================================================================================

DECLARE 
    CURSOR CUR_EMP_DPT IS 
        SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
        FROM EMPLOYEES E 
        JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_DEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
    OPEN CUR_EMP_DPT;
    LOOP 
        FETCH CUR_EMP_DPT INTO V_FIRST_NAME, V_DEPARTMENT_NAME;
        EXIT WHEN CUR_EMP_DPT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_DEPARTMENT_NAME);
    END LOOP;
    CLOSE CUR_EMP_DPT;
END;

//=================================================================================

DECLARE 
//DECLARE PARAMS
    CURSOR CUR_EMP_DPT (P_SALARY EMPLOYEES.SAKARY%TYPE) IS 
        SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
        FROM EMPLOYEES E 
        JOIN DEPARTMENTS D 
        ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        //REPLACE IN THE WHERECLOSE
        WHERE SALARY < P_SALARY;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_DEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
//ADD IN OPEN 
    OPEN CUR_EMP_DPT(6000);
    LOOP 
        FETCH CUR_EMP_DPT INTO V_FIRST_NAME, V_DEPARTMENT_NAME;
        EXIT WHEN CUR_EMP_DPT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_DEPARTMENT_NAME);
    END LOOP;
    CLOSE CUR_EMP_DPT;
    OPEN CUR_EMP_DPT(10000);
    LOOP 
        FETCH CUR_EMP_DPT INTO V_FIRST_NAME, V_DEPARTMENT_NAME;
        EXIT WHEN CUR_EMP_DPT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_DEPARTMENT_NAME);
    END LOOP;
    CLOSE CUR_EMP_DPT;
END;

//=================================================================================
BEGIN
    FOR V_CURSOR IN 
    (SELECT FIRST_NAME, DEPARTMENT_NAME
        FROM EMPLOYEES E JOIN DEPARTMENTS D
        ON E.DEPARTMENT_ID=D.DEPARTMENT_ID)
        LOOP
        DBMS_OUTPUT.PUT_LINE(V_CURSOR_FIRST_NAME || ', ' || V_CURS_DEPARTMENT_NAME);
    END LOOP;
END;

//===============================================================================
//CURSOR DEP_ID DEPT_NAME LOOP DEPARTMENTS END LOOP
DECLARE
    CURSOR CUR_EMPLOYEES IS
        SELECT *
        FROM EMPLOYEES;
    V_EMP EMPLOYEES%ROWTYPE;
BEGIN
    OPEN CUR_EMPLOYEES;
    LOOP
        FETCH CUR_EMPLOYEES INTO V_EMP;
        EXIT WHEN CUR_EMPLOYEES%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_EMP.SALARY || ' ' || V_EMP.EMAIL); 
    END LOOP;
    IF CUR_DEPARTMENTS%OPEN THEN 
        CLOSE CUR_DEPARTMENTS;
    END IF;
    CLOSE CUR_EMPLOYEES; 
END;

// DECLARE PARAM DEFINE CURSOR
// USE PARAM IN WHERE CLOSE 
//PASS THE CLASUE TO PARAM USING OPEN OR FOR