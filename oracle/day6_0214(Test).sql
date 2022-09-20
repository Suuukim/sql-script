SELECT * FROM SHOPINGMALL s ;

--CREATE SEQUENCE [시퀀스명]
--INCREMENT BY [증감숫자] 
--START WITH [시작숫자];

CREATE SEQUENCE member_seq INCREMENT BY 1
START WITH 100001;

DROP SEQUENCE member_seq ;

DROP TABLE MEMBER_TBL_02 IF EXISTS;			--sql을 파일로 실행할 때 사용하세요.

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
VALUES(member_seq.nextval,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');

INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)
VALUES(member_seq.nextval,'차공단','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');

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

-- step 2) 정렬 기준 확인하기
SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO 
ORDER BY asum desc;

-- step 3) 고객정보 가져오기 위한 join 추가
SELECT * FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 4) 요구사항에 따라 필요한 컬럼만 조회하기
SELECT mt.CUSTNO, CUSTNAME, GRADE, sale.asum  FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- step 5) 제시한 요구사항에 따라 컬럼결과 변경하기
SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','일반','C','직원')AS agrade,
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

--문제 변형 : "매출이 없는 회원은 조회되지 않는다."를 "매출이 없는 회원은 0으로 출력한다."
--			1) null값을 0으로 출력하는 함수 : nvl		2)외부조인으로 수정합니다.
--			3) 매출합계가 같을 때는 회원번호 순서로 출력합니다. 

SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','일반','C','직원')AS agrade,
		nvl(asum,0) AS sum_ FROM MEMBER_TBL_02 mt ,			--1)
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		) sale
WHERE mt.CUSTNO = sale.custno(+) 	--2)
ORDER BY sum_ DESC,CUSTNO ;			--3)

-- 위의 5)번 select 실행 결과를 가상테이블 view 로 생성합니다.
CREATE VIEW v_by_custno
AS 
SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','일반','C','직원')AS agrade,
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO 
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;

-- SELECT 쿼리
SELECT * FROM V_BY_CUSTNO ;

-- 프로그램의 검색 기능에는 where 를 잘 사용해서 적용해야 합니다.
SELECT * FROM V_BY_CUSTNO WHERE custno = 100003;
SELECT * FROM V_BY_CUSTNO WHERE custname ='최사랑';
SELECT * FROM V_BY_CUSTNO WHERE agrade = 'VIP';
SELECT * FROM V_BY_CUSTNO WHERE asum>4000;

-- 조건을 회원이름 검색.
SELECT * FROM MEMBER_TBL_02 mt ;
SELECT * FROM MEMBER_TBL_02 mt WHERE custname = '김순이';			--전체일치값 검색
SELECT * FROM MEMBER_TBL_02 mt WHERE custname like '%순이%';		--부분일치 검색
SELECT * FROM MEMBER_TBL_02 mt WHERE custname like '%'|| '순이' || '%';		--||은 문자열 연결


