CREATE TABLE ENT(                 --�Ҽӻ�
ENT_CODE number(3),           	  --����ڵ� (PK)
ENT_NAME VARCHAR2(100) NOT NULL,  --�����
TEL nVARCHAR2(100),               --��ǥ������ȣ
CEO NVARCHAR2(100),               --��ǥ�̻�
ADDRESS VARCHAR2(100),            --�ּ�
F_DATE DATE,                 	  --������
PRIMARY KEY(ENT_CODE)
);

CREATE TABLE G_GROUP(
ENT_CODE NUMBER(3),               --����ڵ� (FK)
TEAM_NAME NVARCHAR2(100),         --����(PK)
MEMBER_CNT number(2),             --�����
D_SONG NVARCHAR2(100),            --���߰�
D_DATE DATE,                      --������
F_NAME NVARCHAR2(100),            --��ī��
LEADER NVARCHAR2(100),            --����
PRIMARY KEY(TEAM_NAME),
FOREIGN KEY(ENT_CODE) REFERENCES ENT(ENT_CODE)
);

CREATE TABLE ALB(                 --�ٹ�
ALB_CODE NVARCHAR2(100),          --�ٹ��ڵ� (PK)
TEAM_NAME NVARCHAR2(100),         --���̸�(FK)
ALB_NAME NVARCHAR2(100),          --�ٹ���
SONG_CNT NUMBER(3),               --���ϰ��
T_SONG NVARCHAR2(100),            --Ÿ��Ʋ��
S_DATE DATE,                      --�߸���
PRIMARY KEY(ALB_CODE),
FOREIGN KEY(TEAM_NAME) REFERENCES G_GROUP(TEAM_NAME)
);

CREATE TABLE SINGER(          	  --����
NUM nVARCHAR2(20),            --���й�ȣ(PK)
NAME NVARCHAR2(100),              --�̸�
BIRTH DATE,                       --�������
NAT NVARCHAR2(100),               --����
TEAM_NAME NVARCHAR2(100),         --���̸�(FK)
PART NVARCHAR2(100),              --�����Ʈ
SNS NVARCHAR2(100),               --sns
PRIMARY KEY(NUM),
FOREIGN KEY(TEAM_NAME) REFERENCES G_GROUP(TEAM_NAME)
);

DROP TABLE SINGER;
DROP TABLE G_GROUP ;
DROP TABLE ALB;
DROP TABLE ENT;
DELETE FROM SINGER s ;


-- �Ҽӻ�
INSERT INTO ENT(ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS)
VALUES (01,'JYP�������̸�Ʈ','02-3345-3455','������','����� ������');
INSERT INTO ENT(ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS)
VALUES (02,'SM�������̸�Ʈ','02-3345-3455','�̼���','����� ������');
INSERT INTO ENT(ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS)
VALUES (03,'YG�������̸�Ʈ','02-3345-3455','������','����� ������');

-- �ٹ� : Ʈ���̽�
INSERT INTO TEAMA.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT01', 'TWICE', 'Twicetagram',13,'LIKEY','20171030');

INSERT INTO TEAMA.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT02', 'TWICE', 'Eyes wide open',13,'I CANT STOP', '2020.10.26');

INSERT INTO TEAMA.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT03', 'TWICE', 'Formula of Love', 17, 'SCIENTIST', '2021.11.12');

-- �ٹ� : ����ũ
INSERT INTO TEAMA.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('YB01', 'BLACKPINK', 'The Album', 8, 'Lovesick Girls', '2020.10.02');

-- �ٹ� : �̾�����
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM01', '�̾�����', 'A Class', 13, 'Good-bye Baby', '2011-07-18');
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM02', '�̾�����', 'Hush', 13, 'Hush', '2013-11-06');

-- �ٹ�(f(x))
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF01', 'f(x)', '�ǳ�Ű��', 10, '�ǳ�Ű��', '2011-04-18');
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF02', 'f(x)', 'Pink Tape', 12, 'ù �����', '2013-07-29');
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF03', 'f(x)', 'Red Light', 11, 'Red Light', '2014-07-07');
INSERT INTO TEAMA.ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF04', 'f(x)', '4 Walls', 10, '4 Walls', '2015-10-27');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JI01','ITZY','CRAZY IN LOVE',16,'LOCO','2021-09-24');


-- �ɱ׷�
INSERT INTO TEAMA.G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(01, 'TWICE', 9, 'OOH-AHH�ϰ�', '2015.10.20', 'Twinkle', '��ȿ');

INSERT INTO TEAMA.G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(03, 'BLACKPINK', 4, '���Ķ�', '2016.08.08','Blink', null);

INSERT INTO TEAMA.G_GROUP 
(ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01, '�̾�����', 4, 'Bad Girl Good Girl', '2010-07-01', 'Say A', null);

INSERT INTO TEAMA.G_GROUP (ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (03, 'f(x)', 4, 'LA chA TA', '2009-09-05', 
      '����', '���丮��');
     
INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (02,'aespa',4,'black mamba','2020-11-17','MY','ī����');

INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01,'ITZY',5,'�޶�޶�','2019-02-12','midzy','����');
     

-- ���� : TWICE 
INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW01', '��ȿ', '1997-02-01', '�ѱ�', 'TWICE', '����,���κ���', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW02', '�糪', '1996-12-29', '�Ϻ�', 'TWICE', '���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW03', '����', '1995-09-22', '�ѱ�', 'TWICE', '���庸��,�����', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW04', '���', '1996-11-09', '�Ϻ�', 'TWICE', '���꺸��,���귡��,���δ�', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW05', '����', '1996-11-01', '�ѱ�', 'TWICE', '���庸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW06', '����', '1998-05-28', '�ѱ�', 'TWICE', '���巡��,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW07', 'ä��', '1999-04-23', '�ѱ�', 'TWICE', '���η���,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW08', '�̳�', '1997-03-24', '�Ϻ�', 'TWICE', '���δ�,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW09', '����', '1999-06-14', '�븸', 'TWICE', '���꺸��,�����', 'https://www.instagram.com/twicetagram/');

-- ���� : BLACKPINK 
INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL01', '����', '1996-01-16', '�ѱ�', 'BLACKPINK', '���η���,���庸��', 'https://www.instagram.com/jennierubyjane/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL02', '����', '1995-01-03', '�ѱ�', 'BLACKPINK', '���庸��', 'https://www.instagram.com/sooyaaa__/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL03', '����', '1997-02-11', '�ѱ�,��������', 'BLACKPINK', '���κ���,�����', 'https://www.instagram.com/roses_are_rosie/');

INSERT INTO TEAMA.SINGER
(NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL04', '����', '1997-03-27', '�±�', 'BLACKPINK', '���δ�,���巡��,���꺸��', 'https://www.instagram.com/lalalalisa_m/');

-- ���� : �̾�����
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI01', '����', '1987-04-27', '�߱�', '�̾�����', '����', 'https://instagram.com/ff0427/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI02', '����', '1989-02-03', '�߱�', '�̾�����', '����, ����, ��', 'https://www.instagram.com/MJBABY0203/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI03', '��', '1991-06-21', '�ѱ�', '�̾�����', '����, ��', 'http://instagram.com/therealminnn');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI04', '����', '1994-10-10', '�ѱ�', '�̾�����', '����', 'http://www.instagram.com/skuukzky/');

-- ���� : f(x)
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX01', '���丮��', '1987-02-02', '�߱�', 'f(x)', '���꺸��, ���δ�', 'http://instagram.com/victoria02_02/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX02', '����', '1992-09-18', '�̱�', 'f(x)', '���η���, ���꺸��', 'http://instagram.com/amberliu/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX03', '�糪', '1993-08-12', '�ѱ�', 'f(x)', '���κ���, �����', 'http://www.instagram.com/hermosavidaluna/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX04', 'ũ����Ż', '1994-10-24', '�ѱ�,�̱�', 'f(x)', '����, ���庸��', 'http://www.instagram.com/vousmevoyez/');
INSERT INTO TEAMA.SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX05', '����', '1994-03-29', '�ѱ�', 'f(x)', null, 'http://instagram.com/jelly_jilli/');

-- ���� : aespa
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE01','ī����','2000-04-11','�ѱ�','aespa','���δ�','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE02','����','2001-01-01','�ѱ�','aespa','���庸��','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE03','����','2000-10-30','�Ϻ�','aespa','���η���','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE04','�״�','2002-10-23','�߱�','aespa','���κ���','https://www.instagram.com/aespa_official/');

-- ���� : ITZY
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT01','����','2000-05-26','�ѱ�','ITZY','���δ�','');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT02','����','2001-04-17','�ѱ�','ITZY','���η���','');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT03','����','2003-12-09','�ѱ�','ITZY','���꺸��','');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT04','ä��','2001-06-05','�ѱ�','ITZY','���δ�','');
INSERT INTO SINGER (NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT05','����','2000-07-21','�ѱ�','ITZY','���κ���','');


SELECT * FROM SINGER WHERE NUM = 'IT05';
SELECT * FROM G_GROUP gg ,ALB a ,ENT e ,SINGER s ;

CREATE VIEW v_ENT 
AS SELECT ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS
FROM ENT;

CREATE VIEW v_ALB
AS SELECT ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE
FROM ALB;

CREATE VIEW v_GGroup
AS SELECT ENT_CODE ,TEAM_NAME,MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER 
FROM G_GROUP;

CREATE VIEW v_SINGER
AS SELECT NUM, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS
FROM SINGER;

SELECT * FROM v_ENT ;
SELECT * FROM v_GGroup ;
SELECT * FROM v_ALB ;
SELECT * FROM v_SINGER;





