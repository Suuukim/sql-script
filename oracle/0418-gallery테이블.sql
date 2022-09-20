CREATE TABLE gallery( 
pno number(5) NOT NULL, 
title varchar2(40), 
wdate DATE,
filenames varchar2(70), --업로드 후 파일명 저장 컬럼 
PRIMARY KEY(pno) );

CREATE SEQUENCE pno_seq;