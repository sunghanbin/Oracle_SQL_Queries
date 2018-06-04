----------------- 단일행 함수 ------------------------------------

-- 단일행 함수 에 대한 내용 ONE NOTE 기록

--//////////// 문자 함수 ///////////////////

-- 대/소문자 변경(UPPER-대문자,LOWER-소문자) --

SELECT 
   UPPER(NAME) AS CASE1,
   LOWER(ID) AS CASE2
FROM HANBIN_TABLE_FIRST;

-------------------------------------------------


-- 컬럼 값 합치기(CONCAT) ----------------------

-- 방법1
SELECT 
      CONCAT(ID,NAME) 
  FROM HANBIN_TABLE_FIRST;
  
-- 방법2

SELECT
      ID || NAME AS FULL_NAME
  FROM HANBIN_TABLE_FIRST;

-------------------------------------------------

---------- 컬럼 값 추출하기(SUBSTR) -------------

SELECT
      NAME,
      SUBSTR(NAME,0,1)
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

----------- 컬럼 값 채우기(LPAD = 왼쪽 / RPAD = 오른쪽) -------

SELECT
      LPAD(ID,10/*자릿수*/,'ACCC')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

------------ 컬럼 값 제거(LTRIM,RTRIM) ----

SELECT
      NAME,
      LTRIM(NAME,'H')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------

----------- 컬럼 값 변경하기(REPLACE) ----------

SELECT
      NAME,
      REPLACE(NAME,'HA','하')
  FROM HANBIN_TABLE_FIRST;
  
------------------------------------------------



--///////////////// 숫자 함수 ///////////////////

SELECT
     ROUND(12.345,2)
     ,CEIL(12.345)
     ,FLOOR(12.345)
     ,MOD(12,10)
     ,POWER(3,2)
 FROM DUAL;
        
      
  
  
  

      

  





