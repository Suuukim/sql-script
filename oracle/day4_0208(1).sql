-- UPDATE 형식
--	UPDATE 테이블명
-- 	SET 수정할 컬럼이름 = 값을 , 로 구분해서 나열
-- 	WHERE 수정할 행에 대한 조건식.

SELECT * FROM "TBL_CUSTOM#" tc; 

-- *update와 delete는 WHERE조건식이 사용되는 것이 안전합니다.
UPDATE "TBL_CUSTOM#" 
SET age = 39
WHERE CUSTOM_ID = 'twice';		
--기본키 컬럼사용 조건식은 1개 행만 수정됩니다.

UPDATE "TBL_CUSTOM#" 
SET age = 23, EMAIL ='nana@korea.kr'
WHERE CUSTOM_ID = 'wonder';

-- custom_id : wonder와 twice에 대해
-- reg_date를 2022년 2월 5일로 변
UPDATE "TBL_CUSTOM#" 
SET REG_DATE = '2022-02-05'
WHERE CUSTOM_ID IN ('wonder','twice');	--IN 연산자는 OR 대체


-- DELETE 형식
-- DELETE FROM 테이블명 WHERE 조건식;
-- 삭제를 위한 샘플데이터 추가.
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'GAL0112'	--실행 : buy#에서 참조하지 않는 값.
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'IPAD011'	--오류 : 무결성 위배.

-- 샘플데이터 추가
INSERT INTO "TBL_PRODUCT#"(pcode,CATEGORY,PNAME,PRICE)
VALUES ('GAL0112', 'A1', '갤럭시', 912300);

UPDATE "TBL_PRODUCT#" SET PNAME ='아이패드프로'
WHERE pcode = 'IPAD011';		-- 정상 실행

UPDATE "TBL_PRODUCT#" SET PCODE ='IPAD011x'
WHERE pcode = 'IPAD011';		-- 오류 : buy#에서 참조하는 값(무결성 위배)

SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

-- on delete, on update(오라클은 안됨) 속성 변경하여 외래키 다시 생성합니다.
ALTER TABLE IDEV."TBL_BUY#" 
		DROP CONSTRAINT "FK_TBL_PRODUCT#";
ALTER TABLE IDEV."TBL_BUY#" 
		ADD CONSTRAINT "FK_TBL_PRODUCT#"
		FOREIGN KEY (PCODE) REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
		ON DELETE CASCADE;	
		--무결성을 위해서 참조하는값 삭제시 연쇄적(연달아서)으로 삭제.
		
-- ALTER TABLE 형식 : drop, add, modify(제약조건은 못합니다.)

-- SELECT JOIN : 둘 이상의 테이블(주로 참조관계의 테이블)을 연결하여 데이터를 조회하는 명령
-- 				 이때 둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼을 이용하여 join 합니다. 
-- 형식 : select ~~~ from 테이블1 a, 테이블2 b 
--					where a.공통컬럼 1=b.공통컬럼1;

SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 	
		 WHERE tp.PCODE = tb.PCODE ;		--동등 조인.

-- JOIN을 쓰는 명령문 형식(표준)
SELECT * FROM "TBL_PRODUCT#" tp
		 JOIN "TBL_BUY#" tb 
		 ON tp.PCODE = tb.PCODE;
		
-- mina012 가 구매한 상품명은 무엇인가?
SELECT tp.PNAME  FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
 WHERE tp.PCODE =tb.PCODE AND custom_id = 'mina012';
		
-- mina012 가 구매한 상품명과 가격 조회하기.
SELECT tp.PNAME,tp.PRICE  FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
 WHERE tp.PCODE = tb.PCODE AND custom_id = 'mina012';


-- 조인할때, 공통된 컬럼은 테이블명을 꼭 지정해야 합니다.
SELECT tp.PNAME,tp.PRICE  FROM "TBL_PRODUCT#" tp,"TBL_BUY#" tb 
 WHERE tp.PCODE =tb.PCODE AND custom_id = 'mina012';

--외부조인 형식 2가지
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 	
		 WHERE tp.PCODE = tb.PCODE(+) ;		--외부 조인.

-- JOIN을 쓰는 명령문 형식(표준)
SELECT * FROM "TBL_PRODUCT#" tp
		 LEFT OUTER JOIN "TBL_BUY#" tb -- 기준이 되는 테이블은 왼쪽 product#
		 ON tp.PCODE = tb.PCODE;

SELECT * FROM "TBL_BUY#" tb
		 RIGHT OUTER JOIN "TBL_PRODUCT#" tp  -- 기준이 되는 테이블은 오른쪽 product#
		 ON tp.PCODE = tb.PCODE;
		
-- 데이터 테스트 또는 데이터 관리를 위해 테이블의 모든 데이터 삭제하기 -> 확인후 다시 설명.
TRUNCATE TABLE "TBL_BUY#" ;		
TRUNCATE TABLE "TBL_PRODUCT#" ;
TRUNCATE TABLE "TBL_CUSTOM#" ;
		
		
		
		
