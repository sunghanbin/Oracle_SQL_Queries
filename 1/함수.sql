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
 FROM DUAL;
        
      
  
  
  

      

  





