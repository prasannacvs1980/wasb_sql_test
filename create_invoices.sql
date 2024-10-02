USE MEMORY.DEFAULT;

/* Creation of Invoices_due table and inserting the data given as per file */

CREATE TABLE IF NOT EXISTS INVOICES_DUE (
                                         COMPANY_NAME VARCHAR,
                                         INVOICE_ITEM VARCHAR,
                                         INVOICE_AMOUNT INT,
                                         DUE_DATE INT);

 TRUNCATE TABLE INVOICES_DUE;

INSERT INTO INVOICES_DUE VALUES ('Party Animals','Zebra, Lion, Giraffe, Hippo',6000,3),
                                ('Catering Plus','Champagne, Whiskey, Vodka, Gin, Rum, Beer, Wine',2000,2),
                                ('Catering Plus','Pizzas, Burgers, Hotdogs, Cauliflour Wings, Caviar',1500,3),
                                ('Dave''s Discos','Dave, Dave Equipment',500,1),
                                ('Entertainment tonight','Portable Lazer tag, go carts, virtual darts, virtual shooting, puppies',6000,3),
                                ('Ice Ice Baby','Ice Luge, Lifesize ice sculpture of Umberto',4000,6);

SELECT * FROM INVOICES_DUE;

/* Creation of Supplier table and inserting data into it */

CREATE TABLE IF NOT EXISTS SUPPLIER (SUPPLIER_ID TINYINT,
                                     NAME VARCHAR);
TRUNCATE TABLE SUPPLIER;

INSERT INTO SUPPLIER (SUPPLIER_ID, NAME)
SELECT
    CAST(ROW_NUMBER() OVER (ORDER BY COMPANY_NAME) AS TINYINT) AS SUPPLIER_ID,
    COMPANY_NAME AS NAME
FROM (SELECT DISTINCT COMPANY_NAME FROM INVOICES_DUE) ;

SELECT * FROM SUPPLIER;

/* Creation of Invoice table and inserting data from Invoices_due and Supplier tables and also calculating next payment date */

CREATE TABLE IF NOT EXISTS INVOICE (supplier_id TINYINT,
                                    invoice_ammount DECIMAL(8, 2),
                                    due_date DATE);
TRUNCATE TABLE INVOICE;

INSERT INTO INVOICE (
                      select supplier_id,invoice_amount,
                      last_day_of_month(DATE_ADD('month',DUE_DATE,CURRENT_DATE)) AS DUE_DATE
                      FROM INVOICES_DUE ID INNER JOIN SUPPLIER S ON ID.COMPANY_NAME = S.NAME
                     );