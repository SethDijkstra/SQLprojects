alter session set "_ORACLE_SCRIPT"=true; 
CREATE USER cprg250
      IDENTIFIED BY password
      DEFAULT TABLESPACE users;
ALTER USER cprg250 quota unlimited on users;
GRANT RESOURCE, CONNECT, CREATE VIEW TO cprg250;