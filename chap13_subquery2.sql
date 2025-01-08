

-- �������� EXISTS��
-- ������ ��� ����� �ִ� �μ� ������ ��� ���
-- �츮�� ���ϴ� ������ ����� ������ �ƴ϶� ������ ��� ����� �ִ� �μ��� ����.
SELECT
    emp_nm
    , addr
    , dept_cd
FROM tb_emp
WHERE addr LIKE '%����%'
;

SELECT
    dept_cd
    , dept_nm
FROM tb_dept 
WHERE dept_cd IN ('100009', '100010')
;

SELECT
    dept_cd
    , dept_nm
FROM tb_dept 
WHERE dept_cd IN (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE addr LIKE '%����%'
)
;

SELECT
    D.dept_cd
    , D.dept_nm
FROM tb_dept D    
WHERE EXISTS (    -- EXSITS�� �����ϴ� �̶�� �ؼ� X, ���ʿ� �ִ� JOIN ���ǿ� �����ϴ� �༮�鸸 ���ܶ�!, NOT EXSITS: �Ʒ� JOIN ���ǿ� ���� �ʴ� �༮�鸸 ����!
    SELECT
        E.dept_cd  -- EXSITS���� ���� SELECT�� �ƹ� �ǹ̰� ����! ��� 1�̳� 'HELLO'���� �ƹ� �����̳� �־ ���� ������ ����.
    FROM tb_emp E
    WHERE E.addr LIKE '%����%'
        AND D.dept_cd = E.dept_cd
)
;


-- # ���� �÷� ��������
--  : ���������� ��ȸ �÷��� 2�� �̻��� ��������

-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� 
-- ���� �������� ����� �̸� ������ϰ� �μ��ڵ带 ��ȸ

SELECT 
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                        SELECT 
                            dept_cd, MIN(birth_de)
                        FROM tb_emp
                        GROUP BY dept_cd
                        HAVING COUNT(*) >= 2
                    )
ORDER BY A.emp_no
;



-- �ζ��� �� �������� (FROM���� ���� ��������)

-- �� ����� ����� �̸��� ��� �޿������� ��ȸ�ϰ� �ʹ�.
SELECT 
    A.emp_no, A.emp_nm, B.pay_avg
FROM tb_emp A 
JOIN (   -- ���̺� ���� ���� ���� ���� ���� �������Ƿ� ���� ���ɼ� UP -> ���͸� �� JOIN����.
                 SELECT 
                    emp_no, AVG(pay_amt) AS pay_avg
                 FROM tb_sal_his
                 GROUP BY emp_no
        ) B
ON A.emp_no = B.emp_no
ORDER BY A.emp_no
;

SELECT 
    A.emp_no, A.emp_nm, AVG(B.PAY_AMT)
FROM tb_emp A 
JOIN TB_SAL_HIS B
ON A.emp_no = B.emp_no
GROUP BY A.EMP_NO, A.EMP_NM 
ORDER BY A.emp_no
;


-- ��Į�� �������� (SELECT, INSERT, UPDATE���� ���� ��������)

-- ����� ���, �����, �μ���, �������, �����ڵ带 ��ȸ

SELECT
    E.emp_no
    , E.emp_nm
    -- �μ��� �ϳ��� ��ȸ�ؿ��� �Ǵµ� ���� JOIN�� �� �ʿ䰡 ����.
    -- �������� ! -> �μ� �������� �μ��� �����ϴ� SELECT�� ���� + ��Ī ����
    , (SELECT D.dept_nm FROM tb_dept D  WHERE E.dept_cd = D.dept_cd) AS dept_nm  -- ��Ī �ο�!
    , E.birth_de
    , E.sex_cd
FROM tb_emp E
;


-- ���� �������� : �ܵ� ���� �Ұ����� ��������
-- �񿬰� �������� : �ܵ� ���� ������    "
