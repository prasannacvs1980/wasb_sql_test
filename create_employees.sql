USE MEMORY.DEFAULT;

CREATE TABLE IF NOT EXISTS EMPLOYEE (
                                      employee_id tinyint,
                                      first_name varchar,
                                      last_name varchar,
                                      job_title varchar,
                                      manager_id tinyint);

TRUNCATE TABLE EMPLOYEE;

 INSERT INTO MEMORY.DEFAULT.EMPLOYEE VALUES (1, 'Ian','James','CEO',4),
                                            (2,'Umberto','Torrielli','CSO',1),
                                            (3,'Alex','Jacobson','MD EMEA',2),
                                            (4,'Darren','Poynton','CFO',2),
                                            (5,'Tim','Beard','MD APAC',2),
                                            (6,'Gemma','Dodd','COS',1),
                                            (7,'Lisa','Platten','CHR',6),
                                            (8,'Stefano','Camisaca','GM Activation',2),
                                            (9,'Andrea','Ghibaudi','MD NAM',2);


SELECT * FROM EMPLOYEE;