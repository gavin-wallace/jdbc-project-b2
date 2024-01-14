select * from employees;


-- Create 2 simple tables
CREATE TABLE DEVELOPERS (
                            id_num INTEGER PRIMARY KEY,
                            names VARCHAR(30),  -- not providing any constrains meaning it can be NULL and it can be DUPLICATE
                            salary INTEGER -- not providing any constrains meaning it can be NULL and it can be DUPLICATE
);

CREATE TABLE TESTERS (
                         id_num INTEGER PRIMARY KEY,
                         names VARCHAR(30),  -- not providing any constrains meaning it can be NULL and it can be DUPLICATE
                         salary INTEGER -- not providing any constrains meaning it can be NULL and it can be DUPLICATE
);


INSERT INTO DEVELOPERS VALUES (1, 'Mike', 155000);
INSERT INTO DEVELOPERS VALUES (2, 'John', 142000);
INSERT INTO DEVELOPERS VALUES (3, 'Steven', 85000);
INSERT INTO DEVELOPERS VALUES (4, 'Maria', 120000);

INSERT INTO TESTERS VALUES (1, 'Gular', 130000);
INSERT INTO TESTERS VALUES (2, 'Parvana', 130000);
INSERT INTO TESTERS VALUES (3, 'Abuzar', 130000);



SELECT * FROM DEVELOPERS;
SELECT * FROM TESTERS;

commit;



UPDATE TESTERS
SET names = 'Steven'
WHERE id_num = 3;

/*
    UNION
        -same number of columns
        -same data type of columns
        -same data type column order
 */


SELECT NAMES FROM DEVELOPERS
UNION
SELECT NAMES FROM TESTERS;


SELECT NAMES, salary FROM DEVELOPERS
UNION
SELECT Names, salary FROM TESTERS;


/*
    UNION ALL
        -combine two SQL query result WITHOUT REMOVING DUPLICATES
 */


SELECT NAMES FROM DEVELOPERS
UNION ALL
SELECT NAMES FROM TESTERS;

-- Logically it does not make sense BUT since number of column is equal and data type is same, we can run this query
SELECT id_num FROM DEVELOPERS
UNION ALL
SELECT SALARY from TESTERS;

/*
    MINUS
        From FIRST Table, it will remove the MATCHING part this is in the SECOND table

 */
SELECT NAMES FROM DEVELOPERS
MINUS
SELECT NAMES FROM TESTERS;

-- Since there is not matching SALARY in SECOND table, nothing will be MINUSED
SELECT salary FROM DEVELOPERS
MINUS
SELECT salary FROM TESTERS;


/*
    INTERSECT
        It will return the result which is in BOTH COLUMNS
 */
SELECT NAMES FROM DEVELOPERS
INTERSECT
SELECT NAMES FROM TESTERS;