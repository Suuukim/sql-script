create table member(
	member_id char(8) not null,		-- ���̵�
	member_name char(5) not null,	-- ȸ�� �̸�
	member_addr varchar(45)		--�ּ�
);

create table product(
	product_name char(4) not null,	--��ǰ �̸�(�⺻ Ű)
	cost int not null,		-- ����
	make_date date,			-- ��������
	company char(5),		-- ����ȸ��
	amount int not null		-- ���� ����
);



