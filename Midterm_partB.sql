/*
Create an anonymous block to perform the following task: Create an anonymous block to display a Total number of currencies that have the keyword "dollar" 
in the currency name. You can use wf_Currencies or currencies Table for this task
#1 Create all the variables
#2 Add logic to calculate the total number of currencies with Names with the word 'Dollar'
#3 Display the total # to the output screen.
*/
-- Yulia Flenova
-- N0134267
-- QUESTION 1 
DECLARE
    CURSOR CUR_CURRENCY IS
        SELECT * FROM CURRENCIES
        WHERE CURRENCY_NAME like '%dollar' ;
    V_CURRENCY_INFO CURRENCIES%ROWTYPE;
BEGIN
    OPEN CUR_CURRENCY;
    LOOP
        FETCH CUR_CURRENCY INTO V_CURRENCY_INFO;
        --DBMS_OUTPUT.PUT_LINE(V_CURRENCY_INFO.CURRNECY_CODE|| V_CURRENCY_INFO.CURRENCY_NAME);
        EXIT WHEN  CUR_CURRENCY%NOTFOUND;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE(CUR_CURRENCY%ROWCOUNT||' ROWS FETCHED');
    IF CUR_CURRENCY%ISOPEN THEN 
        CLOSE CUR_CURRENCY;
    END IF;
END;
    

/*
Create an anonymous block to list all the Countries from the Countries or wf_countries table where the Country name starts with the letter 'R' 
with a population greater than 100,000. You can use table wf_countries. Perform the following steps:
Create a cursor to return the Country Name and Capital of all the countries whose names start with the letter 'R' with a population greater than 100,000.
Loop through without using a for loop to fetch all the records and display the result.
Display the total number of records fetched by the Cursor.
*/
-- Yulia Flenova
-- N0134267
-- QUESTION 2
DECLARE
    CURSOR CUR_COUNTRIES IS
        SELECT * FROM COUNTRIES
        WHERE COUNTRY_NAME like 'R%' AND POPULATION > 100000;
    V_COUNTRY_INFO COUNTRIES%ROWTYPE;
    --V_COUNTRY_NAME COUNTRIES.COUNTRY_NAME%ROWTYPE;
   -- V_CAPITOL COUNTRIES.CAPITOL%ROWTYPE;
BEGIN
    OPEN CUR_COUNTRIES;
    LOOP
        FETCH CUR_COUNTRIES INTO V_COUNTRY_INFO;
        DBMS_OUTPUT.PUT_LINE(V_COUNTRY_INFO.COUNTRY_NAME ||' '|| V_COUNTRY_INFO.CAPITOL|| ' '||V_COUNTRY_INFO.POPULATION);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CUR_COUNTRIES%ROWCOUNT||' ROWS FETCHED');
    IF CUR_COUNTRIES%ISOPEN THEN 
        CLOSE CUR_COUNTRIES;
    END IF;
END;


-- Yulia Flenova
-- N0134267
-- QUESTION 3 
-- Use any loop of your choice. Create an anonymous block to to calculate the average of a number from 10 to 20.
/*DECLARE
BEGIN 
END;
*/

-- Yulia Flenova
-- N0134267
-- QUESTION 4 
/*
Create an anonymous block to display all the countries belonging to a region. Perform the following steps:
(HINT: You need to use the Countries or wf_Countries) and Regions table)
Create a parameterized Explicit Cursor. This cursor should input the region ID and render the Country Name, Population, and Region Name
Use any loop to iterate the cursor and display the Country Name, Population, and Region Name to the user when the region ID is passed to the cursor.
*/

DECLARE
    CURSOR CUR_REGION (p_region_id NUMBER) IS 
        SELECT C.COUNTRY_NAME, C.POPULATION, R.REGION_NAME
        FROM COUNTRIES C
        JOIN REGIONS R ON C.REGION_ID = R.REGION_ID;
    V_REGION_INFO CUR_REGION%ROWTYPE;
BEGIN
    OPEN CUR_REGION(21); 
    DBMS_OUTPUT.PUT_LINE('COUNTRY NAME' || ' POPULATION ' || ' REGION NAME');
    LOOP
        FETCH CUR_REGION INTO V_REGION_INFO;
        EXIT WHEN CUR_REGION%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_REGION_INFO.COUNTRY_NAME || ' ' || V_REGION_INFO.POPULATION || ' ' || V_REGION_INFO.REGION_NAME);
    END LOOP;
    CLOSE CUR_REGION;
END;