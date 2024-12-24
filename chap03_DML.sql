-- WHERE ������ : �����͸� ���͸�
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd = 1
;

-- PK�� ���͸��ϸ� ������ 0�� �Ǵ� 1���� ��ȸ��
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd != 1
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd <> 1 -- NOT EQUAL
;

-- 90�����鸸 ���͸�
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    ,BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE >= '19900101'
    AND BIRTH_DE <= '19991231'
;


-- ���� �����͸� ��ȸ : BETWEEN A AND B
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    , BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231'
;

-- 90������ �ƴ� ����� -> BETWEEN �տ� NOT�� ���̸� ��
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    , BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE NOT BETWEEN '19900101' AND '19991231'
;

-- IN ������ : OR����
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = 100002
        OR DEPT_CD = 100007
        OR DEPT_CD = 100009
;

-- �� �ڵ带 IN�� Ȱ���Ͽ� �Ʒ��� ���� ��ȯ
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
-- ���� OR ����� ����� ����.
WHERE DEPT_CD IN (100002, 100007, 100009)
;

-- ���� �ش����� �ʴ� �ٸ� �����͵� ? -> IN �տ� NOT�� ���̱�.
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
-- ���� OR ����� ����� ����.
WHERE DEPT_CD NOT IN (100002, 100007, 100009)
;

-- LIKE ����
-- Ư�� �ܾ ���Ե� �˻�
-- ���ϵ�ī�� ����(%: 0���� �̻�, _: �� 1����)


-- ���νÿ��� ��� ����� ���͸�
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE ADDR LIKE '%����%'
;

-- �̸��� �� �� �����ϴ� ����� ���͸�
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
;

-- ��_ : ���� ��, �̸��� ������ ��� 
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '��__'
;

-- �̸��� ������ ������ ����� ���͸�
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '%��'
;

SELECT 
    EMAIL
FROM USER
WHERE EMAIL LIKE '_A%@%.COM'  -- BANANA123@GMAIL.COM�� �� �ڵ忡 ���͸���.
;

-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� 
-- ���, �̸�, ����, �μ��ڵ带  ��ȸ
SELECT
    EMP_NO
    ,EMP_NM
    ,BIRTH_DE
    , DEPT_CD
FROM TB_EMP
WHERE 1 = 1   --������ TRUE�� ������ ���� ����
  -- �Ʒ� ������ ���ǵ� AND ó�� ���� (+ �ּ� ���� ����)
    AND EMP_NM LIKE '��%'
    AND DEPT_CD IN (100003, 100004)
    AND BIRTH_DE BETWEEN '19900101' AND '19991231'
;

-- NULL�� ��ȸ
-- NULL ��ȸ�� ������ IS NULL
SELECT
    EMP_NO
    , EMP_NM
    , DIRECT_MANAGER_EMP_NO
FROM TB_EMP
-- NULL ��ȸ�� �� !!! �տ� IS�� �ٿ��� ��ȸ ����! = NULL �ƴ�!!
WHERE DIRECT_MANAGER_EMP_NO IS NULL
;

-- ��簡 ���� ����� �ƴ� ����� ���͸�
SELECT
    EMP_NO
    , EMP_NM
    , DIRECT_MANAGER_EMP_NO
FROM TB_EMP              --NOT�� IS �ڿ�!!
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL
;

-- ������ �켱 ����
-- NOT > AND > OR
SELECT
    EMP_NO
    , EMP_NM
    , ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '��%'  --�达�̸鼭
    AND (ADDR LIKE '%�ϻ�%'   -- �ϻ꿡 ��»��
        OR ADDR LIKE '%����%')  -- �达�� �ƴϾ ���� ��� ����� �� ������!
;      --OR�� ���� ����Ǿ�� �ϹǷ� ��ȣ�� ����!
