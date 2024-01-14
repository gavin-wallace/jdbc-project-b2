SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES; -- Made a VIEW from EMPLOYEES table to show FIRST_NAE and LAST_NAME

-- ALLIASES --  helps us to change the column names / rename columns
SELECT FIRST_NAME as "GIVEN NAME" from EMPLOYEES;
SELECT LAST_NAME as "SURNAME" from EMPLOYEES;

-- Display annual salary for all employees
select * from EMPLOYEES;
select FIRST_NAME, LAST_NAME, SALARY*12 as "ANNUAL SALARY" from EMPLOYEES;

-- Make a raise for them by 10K -- > THis will only change it in your VIEW not in actual Database
select FIRST_NAME, LAST_NAME, SALARY*12+10000 as "ANNUAL SALARY" from EMPLOYEES;



-- SINGLE ROW FUNCTIONS
-- CONCAT - concatenation
-- IN Java --- > + --- >  first_name + " " + last_name  --- >  Steven King
-- IN SQL ---- > || -- >  first_name || ' ' || last_name -- >  Steven King
-- IN SQL ---- > CONCAT() -- >  CONCAT(first_name, last_name) -- >  Steven King
-- CONCAT ONLY works with two ARGUMENTS
select * from EMPLOYEES;
select EMAIL || '@gmail.com' from EMPLOYEES;
select EMAIL || '@gmail.com' AS FULL_EMAIL from EMPLOYEES;

--or we can use CONCAT
SELECT CONCAT(email, '@gmail') FROM EMPLOYEES;
SELECT CONCAT(email, '@gmail') AS FULL_EMAIL FROM EMPLOYEES;
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS FULL_NAME FROM EMPLOYEES;


-- LOWER
select LOWER (EMAIL || '@gmail.com') AS FULL_EMAIL from EMPLOYEES;

-- UPPER
select UPPER (EMAIL || '@gmail.com') AS FULL_EMAIL from EMPLOYEES;

-- INITCAP - ONLY FIRST letter in UPPER case
select INITCAP(EMAIL) from EMPLOYEES;

-- LENGTH
-- Display the length of eamil
SELECT EMAIL, LENGTH(EMAIL) FROM  EMPLOYEES;

-- Display  all the employees first_name and order by based on length of firstname
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES
order by 2;

SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES
order by LENGTH(FIRST_NAME);

SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS LENGTH_FIRSTNAME FROM EMPLOYEES
order by LENGTH_FIRSTNAME;

--Display the result as below concatenation
-- $first_name makes $salary salary
SELECT FIRST_NAME || ' makes $' || SALARY || ' salary' AS "Emaployees Salary" from EMPLOYEES;


-- SUBSTRING --- >  SUBSTR(columnName, beginningIndex, endingIndex)
-- Display all employees First_Name 2 characters
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 0, 2) from EMPLOYEES;

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 0, 2) from EMPLOYEES
where FIRST_NAME = 'Steven';

-- Display all Initials from employees --- >  first character for first_name and first character of last_name
SELECT FIRST_NAME, LAST_NAME from EMPLOYEES
WHERE LAST_NAME = 'King';

SELECT FIRST_NAME, LAST_NAME, SUBSTR(FIRST_NAME, 0,1) || SUBSTR(LAST_NAME, 0,1) AS INITIALS from EMPLOYEES
WHERE LAST_NAME = 'King';

SELECT FIRST_NAME, LAST_NAME, SUBSTR(FIRST_NAME, 0,1) || SUBSTR(LAST_NAME, 0,1) AS INITIALS from EMPLOYEES;


-- Display all employees with first_name with 6 characters
SELECT FIRST_NAME from EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;

SELECT FIRST_NAME, LENGTH(FIRST_NAME) from EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;
-- OR we can do this.
SELECT FIRST_NAME from EMPLOYEES
WHERE FIRST_NAME LIKE '______';



-- Display how many employees with first_name being in 6 characters
SELECT  COUNT(FIRST_NAME) from EMPLOYEES
where LENGTH(FIRST_NAME) = 6;