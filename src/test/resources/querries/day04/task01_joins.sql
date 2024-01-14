select * from employees;

CREATE TABLE address (
                         address_id INTEGER PRIMARY KEY,
                         address varchar(50) NOT NULL,
                         phone NUMBER not null
);

INSERT INTO address (address_id, address, phone) VALUES (5, '193 Hello St', 2830334455);
INSERT INTO address (address_id, address, phone) VALUES (7,	'692 Bye Rd', 2830334456);
INSERT INTO address (address_id, address, phone) VALUES (8,	'1556 Tom Way', 2830334457);
INSERT INTO address (address_id, address, phone) VALUES (10, '1795 Jerry St', 2830334458);
INSERT INTO address (address_id, address, phone) VALUES (11, '900 Fairfax Blvd', 2830334459);

SELECT * FROM address;


CREATE TABLE CUSTOMER (
                          customer_id INTEGER PRIMARY KEY,
                          first_name varchar(30) not null,
                          last_name varchar(40) not null,
                          address_id INTEGER REFERENCES address(address_id)
);


INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_id) VALUES (1, 'Marry', 'Smith',5);
INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_id) VALUES (2, 'Patricia', 'Johnson',NULL);
INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_id) VALUES (3, 'Linda', 'Jones',7);
INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_id) VALUES (4, 'Barbara', 'Jones',8);
INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_id) VALUES (5, 'Elizabeth', 'Brown',NULL);


SELECT * FROM CUSTOMER;


commit;

/*
 INNER JOIN

    Get the info ONLY matching portion of the tables
    Inner Join eliminates if there is no matching
    If you do nto write inner and just write join, it will by default act like INNER JOIN

 */

SELECT first_name, last_name, address, phone
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.address_id = ADDRESS.address_id;

-- This will give an issue because the query does not know from WICH table it needs to get the address_id column since both have it.
SELECT first_name, last_name, address, phone, address_id
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.address_id = ADDRESS.address_id;

-- The solution is, we can call that column with the table name.  -- > USTOMER.address_id
SELECT first_name, last_name, address, phone, CUSTOMER.address_id
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.address_id = ADDRESS.address_id;

-- The solution is, we can call that column with the table name.  -- > ADDRESS.address_id
SELECT first_name, last_name, address, phone, ADDRESS.address_id
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.address_id = ADDRESS.address_id;

-- YOu can get that column form both table since both have it -- > ADDRESS.address_id, CUSTOMER.address_id
SELECT first_name, last_name, address, phone, ADDRESS.address_id, CUSTOMER.address_id
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.address_id = ADDRESS.address_id;


/*
    LEFT OUTER JOIN
          Matching part + only the unique ones for the left table
 */


SELECT first_name, last_name, address, phone
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.address_id = ADDRESS.address_id;


/*
    LEFT OUTER JOIN with WHERE
        -This way we can find which data from left table has NO VALUES in RIGHT table by doing WHERE condition IS NULL

 */

SELECT first_name, last_name, address, phone
FROM CUSTOMER left OUTER JOIN ADDRESS
                              ON CUSTOMER.address_id = ADDRESS.address_id
WHERE address.address_id IS NULL;

SELECT first_name, last_name, address, phone
FROM CUSTOMER left OUTER JOIN ADDRESS
                              ON CUSTOMER.address_id = ADDRESS.address_id
WHERE customer.address_id IS NULL;


-- THe one below is just showing the data from a SINGLE table
SELECT first_name, last_name
FROM CUSTOMER
WHERE address_id IS NULL;


-- This will be giving the same result as the INNER JOIN
SELECT first_name, last_name, address, phone
FROM CUSTOMER left OUTER JOIN ADDRESS
                              ON CUSTOMER.address_id = ADDRESS.address_id
WHERE customer.address_id IS NOT NULL;


-- You can use short name of tables as part of ON statement
SELECT first_name, last_name, address, phone
FROM CUSTOMER c left OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id
WHERE c.address_id IS NOT NULL;



/*
    RIGHT OUTER JOIN
          Matching part + only the unique ones for the right table
            Note: On the query we can write either RIGHT OUTER JOIN or LEFT OUTER JOIN based on which side we put the table names
        NOTE:  LEFT OUTER JOIN ==== > LEFT JOIN
    */
SELECT first_name, last_name, address, phone
FROM CUSTOMER c RIGHT OUTER JOIN ADDRESS a
                                 ON c.address_id = a.address_id;

--Note: On the query we can write either RIGHT OUTER JOIN or LEFT OUTER JOIN based on which side we put the table names
SELECT first_name, last_name, address, phone
FROM ADDRESS a LEFT OUTER JOIN CUSTOMER c
                               ON c.address_id = a.address_id;


/*
    RIGHT OUTER JOIN with WHERE
        -This way we can find which data from RIGHT table has NO VALUES in LEFT table by doing WHERE condition IS NULL

 */
SELECT first_name, last_name, address, phone
FROM CUSTOMER c RIGHT OUTER JOIN ADDRESS a
                                 ON c.address_id = a.address_id
WHERE c.address_id IS NULL;


-- The query below will show nothing becuase a.address_id has NOT null values
SELECT first_name, last_name, address, phone
FROM CUSTOMER c RIGHT OUTER JOIN ADDRESS a
                                 ON c.address_id = a.address_id
WHERE a.address_id IS NULL;


/*
    FULL OUTER JOIN
        It will have all data that is matching with both table
        PLUS -- > the ones from left table/side + the ones from right table/side
 */

SELECT first_name, last_name, address, phone
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id;


/*
    FULL OUTER JOIN with WHERE
 */

SELECT first_name, last_name, address, phone, c.address_id, a.address_id
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id
WHERE c.address_id IS NOT NULL;

SELECT first_name, last_name, address, phone, c.address_id, a.address_id
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id
WHERE a.address_id IS NOT NULL;

SELECT first_name, last_name, address, phone, c.address_id, a.address_id
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id;



-- IQ
SELECT first_name, last_name, address, phone, c.address_id, a.address_id
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id
WHERE last_name LIKE 'S%';



SELECT first_name, last_name, address, phone, c.address_id, a.address_id
FROM CUSTOMER c FULL OUTER JOIN ADDRESS a
                                ON c.address_id = a.address_id
WHERE a.address_id IS NULL OR c.address_id IS NULL;