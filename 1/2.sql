--/////////////////// ������ ���� ///////////////

-- INNER JOIN --

-- Ű�� �����ϰ� Ű�� �ִ� ����� �ڷḸ ��ȸ
-- INNER JOIN �� ���� �����͸� �������� �����ؾ� �ӵ�UP
-- ������
SELECT B.*,A.REGIONNAME
  FROM KOPO_REGION_MST A
INNER JOIN KOPO_CHANNEL_SEASONALITY_NEW B
ON A.REGIONID = B.REGIONID;

-- LEFT JOIN --

-- ���� �����͸� ��� ����� �Ҷ�
-- �ڼ��� ���� ONE NOTE

SELECT A.*,B.REGIONNAME
  FROM  KOPO_CHANNEL_SEASONALITY_NEW A
LEFT JOIN KOPO_REGION_MST B
ON A.REGIONID = B.REGIONID;





