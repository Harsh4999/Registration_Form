SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ppp(tname IN NUMBER)
IS
BEGIN
    EXECUTE IMMEDIATE 'create table STUD (name varchar2(20),std varchar2(20),roll number(10) primary key,username varchar2(20),password varchar2(20),imgName varchar2(255),img blob)';
END;
/
show errors   
