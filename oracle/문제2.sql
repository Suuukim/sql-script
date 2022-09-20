-- 작성자 : 김정수

--1)
CREATE OR REPLACE PROCEDURE return_book(
	idx IN tbl_member.MEM_IDX%TYPE,   -- 현실에서는 회원번호 안받습니다. -> 수정 해보세요.
	abcode IN tbl_book.BCODE%TYPE,
	areturn_date IN tbl_bookrent.RETURN_DATE%TYPE,
	-- 출력 매개 변수로 성공 또는 실패 문자열 전달.
	success OUT varchar2
)
IS 
	vrent_no NUMBER;
	v_idx NUMBER;
	cnt NUMBER;
BEGIN 
	SELECT count(*) INTO cnt
		FROM TBL_BOOKRENT tb 
		WHERE BCODE =abcode AND MEM_IDX = idx AND RETURN_DATE IS NULL;
	SELECT rent_no ,MEM_IDX  INTO vrent_no , v_idx
		FROM TBL_BOOKRENT tb 
		WHERE BCODE =abcode AND MEM_IDX = idx AND RETURN_DATE IS NULL;
	IF(v_idx=idx AND cnt=1) THEN 
		UPDATE TBL_BOOKRENT SET RETURN_DATE = areturn_date WHERE RENT_NO = vrent_no;
		UPDATE TBL_BOOKRENT SET DIFF_DAYS= RETURN_DATE - EXP_DATE WHERE RENT_NO =vrent_no;
	END IF;
	COMMIT;	
	DBMS_OUTPUT.put_line('success 성공');
	success :='success';
	EXCEPTION WHEN OTHERS THEN
		dbms_output.put_line('fail 실패');
		success :='fail';
		ROLLBACK;
END;

--저장 프로시저를 실행하는 예
SELECT * FROM TBL_BOOKRENT tb ;

DECLARE
	vresult varchar2(20);
BEGIN
	return_book (10003,'B1101','2022-03-14',vresult);
	DBMS_OUTPUT.put_line('결과 : ' || vresult);
END;

--2)

