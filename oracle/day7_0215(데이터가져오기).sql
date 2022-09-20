--전국야영장 정보조회와 예약
SELECT * FROM "tbl_campArea" tca ;

-- 전체 데이터 갯수는?
SELECT count(*) FROM "tbl_campArea" tca ;

-- 강원도 데이터 갯수는?
SELECT COUNT(*) FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE'강원도%'; 

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))	--substr(문자열,시작위치,길이)
FROM "tbl_campArea" tca ;		--주소에서 첫번쨰 공백 앞부분 추출(중복없이)


-- 강원도의 자동차야영장 야영장 이름, 부대시설 조회하기
SELECT camp_name, etc1, etc2 
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '강원도%' AND CAMP_TYPE LIKE '%자동차%';

-- 자동차 야영장 갯수가 50개 이상인 곳 야영장 이름, 주소 조회하기
SELECT CAMP_NAME , ADDRESS , CAR_CNT 
FROM "tbl_campArea" tca 
WHERE CAR_CNT >= 50;

-- 카라반 있는 야영장 이름, 주소, 카라반 갯수 조회하기
SELECT CAMP_NAME , ADDRESS , CARA_CNT 
FROM "tbl_campArea" tca 
WHERE  CARA_CNT > 0
ORDER BY ADDRESS ; 



-- 연습
-- 양구에 있는 캠핑장 조회.
SELECT CAMP_NAME , ADDRESS
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '%양구군%';

SELECT COUNT(ADDRESS)
FROM "tbl_campArea" tca 
WHERE ADDRESS LIKE '%양구군%';

SELECT CAMP_NAME , COUNT(ADDRESS)  
FROM "tbl_campArea" tca 
GROUP BY CAMP_NAME 
HAVING COUNT(ADDRESS) LIKE '%양구군%';


