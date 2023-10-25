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

-- Outer block 
<<outer>> 
DECLARE
    -- required variables
    x NUMBER := 0;
    counter NUMBER := 4;
BEGIN
-- first loop for the thousands numbers
    FOR i IN 1..counter LOOP
    -- increase x (work with coloumn 2)
        x := x + 1;
        INSERT INTO TEMP (NUM_ONE, NUM_TWO, CHAR_OUT) VALUES (i*1000, x, 'in OUTER loop'); -- thousands increase inside the insert
        --inner block 
        DECLARE 
        -- required variables
            x NUMBER := 0;
            counter NUMBER := 4;
        BEGIN 
        -- second for loop
            FOR j IN 1..counter LOOP
            -- continue to incease the second coloumn value
            x := x + 1;
            -- refer to the outer value
            outer.x:= outer.x + 1;
            INSERT INTO TEMP (NUM_ONE, NUM_TWO, CHAR_OUT) VALUES (x, outer.x, 'in INNER loop');
            -- end inner loop
            END LOOP;
        -- end second block
        END;
    -- end first loop
    END LOOP;
END;
select * from temp;
DELETE TEMP;
DROP TABLE TEMP;
