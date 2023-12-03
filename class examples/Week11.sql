CREATE TABLE LOG_EMPLOYEE_UPDATES
    (USER_ID VARCHAR(100),
    ACTIONDATE DATE,
    ACTIONNAME VARCHAR(50));

CREATE OR REPLACE TRIGGER TRG_UPDATE_SALARY
AFTER UPDATE OF SALARY ON EMPLOYEES 
    BEGIN 
        INSERT INTO LOG_EMPLOYEE_UPDATES VALUES (USER_ID, SYSDATE, 'UPDATE');
    END;
    
SELECT * FROM LOG_EMPLOYEE_UPDATES;

-- EVENT 

UPDATE EMPLYOEES
SET SALARY = 25000 
WHERE EMPLYOEE_ID = 100;

SELECT * FROM EMPLOYEES

--================================

CREATE TABLE LOG_EMPLOYEE_UPDATE_DETAILED (
    USER_ID VARCHAR(100),
    actionDate DATE,
    actionName VARCHAR(100),
    old_firstName VARCHAR(100),
    old_lastName VARCHAR(100),
    old_salary NUMBER,
    new_firstName VARCHAR(100),
    new_lastName VARCHAR(100),
    new_salary NUMBER
);

create or replce trigger trg_update_detailed
after update on employees for each row 
    begin 
        INSERT INTO LOG_EMPLOYEE_UPDATE_DETAILED VALUES (USER_ID, SYSDATE, 'UPDATE',
        deleted.first_name, deleted.last_name, deleted.salry
        inserted.first_name, inserted.last_name, inserted.salry
        );
    end;