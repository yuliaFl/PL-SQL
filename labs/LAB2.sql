-- LAB 2.4 
-- Question 1.b
DECLARE
    number_of_students PLS_INTEGER := 30; 
    student_name VARCHAR2(10) := 'Johnson'; 
    stu_per_class CONSTANT NUMBER := 1; 
    today DATE := SYSDATE + 1; 
BEGIN 
    DBMS_OUTPUT.PUT_LINE ('number of students '||number_of_students); 
    DBMS_OUTPUT.PUT_LINE ('name of the students '||student_name); 
    DBMS_OUTPUT.PUT_LINE ('number of students per class'||stu_per_class); 
    DBMS_OUTPUT.PUT_LINE ('Tomorrows date '||today); 
    
END;

-- LAB 2.5
-- Question 2
DECLARE
    v_name VARCHAR2(50) :='yulia';
    v_length_name PLS_INTEGER;
BEGIN
    v_length_name := LENGTH(v_name);
    DBMS_OUTPUT.PUT_LINE(v_length_name);
END;

-- Question 3
DECLARE
    my_date DATE := SYSDATE;
    v_last_day DATE;
BEGIN
    v_last_day := LAST_DAY(my_date);
    DBMS_OUTPUT.PUT_LINE(v_last_day);
END;

-- Question 3.B
DECLARE
    my_date DATE := SYSDATE;
    v_last_day DATE;
    new_date DATE;
BEGIN
    new_date:= my_date +45; 
    v_last_day := LAST_DAY(my_date);
    DBMS_OUTPUT.PUT_LINE(v_last_day);
    DBMS_OUTPUT.PUT_LINE(new_date);
END;

