create table member(
	member_id char(8) not null,		-- 아이디
	member_name char(5) not null,	-- 회원 이름
	member_addr varchar(45)		--주소
);

create table product(
	product_name char(4) not null,	--제품 이름(기본 키)
	cost int not null,		-- 가격
	make_date date,			-- 제조일자
	company char(5),		-- 제조회사
	amount int not null		-- 남은 수량
);



