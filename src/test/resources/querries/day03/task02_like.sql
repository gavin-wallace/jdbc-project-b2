SELECT * FROM EMPLOYEES;


-- Display all information from employees who is making highest salary in company ?

SELECT MAX(SALARY) FROM EMPLOYEES; -- 24K

-- Here we manually put the highest salary for our condition
SELECT * FROM EMPLOYEES
WHERE SALARY = 24000;

-- We dynamically get the highest salary and use it to find who is making that salary
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

-- Display the 2nd highest salary
SELECT SALARY from EMPLOYEES
order by SALARY desc ;

SELECT MAX(SALARY) from EMPLOYEES; -- 24K

SELECT MAX(SALARY) from EMPLOYEES
WHERE SALARY < 24000; -- 17K


-- Make it dynamic
SELECT MAX(SALARY) from EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES);

-- GEt me all info who is making the 2nd highest salary
SELECT * FROM EMPLOYEES
WHERE SALARY = 17000;

-- Make it dynamic
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) from EMPLOYEES
                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES));


-- Display all the employees who are making above the average salary
select ROUND(AVG(SALARY)) from EMPLOYEES; -- 6462

select * from EMPLOYEES
where SALARY > 6462;

-- make dynamic
select * from EMPLOYEES
where SALARY > (select ROUND(AVG(SALARY)) from EMPLOYEES);
