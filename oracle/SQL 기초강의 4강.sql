-- SQL ���ʰ��� ������\
-- ���� ������Ʈ �ϰ�ͳ׿� 

create table member(
	member_id varchar2(8) not null,		-- ���̵�
	member_name varchar2(10) not null,	-- ȸ�� �̸�
	member_addr varchar2(45)		--�ּ�
);

create table product(
	product_name varchar2(20) not null,	--��ǰ �̸�(�⺻ Ű)
	cost int not null,		-- ����
	make_date date,			-- ��������
	company varchar2(10),		-- ����ȸ��
	amount int not null		-- ���� ����
);

drop table product;

insert into member(member_id,member_name,member_addr)
values('tess','���ƾ�','��� ��õ�� �ߵ�');
insert into member(member_id,member_name,member_addr)
values('hero','�ӿ���','���� ������ �߻굿');
insert into member(member_id,member_name,member_addr)
values('iyou','������','��õ ���� ���ε�');
insert into member(member_id,member_name,member_addr)
values('jyp','������','��� ���� ���׵�');

insert into product(product_name,cost,make_date,company,amount)
values('�ٳ���',1500,'21-07-01','����Ʈ',17);
insert into product(product_name,cost,make_date,company,amount)
values('Ű��',2500,'21-07-01','OB',3);
insert into product(product_name,cost,make_date,company,amount)
values('�ﰢ���',800,'21-07-01','CJ',22);

select * from member;
select * from member where member_name = '������';

CREATE INDEX idx_member_name ON member(member_name);

CREATE VIEW member_view
AS
SELECT * FROM member;

SELECT * FROM member_view;

DELIMITER //
CREATE PROCEDURE myProc()
BEIGN
SELECT * FROM member WHERE member_name = '���ƾ�';
SELECT * FROM product WHERE product_name = '�ﰢ���';
END //
DELIMITER;

CALL myProc(); --coinstar 

