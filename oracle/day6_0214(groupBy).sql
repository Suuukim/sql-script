-- �����Լ�(����Լ�, �׷�) : count, max, min, sum, avg, �ܿ� (�л�,ǥ������,�߾Ӱ�) ���� �Լ��� ����.

-- group by : Ư�� �÷����� �׷�ȭ�ϰ� �׿� ���ؼ� �����Լ��� �����մϴ�.
-- ����) �μ��� �������, ������ ������, �μ��� ������, ������ �������.... 

-- �׷��Լ� ����
SELECT count(*), avg(salary) 
FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG';
-- ���� : �׷��Լ� ����� �Ϲ��÷��� �Բ� ��ȸ ���մϴ�.
SELECT JOB_ID , count(*), avg(salary) 
FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG'


-- gorup by�� �����Ͽ� �������� count, avg ���մϴ�.
SELECT JOB_ID , COUNT(*),AVG(salary)
FROM EMPLOYEES e 
GROUP BY JOB_ID ;

-- �μ��� count, avg (�׷��Լ� ����� �Բ� ��ȸ�� �� �ִ� �÷��� �׷�ȭ �÷��� �����մϴ�.)
SELECT DEPARTMENT_ID, count(*) AS "�ο���", avg(salary) AS "���"
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- departments ���̺�� ���� �μ��� ���踦 join 
SELECT * FROM DEPARTMENTS d ,
		(SELECT DEPARTMENT_ID, count(*) AS "�ο���", avg(salary) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;


SELECT d.DEPARTMENT_ID , DEPARTMENT_NAME , d2."�ο���" , d2."���"  
FROM DEPARTMENTS d ,
		(SELECT DEPARTMENT_ID, count(*) AS "�ο���", avg(salary) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."�ο���" desc;		--�������� desc

-- ��ձ޿� ��������
SELECT d.DEPARTMENT_ID , DEPARTMENT_NAME , d2."�ο���" , d2."���"  
FROM DEPARTMENTS d ,
		(SELECT DEPARTMENT_ID, count(*) AS "�ο���", round(avg(salary),0) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER  BY d2."���";			

-- �ڸ��� ���� �Լ� : ���� trunc , �ø� ceil , �ݿø� round

-- ���� group by ������� ��ձݾ��� 8000 �̻��� �μ��� ��ȸ�Ѵٸ�?
SELECT DEPARTMENT_ID, count(*) AS "�ο���", round(avg(salary),0) AS "���"
FROM EMPLOYEES e 
-- WHERE e."���" >= 8000		-- ���� : �����Լ� ��������� WHERE ��� X
GROUP BY DEPARTMENT_ID
HAVING avg(salary) > 8000	-- HAVING  :�����Լ� ��������� ���ǽ��� ���� ��밡���մϴ�. �Ϲ��÷��� ����
ORDER BY "���" ;

-- ���� : from -> where -> group by -> HAVING -> order by

-- ALL Ű���� : job_id �� ST_CLERT �� ��� �������� �޿����� ���� �޴� ������ ��ȸ
-- 			  ���� ����� amx ������ ū���� ã�� ��. -> ALL Ű����� �ٲ㺸��
SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID = 'ST_CLERK';

-- EMPLOYEES ���̺� ���� ������ ���� max ������ ū�͸� ����� �����մϴ�.
SELECT last_name , salary , job_id FROM EMPLOYEES e 
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID = 'ST_CLERK');

-- ���� salary �÷����� �����ϰ� ���ǿ� �´� �͸� �����մϴ�.
SELECT last_name , salary , job_id FROM EMPLOYEES e 
WHERE SALARY > all(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID = 'ST_CLERK');

SELECT * FROM EMPLOYEES e ;



