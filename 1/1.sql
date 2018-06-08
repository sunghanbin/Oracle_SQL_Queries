-- ���̺� ��ȸ --
select * from HANBIN_TABLE_FIRST;

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



--------------------- �÷� --------------------------

-- �÷� �߰� 

ALTER TABLE HANBIN_TABLE_FIRST ADD TEST NUMBER;

-- �÷� ����

ALTER TABLE HANBIN_TABLE_FIRST MODIFY TEST VARCHAR(10);

-- �÷� ���� 

ALTER TABLE HANBIN_TABLE_FIRST DROP COLUMN TEST;

-- �÷� �̸� ����

ALTER TABLE HANBIN_TABLE_FIRST RENAME COLUMN TEST TO SCORE;

-- �÷� ���� ��ȸ

SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = 'HANBIN_TABLE_FIRST'; 

-------------------------------------------------------



------------------ ������ ---------------------------
 
 ------------ ������ ���� ----------
 
 INSERT INTO HANBIN_TABLE_FIRST
 VALUES ('HANBIN','SUNG','77777',201650250);
 
 -- ���̺� ����INSERT �ϴ� ���1

-- �ϳ��� ���̺� ���������� �ѹ��� ���� ���̺� �߰��� �����ϴ� 

INSERT ALL
INTO HANBIN_TABLE_FIRST VALUES('Deliesselia','DEL','12345',20151254)
INTO HANBIN_TABLE_LOGIN VALUES('DELISEA','SEA','123AA',2015113)
SELECT * FROM DUAL;
-- SELECT * FROM DUAL ��������� �Ѵ� 


-- �ϳ��� ���̺� ����INSELT �ϴ� ���2

INSERT INTO HANBIN_TABLE_FIRST(NAME,ID,PASS,STUDENT_ID)
SELECT 'SIMONS','ONS',NULL,20151297 FROM DUAL;
SELECT 'DELIZA','LI','56434DF5',20151299 FROM DUAL UNION ALL
SELECT 'DELMON','MON','56434FGF5',20151296 FROM DUAL UNION ALL
SELECT 'DELMON','MON','56434FGF5',NULL FROM DUAL UNION ALL
SELECT 'COTY','CO','56434DFJF5',20151298 FROM DUAL;

-- ��α� ����� �������δ� 1������� �������� ���̺� ���ε��� �Է��ϰ� �Ǵ°� 
-- �̹Ƿ� 1�� �྿ ���� ����� �ִ°Ͱ� ���� �Ͽ� �ӵ��� ������ ������ ���2 �� ��õ �ߴ�


-------- ������ ������Ʈ(���������� ����) ----------
 
 UPDATE HANBIN_TABLE_FIRST
 SET STUDENT_ID = 201650255
 WHERE 1=1
 AND STUDENT_ID = 201650250;
 
 ------ ������ ���� -------
 
 DELETE FROM HANBIN_TABLE_FIRST WHERE PASS = '56434DFJF5';
 
 
 -- ��� �� ����
 DELETE FROM HANBIN_TABLE_FIRST;
 
 
 

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



---------------------- ����� ���� �Է� �޾� ����ϱ� ------------

-- ����� ���� �Է� �ޱ� --

SELECT
      NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
 WHERE STUDENT_ID = &STUDENT;
 
 ------------------------------------------------------------------
 
 ---------------- ������ �����ϱ� ---------------------------------
 
 -- �����ϱ� --

SELECT
      NAME, ID, STUDENT_ID 
  FROM HANBIN_TABLE_FIRST
 ORDER BY ID;
 
 -----------------------------------------------------------------
 
 ----------------- ���տ����� ------------------------------------
 
 -- ������(UNION(ALL)) -- 
 
 SELECT *
 FROM HANBIN_TABLE_FIRST
 --������ ��� ���� WHERE ID = 'SUNG'
 UNION
 
 SELECT *
 FROM HANBIN_TABLE_FIRST;
 --������ ��� ���� WHERE ID = 'HAN'
 
  SELECT *
 FROM HANBIN_TABLE_FIRST
 --������ ��� ���� WHERE ID = 'SUNG'
 UNION ALL
 
 SELECT *
 FROM HANBIN_TABLE_FIRST;
 --������ ��� ���� WHERE ID = 'HAN'
 
 -- ������(INTERSECT) --
 
 SELECT NAME
   FROM HANBIN_TABLE_FIRST
-- ��밡�� WHERE STUDENT_ID = '2016500'

INTERSECT

SELECT NAME
FROM HANBIN_TABLE_FIRST;
-- ��밡�� WHERE STUDENT_ID = '2016520'

-- ������(MINUS) --

 SELECT NAME
   FROM HANBIN_TABLE_FIRST
-- ��밡�� WHERE STUDENT_ID = '2016500'

MINUS

SELECT NAME
FROM HANBIN_TABLE_FIRST;
-- ��밡�� WHERE STUDENT_ID = '2016520'

----------------- ������ ����Ʈ --------------------------------

-- BETWEEN a AND b --

-- a �� b ���̿� �ִ� ���� �� ��� �˻�

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NEME BETWEEN 1 AND 10;

-- IN(a,b,C) --

-- a �̰ų� B �̰ų� C �� ������ �˻�(�پ��� ������ AND �� �����ʰ� �ѹ���)

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NEME IN(1,2,10);

-- LIKE --

-- Ư�� ������ ������ �ִ� ������ �˻�

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME LIKE 'HANBIN';

-- IS NULL / IS NOT NULL --

-- NULL ���� �˻� / NULL �� �ƴ� ���� �˻�

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME IS NULL;

-- != a --

-- a �� �ƴ� ��� ������ �˻�

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME != 'SUNG';

--------------------------------------------------------------

  














   
 
 
 
 




  

 


