// Lab 5
// QUESTION 1 A-F

DECLARE 
    CURSOR CURRENCIES_CUR IS 
    SELECT CURRENCY_CODE, CURRENCY_NAME 
    FROM CURRENCIES
    ORDER BY CURRENCY_NAME ASC;
    
    V_CURRENCY_CODE CURRENCIES.CURRENCY_CODE%TYPE;
    V_CURRENCY_NAME CURRENCIES.CURRENCY_NAME%TYPE;
BEGIN
    OPEN CURRENCIES_CUR;
    LOOP
        FETCH CURRENCIES_CUR INTO V_CURRENCY_CODE, V_CURRENCY_NAME;
        DBMS_OUTPUT.PUT_LINE(V_CURRENCY_CODE || ' ' || V_CURRENCY_NAME);
    EXIT WHEN CURRENCIES_CUR%NOTFOUND;
    END LOOP;
    CLOSE CURRENCIES_CUR;
END;

// QUESTION 1 - G
BEGIN 
    FOR V_CURSOR IN 
    (SELECT COUNTRY_NAME, NATIONAL_HOLIDAY_DATE, NATIONAL_HOLIDAY_NAME
    FROM COUNTRIES
    WHERE REGION_ID=5 AND NATIONAL_HOLIDAY_DATE IS NOT NULL)
    LOOP 
    DBMS_OUTPUT.PUT_LINE(V_CURSOR.COUNTRY_NAME);
    END LOOP;
END;

//QUESTION 2 
DECLARE
   CURSOR CUR_REGION IS
      SELECT R.REGION_NAME, COUNT(C.COUNTRY_ID) AS C_COUNT
      FROM REGIONS R
      JOIN COUNTRIES C ON R.REGION_ID = C.REGION_ID
      GROUP BY R.REGION_NAME
      HAVING COUNT(C.COUNTRY_ID) >= 10
      ORDER BY R.REGION_NAME ASC;
BEGIN
   FOR X IN CUR_REGION LOOP
      DBMS_OUTPUT.PUT_LINE('Region: ' || X.REGION_NAME || '  Country Count: ' || X.C_COUNT);
   END LOOP;
END;


// QUESTION 3
BEGIN 
    FOR V_CURSOR IN 
    (SELECT COUNTRY_NAME, NATIONAL_HOLIDAY_DATE, NATIONAL_HOLIDAY_NAME
    FROM COUNTRIES
    WHERE REGION_ID=5)
    LOOP 
    DBMS_OUTPUT.PUT_LINE('COUNTRY NAME: '|| V_CURSOR.COUNTRY_NAME||' HOLIDAY NAME: '|| V_CURSOR.NATIONAL_HOLIDAY_NAME || ' HOLIDAY DATE: ' || V_CURSOR.NATIONAL_HOLIDAY_DATE );
    END LOOP;
END;

// QUESTION 4 
DECLARE 
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
    V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
    V_SALARY EMPLOYEES.SALARY%TYPE;
    V_ROW_COUNT NUMBER := 0;
    
    CURSOR CUR_EMPLOYEES IS 
    SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
    FROM EMPLOYEES
    ORDER BY SALARY DESC;
BEGIN
    OPEN CUR_EMPLOYEES;
    LOOP 
        FETCH CUR_EMPLOYEES INTO V_FIRST_NAME, V_LAST_NAME, V_JOB_ID, V_SALARY;
        V_ROW_COUNT := V_ROW_COUNT+1;
        
        IF V_ROW_COUNT > 6 THEN 
            EXIT;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('FIRST NAME: '|| V_FIRST_NAME || '          V_LAST_NAME: '|| V_LAST_NAME||'           JOB ID:' || V_JOB_ID || '           SALARY: '|| V_SALARY);
        
    END LOOP;
    CLOSE CUR_EMPLOYEES;
END;

// QUESTION 6
DECLARE 
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
    V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
    V_SALARY EMPLOYEES.SALARY%TYPE;
    V_ROW_COUNT NUMBER := 0;
    
    CURSOR CUR_EMPLOYEES IS 
    SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
    FROM EMPLOYEES
    ORDER BY SALARY DESC;
BEGIN
    OPEN CUR_EMPLOYEES;
    LOOP 
        FETCH CUR_EMPLOYEES INTO V_FIRST_NAME, V_LAST_NAME, V_JOB_ID, V_SALARY;
        V_ROW_COUNT := V_ROW_COUNT+1;
        
        IF CUR_EMPLOYEES%NOTFOUND THEN 
            EXIT;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('FIRST NAME: '|| V_FIRST_NAME || '          V_LAST_NAME: '|| V_LAST_NAME||'           JOB ID:' || V_JOB_ID || '           SALARY: '|| V_SALARY);
        
    END LOOP;
    CLOSE CUR_EMPLOYEES;
END;

//Use a cursor FOR loop, declaring the cursor using a subquery in the FOR…LOOP statement. 5. 
//QUESTION 7 
DECLARE
    V_COUNTRY_NAME      COUNTRIES.COUNTRY_NAME%TYPE;
    V_HIGHEST_ELEVATION     COUNTRIES.HIGHEST_ELEVATION%TYPE;
    V_CLIMATE       COUNTRIES.CLIMATE%TYPE;
    
   CURSOR CUR_COUNTRY IS
      SELECT COUNTRY_NAME, HIGHEST_ELEVATION, CLIMATE
      FROM COUNTRIES 
      WHERE HIGHEST_ELEVATION > 8000;
BEGIN
   FOR X IN CUR_COUNTRY LOOP
      DBMS_OUTPUT.PUT_LINE('Country Name: ' || V_COUNTRY_NAME);
      DBMS_OUTPUT.PUT_LINE('Highest Elevation: ' || V_HIGHEST_ELEVATION);
      DBMS_OUTPUT.PUT_LINE('Climate: ' ||V_CLIMATE);
   END LOOP;
END;

//QUESTION 8
DECLARE
    V_COUNTRY_NAME COUNTRIES.COUNTRY_NAME%TYPE;
    V_ROW_COUNT NUMBER;
    
    CURSOR COUNTRY_CURSOR IS
        SELECT C.COUNTRY_NAME
        FROM COUNTRIES C
        LEFT JOIN SPOKEN_LANGUAGES S ON C.COUNTRY_ID = S.COUNTRY_ID
        GROUP BY C.COUNTRY_NAME;

BEGIN
    OPEN COUNTRY_CURSOR;
    LOOP
        FETCH COUNTRY_CURSOR INTO V_COUNTRY_NAME;
        EXIT WHEN COUNTRY_CURSOR%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('COUNTRY NAME: ' || V_COUNTRY_NAME);

        V_ROW_COUNT := V_ROW_COUNT + 1;
    END LOOP;
    
    CLOSE COUNTRY_CURSOR;

    DBMS_OUTPUT.PUT_LINE('TOTAL ' || V_ROW_COUNT);
END;



//QUESTION 9
DECLARE
   V_COUNTRY_NAME COUNTRIES.COUNTRY_NAME%TYPE;
   V_AREA COUNTRIES.AREA%TYPE; -- Corrected typo in the column name

   CURSOR CUR_COUNTRY(P_REGION_ID NUMBER) IS
      SELECT C.COUNTRY_NAME, C.AREA
      FROM COUNTRIES C
      WHERE C.REGION_ID = P_REGION_ID;
BEGIN
   OPEN CUR_COUNTRY(5);
   DBMS_OUTPUT.PUT_LINE('Region 5 (South America):');
   LOOP
      FETCH CUR_COUNTRY INTO V_COUNTRY_NAME, V_AREA;
      EXIT WHEN CUR_COUNTRY%NOTFOUND; -- Corrected the cursor name
      DBMS_OUTPUT.PUT_LINE('Name: ' || V_COUNTRY_NAME || ', Area: ' || V_AREA);
   END LOOP;
   CLOSE CUR_COUNTRY;

   OPEN CUR_COUNTRY(30);
   DBMS_OUTPUT.PUT_LINE('Region 30 (Eastern Asia):');
   LOOP
      FETCH CUR_COUNTRY INTO V_COUNTRY_NAME, V_AREA;
      EXIT WHEN CUR_COUNTRY%NOTFOUND; -- Corrected the cursor name
      DBMS_OUTPUT.PUT_LINE('Name: ' || V_COUNTRY_NAME || ', Area: ' || V_AREA);
   END LOOP;
   CLOSE CUR_COUNTRY;
END;


//QUESTION 10 