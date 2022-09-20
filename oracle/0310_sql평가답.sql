--2) �����ȣ ���̺�
CREATE TABLE tbl_postcode (
postcode char(6) PRIMARY KEY,
area1 varchar2(200) NOT NULL 
);

--3)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(6) );

--4) custom#���̺� postcode �÷��� postcode ���̺��� postcode �÷��� �����մϴ�.
--            "            �÷�����           "            �÷��� ���� �����Ҽ� �ֽ��ϴ�.
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);


--1)
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','��õ������ ������ �ڿ���');

--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID ='mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID ='hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID ='wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID ='sana';


-- 3��14�� �� ������ ����� ���� : ����/���������� �м�
-- 1. ER ���̾�׷��� ���� ����������� ���踦 ���ϰ� �����մϴ�.   -> ���̺� ���ô� ������� ���͵� ������ �� �ְ� �ϼ���.
--			1) ������ Ÿ�� : number(n, m)  : n�� �ǹ� , m�� �ǹ�  ���� number(5,0) �Ǵ� number(6,2) �� ����
--						  char(n), varchar2(n)�� �ѱ۰� ������ ���� , date Ÿ�� � ���� ����
--					-> ���� ���̺��� Ư�� �÷��� ���÷� ���� �ϼ���.
--			2) �⺻Ű �÷� : �⺻Ű �÷��� �ǹ�(����)�� �ۼ��ϰ� ���÷� ����.-> tbl_custom# ���̺��� �⺻Ű custom_id�� ������
--						  �⺻Ű �÷��� ������ ���� ������ �� �ִ�.�׷��� custom_id �÷��� ���� �ߺ��� ���̸� �ȵ˴ϴ�.
--						  ������ ���� ��� ���̺� ���� �⺻Ű �÷��� �����ϼ���.
--				�������� �⺻Ű�� ����� ���� �� ������ �����ϼ���.�⺻Ű�� unique �÷��̾���Ѵµ� �����ϴ� �÷��� �����Ƿ�
--				������ �Ϸù�ȣ�� �ο��մϴ�. �⺻Ű�� ���� �� �÷��� ��� (custom_id,pcode) ��  ���� �����Ҽ� �ֽ��ϴ�.
--				�׷��� ���⼭�� (custom_id,pcode) �� unique ������ �������� �ʾƿ�.-> �׷��� �������� �⺻Ű.
--			3) unique �������� : unique �� ������ ��. �� �ߺ��� ���� ������� �ʴ� �÷�.
--			4) �������� �ܷ�Ű �������� : ��� ���迡 ���� �����ϼ���.
--						�� Ű���� : ����, �����÷�,�ܷ�Ű �÷��� ���̺� ���÷� ����.
--						�� on delete �ɼ� 


--2. ���ν��� ����(����) �ϰ� �����ϱ� (��� �ڵ带 ����)
--1)  insert,update,delete Ʈ����� ���� ���ν��� : return_book
--2)  ??  select �� �ϴ� ������ �����뿩 ���̺��� ������� �ʿ��� ��ȸ�� �����ϴ� ���ν���
--		�Է¸Ű����� 1�� �̻� , ��¸Ű� ���� 1���̻� (��, ȸ��1���� �Ϸ翡 1���� å�� �뿩�Ѵٴ� ����.)
--		select ����� 1������ ��ȸ�Ǵ� ��츸�� ������ �ؾ��մϴ�.


--3. 2���� 1) �Ǵ� 2)�� java jdbc �� ���α׷����մϴ�. (�ݳ��ϴ� å,ȸ����ȣ, ��¥�� Ű���� �Է����� ó���ϱ�.)
--		��> ����� ���� 8�ñ��� ���� ����̺�(�������� ��ũ)�� �ۼ��ؼ� �ø���(������ �־ �˴ϴ�.) �ڹټҽ����ϸ�...
--				��> ���������� ���������� �÷��ְڽ��ϴ�.