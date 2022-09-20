SELECT * FROM SHOPINGMALL s ;

--CREATE SEQUENCE [��������]
--INCREMENT BY [��������] 
--START WITH [���ۼ���];

CREATE SEQUENCE member_seq INCREMENT BY 1
START WITH 100001;

DROP SEQUENCE member_seq ;

DROP TABLE MEMBER_TBL_02 IF EXISTS;			--sql�� ���Ϸ� ������ �� ����ϼ���.

CREATE TABLE member_tbl_02(
	custno number(6) NOT NULL,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate DATE,
	grade char(1),
	city char(2),
	PRIMARY KEY(custno)
);

CREATE TABLE MONEY_TBL_02(
	custno number(6) NOT NULL,
	salenol number(20) NOT NULL,
	pcost number(8),
	amount number(4),
	price number(10),
	pcode varchar2(10),
	sdate DATE,
	PRIMARY KEY(custno,salenol)
); 

CREATE TABLE GRADE_TBL_02 (


)

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'���ູ','010-1111-2222','���� ���빮�� �ְ�1��','20151202','A','01');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'���ູ','010-1111-3333','���� ���빮�� �ְ�2��','20151206','B','01');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'�����','010-1111-4444','�︪�� �︪�� ����1��','20151001','B','30');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'�ֻ��','010-1111-5555','�︪�� �︪�� ����2��','20151113','A','30');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'����ȭ','010-1111-6666','���ֵ� ���ֽ� �ܳ�����','20151225','B','60');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'������','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160001, 500, 5, 2500, 'A001', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160003, 500, 3, 1500, 'A008', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160005, 500, 1, 500, 'A001', '20160103');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160007, 500, 2, 1000, 'A001', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160008, 300, 1, 300, 'A005', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160009, 600, 1, 600, 'A006', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

SELECT * FROM MEMBER_TBL_02 mt ;
SELECT * FROM MONEY_TBL_02 mt ;

-- step 1)
SELECT custno, sum(price) FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO ;

-- step 2) ���� ���� Ȯ���ϱ�
SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO 
ORDER BY asum desc;

-- step 3) ������ �������� ���� join �߰�
SELECT * FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 4) �䱸���׿� ���� �ʿ��� �÷��� ��ȸ�ϱ�
SELECT mt.CUSTNO, CUSTNAME, GRADE, sale.asum  FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 5) ������ �䱸���׿� ���� �÷���� �����ϱ�
SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','�Ϲ�','C','����')AS agrade,
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

--���� ���� : "������ ���� ȸ���� ��ȸ���� �ʴ´�."�� "������ ���� ȸ���� 0���� ����Ѵ�."
--			1) null���� 0���� ����ϴ� �Լ� : nvl		2)�ܺ��������� �����մϴ�.
--			3) �����հ谡 ���� ���� ȸ����ȣ ������ ����մϴ�. 

SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','�Ϲ�','C','����')AS agrade,
		nvl(asum,0) AS sum_ FROM MEMBER_TBL_02 mt ,			--1)
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		) sale
WHERE mt.CUSTNO = sale.custno(+) 	--2)
ORDER BY sum_ DESC,CUSTNO ;			--3)

-- ���� 5)�� select ���� ����� �������̺� view �� �����մϴ�.
CREATE VIEW v_by_custno
AS 
SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','�Ϲ�','C','����')AS agrade,
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- SELECT ����
SELECT * FROM V_BY_CUSTNO ;

-- ���α׷��� �˻� ��ɿ��� where �� �� ����ؼ� �����ؾ� �մϴ�.
SELECT * FROM V_BY_CUSTNO WHERE custno = 100003;
SELECT * FROM V_BY_CUSTNO WHERE custname ='�ֻ��';
SELECT * FROM V_BY_CUSTNO WHERE agrade = 'VIP';
SELECT * FROM V_BY_CUSTNO WHERE asum>4000;

-- ������ ȸ���̸� �˻�.
SELECT * FROM MEMBER_TBL_02 mt ;
SELECT * FROM MEMBER_TBL_02 mt WHERE custname = '�����';			--��ü��ġ�� �˻�
SELECT * FROM MEMBER_TBL_02 mt WHERE custname like '%����%';		--�κ���ġ �˻�
SELECT * FROM MEMBER_TBL_02 mt WHERE custname like '%'|| '����' || '%';		--||�� ���ڿ� ����


