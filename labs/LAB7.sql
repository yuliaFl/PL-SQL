-- Yulia Flenova 
-- N01342767 
-- LAB 7 

-- QUESTION 7.3 - 1
DECLARE
   v_rows_updated EXCEPTION;
BEGIN
   UPDATE excep_emps
   SET salary = 10000
   WHERE department_id = 40;

   IF SQL%NOTFOUND THEN
      RAISE v_rows_updated;
   ELSE
      DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);
   END IF;

EXCEPTION
   WHEN v_rows_updated THEN
      DBMS_OUTPUT.PUT_LINE('No employees');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error ' || SQLCODE || ' - ' || SQLERRM);
END;
--------------------------------------------------------------------------------
DECLARE
    v_rows_updated EXCEPTION;
BEGIN 
    UPDATE excep_emps 
    SET salary = 10000 
    WHERE department_id = 20; 
    
    IF SQL%NOTFOUND THEN
      RAISE v_rows_updated;
   ELSE
      DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);
   END IF; 
    
EXCEPTION 
    WHEN v_rows_updated THEN 
        RAISE_APPLICATION_ERROR(-20202, 'No employees');
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('error ' || SQLCODE || '-' || SQLERRM); 
END;
--------------------------------------------------------------------------------
DECLARE
    v_rows_updated EXCEPTION;
BEGIN 
    UPDATE excep_emps 
    SET salary = 10000 
    WHERE department_id = 40; 
    
    IF SQL%NOTFOUND 
        THEN RAISE_APPLICATION_ERROR(-20202, 'no employees'); 
    END IF; 
END;
--============================================================================
DECLARE 
  v_dept_id  excep_emps.department_id%TYPE;   
  v_count       NUMBER;  
  
  select_found EXCEPTION;
  no_employee_deleted EXCEPTION;
BEGIN 
    v_dept_id := 40; 
    SELECT COUNT(*) INTO v_count 
    FROM excep_emps 
    WHERE department_id = v_dept_id; 
    
    IF v_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20203, 'No employees found');
    END IF;
  
    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20204, 'No employees were deleted');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('There are ' || v_count || ' employees'); 
  
    DELETE FROM excep_emps 
    WHERE department_id = v_dept_id; 
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employees were deleted'); 
    
EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
  END;
    ROLLBACK; 
END; 

--============================================================================
-- QUESTION 7.4 - 1
DECLARE 
    v_country_name     countries.country_name%TYPE;   
    v_currency_code     countries.currency_code%TYPE; 
    e_no_currency    	 	EXCEPTION; 
BEGIN   DECLARE 
  BEGIN 
    SELECT country_name, currency_code INTO v_country_name, v_currency_code 
      FROM countries 
        WHERE country_id = 5;   -- repeat with 672   
    IF v_currency_code = 'NONE' THEN 
      RAISE e_no_currency; 
 
    END IF; 
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('This country does not exist'); 
      WHEN e_no_currency THEN 
        DBMS_OUTPUT.PUT_LINE('This country exists but has no currency');     END; 
  EXCEPTION 
    WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('Another type of error occurred'); 
END; 