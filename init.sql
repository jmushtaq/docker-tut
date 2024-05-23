CREATE ROLE dev WITH PASSWORD 'dev123';                                                                                                                                         
ALTER ROLE dev PASSWORD 'dev123';                                                                                                                                                         
ALTER ROLE dev LOGIN;                                                                                                                                                                         

CREATE DATABASE django_dev1;
GRANT ALL PRIVILEGES ON DATABASE django_dev1 TO dev;

CREATE DATABASE django_dev2;
GRANT ALL PRIVILEGES ON DATABASE django_dev2 TO dev;

