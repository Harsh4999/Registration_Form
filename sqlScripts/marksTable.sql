SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE sss(tname IN NUMBER)
IS
BEGIN
    EXECUTE IMMEDIATE 'create table SMARK (roll number(10),maths number(10),english number(10),science number(10),total number(10),FOREIGN KEY (roll) REFERENCES STUD(roll))';
END;
/
show errors   
