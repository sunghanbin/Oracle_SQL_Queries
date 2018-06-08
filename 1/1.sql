-- 테이블 조회 --
select * from HANBIN_TABLE_FIRST;

SELECT * FROM TABS;

--TNSNAME 설정  //자세한 설명은 ONE NOTE 기록함--
/*{서버별칭} = 
              (DESCRIPTION =
                (ADDRESS = (PROTOCOL = TCP)(HOST = 서버ip주소)(PORT = 포트넘버))
                (CONNECT_DATA = 
                 (SERVER = DEDICATED)
                  (SERVICE_NAME = 테이터베이스 서비스 이름)))*/




------------------ 테이블 스페이스 ----------------------------

--테이블 스페이스 생성하기--
CREATE TABLESPACE TESTSUNG
DATAFILE 'C:\ORACLE\DATA\TESTSUNG.dbf' SIZE 1024M
AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
SEGMENT SPACE MANAGEMENT AUTO;

--테이블스페이스 조회--
SELECT * FROM DBA_TABLESPACES;

--테이블스페이스 삭제--
DROP TABLESPACE TESTSUNG
INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

-----------------------------------------------------------

-------------------- 사용자 ----------------------

--사용자 생성--
CREATE USER HANBIN
  IDENTIFIED BY SUNG--비번
  DEFAULT TABLESPACE TESTSUNG
  TEMPORARY TABLESPACE TEMP;
  
--사용자 조회--
SELECT * FROM DBA_USERS;

--사용자 비밀번호변경 및 사용자 삭제--
ALTER USER HANBIN
IDENTIFIED BY SUNG2;

DROP USER HANBIN CASCADE;

--사용자 권한 생성--
GRANT CONNECT,RESOURCE, DBA TO HANBIN;

---------------------------------------------------

------------------- 테이블 -------------------------

--테이블 생성--
CREATE TABLE HANBIN_TABLE_SECOND
(
 NAME VARCHAR(10),
 ID VARCHAR(20),
 PASS VARCHAR(20),
 STUDENT_ID NUMBER
 );

--테이블 삭제--
DROP TABLE HANBIN_TABLE_SECOND; 

--------------------------------------------------



--------------------- 컬럼 --------------------------

-- 컬럼 추가 

ALTER TABLE HANBIN_TABLE_FIRST ADD TEST NUMBER;

-- 컬럼 수정

ALTER TABLE HANBIN_TABLE_FIRST MODIFY TEST VARCHAR(10);

-- 컬럼 삭제 

ALTER TABLE HANBIN_TABLE_FIRST DROP COLUMN TEST;

-- 컬럼 이름 변경

ALTER TABLE HANBIN_TABLE_FIRST RENAME COLUMN TEST TO SCORE;

-- 컬럼 정보 조회

SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = 'HANBIN_TABLE_FIRST'; 

-------------------------------------------------------



------------------ 데이터 ---------------------------
 
 ------------ 데이터 삽입 ----------
 
 INSERT INTO HANBIN_TABLE_FIRST
 VALUES ('HANBIN','SUNG','77777',201650250);
 
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


-------- 데이터 업데이트(기존데이터 변경) ----------
 
 UPDATE HANBIN_TABLE_FIRST
 SET STUDENT_ID = 201650255
 WHERE 1=1
 AND STUDENT_ID = 201650250;
 
 ------ 데이터 삭제 -------
 
 DELETE FROM HANBIN_TABLE_FIRST WHERE PASS = '56434DFJF5';
 
 
 -- 모든 행 삭제
 DELETE FROM HANBIN_TABLE_FIRST;
 
 
 

 --데이터 IMPORT 하기 ONE NOTE 기록
 
 -------------------------------------------------
 
 
 
 ------------------- 키생성 ----------------------
 
 -- 기본키 생성 // 기본키에 대한 자세한설명 필기노트 기록 --
 
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
 -- 상단 -> 외래키 생성 --
 
 --키 제거 --
 ALTER TABLE HANBIN_TABLE_FIRST
 DROP CONSTRAINT FK_HANBIN_TABLE_FIRST;
 --키가 없던 테이블에 키를 추가 할때--
 ALTER TABLE HANBIN_TABLE_FIRST
 ADD CONSTRAINT FK_HANBIN_TABLE_FIRST FOREIGN KEY(ID,PASS) REFERENCES HANBIN_TABLE_LOGIN(ID,PASS)
 ON DELETE CASCADE; -- 부모가 삭제하면 자식도 자동으로 삭제 됨 (참조무결성 무시)
 
 -- ON DELETE SET NULL 부모가 삭제시 자식을 지우지 않고 NULL값으로 변경된다.
 
 -- DEFAULT 상단의 두가지 기능들을 사라지게 만든다. 기본값
 
 --------------------------------------------
 
 
 
 
 ------------------ 관계대수 ----------------
 
 --SELECTION--
 --특정행 추출연산
 
 SELECT * FROM HANBIN_TABLE_FIRST
     WHERE 1=1
     AND STUDENT_ID = 201650255;
     
 --PROJECTION--
 --특정 컬럼들만 추출하는 연산 (중복행발생할수있음)

 SELECT NAME 
   FROM HANBIN_TABLE_FIRST;
   
--UNION--
--2개의 테이블을 합침 (속성수와 컬럼정보가 같아야한다)
-- 중복제거 및 정렬 (속도저하)

SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
UNION
SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_SECOND;

--UNION ALL--
-- 중복제거 및 정렬 x

SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
UNION ALL
SELECT NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_SECOND;
  
---------------------------------------------------------------

--------------------- EXPRESSION 이용 -------------------------

SELECT 
      77.20 AS TEST,
      NAME
  FROM HANBIN_TABLE_FIRST;
  
SELECT
      NAME||'/'||STUDENT_ID AS attendance
  FROM HANBIN_TABLE_FIRST;
    
----------------------------------------------------------------

---------------------- DISTINCT --------------------------------
--중복값 제거

SELECT
      DISTINCT NAME, STUDENT_ID
  FROM HANBIN_TABLE_FIRST;
  
----------------------------------------------------------------

--------------------- WHERE -----------------------------------
--조건절--
--비교시 대소문자 구분

SELECT
      ID, PASS
  FROM HANBIN_TABLE_FIRST
 WHERE 1=1
   AND ID = 'HANBIN'
   AND PASS = '77777';
   
----------------------------------------------------------------



---------------------- 사용자 조건 입력 받아 출력하기 ------------

-- 사용자 조건 입력 받기 --

SELECT
      NAME, ID, PASS, STUDENT_ID
  FROM HANBIN_TABLE_FIRST
 WHERE STUDENT_ID = &STUDENT;
 
 ------------------------------------------------------------------
 
 ---------------- 데이터 정렬하기 ---------------------------------
 
 -- 정렬하기 --

SELECT
      NAME, ID, STUDENT_ID 
  FROM HANBIN_TABLE_FIRST
 ORDER BY ID;
 
 -----------------------------------------------------------------
 
 ----------------- 집합연산자 ------------------------------------
 
 -- 합집합(UNION(ALL)) -- 
 
 SELECT *
 FROM HANBIN_TABLE_FIRST
 --조건절 사용 가능 WHERE ID = 'SUNG'
 UNION
 
 SELECT *
 FROM HANBIN_TABLE_FIRST;
 --조건절 사용 가능 WHERE ID = 'HAN'
 
  SELECT *
 FROM HANBIN_TABLE_FIRST
 --조건절 사용 가능 WHERE ID = 'SUNG'
 UNION ALL
 
 SELECT *
 FROM HANBIN_TABLE_FIRST;
 --조건절 사용 가능 WHERE ID = 'HAN'
 
 -- 교집합(INTERSECT) --
 
 SELECT NAME
   FROM HANBIN_TABLE_FIRST
-- 사용가능 WHERE STUDENT_ID = '2016500'

INTERSECT

SELECT NAME
FROM HANBIN_TABLE_FIRST;
-- 사용가능 WHERE STUDENT_ID = '2016520'

-- 차집합(MINUS) --

 SELECT NAME
   FROM HANBIN_TABLE_FIRST
-- 사용가능 WHERE STUDENT_ID = '2016500'

MINUS

SELECT NAME
FROM HANBIN_TABLE_FIRST;
-- 사용가능 WHERE STUDENT_ID = '2016520'

----------------- 연산자 리스트 --------------------------------

-- BETWEEN a AND b --

-- a 와 b 사이에 있는 범위 값 모두 검색

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NEME BETWEEN 1 AND 10;

-- IN(a,b,C) --

-- a 이거나 B 이거나 C 인 조건을 검색(다양한 조건을 AND 를 쓰지않고 한번에)

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NEME IN(1,2,10);

-- LIKE --

-- 특정 패턴을 가지고 있는 조건을 검색

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME LIKE 'HANBIN';

-- IS NULL / IS NOT NULL --

-- NULL 값을 검색 / NULL 이 아닌 값을 검색

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME IS NULL;

-- != a --

-- a 가 아닌 모든 조건을 검색

SELECT NAME
FROM HANBIN_TABLE_FIRST
WHERE NAME != 'SUNG';

--------------------------------------------------------------

  














   
 
 
 
 




  

 


