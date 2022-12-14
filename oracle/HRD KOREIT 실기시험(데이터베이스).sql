-- 회원insert (가입일자는 sysdate로 하세요.)
INSERT INTO MEMBER_TBL_02  
VALUES (member_seq.nextval,'최모모','010-9988-1103','서울시 강남구 역삼동',sysdate,'A','01' );

SELECT * FROM MEMBER_TBL_02 mt ;

-- 회원수정update는 회원번호를 조건으로 하여 전화번호,주소,거주지역 컬럼을 변경할 수 있도록 합니다.
UPDATE MEMBER_TBL_02 SET phone='010-9999-7777',address='제주도 서귀포시',city='60' WHERE custno =100021;


-- 회원 전체 select
SELECT * FROM MEMBER_TBL_02 mt ;

-- 회원 pk로 select
SELECT * FROM MEMBER_TBL_02 mt WHERE CUSTNO =100021 ;
DELETE SEQUENCE Member_seq;
CREATE SEQUENCE Member_seq START WITH 100007;

-- 매출집계 -> 자바 vo 클래스는 select 조회 컬럼만으로 변수를 선언해서 작성합니다.
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;


-- 위의 select 를 뷰(create view)로도 만들어보세요.
create OR replace VIEW v_hrdSale
AS
SELECT mt.CUSTNO , CUSTNAME , 
		decode(grade,'A','VIP','B','일반','C','직원') AS agrade, 
		asum FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt 
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno ;




SELECT * FROM v_hrdSale ;


CREATE TABLE member_tbl_02(
custno number(6) NOT NULL,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate DATE,
grade char(1),
city char(2),
PRIMARY key(custno)
);

CREATE TABLE money_tbl_02(
custno number(6) NOT NULL,
salenol number(8) NOT NULL,
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate DATE,
PRIMARY key(custno, salenol)
);

INSERT INTO MEMBER_TBL_02 VALUES (100001,'김행복','010-111-2222','서울시 동대문구 휘경1동','2015-12-02','A','01');
INSERT INTO MEMBER_TBL_02 VALUES (100002,'이축복','010-111-3333','서울시 동대문구 휘경2동','2015-12-06','B','01');
INSERT INTO MEMBER_TBL_02 VALUES (100003,'장믿음','010-111-4444','울릉군 울릉읍 독도1리','2015-10-01','B','30');
INSERT INTO MEMBER_TBL_02 VALUES (100004,'최사랑','010-111-5555','울릉군 울릉읍 독도2리','2015-11-13','A','30');
INSERT INTO MEMBER_TBL_02 VALUES (100005,'진평화','010-111-6666','제주도 제주시 외나무골','2015-12-25','B','60');
INSERT INTO MEMBER_TBL_02 VALUES (100006,'차공단','010-111-7777','제주도 제주시 감나무골','2015-12-11','C','60');

INSERT INTO MONEY_TBL_02 VALUES (100001,20160001,500,5,2500,'A001','2016-01-01');
INSERT INTO MONEY_TBL_02 VALUES (100001,20160002,1000,4,4000,'A002','2016-01-01');
INSERT INTO MONEY_TBL_02 VALUES (100001,20160003,500,3,1500,'A008','2016-01-01');
INSERT INTO MONEY_TBL_02 VALUES (100002,20160004,2000,1,2000,'A004','2016-01-02');
INSERT INTO MONEY_TBL_02 VALUES (100002,20160005,500,1,500,'A001','2016-01-03');
INSERT INTO MONEY_TBL_02 VALUES (100003,20160006,1500,2,3000,'A003','2016-01-03');
INSERT INTO MONEY_TBL_02 VALUES (100004,20160007,500,2,1000,'A001','2016-01-04');
INSERT INTO MONEY_TBL_02 VALUES (100004,20160008,300,1,300,'A005','2016-01-04');
INSERT INTO MONEY_TBL_02 VALUES (100004,20160009,600,1,600,'A006','2016-01-04');
INSERT INTO MONEY_TBL_02 VALUES (100004,20160010,3000,1,3000,'A007','2016-01-06');

SELECT max(custno)+1
FROM MEMBER_TBL_02 mt ;

--회원매출조회 (매출이 높은 회원 순으로)
SELECT mt.custno, mt.custname, mt.grade, sum(mt2.price)
FROM MEMBER_TBL_02 mt , MONEY_TBL_02 mt2 
WHERE mt.custno = mt2.custno 
GROUP BY mt.CUSTNO, mt.custname, mt.grade 
ORDER BY sum(mt2.price) DESC ;

SELECT MAX(custno)+1 custno FROM member_tbl_02;
