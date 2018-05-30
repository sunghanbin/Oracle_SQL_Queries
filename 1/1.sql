-- 테이블 조회 --
-- select * from {테이블명}

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

------------------ 데이터 ---------------------------
 
 --데이터 삽입--
 INSERT INTO HANBIN_TABLE_FIRST
 VALUES ('HANBIN','SUNG','77777',201650250);

 --데이터 업데이트(기존데이터 변경)--
 UPDATE HANBIN_TABLE_FIRST
 SET STUDENT_ID = 201650255
 WHERE 1=1
 AND STUDENT_ID = 201650250;
 

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


------------------ 숫자 함수 ----------------------------------
--사용예제

SELECT
      ROUND(TEST,1)
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
 






      



   
 
 
 
 




  

 


