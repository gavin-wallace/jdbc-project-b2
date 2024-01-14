SELECT * FROM EMPLOYEES;


-- How many manger id we have?
SELECT MANAGER_ID from EMPLOYEES; -- this will show all rows including NULL
SELECT COUNT (MANAGER_ID) from EMPLOYEES; -- this will give count of all rows EXCLUDING NULL


-- How many employees we have?
SELECT * FROM EMPLOYEES; -- This will show all rows
SELECT COUNT (FIRST_NAME) FROM EMPLOYEES; -- This will give us the count of all rows in FIRST_NAME  column

-- GEt me the unique names
SELECT FIRST_NAME FROM EMPLOYEES; -- This will show all row for first_name with duplicates
SELECT COUNT (FIRST_NAME) FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES; -- This will show all row for first_name with NO duplicate
SELECT COUNT (DISTINCT FIRST_NAME) FROM EMPLOYEES;

-- How many employees work as 'IT_PROG' or 'SA_REP'
SELECT COUNT(*) FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');

-- How many department_id we have?
SELECT DEPARTMENT_ID FROM EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;

-- How many department_id I have as empty?
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; -- Since it only counts based on DEPARTMENT_ID and it is NULL, the result is 0

SELECT COUNT(*) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;-- Since it counts based on all info and there is data for other columns, the result is 1


-- -----------AGGREGATE FUNCTIONS--------------------------
--Get me min salary from employees
SELECT MIN(SALARY) from EMPLOYEES; --2_100

--Get me max salary from employees
SELECT MAX(SALARY) from EMPLOYEES; --24_000


--Get me average salary from employees
SELECT AVG(SALARY) from EMPLOYEES; -- 6_461

-- Display it with 2 decimals
SELECT ROUND (AVG(SALARY), 2) from EMPLOYEES;
-- Display it with 1 decimals
SELECT ROUND (AVG(SALARY), 1) from EMPLOYEES;
-- Display it with 4 decimals
SELECT ROUND (AVG(SALARY), 4) from EMPLOYEES;


--Get me sum of salary from employees
SELECT SUM(SALARY) FROM EMPLOYEES; -- total salary - > 691_416
