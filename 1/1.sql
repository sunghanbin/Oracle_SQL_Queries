-- ���̺� ��ȸ --
-- select * from {���̺��}

SELECT * FROM TABS;


--TNSNAME ����  //�ڼ��� ������ ONE NOTE �����--
/*{������Ī} = 
              (DESCRIPTION =
                (ADDRESS = (PROTOCOL = TCP)(HOST = ����ip�ּ�)(PORT = ��Ʈ�ѹ�))
                (CONNECT_DATA = 
                 (SERVER = DEDICATED)
                  (SERVICE_NAME = �����ͺ��̽� ���� �̸�)))*/




------------------ ���̺� �����̽� ----------------------------

--���̺� �����̽� �����ϱ�--
CREATE TABLESPACE TESTSUNG
DATAFILE 'C:\ORACLE\DATA\TESTSUNG.dbf' SIZE 1024M
AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
SEGMENT SPACE MANAGEMENT AUTO;

--���̺����̽� ��ȸ--
SELECT * FROM DBA_TABLESPACES;

--���̺����̽� ����--
DROP TABLESPACE TESTSUNG
INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

-----------------------------------------------------------

-------------------- ����� ----------------------

--����� ����--
CREATE USER HANBIN
  IDENTIFIED BY SUNG--���
  DEFAULT TABLESPACE TESTSUNG
  TEMPORARY TABLESPACE TEMP;
  
--����� ��ȸ--
SELECT * FROM DBA_USERS;

--����� ��й�ȣ���� �� ����� ����--
ALTER USER HANBIN
IDENTIFIED BY SUNG2;

DROP USER HANBIN CASCADE;

--����� ���� ����--
GRANT CONNECT,RESOURCE, DBA TO HANBIN;

---------------------------------------------------

------------------- ���̺� -------------------------

--���̺� ����--
CREATE TABLE HANBIN_TABLE_SECOND
(
 NAME VARCHAR(10),
 ID VARCHAR(20),
 PASS VARCHAR(20),
 STUDENT_ID NUMBER
 );

--���̺� ����--
DROP TABLE HANBIN_TABLE_SECOND; 

--------------------------------------------------

------------------ ������ ---------------------------
 
 --������ ����--
 INSERT INTO HANBIN_TABLE_FIRST
 VALUES ('HANBIN','SUNG','77777',201650250);

 --������ ������Ʈ(���������� ����)--
 UPDATE HANBIN_TABLE_FIRST
 SET STUDENT_ID = 201650255
 WHERE 1=1
 AND STUDENT_ID = 201650250;
 

 --������ IMPORT �ϱ� ONE NOTE ���
 
 -------------------------------------------------
 
 
 
 ------------------- Ű���� ----------------------
 
 -- �⺻Ű ���� // �⺻Ű�� ���� �ڼ��Ѽ��� �ʱ��Ʈ ��� --
 
  CREATE TABLE HANBIN_TABLE_LOGIN
(
 ID VARCHAR(20),
 PASS VARCHAR(20),
 CONSTRAINTS PK_HANBIN_TABLE_LOGIN PRIMARY KEY(ID,PASS));
 
 
 CREATE TABLE HANBIN_TABLE_FIRST
(
 NAME VARCHAR(10),
 ID VARCHAR(20),
 PASS VARCHAR(20),
 STUDENT_ID NUMBER,
 CONSTRAINTS PK_HANBIN_TABLE_FIRST PRIMARY KEY(NAME,STUDENT_ID),
 CONSTRAINTS FK_HANBIN_TABLE_FIRST FOREIGN KEY(ID,PASS) REFERENCES HANBIN_TABLE_LOGIN(ID,PASS));
 -- ��� -> �ܷ�Ű ���� --
 
 --Ű ���� --
 ALTER TABLE HANBIN_TABLE_FIRST
 DROP CONSTRAINT FK_HANBIN_TABLE_FIRST;
 --Ű�� ���� ���̺� Ű�� �߰� �Ҷ�--
 ALTER TABLE HANBIN_TABLE_FIRST
 ADD CONSTRAINT FK_HANBIN_TABLE_FIRST FOREIGN KEY(ID,PASS) REFERENCES HANBIN_TABLE_LOGIN(ID,PASS)
 ON DELETE CASCADE; -- �θ� �����ϸ� �ڽĵ� �ڵ����� ���� �� (�������Ἲ ����)
 
 -- ON DELETE SET NULL �θ� ������ �ڽ��� ������ �ʰ� NULL������ ����ȴ�.
 
 -- DEFAULT ����� �ΰ��� ��ɵ��� ������� �����. �⺻��
 
 --------------------------------------------
 
 ------------------ ������ ----------------
 
 --SELECTION--
 --Ư���� ���⿬��
 
 SELECT * FROM HANBIN_TABLE_FIRST
     WHERE 1=1
     AND STUDENT_ID = 201650255;
     
 --PROJECTION--
 --Ư�� �÷��鸸 �����ϴ� ���� (�ߺ���߻��Ҽ�����)

 SELECT NAME 
   FROM HANBIN_TABLE_FIRST;
   
--UNION--
--2���� ���̺��� ��ħ (�Ӽ����� �÷������� ���ƾ��Ѵ�)
-- �ߺ����� �� ���� (�ӵ�����)

SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
UNION
SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_SECOND;

--UNION ALL--
-- �ߺ����� �� ���� x

SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
UNION ALL
SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_SECOND;
  
---------------------------------------------------------------

--------------------- EXPRESSION �̿� -------------------------

SELECT 
      77.20 AS TEST,
      NAME
  FROM HANBIN_TABLE_FIRST;
  
SELECT
      NAME||'/'||STUDENT_ID AS attendance
  FROM HANBIN_TABLE_FIRST;
    
----------------------------------------------------------------

---------------------- DISTINCT --------------------------------
--�ߺ��� ����

SELECT
      DISTINCT NAME, STUDENT_ID
  FROM HANBIN_TABLE_FIRST;
  
----------------------------------------------------------------

--------------------- WHERE -----------------------------------
--������--
--�񱳽� ��ҹ��� ����

SELECT
      ID, PASS
  FROM HANBIN_TABLE_FIRST
 WHERE 1=1
   AND ID = 'HANBIN'
   AND PASS = '77777';
   
----------------------------------------------------------------


------------------ ���� �Լ� ----------------------------------
--��뿹��

SELECT
      ROUND(TEST,1)
  FROM HANBIN_TABLE_FIRST;

--ROUND--
--N  ���� �ݿø� �Ѵ� ROUND(3.14,1<-�ݿø��� �ڸ���)

--CEIL--
-- N  ���� ���� ������ ū���� ���

--FLOOR--
-- N  ���� ���� ������ ���� ���� ���

--MOD--
--N  ���� ������ ������ �� ���

--POWER--
--�־��� ����N�� ����M ���� ����� POWER(2,3)--> 8

--ABS--
-- ���밪�� ���  //���밪�̶� 0���� ������ �Ÿ� ���� X

--SQRT--
-- N ���� ��Ʈ���� ����. N�� ��������� 
 






      



   
 
 
 
 




  

 


