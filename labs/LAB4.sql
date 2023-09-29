//LAB 4
//QUESTION 1 

DECLARE 
    V_POPULATION WF_COUNTRIES.POPULATION%TYPE;
BEGIN 
    SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=86;
    IF V_POPULATION > 1000000000 THEN
        DBMS_OUTPUT.PUT_LINE('greater than 1 billion');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('LESS than 1 billion');
    END IF;
      SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=44;
    IF V_POPULATION > 1000000000 THEN
        DBMS_OUTPUT.PUT_LINE('greater than 1 billion');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('LESS than 1 billion');
    END IF;
END;

//QUESTION 2
DECLARE 
    V_POPULATION WF_COUNTRIES.POPULATION%TYPE;
BEGIN 
    SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=91;
IF V_POPULATION > 1000000000 THEN
    dbms_output.put_line('greater than 1 billion');
ELSIF V_POPULATION = 0 THEN
    dbms_output.put_line('Population is 0');
ELSIF V_POPULATION <= 1000000000 THEN
    dbms_output.put_line('Population is greater than 0');
ELSE
    dbms_output.put_line('Population is null');
END IF;
    SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=44;
IF V_POPULATION > 1000000000 THEN
    dbms_output.put_line('greater than 1 billion');
ELSIF V_POPULATION = 0 THEN
    dbms_output.put_line('Population is 0');
ELSIF V_POPULATION <= 1000000000 THEN
    dbms_output.put_line('Population is greater than 0');
ELSE
    dbms_output.put_line('Population is null');
END IF;
    SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=672;
IF V_POPULATION > 1000000000 THEN
    dbms_output.put_line('greater than 1 billion');
ELSIF V_POPULATION = 0 THEN
    dbms_output.put_line('Population is 0');
ELSIF V_POPULATION <= 1000000000 THEN
    dbms_output.put_line('Population is greater than 0');
ELSE
    dbms_output.put_line('Population is null');
END IF;
    SELECT POPULATION INTO V_POPULATION 
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID=15;
IF V_POPULATION > 1000000000 THEN
    dbms_output.put_line('greater than 1 billion');
ELSIF V_POPULATION = 0 THEN
    dbms_output.put_line('Population is 0');
ELSIF V_POPULATION <= 1000000000 THEN
    dbms_output.put_line('Population is greater than 0');
ELSE
    dbms_output.put_line('Population is null');
END IF;
END;

//QUESTION 3
DECLARE 
   v_country_id  countries.country_id%TYPE := 15;         
   v_ind_date    countries.date_of_independence%TYPE;   
   v_natl_holiday countries.national_holiday_date%TYPE; 
BEGIN 
   SELECT date_of_independence, national_holiday_date 
      INTO v_ind_date, v_natl_holiday 
      FROM countries 
      WHERE country_id = v_country_id; 
   IF v_ind_date IS NOT NULL THEN       DBMS_OUTPUT.PUT_LINE('A');   
   ELSIF v_natl_holiday IS NOT NULL THEN 
      DBMS_OUTPUT.PUT_LINE('B');   
   ELSIF v_natl_holiday IS NULL AND v_ind_date IS NULL THEN 
      DBMS_OUTPUT.PUT_LINE('C');   
   END IF; 
END; 

//QUESTION 4
DECLARE 
   v_country_name  	countries.country_name%TYPE :=  '<country_name>';    
   v_airports      	countries.airports%TYPE; 
BEGIN 
   SELECT airports INTO v_airports 
      FROM wf_countries 
      WHERE country_name = v_country_name; 
 CASE
     WHEN v_airports < 101 THEN 'There are 100 or fewer airports.'
     WHEN v_airports < 1001 THEN 'There are between 101 and 1,000 airports'
     WHEN v_airports < 10001 THEN 'There are between 1,001 and 10,000 airports'
     WHEN v_airports > 10000 THEN 'There are more than 10,000 airports.'
     ELSE 'The number of airports is not available for this country.'
 END;
END;

//QUESTION 5
//Write a PL/SQL block to display the country_id and country_name values from the COUNTRIES table for country_id whose values range from 1 through 3.
//Use a basic loop. Increment a variable from 1 through 3.
//Use an IF statement to test your variable and EXIT the loop after you have displayed the first 3 countries. 
DECLARE
    V_ID  WF_COUNTRIES.COUNTRY_ID%TYPE:=1;
    V_COUNTRY_NAME WF_COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
    LOOP
    SELECT COUNTRY_NAME INTO V_COUNTRY_NAME
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID= V_ID;
        DBMS_OUTPUT.PUT_LINE('ID: '||V_ID||' NAME: '|| V_COUNTRY_NAME);    
        V_ID:=V_ID+1;
    IF V_ID>3 THEN EXIT;
    END IF;
    END LOOP;
END;

// Modify your solution to question 1 above, replacing the IF statement with an EXIT....WHEN statement. Screen Capture 6
DECLARE
    V_ID  WF_COUNTRIES.COUNTRY_ID%TYPE:=1;
    V_COUNTRY_NAME WF_COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
    LOOP
    SELECT COUNTRY_NAME INTO V_COUNTRY_NAME
    FROM WF_COUNTRIES
    WHERE COUNTRY_ID= V_ID;
        DBMS_OUTPUT.PUT_LINE('ID: '||V_ID||' NAME: '|| V_COUNTRY_NAME);    
        V_ID:=V_ID+1;
    EXIT WHEN V_ID>3 ;
    END LOOP;
END;

//Create a MESSAGES table and insert several rows into it
DROP TABLE messages;  
CREATE TABLE messages (results NUMBER(2)); 

//Write a PL/SQL block to insert numbers into the MESSAGES table. Insert the numbers 1 through 10, excluding 6 and 8. 
DECLARE 
 X NUMBER:=1;
BEGIN
    LOOP
         IF X NOT IN (6,8) THEN
            INSERT INTO MESSAGES VALUES(X); 
        END IF;
        X :=X+1;
    EXIT WHEN X>10;    
    END LOOP;
END;

SELECT* FROM MESSAGES;

//Write a PL/SQL block to display the country_id and country_name values from the COUNTRIES table for country_id whose
//values range from 51 through 55. Use a WHILE loop. Increment a variable from 51 through 55. 
//Test your variable to see when it reaches 55. EXIT the loop after you have displayed the 5 countries. 
DECLARE
  V_START NUMBER := 51;
  V_LAST NUMBER := 55;
  V_ID NUMBER := V_ID;
BEGIN
  WHILE V_ID <= V_LAST LOOP
    FOR X IN (SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES WHERE COUNTRY_ID = V_ID) LOOP
      DBMS_OUTPUT.PUT_LINE('ID: '|| X.COUNTRY_ID || ',Name: ' || X.COUNTRY_NAME);
          V_ID := V_ID + 1;
    END LOOP;
    EXIT WHEN V_ID > V_LAST;
  END LOOP;
END;

//9.	Write a PL/SQL block to display the country_id and country_name values from the COUNTRIES table for country_id whose values
//range from 51 through 55 in the reverse order. Use a FOR loop.  

DECLARE
    V_ID COUNTRIES.COUNTRY_ID%TYPE;
    V_NAME COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN 
    SELECT COUNTRY_ID, COUNTRY_NAME INTO V_ID, V_NAME FROM COUNTRIES WHERE COUNTRY_ID=V_ID;
    FROM X IN REVERSE 51..55 LOOP
    DBMS_OUTPUT.PUT_LINE(V_ID||V_NAME);
    END LOOP;
END;


//Write a PL/SQL block to produce a list of available vehicle license plate numbers. 
//These numbers must be in the following format: NN-MMM, where NN is between 60 and 65, and MMM is between 100 and 110. Use nested FOR loops. 
//The outer loop should choose numbers between 60 and 65. 
//The inner loop should choose numbers between 100 and 110, and concatenate the two numbers together.  
DECLARE
  V_PLATE VARCHAR2(20);
BEGIN
  FOR NN IN 60..65 LOOP
    FOR MMM IN 100..110 LOOP
      V_PLATE := TO_CHAR(nn) || '-' || TO_CHAR(MMM);
      DBMS_OUTPUT.PUT_LINE(V_PLATE);
    END LOOP;
  END LOOP;
END;
