--1) TBL_BUY# ���̺��� BUY_SEQ �÷��� �ڵ����� �ǵ��� sequence�� �����ϴ� DDL ����� �ۼ��ϼ���.
--   ��,BUY_SEQ �÷����� 2001���� �����ϰ� ������ �̸���  buyno_seq �� �մϴ�
CREATE SEQUENCE tblbuy_seq START WITH 2001;
CREATE SEQUENCE tblbuy_seq MINVALUE 2001;

--2)�Ʒ��� ���� ������ TBL_POSTCODE ���̺��� �����ϴ� DDL ��ɹ��� �ۼ��ϼ���.
--  (��, primary key �� �Ʒ� �׸��� ǥ�õ� ������ ��� �����մϴ�.)
CREATE TABLE tbl_postcode (
	postcode char(6) PRIMARY KEY,
	area1 varchar2(200) NOT NULL 
);

--3)TBL_CUSTOM#  ���̺�   postcode �÷��� �߰��ϴ� DDL����� �ۼ��ϼ���. 
--  (��, postcode �÷��� null �� ����մϴ�.)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(6) );
 
--4)  TBL_CUSTOM# �� postcode �÷���  TBL_POSTCODE ���̺��� postcode �÷��� �����ϵ���
--    foreign key ���������� �߰��ϴ� DDL����� �ۼ��ϼ���. �������� �̸��� ���Ƿ� �ϼ���.
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_pstcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);

UPDATE "TBL_CUSTOM#" 
SET CUSTOM_ID = 'sana'
WHERE CUSTOM_ID IN ('sana22');

INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES ('CJ-BABQ1', 'B1', 'CJ�޹�����SET', 26000);
INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES ('CHR-J59', 'A2', 'Sü��', 98700);

INSERT INTO "TBL_BUY#" (BUY_SEQ,CUSTOM_ID ,PCODE ,QUANTITY ,BUY_DATE)
VALUES (tbl_buy_seq.nextval ,'hongGD','dk_143',1,'22-02-11');
INSERT INTO "TBL_BUY#" (BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
VALUES (tbl_buy_seq.nextval, 'twice','CHR-J59', 2, '22-02-12');
INSERT INTO "TBL_BUY#" (BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
VALUES (tbl_buy_seq.nextval, 'hongGD','CJ-BABQ1', 4, '22-02-11');
INSERT INTO "TBL_BUY#" (BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
VALUES (tbl_buy_seq.nextval, 'hongGD','IPAD011', 2, '22-02-08');


DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'CJ-BABQ1';
DELETE FROM "TBL_BUY#" tb WHERE CUSTOM_ID = 'hongGD';

--1) 2022�� 2��11�Ϻ��� �� ���Ŀ� �Ǹŵ� ��ǰ�� �Ʒ��� ���� ��ȸ �մϴ�.
SELECT * FROM "TBL_BUY#" tb WHERE buy_date > '2022-02-10';

--2) ���� ������ ���� ��ǰ�� ������ ���� ��ȸ�մϴ�.
SELECT PCODE , PNAME , price 
FROM "TBL_PRODUCT#" 
WHERE PRICE = (SELECT max(price) FROM "TBL_PRODUCT#" tp);

--3) ��ǰ�� ī�װ����� ���� ��� ��ǰ�� ��ȸ �մϴ�. ��ȸ����� category �÷����� �����մϴ�.
SELECT category, max(price) FROM "TBL_PRODUCT#" tp 
GROUP BY CATEGORY
ORDER BY CATEGORY ;

--4) IPAD011 �� ������ �������� ���ż����� �Ʒ��� ���� ��ȸ�մϴ�.
SELECT tb.CUSTOM_ID , name,quantity FROM "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID 
AND tb.PCODE = 'IPAD011';

--5) �������� ��ǰ�� �������� ���� ���� �Ʒ��� ���� ��ȸ�մϴ�. (outer join)
SELECT tc.CUSTOM_ID ,name,age FROM "TBL_CUSTOM#" tc ,"TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID (+)
AND tb.PCODE IS NULL ;

--6) ��¥���� ���Ǹűݾ��� �Ʒ��� ���� ��ȸ�մϴ�. (join�� group by)
SELECT buy_date2, sum(money)
FROM(SELECT TO_CHAR(buy_date,'yyyy-MM-dd') 
AS buy_date2 ,custom_id ,tb.pcode,quantity * price AS money
FROM "TBL_BUY#" tb ,"TBL_PRODUCT#" tp 
WHERE tb.pcode = tp.PCODE )
GROUP BY buy_date2 
ORDER BY buy_date2;

--1) TBL_POSTCODE ���̺��� �����͸� �Ʒ��� ���� �߰��ϴ� DDL����� ��� �ۼ��ϼ���.
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','��õ������ ������ �ڿ���');

--2) 1�� �������� TBL_CUSTOM# ���̺�  POSTCODE �÷��� �߰��Ͽ����ϴ�. �� �Ŀ� �Ʒ��� ���� �� ����
--   POSTCODE �÷����� �����ϱ� ���� DDL����� ��� �ۼ��ϼ���.
UPDATE "TBL_CUSTOM#" SET POSTCODE = '137964' WHERE CUSTOM_ID = 'mina012'
UPDATE "TBL_CUSTOM#" SET POSTCODE = '412510' WHERE CUSTOM_ID = 'hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE = '409880' WHERE CUSTOM_ID = 'wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE = '138761' WHERE CUSTOM_ID = 'sana';

--3) �Ʒ��� ���� select ������ �����Ų ����� ��ȸ�Ǵ�  v_custom_info �̸��� ��(VIEW)�� �����ϼ���.���� 2�� ���̺��� �̿��մϴ�.
CREATE VIEW v_custom_info
AS
SELECT custom_id, tp.postcode,area1 
FROM TBL_POSTCODE tp, "TBL_CUSTOM#" tc 
WHERE tp.POSTCODE = tc.POSTCODE ;

SELECT * FROM v_custom_info ;

