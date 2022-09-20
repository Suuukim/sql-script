-- ���α� ���̺� : freeboard
create table freeboard(
  idx number(5) not null,
  name varchar2(30) not null,     --�ۼ���
  password varchar2(10) not null,  --�ۺ�й�ȣ
  subject varchar2(40) not null,    --������
  content varchar2(2000) not null,	-- �� ����
  readCount number(5) default '0',    -- ��ȸ��
  wdate date default sysdate,         -- �ۼ���¥�ͽð� �⺻��
  ip varchar2(15) default '127.0.0.1',  -- ����
  commentCount number(3) default '0',   --��� ����
  primary key(idx)
);  
-- freeboard ���̺��� �⺻Ű idx ������ (����Ŭ������ ����մϴ�.) 
-- *mysql �����ͺ��̽��� �������� ���� �÷��� autoincrement(�ڵ�����) ���� �մϴ�.
create SEQUENCE board_idx_seq;

-- ������ ���� �߰�
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '���ϴ�','1111','�˸��ϴ�.','���� ���� ����ȳ��Դϴ�.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '�ֻ糪','2222','����','��������');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '�ڸ��','1234','����','��������!!');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '�趯��','1111','�̺�Ʈ','�̺�Ʈ �ȳ��Դϴ�.');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '�ڼ���','2222','�����','����������');
INSERT INTO freeboard (idx,name,password,subject,content)
VALUES (board_idx_seq.nextval, '�ѾƸ�','1234','��ȸ�� ����','��ȸ�� �ȳ��Դϴ�.');


SELECT * FROM freeboard ORDER BY idx DESC;

SELECT count(*) FROM freeboard ;

-- ***** �Խ��� �������� �۸���� ������������ ó���ؾ��մϴ�.(����¡)
-- ���� : �� ȭ�鿡 ���̴� �۸�Ͽ��� ���� ������ 10���� �Ѵ�. ������ �̵� ��ư�� 10���� �����ش�.
--		 ���� ������ �������� ����������/��������, �Ǿ� 1������,�ǵ��������� �̵��ϴ� ��ư�� �ִ�.

-- rownum �� ����Ŭ���� select ����� ���� ��ġ�� ��Ÿ���� �÷��̸��Դϴ�.
SELECT * FROM (
SELECT rownum AS R ,T.* FROM 
 (SELECT * FROM freeboard ORDER BY idx desc ) T)	-- T�� ���� SELECT ����� ���� ��Ī
--WHERE R BETWEEN 1 AND 10;		-- ������ 1�� ���� sql
--WHERE R BETWEEN 11 AND 20;	-- ������ 2�� ���� sql
WHERE R BETWEEN 111 AND 120;	    -- ������ 12�� ���� SQL : startNo = (pageNo-1)*10+1

-- ���� sql�� select 2���� �ذ��ϱ�
select * from (
	        select ROW_NUMBER() OVER(order by idx desc) as R, T.* from freeboard T 
			order by idx desc)  
where R between 111 and 120;



-- ����¡ select �ϳ��� �׽�Ʈ
SELECT * FROM freeboard ORDER BY idx desc ; 
SELECT rownum AS R ,T.* FROM 
 (SELECT * FROM freeboard ORDER BY idx desc ) T;
----------------------


-- ����ִ� �Խ����� ��� ���̺�
CREATE TABLE comments (
	idx number(3) NOT NULL,   -- ��� ���̺��� �⺻Ű
	"mref" number(5) NOT NULL,   -- freeboard ���̺��� idx	
	name varchar2(30) NOT NULL,
	content varchar2(2000) NOT NULL,
	wdate DATE default sysdate ,
	ip varchar2(15) default '127.0.0.1',
	heart number(3) default '0',
	primary  key (idx)
);

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO comments(idx,"ref",name,content)
VALUES (cmt_idx_seq.nextval,3,'���ϴ�','Ȯ���߽��ϴ�.!!');

-- freeboard ���̺��� ��� ���� 
-- 1) ��� �ۼ��� ������ +1    2) ��� ������ ���ϴ� SELECT 
SELECT count(*) FROM comments WHERE "mref"=3;	-- freeboard 3�� ���� ��۰���
SELECT count(*) FROM comments WHERE "mref"=1;

-- 1) �� ������ ���� : Ʈ����� ó��
-- insert into comments -> update freeboard set commentCount=commentCount+1
