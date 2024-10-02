USE memory.default;

CREATE TABLE IF NOT EXISTS EXPENSE (
                                     employee_id TINYINT,
                                     unit_price DECIMAL(8, 2),
                                     quantity TINYINT
                                   );

TRUNCATE TABLE EXPENSE;


CREATE TABLE IF NOT EXISTS EXPENSE_LASTNIGHT (
                                                Employee_name varchar,
                                                Items varchar,
                                                Unit_Price decimal(6,2),
                                                Quantity tinyint
                                              );

TRUNCATE TABLE  EXPENSE_LASTNIGHT;

INSERT INTO EXPENSE_LASTNIGHT VALUES ('Alex Jacobson','Drinks, lots of drinks',6.50,14),
                                     ('Alex Jacobson', 'More Drinks', 11.00, 20),
                                     ('Alex Jacobson', 'So Many Drinks!', 22.00, 18),
                                     ('Alex Jacobson', 'I bought everyone in the bar a drink!', 13.00, 75),
                                     ('Andrea Ghibaudi', 'Flights from Mexico back to New York', 300.00, 1),
                                     ('Darren Poynton', 'Ubers to get us all home', 40.00, 9),
                                     ('Umberto Torrielli', 'I had too much fun and needed something to eat', 17.50, 4);

INSERT INTO EXPENSE (
                       SELECT E.EMPLOYEE_ID, ELN.UNIT_PRICE, ELN.QUANTITY
                       FROM  EXPENSE_LASTNIGHT ELN INNER JOIN
                       EMPLOYEE E  ON E.FIRST_NAME||' '||E.LAST_NAME = ELN.EMPLOYEE_NAME) ;


SELECT * FROM EXPENSE;
