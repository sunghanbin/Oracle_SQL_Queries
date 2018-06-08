--/////////////////// 데이터 조인 ///////////////

-- INNER JOIN --

-- 키를 정의하고 키가 있는 경우의 자료만 조회
-- INNER JOIN 은 작은 데이터를 기준으로 조인해야 속도UP
-- 교집합
SELECT B.*,A.REGIONNAME
  FROM KOPO_REGION_MST A
INNER JOIN KOPO_CHANNEL_SEASONALITY_NEW B
ON A.REGIONID = B.REGIONID;

-- LEFT JOIN --

-- 기존 데이터를 모두 살려야 할때
-- 자세한 내용 ONE NOTE

SELECT A.*,B.REGIONNAME
  FROM  KOPO_CHANNEL_SEASONALITY_NEW A
LEFT JOIN KOPO_REGION_MST B
ON A.REGIONID = B.REGIONID;





