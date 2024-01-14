-- 1. display full addresses from locations table in a single column
select STREET_ADDRESS||' '||CITY||' '||STATE_PROVINCE||' '||POSTAL_CODE||' '||LOCATIONS.COUNTRY_ID as STREET_ADDRESS from LOCATIONS;

-- 2. display all information of the employee who has the minimum salary in employees table
select * from EMPLOYEES where SALARY = (select min(SALARY) from EMPLOYEES);

-- 3. display the second minimum salary from the employees
select MIN(SALARY) from EMPLOYEES where SALARY != (select min(SALARY) from EMPLOYEES);

-- 4. display all information of the employee who has the second minimum salary
select * from EMPLOYEES where SALARY = (select MIN(SALARY) from EMPLOYEES where SALARY != (select min(SALARY) from EMPLOYEES));

-- 5. list all the employees who are making above the average salary;
select * from EMPLOYEES where SALARY > (select AVG(SALARY) from EMPLOYEES);

-- 6. list all the employees who are making less than the average salary
select * from EMPLOYEES where SALARY < (select AVG(SALARY) from EMPLOYEES);

-- 7. display manager name of 'Neena'
select * from EMPLOYEES where FIRST_NAME = 'Neena';

-- 8. find the 3rd maximum salary from the employees table (do not include duplicates)
select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM < 4;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY desc) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 3;

-- 9. find the 5th maximum salary from the employees table (do not include duplicates)
select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM < 6;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY desc) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 5;

-- 10. find the 7th maximum salary from the employees table (do not include duplicates)
select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM < 8;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY desc) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 7;

-- 11. find the 10th maximum salary from the employees table (do not include duplicates)
select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM < 11;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY desc) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 10;

-- 12. find the 3rd minimum salary from the employees table (do not include duplicates)
select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where rownum < 4;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 3;

-- 13. find the 5th minimum salary from the employees table (do not include duplicates)
select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where rownum < 6;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 5;

-- 14. find the 7th minimum salary from the employees table (do not include duplicates)
select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where rownum < 8;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 7;

-- 15. find the 10th minimum salary from the employees table (do not include duplicates)
select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where rownum < 11;
select SALARY from (select SALARY, ROW_NUMBER() OVER (ORDER BY SALARY) as Number_ROW from (select distinct SALARY from EMPLOYEES)) where Number_ROW = 10;
