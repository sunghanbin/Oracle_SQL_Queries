----------------- ������ �Լ� ------------------------------------

-- ������ �Լ� �� ���� ���� ONE NOTE ���

--//////////// ���� �Լ� ///////////////////

-- ��/�ҹ��� ����(UPPER-�빮��,LOWER-�ҹ���) --

SELECT 
   UPPER(NAME) AS CASE1,
   LOWER(ID) AS CASE2
FROM HANBIN_TABLE_FIRST;

-------------------------------------------------


-- �÷� �� ��ġ��(CONCAT) ----------------------

-- ���1
SELECT 
      CONCAT(ID,NAME) 
  FROM HANBIN_TABLE_FIRST;
  
-- ���2

SELECT
      ID || NAME AS FULL_NAME
  FROM HANBIN_TABLE_FIRST;

-------------------------------------------------

---------- �÷� �� �����ϱ�(SUBSTR) -------------

SELECT
      NAME,
      SUBSTR(NAME,0,1)
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

----------- �÷� �� ä���(LPAD = ���� / RPAD = ������) -------

SELECT
      LPAD(ID,10/*�ڸ���*/,'ACCC')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

------------ �÷� �� ����(LTRIM,RTRIM) ----

SELECT
      NAME,
      LTRIM(NAME,'H')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

----------- �÷� �� �����ϱ�(REPLACE) ----------

SELECT
      NAME,
      REPLACE(NAME,'HA','��')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------



--///////////////// ���� �Լ� ///////////////////

SELECT
     ROUND(12.345,2)
     ,CEIL(12.345)
     ,FLOOR(12.345)
     ,MOD(12,10)
     ,POWER(3,2)
     ,ABS(-7)
     ,SQRT(69)
 FROM DUAL;
 
 
 --��뿹��

SELECT 
      mod(STUDENT_ID,7)
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


-----------------------------------------------------------------


--//////////////////// ��¥ �Լ� //////////////////////////////

-- SYSDATE --
-- �ý��� ���� ��¥/�ð� 
SELECT 
      SYSDATE
  FROM DUAL;

-- NEXT_DAY --
-- �������� ���
-- ���ð��� �������� ���� �� �����ٸ� ������ ��¥�� / ���� ���� �̾ƴ϶�� ���� ������ 
-- �� /1,��/2,ȭ/3,��/4,��/5,��/6,��/7

SELECT 
      NEXT_DAY(SYSDATE,7)
  FROM DUAL;

-- LAST_DAY --
-- ���� ���� ������ ��¥ 

SELECT 
      LAST_DAY(SYSDATE)
  FROM DUAL;
  
-- YYYY�⵵,MM��,WW����,DD��
-- TO_CHAR �� ��¥�� ������ ���´� DATE �����̱� ������ ����(CHAR)�� �ٲپ� �ش�
-- DATE ����ȯ�� ���� �ڼ��� ������ ONE NOTE '��¥�Լ�'�� �˻� 
SELECT TO_CHAR(SYSDATE-7, 'YYYYWW')
--�ý��� ��¥�� ���� 7���� ����
,TO_CHAR(SYSDATE, 'YYYYWW')
-- �ý��� ���� ����
,TO_CHAR(SYSDATE-30, 'YYYYMMDD')
,TO_CHAR(SYSDATE, 'YYYYMMDD')
,TO_CHAR(SYSDATE-1, 'YYYYMMDD')
FROM DUAL;


--///////////////////// �Ϲ��Լ� ////////////////////////////////

-- NVL --
--NULL ���� ������ �ٸ������� ġȯ
SELECT 
      NVL(PASS,'56448Q')
  FROM HANBIN_TABLE_FIRST;
  
-- NVL --
-- NULL�� �ƴҰ�� A NULL�� ��� B �� ġȯ
SELECT 
      NVL2(PASS,'56448Q','90903A')
  FROM HANBIN_TABLE_FIRST;

-- CASE --
-- ���ǿ� �´� ��� WHEN�� ������ ġȯ
SELECT
      STUDENT_ID,
      CASE WHEN STUDENT_ID<20151296 THEN 2020
           WHEN STUDENT_ID>201650250 AND STUDENT_ID<20151299 THEN 123
            ELSE 3000 END AS STUDENT_ID
FROM HANBIN_TABLE_FIRST;


-- DECODE (SWITCH CASE) �� ���� 
SELECT A.*
      ,DECODE(A.ID,'DEL',1,'SEA',2,3) AS NUM
      FROM HANBIN_TABLE_FIRST A
 WHERE 1=1
 ORDER BY NUM;
  
-------------------------------------------------------------------


--/////////////////////////// �����Լ� /////////////////////////////

-- COUNT --

-- �־��� �ڷ� ���� ������ �Ǽ��� �����

SELECT 
      COUNT(NAME)
  FROM HANBIN_TABLE_FIRST;
  
-- SUM --

-- �־��� �ڷ� ���� ������ �հ踦 �����

SELECT 
      SUM(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;
  
-- AVG --

-- �־��� �ڷ� ���� ������ ����� �����

SELECT 
      AVG(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;

-- MIN/MAX --

-- �־��� �ڷ� ���� ������ �ִ�/�ּҰ��� �����

SELECT 
      MAX(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;
  

--//// GROUP BY ///////

SELECT
      ID
      ,NAME
      ,AVG(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST
-- WHERE ����
GROUP BY ID,NAME
HAVING AVG(STUDENT_ID) > 201650222-- HAVING ������(����)
ORDER BY ID,NAME;

---------------------------------------------------------------------------



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







