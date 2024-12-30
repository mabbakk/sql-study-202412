-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ
-- ��� �����Ͱ� ����ϰ� ���� ���¿��� ����

-- ��� ��ȣ(emp_no) ��������
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

-- ��� �̸�(emp_nm) ��������
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm DESC
;

--��� �ڵ�(dept_cd) ��������
SELECT 
    emp_no
    , emp_nm
    , addr
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC  -- �μ� �ڵ尡 �Ȱ����� ��� �̸����� ����
;

SELECT 
    emp_no AS ���
    , emp_nm �̸�  --AS ���� ����
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY �̸� DESC
;

SELECT 
    emp_no AS ���
    , emp_nm �̸�  --AS ���� ����
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY 3, 1 DESC --3 �ڿ� ASC ����, 3 : �μ��ڵ� dept_cd, �μ��ڵ�� ���� �� 1��(���) ������������ ����.
;


SELECT 
    emp_no AS ���
    , emp_nm �̸�
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY �μ��ڵ�, 1 DESC
;

-- ����Ŭ���� ���Ľ� null�� ���� ū ������ ���. ������->null�� ���� ����, ������->null�� ���� �Ʒ���.
SELECT
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;


SELECT    --5
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his    --1
WHERE pay_de BETWEEN '20190101' AND '20191231'    --2
GROUP BY emp_no    --3
HAVING AVG(pay_amt) >= 4500000    --4
ORDER BY 2  DESC    --6
;






















