-- ���ν����� ����Ŭ ��ü�� �����ϸ� ȣ���ؼ� �ٽ� ������ �� �ֽ��ϴ�.
-- ���ν����� ������ �� create : ������ ����� , replace : ������ ��ü�ϱ�
CREATE OR REPLACE PROCEDURE dept_max_salary3(		
	--�Ű������� �����ϴ� ��ġ : IN�� �Է� �Ű������μ� ������ �� ���޵Ǵ� ���� �����ϴ� �����Դϴ�.
	dept_name IN hr.DEPARTMENTS.DEPARTMENT_NAME %TYPE 
)
IS
		--�ʿ��� ������ �����ϴ� ��ġ
	dept_id NUMBER(8);
	max_sal NUMBER(8);			-- ������Ÿ�� ũ�� ����.
	emp EMPLOYEES%ROWTYPE;
BEGIN 
	-- Sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID 
	INTO dept_id			-- ������ ����. 
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;		-- �Է� �Ű�����
	-- ������ �μ�ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(salary) 
	INTO max_sal		-- ������ �����ϱ�
	FROM EMPLOYEES e WHERE DEPARTMENT_ID = dept_id;		-- ������ ���ǽĿ� Ȱ��
	DBMS_OUTPUT.PUT_LINE(dept_name || '�ְ� �����ݾ� : ' || max_sal);
	-- �߰� : �ְ����ݾ��� �޴� ������ �������ϱ�	(�� ��ü�� ������ ����)
	SELECT * 
	INTO emp			-- rowtype ������ ��ȸ��� ��� �÷��� ����.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = dept_id AND e.SALARY = max_sal; 
	DBMS_OUTPUT.PUT_LINE(dept_name || '�ְ��� ���� : ' || emp.last_name || ',' || emp.hire_date);
END;

BEGIN 
	dept_max_salary3('Sales');
END;

--�Ϲ� join sql
SELECT d.department_id, d.department_name dept , max_sal FROM DEPARTMENTS d, 
	(SELECT DEPARTMENT_ID id, max(salary) max_sal
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID) max_sal#
WHERE d.DEPARTMENT_ID = max_sal#.id;

--�μ��� �ְ� ����
SELECT DEPARTMENT_ID, max(salary) max_sal
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID 
		HAVING DEPARTMENT_ID = 80;
-- ���ν��� ����
CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN DEPARTMENTS.DEPARTMENT_NAME %TYPE,
	-- ��� �Ű�����
	dept_id OUT hr.departments.DEPARTMENT_ID %TYPE,
	max_sal OUT NUMBER
)
IS 
	vdept_id NUMBER(8);
BEGIN 
	SELECT d.department_id id
	INTO vdept_id	--��ȸ��� ������ ����
	FROM DEPARTMENTS d 
	WHERE d.DEPARTMENT_NAME = 'Sales';
	--
	SELECT DEPARTMENT_ID, max(salary) max_sal
	INTO dept_id,max_sal		-- ��ȸ ����� ��� �Ű������� ����.
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID 
		HAVING DEPARTMENT_ID = vdept_id;
END;

-- ���ν��� ������ �� ��� �Ű� ������ �����ؾ��մϴ�.
DECLARE 
	dept_id hr.departments.DEPARTMENT_ID %TYPE;
	max_sal NUMBER;
BEGIN
	dept_max_salary2('Sales',dept_id,max_sal);
	DBMS_OUTPUT.PUT_LINE('�μ��ڵ�' || ':' || dept_id || ',�����ݾ� : ' || max_sal);
END;

