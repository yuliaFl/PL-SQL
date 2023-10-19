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


DECLARE
-- variables declared
    X NUMBER := 0; 
    V_COUNTER NUMBER := 0;
BEGIN
    LOOP -- first loop 
        V_COUNTER := V_COUNTER + 1;
            IF V_COUNTER > 4 THEN
            EXIT;
            END IF;
        LOOP
            V_COUNTER := V_COUNTER + 1;
            IF V_COUNTER > 20 THEN
            EXIT;
            END IF;
        INSERT INTO TEMP
        VALUES (X, V_COUNTER, 'in INNER loop');
      END LOOP;
    END LOOP;
END;

select * from temp;

DELETE TEMP;
-- QUESTION 2
/*
A PL/SQL is needed to calculate annual raises and update employee salary amounts recorded in the EMP table. Create a block that addresses the requirements below. Note that all salaries in EMP table are recorded as monthly amounts. Display the calculated salaries for verification before including the update action.
•	Calculate 5% annual raises for all employees except AD_VP.
•	If the 5% totals to more than 2000, cap the raise to 2000.
•	Update the salary for each employee in the table.
•	For each employee display the current annual salary, raise, and proposed new annual salary.
•	At the end, show the total amount of salary increase.

NOTE: Create the table EMP as a copy of Employee table as follow:

Create table emp (empno, ename, sal,job)
As( select employee_id,first_name||' '||last_name,salary,job_id from employees)
*/

-- QUESTION 3
/*
Use control Structure to write a program to display the language spoken by natives of the country. 
Input the name of the country and display the language spoken by the natives of the country. 
You can use any structure of your choice.
*/

-- QUESTION 4
/*
Write a PL/SQL program (Using Cursors) which calculates the number of years and employee has worked in the company.
Display this information only for the employees who are working in the Sales department. Your output should be similar to following.
*/

-- QUESTION 5
/*
Write a PL/SQL program (Using Cursors) to list all the Managers from the employee’s table with list of the Employees reporting to the Manager. Both managers and Employees reporting to the managers should be listed in alphabetical order.Output should list following information 
For manager:
1.	First name
2.	Last name 
3.	Department name
Employees reporting to Manager 
1.	First name
2.	Last name 
3.	Department name
*/