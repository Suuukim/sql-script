--�����߿��� ������ȸ�� ����
SELECT * FROM "tbl_campArea" tca ;

-- ��ü ������ ������?
SELECT count(*) FROM "tbl_campArea" tca ;

-- ������ ������ ������?
SELECT COUNT(*) FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE'������%'; 

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))	--substr(���ڿ�,������ġ,����)
FROM "tbl_campArea" tca ;		--�ּҿ��� ù���� ���� �պκ� ����(�ߺ�����)


-- �������� �ڵ����߿��� �߿��� �̸�, �δ�ü� ��ȸ�ϱ�
SELECT camp_name, etc1, etc2 
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '������%' AND CAMP_TYPE LIKE '%�ڵ���%';

-- �ڵ��� �߿��� ������ 50�� �̻��� �� �߿��� �̸�, �ּ� ��ȸ�ϱ�
SELECT CAMP_NAME , ADDRESS , CAR_CNT 
FROM "tbl_campArea" tca 
WHERE CAR_CNT >= 50;

-- ī��� �ִ� �߿��� �̸�, �ּ�, ī��� ���� ��ȸ�ϱ�
SELECT CAMP_NAME , ADDRESS , CARA_CNT 
FROM "tbl_campArea" tca 
WHERE  CARA_CNT > 0
ORDER BY ADDRESS ; 



-- ����
-- �籸�� �ִ� ķ���� ��ȸ.
SELECT CAMP_NAME , ADDRESS
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '%�籸��%';

SELECT COUNT(ADDRESS)
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '%�籸��%';

SELECT CAMP_NAME , COUNT(ADDRESS)  
FROM "tbl_campArea" tca 
GROUP BY CAMP_NAME 
HAVING COUNT(ADDRESS) LIKE '%�籸��%';


