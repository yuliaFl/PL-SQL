 --=========================================================================================
 -- Class Lessons
  --=========================================================================================
DECLARE 
    V_LAST_NAME VARCHAR(50); -- this is a comment 
BEGIN 
    V_LAST_NAME:='AAA';
    DBMS_OUTPUT.PUT_LINE(V_LAST_NAME);
END;

SELECT  FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID  = 100; --scaler
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 100; -- composet 

 --=========================================================================================
Declare
v_date Date:=SYSDATE; -- curent system date
v_date1 TIMESTAMP := SYSDATE;
v_date2 TIMESTAMP WITH TIME ZONE := SYSDATE;
begin
    DBMS_OUTPUT.PUT_Line('DATE : '||v_date);
    DBMS_OUTPUT.PUT_Line('TIMESTAMP : '||v_date1);
    DBMS_OUTPUT.PUT_Line('TIMESTAMP WITH TIME ZONE : '||v_date2);
end;

 --=========================================================================================
 
DECLARE 
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
     V_LAST_NAME VARCHAR(50);
     V_FULL_NAME VARCHAR(50);
BEGIN 
    V_FIRST_NAME:=V_LAST_NAME||V_LAST_NAME;
    
    SELECT FIRST_NAME , LAST_NAME INTO V_FIRST_NAME, V_LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || V_LAST_NAME);
END;

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
 
 --=========================================================================================

DECLARE 
    V_EMP_Record employees%RowTYPE;
BEGIN
    select * into V_EMP_Record from employees where employee_Id=100;
    DBMS_OUTPUT.PUT_Line(V_EMP_Record.first_name);
    DBMS_OUTPUT.PUT_Line(V_EMP_Record.last_name);
    DBMS_OUTPUT.PUT_Line(V_EMP_Record.employee_id);
END;

 --=========================================================================================
 --NESTING / BLOCK WITHIN A BLOCK
<<outer>>
declare
    v_fathername VARCHAR2(50):='john';
    v_dob date:='81-03-09';
begin
    declare
        v_childname VARCHAR2(50):='mike';
        v_dob date:='21-02-09'; 
    begin
        DBMS_OUTPUT.PUT_line('Child Name is  :'|| v_childname);
        DBMS_OUTPUT.PUT_line('dob Name is  :'|| v_dob);
        DBMS_OUTPUT.PUT_line('Father Name is  :'|| v_fathername);
        DBMS_OUTPUT.PUT_line('Father dob Name is  :'|| outer.v_dob);
    end;
    
        DBMS_OUTPUT.PUT_line('Father Name is  :'|| v_fathername);
        DBMS_OUTPUT.PUT_line('dob Name is  :'|| v_dob);
        
end;
 --=========================================================================================
CREATE FUNCTION num_characters (p_string IN VARCHAR2) RETURN INTEGER AS   v_num_characters INTEGER; 
BEGIN 
  SELECT LENGTH(p_string) INTO v_num_characters 
    FROM dual; 
  RETURN v_num_characters; END; 

DECLARE 
  v_length_of_string INTEGER; BEGIN 
  v_length_of_string := num_characters('Oracle Corporation'); 
  DBMS_OUTPUT.PUT_LINE(v_length_of_string); END; 

 --=========================================================================================

declare 
    today DATE:=SYSDATE; --•	A variable named TODAY of datatype DATE. Initialize TODAY with SYSDATE. 
    tomorrow today%TYPE; --	A variable named TOMORROW with the same datatype as TODAY.  Use the %TYPE attribute to declare this variable. 
BEGIN 
    tomorrow:=today+1;
    DBMS_OUTPUT.PUT_LINE(today); 
    DBMS_OUTPUT.PUT_LINE(tomorrow); 
    DBMS_OUTPUT.PUT_LINE('Hello World'); 
  END; 
  
 --=========================================================================================
 -- LAB 2
  --=========================================================================================

DECLARE
    v_country_name VARCHAR(70) := 'Japan';
    v_highest_elevation NUMBER(6);
    v_lowest_elevation NUMBER(6);
BEGIN
    SELECT highest_elevation, lowest_elevation
    INTO v_highest_elevation, v_lowest_elevation
    FROM countries
    WHERE country_name = v_country_name;
    
    DBMS_OUTPUT.PUT_LINE('The lowest elevation from ' || v_country_name || ' is ' || v_lowest_elevation);
    DBMS_OUTPUT.PUT_LINE('The highest elevation from ' || v_country_name || ' is ' || v_highest_elevation);
END;

DECLARE 
x	VARCHAR2(20); BEGIN 
   x := '123' + '456' ; 
   DBMS_OUTPUT.PUT_LINE(x); END; 

DECLARE 
x	NUMBER(6); BEGIN 
  x := 5 + 3 * 2 ; 
  DBMS_OUTPUT.PUT_LINE(x); END; 

