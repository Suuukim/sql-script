-- �Խ���
CREATE TABLE BOARD_idle(
BOARD_IDX NUMBER NOT NULL,
BOARD_CAT NUMBER NOT NULL,
BOARD_SUB nvarchar2(100) NOT NULL,
BOARD_CON varchar2(4000) NOT NULL,
WDATE DATE,
COM_CNT number(5),
LIKE_CNT number(5),
VIEW_CNT number(5),
BOARD_NAME nvarchar2(100),
CONSTRAINT pk_BOARD PRIMARY KEY(BOARD_IDX, board_cat),
CONSTRAINT fk_BOARD_NAME FOREIGN KEY(BOARD_NAME) REFERENCES USERS_idle(USER_name)
);

ALTER TABLE BOARD_IDLE MODIFY(BOARD_CON varchar2(4000));
CREATE SEQUENCE board_idx;

ALTER TABLE BOARD_IDLE MODIFY(BOARD_CON varchar2(4000));

ALTER TABLE BOARD_IDLE modify 
CONSTRAINT pk_BOARD_idx PRIMARY KEY(board_idx, board_cat);

CREATE SEQUENCE board_idx_seq;
CREATE SEQUENCE board2_idx_seq;
CREATE SEQUENCE board3_idx_seq;
CREATE SEQUENCE board4_idx_seq;

ALTER TABLE BOARD_IDLE ADD user_id nvarchar2(15);
ALTER TABLE BOARD_IDLE ADD CONSTRAINT fk2_board FOREIGN KEY (user_id) REFERENCES users_idle (user_id) ON DELETE CASCADE;
ALTER TABLE BOARD_IDLE ADD user_id nvarchar2(15); 

-- ���
CREATE TABLE COMMENT_idle (
	COMMENT_idx NUMBER NOT NULL,			--��� seq(PK)
	comment_board NUMBER,		 			--�Խñ� seq(FK)
	comment_content nvarchar2(1000),			--��� ����
	comment_like NUMBER DEFAULT 0,			--���ƿ�
	comment_wdate DATE DEFAULT sysdate,		--��� �ۼ���
	comment_mname nvarchar2(100),			--��� �ۼ���(�ۼ��� name FK)
	comment_parent NUMBER CONSTRAINT chk_parent CHECK(comment_parent IN (0,1)),	--�θ���(0or1)
	CONSTRAINT comment_pk PRIMARY KEY (COMMENT_idx),
	CONSTRAINT comment_fk FOREIGN KEY (comment_board) REFERENCES board_idle(board_idx),
	CONSTRAINT comment_fk2 FOREIGN KEY (COMMENT_mname) REFERENCES USERS_idle(User_name)
);

CREATE SEQUENCE comment_idx;

--ALTER TABLE COMMENTS RENAME TO comments_ex; 
--DROP TABLE COMMENTS;

-- ����
CREATE TABLE goods_idle (
	gcode nvarchar2(100),
	gname nvarchar2(100), 
	gprice NUMBER(10),    
	PRIMARY key(gcode)
);

-- ȸ��
CREATE TABLE users_idle(
	user_id nvarchar2(15) PRIMARY KEY,	--ȸ��id
	user_password nvarchar2(20),		--ȸ��pw
	user_name nvarchar2(10) UNIQUE,		--�г���
	joinDate DATE,						--������
	user_email nvarchar2(100),			--�̸���
	user_grade nvarchar2(10)			--���
	user_replyNum NUMBER,				--�Խñۼ�
	user_articleNum NUMBER				--��ۼ�
);
ALTER TABLE USERS_IDLE MODIFY user_grade nvarchar2(100) DEFAULT '��ũ����';
ALTER TABLE USERS_IDLE MODIFY joinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE USERS_IDLE DROP COLUMN user_grade; 

ALTER TABLE users_idle ADD user_replyNum NUMBER
ADD user_articleNum number;

ALTER TABLE users_idle MODIFY user_articleNum DEFAULT 0;
ALTER TABLE users_idle MODIFY user_replyNum  DEFAULT 0;

INSERT INTO IDEV.USERS_IDLE
(USER_ID,USER_PASSWORD,USER_NAME,USER_EMAIL)
VALUES ('TEST',12345678,'���̵��Դϴ�','toki159@naver.com');

ALTER TABLE users_IDLE MODIFY(user_name nvarchar2(10));

DROP TABLE BOARD_IDLE;
DROP TABLE GOODS;
DROP TABLE users_idle;
DROP TABLE ALBUM;

CREATE TABLE ADMIN_IDLE(
ADM_ID nvarchar2(15) PRIMARY KEY,		--������ID
ADM_password nvarchar2(20),				--������PW
ADM_name nvarchar2(10),					--�������̸�
ADM_DATE DATE,							--������
ADM_email nvarchar2(30),				--�̸��� 
ADM_grade nvarchar2(10)					--�����ڵ��
);

INSERT INTO IDEV.ADMIN_IDLE
(ADM_ID, ADM_PASSWORD, ADM_NAME, ADM_DATE, ADM_EMAIL, ADM_GRADE)
VALUES('admin', '123456789', '������',sysdate, 'abc@naver.com', '������');

-- �ٹ�
CREATE TABLE ALBUM_idle(
	ALB_CODE NUMBER(5) NOT NULL,
	ALB_TITLE NVARCHAR2(100) NOT NULL,
	SONG_CNT NUMBER(4),
	TITLE_SONG NVARCHAR2(200) NOT NULL,
	REL_DATE DATE,
	TITLE_URL NVARCHAR2(500),
	PRIMARY KEY(ALB_CODE)
);

CREATE SEQUENCE alb_seq
	START WITH 1;

-- �̴Ͼٹ�
INSERT INTO IDEV.ALBUM_IDLE 
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES (alb_seq.nextval, 'I am', 6, 'LATATA', '2018-05-02', 'https://youtu.be/p4RIhcY7V3c');

INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES (alb_seq.nextval, 'I made', 5, 'Senorita', '2019-02-26', 'https://youtu.be/2cevbhEqQF4');

INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES (alb_seq.nextval, 'I trust', 5, 'Oh my god', '2020-04-06', 'https://youtu.be/om3n2ni8luE');

INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, 'I burn', 6, 'ȭ', '2021-01-11', 'https://youtu.be/z3szNvgQxHo');

-- ������ �̱�
INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, '��(��)', 1, '��(��)', '2018-08-14', 'https://youtu.be/OKNXn2qCEws');

INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, 'Uh-Oh', 1, 'Uh-Oh', '2019-06-26', 'https://youtu.be/I66oFXdf0KU');

INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, 'i''M THE TREND', 1, 'i''M THE TREND', '2020-07-07', 'https://youtu.be/ZlKoeJ3xlx4');

-- �̱�
INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, 'DUMDi DUMDi', 1, 'DUMDi DUMDi', '2020-08-03', 'https://youtu.be/HPQ5mqovXHo');

-- ����
INSERT INTO IDEV.ALBUM_IDLE
(ALB_CODE, ALB_TITLE, SONG_CNT, TITLE_SONG, REL_DATE, TITLE_URL)
VALUES(alb_seq.nextval, 'I NEVER DIE', 9, 'TOMBOY', '2022-03-14', 'https://youtu.be/Jh4QFaPmdss');


