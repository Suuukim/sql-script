--테이블 추가
CREATE TABLE Persons (
	PersonId int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

-- 테이블 변경 - 열 추가
ALTER TABLE Persons
ADD Email varchar(255);

-- 테이블 변경 - 드롭 열
ALTER TABLE PERSONS
DROP COLUMN Email;

--SQL 제약 조건
--NOT NULL - 열에 NULL 값이 없어야함.
--UNIQUE - 중복되는 값 오면 안됨
--PRIMARY KEY - 그 사람만이 가지고 있는 고유 값(NOT NULL + 유니크)
--FOREIGN KEY - 외래키 : 부모테이블의 값을 참조하는 자식테이블의 컬럼
--				자식테이블 ; 다른 테이블의 값을 참조하는 테이블
--				부모테이블 : 다른 테이블의 의해 참조되는 테이블
--				참조키(reference) : 자식 테이블에서 참조하는 부모 테이블의 컬럼

-- 테이블 생성의 SQL 기본 키 (PRIMARY KEY)
CREATE TABLE Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	PRIMARY KEY (ID)
);

CREATE TABLE Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

-- 기본키가 이미 생성되었을 때 열에 대한 wp약 조건 추가할 경우
ALTER TABLE PERSONS 
ADD PRIMARY KEY (ID);



