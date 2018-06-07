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
     ,ABS(-7)
     ,SQRT(69)
 FROM DUAL;
 
 
 --사용예제

SELECT 
      mod(STUDENT_ID,7)
  FROM HANBIN_TABLE_FIRST;

--ROUND--
--N  값을 반올림 한다 ROUND(3.14,1<-반올림할 자릿수)

--CEIL--
-- N  값을 가장 근접한 큰정수 출력

--FLOOR--
-- N  값을 가장 근접한 작은 정수 출력

--MOD--
--N  값을 나눈후 나머지 값 출력

--POWER--
--주어진 숫자N의 숫자M 승을 출력함 POWER(2,3)--> 8

--ABS--
-- 절대값을 계산  //절대값이란 0으로 부터의 거리 음수 X

--SQRT--
-- N 값의 루트값을 구함. N은 양수여야함 


-----------------------------------------------------------------


--//////////////////// 날짜 함수 //////////////////////////////

-- SYSDATE --
-- 시스템 현재 날짜/시간 
SELECT 
      SYSDATE
  FROM DUAL;

-- NEXT_DAY --
-- 다음요일 출력
-- 현시간을 기준으로 요일 이 지났다면 다음주 날짜를 / 지난 요일 이아니라면 그주 요일을 
-- 일 /1,월/2,화/3,수/4,목/5,금/6,토/7

SELECT 
      NEXT_DAY(SYSDATE,7)
  FROM DUAL;

-- LAST_DAY --
-- 속한 달의 마지막 날짜 

SELECT 
      LAST_DAY(SYSDATE)
  FROM DUAL;
  
-- YYYY년도,MM달,WW주차,DD일
-- TO_CHAR 는 날짜의 데이터 형태는 DATE 형태이기 때문에 문자(CHAR)로 바꾸어 준다
-- DATE 형변환에 대한 자세한 설명은 ONE NOTE '날짜함수'로 검색 
SELECT TO_CHAR(SYSDATE-7, 'YYYYWW')
--시스템 날짜로 부터 7일전 주차
,TO_CHAR(SYSDATE, 'YYYYWW')
-- 시스템 현재 주차
,TO_CHAR(SYSDATE-30, 'YYYYMMDD')
,TO_CHAR(SYSDATE, 'YYYYMMDD')
,TO_CHAR(SYSDATE-1, 'YYYYMMDD')
FROM DUAL;


--///////////////////// 일반함수 ////////////////////////////////

-- NVL --
--NULL 값을 만나면 다른값으로 치환
SELECT 
      NVL(PASS,'56448Q')
  FROM HANBIN_TABLE_FIRST;
  
-- NVL --
-- NULL이 아닐경우 A NULL일 경우 B 로 치환
SELECT 
      NVL2(PASS,'56448Q','90903A')
  FROM HANBIN_TABLE_FIRST;

-- CASE --
-- 조건에 맞는 경우 WHEN절 값으로 치환
SELECT
      STUDENT_ID,
      CASE WHEN STUDENT_ID<20151296 THEN 2020
           WHEN STUDENT_ID>201650250 AND STUDENT_ID<20151299 THEN 123
            ELSE 3000 END AS STUDENT_ID
FROM HANBIN_TABLE_FIRST;


-- DECODE (SWITCH CASE) 과 같음 
SELECT A.*
      ,DECODE(A.ID,'DEL',1,'SEA',2,3) AS NUM
      FROM HANBIN_TABLE_FIRST A
 WHERE 1=1
 ORDER BY NUM;
  
-------------------------------------------------------------------


--/////////////////////////// 집계함수 /////////////////////////////

-- COUNT --

-- 주어진 자료 집계 단위의 건수를 출력함

SELECT 
      COUNT(NAME)
  FROM HANBIN_TABLE_FIRST;
  
-- SUM --

-- 주어진 자료 집계 단위의 합계를 출력함

SELECT 
      SUM(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;
  
-- AVG --

-- 주어진 자료 집계 단위의 평균을 출력함

SELECT 
      AVG(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;

-- MIN/MAX --

-- 주어진 자료 집계 단위의 최대/최소값을 출력함

SELECT 
      MAX(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST;
  

--//// GROUP BY ///////

SELECT
      ID
      ,NAME
      ,AVG(STUDENT_ID)
  FROM HANBIN_TABLE_FIRST
-- WHERE 가능
GROUP BY ID,NAME
HAVING AVG(STUDENT_ID) > 201650222-- HAVING 조건절(집계)
ORDER BY ID,NAME;

---------------------------------------------------------------------------



-- 테이블에 다중INSERT 하는 방법1

-- 하나의 테이블도 가능하지만 한번에 다중 테이블 추가도 가능하다 

INSERT ALL
INTO HANBIN_TABLE_FIRST VALUES('Deliesselia','DEL','12345',20151254)
INTO HANBIN_TABLE_LOGIN VALUES('DELISEA','SEA','123AA',2015113)
SELECT * FROM DUAL;
-- SELECT * FROM DUAL 을꼭써줘야 한다 


-- 하나의 테이블에 다중INSELT 하는 방법2

INSERT INTO HANBIN_TABLE_FIRST(NAME,ID,PASS,STUDENT_ID)
SELECT 'SIMONS','ONS',NULL,20151297 FROM DUAL;
SELECT 'DELIZA','LI','56434DF5',20151299 FROM DUAL UNION ALL
SELECT 'DELMON','MON','56434FGF5',20151296 FROM DUAL UNION ALL
SELECT 'DELMON','MON','56434FGF5',NULL FROM DUAL UNION ALL
SELECT 'COTY','CO','56434DFJF5',20151298 FROM DUAL;

-- 블로그 사람의 설명으로는 1번방법은 여러개의 테이블에 따로따로 입력하게 되는것 
-- 이므로 1개 행씩 따로 명령을 주는것과 동일 하여 속도가 느리기 때문에 방법2 을 추천 했다







