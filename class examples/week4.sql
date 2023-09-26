// WEEK 4 

DECLARE 
    V_GRADE INT :=60;
BEGIN 
    IF V_GRADE>60 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 60');
    ELSE
        DBMS_OUTPUT.PUT_LINE('SCORE EQUAL OR GREATER 60');  
        //THIS WILL SHOW
    END IF;
END;


DECLARE 
    V_GRADE INT :=60;
BEGIN 
    IF V_GRADE>60 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 60'); 
        //THIS WILL SHOW
    ELSIF V_GRADE >=70 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 70');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('SCORE EQUAL OR GREATER 60');
    END IF;
END;

DECLARE 
    V_GRADE INT :=70;
BEGIN 
    IF V_GRADE>50 AND V_GRADE <= 60 THEN 
    //THIS WILL SHOW
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 60'); 
    ELSIF V_GRADE>60 AND V_GRADE <= 70 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 70');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('SCORE EQUAL OR GREATER 60');
    END IF;
END;

/////////////////////////// CASE STATEMENT -- WHEN EXECUTING A BUNCH OF STATMENTS 

DECLARE 
    V_GRADE INT :=50;
BEGIN 
    CASE V_GRADE 
    WHEN 60 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 60'); 
     WHEN 70 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 70');
    WHEN 50 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE 50');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('CONTACT ADMIN');
    END CASE;
END;
 
 
// WHEN IN COMPARE 
DECLARE 
    V_GRADE INT :=50;
BEGIN 
    CASE V_GRADE 
    WHEN V_GRADE > 50 AND V_GRADE <=60 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE C'); 
     WHEN V_GRADE > 60 AND V_GRADE <=70 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE B');
    WHEN V_GRADE > 70 AND V_GRADE <=90 THEN 
        DBMS_OUTPUT.PUT_LINE('YOU SCORE A+');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('CONTACT ADMIN');
    END CASE;
END;


///////// CASE EXPRESSION  -- ASSIGNING A VALUE TO IT
DECLARE 
    V_GRADE INT :=50;
    V_LETTERGRADE VARCHAR(10);
BEGIN 
    V_LETTERGRADE:= CASE
    WHEN V_GRADE > 50 AND V_GRADE <=60 THEN 'C'
    WHEN V_GRADE > 60 AND V_GRADE <=70 THEN 'B'
    WHEN V_GRADE > 70 AND V_GRADE <=90 THEN 'A'
    ELSE 'NA'
    END;
    DBMS_OUTPUT.PUT_LINE(V_LETTERGRADE);
END;


/////// looops 

DECLARE 
    V_COUNTER INT :=1;
BEGIN 
    LOOP 
        DBMS_OUTPUT.PUT_LINE(V_COUNTER);
        V_COUNTER:=V_COUNTER+1;
        EXIT WHEN V_COUNTER>5;
    END LOOP;
END;


//DO WHILE, CHECK CONDITION AT FIRST STEP
DECLARE 
    V_COUNTER INT :=1;
BEGIN 
    LOOP 
    EXIT WHEN  V_COUNTER>5;
        DBMS_OUTPUT.PUT_LINE(V_COUNTER);
        V_COUNTER:=V_COUNTER+1;
    END LOOP;
    V_COUNTER:=1;
    WHILE V_COUNTER < 5 LOOP
    DBMS_OUTPUT.PUT_LINE(V_COUNTER);
    V_COUNTER:=V_COUNTER+1;
    END LOOP;
END;

//FOR LOOP 
BEGIN 
    FOR V_COUTER IN 1..5 LOOP 
    DBMS_OUTPUT.PUT_LINE(V_COUNTER);
    END LOOP;
END;

DECLARE 
    V_MAX INT:=10;
BEGIN 
    FOR V_COUTER IN REVERSE 1..V_MAX LOOP 
    DBMS_OUTPUT.PUT_LINE(V_COUNTER);
    END LOOP;
END;

//MULTIPLICATION TABLE FOR 5
DECLARE 
    V_NUM INT :=5;
BEGIN 
    FOR V_COUNTER IN 1..10 LOOP 
        DBMS_OUTPUT.PUT_LINE(V_NUM * V_COUNTER);
    END LOOP;
END;

//5 MULTIPLICATION TABLES 
DECLARE 
    V_NUM INT :=1;
BEGIN 
    FOR V_COUNTER IN 1..10 LOOP 
         DBMS_OUTPUT.PUT_LINE('TABLE OF ' || V_COUNTER);
        FOR V_NUM IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(V_NUM || ' * ' || V_COUNTER || '=' || V_NUM * V_COUNTER);
            END LOOP;
    END LOOP;
END;
