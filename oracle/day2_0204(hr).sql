--��������

-- �������� : �ۼ��� �趯�� -> ��ũ��Ʈ ȭ�� ĸ���ؼ� dm �����ּ���.

--1 . jobs ���̺� ����
--1) min_salary �÷��� 10000�̻��� Job_title ��ȸ
SELECT job_title FROM jobs WHERE min_salary >= 10000;

--2) job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
SELECT * FROM JOBS j WHERE JOB_TITLE = 'Programmer';
--��ҹ��� ������� �Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : upper(), lower() �̿��մϴ�.
SELECT * FROM JOBS j WHERE UPPER(job_title)  = 'PROGRAMMER';
SELECT * FROM JOBS j WHERE LOWER(job_title)  = 'programmer';

--3) max_salary �÷��� �ִ밪 ��ȸ
SELECT MAX(max_salary) FROM JOBS j;

--���ذ� >> �߰� : min_salary �� ��հ����� ���� ���� ��� �÷� ��ȸ -> group ���� �Ŀ� �ٽ� �غ��ϴ�.
	SELECT job_id,job_title FROM JOBS j WHERE MIN_SALARY < AVG(MIN_SALARY);


--2. locations ���̺� ����
--1) city �÷��� London �� postal_code �÷� ��ȸ
SELECT postal_code FROM LOCATIONS l WHERE CITY ='London';
SELECT postal_code FROM LOCATIONS l WHERE CITY ='Seattle';


--2) LOCATION_ID �÷��� 1700 , 2700, 2500�� �ƴϰ� city �÷��� Tokyo �� ���� ��� �÷� ��ȸ
SELECT * FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY = 'Tokyo';


--3. employees ���̺�
--����Լ�(���� �Լ�)�� �� �� �����մϴ�.
SELECT count(*) FROM EMPLOYEES e;		--�Ѱ��� : 107
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';		-- ���� job_id ������ : 5

SELECT AVG(SALARY) FROM EMPLOYEES e ;	--���� ��� �޿� : 6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';		--���� job_id ��ձ޿� : 5760

SELECT MAX(salary) FROM EMPLOYEES e ;	--���� �� �ְ� �޿� : 24,000
SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';		--���� job_id �ְ�޿� : 9000

SELECT MIN(salary) FROM EMPLOYEES e ;	--���� �� �ּ� �޿� : 2,100
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; 		--���� job_id �ּұ޿� : 4200


--����Լ��� �׷��Լ��Դϴ�. �ش��Լ� ������� ���ϱ����� �����͸� �׷�ȭ�ϰ� �����մϴ�.
--�׷��Լ� ����� �÷��� ���� ��ȸ�� �� �����ϴ�. �Ʒ� sql�� ���� �Դϴ�.
SELECT JOB_ID, MAX(salary) FROM EMPLOYEES e ;

SELECT * FROM EMPLOYEES e2 WHERE SALARY = (
--���� max,min ���� sql����� �ϳ��� ���⿡ �־����.
--	SELECT AVG(SALARY) FROM EMPLOYEES e
--	SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
--	SELECT MIN(salary) FROM EMPLOYEES e
	SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
); -- SELECT �ȿ� �� ���� �� �ٸ� SELECT �� ���������Դϴ�. �������� ������� 1���̹Ƿ� = ���ǽĿ� ����� �� �ֽ��ϴ�.

--IT_PROG �߿��� �ּұ޿��� �޴� ����� first_name, last_name �÷� ��ȸ�ϱ�.
SELECT first_name, last_name FROM EMPLOYEES e 
WHERE SALARY = (SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID = 'IT_PROG'; 

SELECT SALARY FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';


-- �߰� : min_salary �� ��հ����� ���� ���� job_id,job_title �÷� ��ȸ -
-- �׷��Լ��� �ݵ�� select ������ ����մϴ�.
--��հ�
SELECT AVG(MIN_SALARY) FROM JOBS j;
--��հ��� ���ǽĿ� �̿��ϱ�(��������)
SELECT  job_id ,job_title  FROM JOBS j 
WHERE MIN_SALARY <(SELECT AVG(MIN_SALARY) FROM JOBS j2 );

--





