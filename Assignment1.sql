-- Yulia Flenova 
-- N01342767 

-- QUESTION 1
/*
Create a Pl/SQL subprogram, which has two blocks.
An outer block declares two variables named x and counter and loops four times. 
Inside this loop is a sub-block that also declares a variable named x. 
The values inserted into the temp table show that the two x 's are indeed different.
You will have to create the table temp as follows:
*/

CREATE TABLE TEMP(
NUM_ONE NUMBER(5),
NUM_TWO NUMBER(2),
CHAR_OUT VARCHAR2(30));

DECLARE
    V_X NUMBER(2);
    V_COUNTER NUMBER := 0;
BEGIN
  LOOP
    V_COUNTER := V_COUNTER + 1;
    IF V_COUNTER = 20 THEN
      EXIT;
    END IF;
    dbms_output.put_line( 'Inside loop: ' || V_COUNTER )  ;
  END LOOP;
  -- control resumes here after EXIT
  dbms_output.put_line( 'After loop: ' || V_COUNTER );
END;

-- QUESTION 2
-- QUESTION 3
-- QUESTION 4
-- QUESTION 5