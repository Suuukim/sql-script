--���̺� �߰�
CREATE TABLE Persons (
	PersonId int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

-- ���̺� ���� - �� �߰�
ALTER TABLE Persons
ADD Email varchar(255);

-- ���̺� ���� - ��� ��
ALTER TABLE PERSONS
DROP COLUMN Email;

--SQL ���� ����
--NOT NULL - ���� NULL ���� �������.
--UNIQUE - �ߺ��Ǵ� �� ���� �ȵ�
--PRIMARY KEY - �� ������� ������ �ִ� ���� ��(NOT NULL + ����ũ)
--FOREIGN KEY - �ܷ�Ű : �θ����̺��� ���� �����ϴ� �ڽ����̺��� �÷�
--				�ڽ����̺� ; �ٸ� ���̺��� ���� �����ϴ� ���̺�
--				�θ����̺� : �ٸ� ���̺��� ���� �����Ǵ� ���̺�
--				����Ű(reference) : �ڽ� ���̺��� �����ϴ� �θ� ���̺��� �÷�

-- ���̺� ������ SQL �⺻ Ű (PRIMARY KEY)
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

-- �⺻Ű�� �̹� �����Ǿ��� �� ���� ���� wp�� ���� �߰��� ���
ALTER TABLE PERSONS 
ADD PRIMARY KEY (ID);



