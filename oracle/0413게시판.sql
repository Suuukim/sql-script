-- 메인글 테이블 : freeboard
create table freeboard(
  idx number(5) not null,
  name varchar2(30) not null,     --작성자
  password varchar2(10) not null,  --글비밀번호
  subject varchar2(40) not null,    --글제목
  content varchar2(2000) not null,	-- 글 내용
  readCount number(5) default '0',    -- 조회수
  wdate date default sysdate,         -- 작성날짜와시간 기본값
  ip varchar2(15) default '127.0.0.1',  -- 선택
  commentCount number(3) default '0',   --댓글 갯수
  primary key(idx)
);  
-- freeboard 테이블의 기본키 idx 시퀀스 (오라클에서만 사용합니다.) 
-- *mysql 데이터베이스는 시퀀스가 없고 컬럼에 autoincrement(자동증가) 설정 합니다.
create SEQUENCE board_idx_seq;

-- 데이터 샘플 추가
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '이하니','1111','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '최사나','2222','공지','공지공지');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '박모모','1234','하이','하이하이!!');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '김땡땡','1111','이벤트','이벤트 안내입니다.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '박세리','2222','재공지','재공지재공지');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '한아름','1234','정회원 공지','정회원 안내입니다.');


SELECT * FROM freeboard ORDER BY idx DESC;

SELECT count(*) FROM freeboard ;

-- ***** 게시판 유형에서 글목록을 페이지단위로 처리해야합니다.(페이징)
-- 예시 : 한 화면에 보이는 글목록에서 글의 갯수는 10개로 한다. 페이지 이동 버튼은 10개씩 보여준다.
--		 현재 페이지 기준으로 다음페이지/앞페이지, 맨앞 1페이지,맨뒤페이지로 이동하는 버튼이 있다.

-- rownum 은 오라클에서 select 결과로 행의 위치를 나타내는 컬럼이름입니다.
SELECT * FROM (
SELECT rownum AS R ,T.* FROM 
 (SELECT * FROM freeboard ORDER BY idx desc ) T)	-- T는 앞의 SELECT 결과에 대한 별칭
--WHERE R BETWEEN 1 AND 10;		-- 페이지 1에 대한 sql
--WHERE R BETWEEN 11 AND 20;	-- 페이지 2에 대한 sql
WHERE R BETWEEN 111 AND 120;	    -- 페이지 12에 대한 SQL : startNo = (pageNo-1)*10+1

-- 위의 sql을 select 2개로 해결하기
select * from (
	        select ROW_NUMBER() OVER(order by idx desc) as R, T.* from freeboard T 
			order by idx desc)  
where R between 111 and 120;



-- 페이징 select 하나씩 테스트
SELECT * FROM freeboard ORDER BY idx desc ; 
SELECT rownum AS R ,T.* FROM 
 (SELECT * FROM freeboard ORDER BY idx desc ) T;
----------------------


-- 댓글있는 게시판의 댓글 테이블
CREATE TABLE comments (
	idx number(3) NOT NULL,   -- 댓글 테이블의 기본키
	"mref" number(5) NOT NULL,   -- freeboard 테이블의 idx	
	name varchar2(30) NOT NULL,
	content varchar2(2000) NOT NULL,
	wdate DATE default sysdate ,
	ip varchar2(15) default '127.0.0.1',
	heart number(3) default '0',
	primary  key (idx)
);

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO comments(idx,"ref",name,content)
VALUES (cmt_idx_seq.nextval,3,'이하니','확인했습니다.!!');

-- freeboard 테이블의 댓글 갯수 
-- 1) 댓글 작성될 때마다 +1    2) 댓글 갯수를 구하는 SELECT 
SELECT count(*) FROM comments WHERE "mref"=3;	-- freeboard 3번 글의 댓글갯수
SELECT count(*) FROM comments WHERE "mref"=1;

-- 1) 로 구현할 예정 : 트랜잭션 처리
-- insert into comments -> update freeboard set commentCount=commentCount+1
