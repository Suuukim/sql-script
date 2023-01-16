-- SQL 기초강의 유투브\
-- 빨리 업데이트 하고싶네요 

create table member(
	member_id varchar2(8) not null,		-- 아이디
	member_name varchar2(10) not null,	-- 회원 이름
	member_addr varchar2(45)		--주소
);

create table product(
	product_name varchar2(20) not null,	--제품 이름(기본 키)
	cost int not null,		-- 가격
	make_date date,			-- 제조일자
	company varchar2(10),		-- 제조회사
	amount int not null		-- 남은 수량
);

drop table product;

insert into member(member_id,member_name,member_addr)
values('tess','나훈아','경기 부천시 중동');
insert into member(member_id,member_name,member_addr)
values('hero','임영웅','서울 은형구 중산동');
insert into member(member_id,member_name,member_addr)
values('iyou','아이유','인천 남구 주인동');
insert into member(member_id,member_name,member_addr)
values('jyp','박진영','경기 고양시 장항동');

insert into product(product_name,cost,make_date,company,amount)
values('바나나',1500,'21-07-01','델몬트',17);
insert into product(product_name,cost,make_date,company,amount)
values('키스',2500,'21-07-01','OB',3);
insert into product(product_name,cost,make_date,company,amount)
values('삼각김밥',800,'21-07-01','CJ',22);

select * from member;
select * from member where member_name = '아이유';

CREATE INDEX idx_member_name ON member(member_name);

CREATE VIEW member_view
AS
SELECT * FROM member;

SELECT * FROM member_view;

DELIMITER //
CREATE PROCEDURE myProc()
BEIGN
SELECT * FROM member WHERE member_name = '나훈아';
SELECT * FROM product WHERE product_name = '삼각김밥';
END //
DELIMITER;

CALL myProc(); --coinstar 

