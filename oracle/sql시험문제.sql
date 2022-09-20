--1) TBL_BUY# 테이블의 BUY_SEQ 컬럼을 자동증가 되도록 sequence를 생성하는 DDL 명령을 작성하세요.
--   단,BUY_SEQ 컬럼값은 2001부터 시작하고 시퀀스 이름은  buyno_seq 로 합니다
CREATE SEQUENCE tblbuy_seq START WITH 2001;
CREATE SEQUENCE tblbuy_seq MINVALUE 2001;

--2)아래와 같은 구조의 TBL_POSTCODE 테이블을 생성하는 DDL 명령문을 작성하세요.
--  (단, primary key 와 아래 그림에 표시된 형식은 모두 설정합니다.)
CREATE TABLE tbl_postcode (
	postcode char(6) PRIMARY KEY,
	area1 varchar2(200) NOT NULL 
);

--3)TBL_CUSTOM#  테이블에   postcode 컬럼을 추가하는 DDL명령을 작성하세요. 
--  (단, postcode 컬럼은 null 을 허용합니다.)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(6) );
 
--4)  TBL_CUSTOM# 의 postcode 컬럼이  TBL_POSTCODE 테이블의 postcode 컬럼을 참조하도록
--    foreign key 제약조건을 추가하는 DDL명령을 작성하세요. 제약조건 이름은 임의로 하세요.
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_pstcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);

UPDATE "TBL_CUSTOM#" 
SET CUSTOM_ID = 'sana'
WHERE CUSTOM_ID IN ('sana22');

INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES ('CJ-BABQ1', 'B1', 'CJ햇반잡곡밥SET', 26000);
INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES ('CHR-J59', 'A2', 'S체어', 98700);

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

--1) 2022년 2월11일부터 그 이후에 판매된 상품을 아래와 같이 조회 합니다.
SELECT * FROM "TBL_BUY#" tb WHERE buy_date > '2022-02-10';

--2) 가장 가격이 높은 상품을 다음과 같이 조회합니다.
SELECT PCODE , PNAME , price 
FROM "TBL_PRODUCT#" 
WHERE PRICE = (SELECT max(price) FROM "TBL_PRODUCT#" tp);

--3) 상품의 카테고리별로 가장 비싼 상품을 조회 합니다. 조회결과는 category 컬럼으로 정렬합니다.
SELECT category, max(price) FROM "TBL_PRODUCT#" tp 
GROUP BY CATEGORY
ORDER BY CATEGORY ;

--4) IPAD011 을 구매한 고객정보와 구매수량을 아래와 같이 조회합니다.
SELECT tb.CUSTOM_ID , name,quantity FROM "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID 
AND tb.PCODE = 'IPAD011';

--5) 아직까지 상품을 구매하지 않은 고객을 아래와 같이 조회합니다. (outer join)
SELECT tc.CUSTOM_ID ,name,age FROM "TBL_CUSTOM#" tc ,"TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID (+)
AND tb.PCODE IS NULL ;

--6) 날짜별로 총판매금액을 아래와 같이 조회합니다. (join과 group by)
SELECT buy_date2, sum(money)
FROM(SELECT TO_CHAR(buy_date,'yyyy-MM-dd') 
AS buy_date2 ,custom_id ,tb.pcode,quantity * price AS money
FROM "TBL_BUY#" tb ,"TBL_PRODUCT#" tp 
WHERE tb.pcode = tp.PCODE )
GROUP BY buy_date2 
ORDER BY buy_date2;

--1) TBL_POSTCODE 테이블의 데이터를 아래와 같이 추가하는 DDL명령을 모두 작성하세요.
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','서울특별시 서초구 서초2동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','서울특별시 송파구 장지동 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','경기도 고양시 덕양구 벽제동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','인천광역시 옹진군 자월면');

--2) 1번 문제에서 TBL_CUSTOM# 테이블에  POSTCODE 컬럼을 추가하였습니다. 그 후에 아래와 같이 각 행의
--   POSTCODE 컬럼값을 변경하기 위한 DDL명령을 모두 작성하세요.
UPDATE "TBL_CUSTOM#" SET POSTCODE = '137964' WHERE CUSTOM_ID = 'mina012'
UPDATE "TBL_CUSTOM#" SET POSTCODE = '412510' WHERE CUSTOM_ID = 'hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE = '409880' WHERE CUSTOM_ID = 'wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE = '138761' WHERE CUSTOM_ID = 'sana';

--3) 아래와 같이 select 쿼리를 실행시킨 결과가 조회되는  v_custom_info 이름의 뷰(VIEW)를 생성하세요.위의 2개 테이블을 이용합니다.
CREATE VIEW v_custom_info
AS
SELECT custom_id, tp.postcode,area1 
FROM TBL_POSTCODE tp, "TBL_CUSTOM#" tc 
WHERE tp.POSTCODE = tc.POSTCODE ;

SELECT * FROM v_custom_info ;

