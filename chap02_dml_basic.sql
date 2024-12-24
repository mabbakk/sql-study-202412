CREATE TABLE GOODS (
    ID NUMBER(6) PRIMARY KEY,
    GOODS_NAME VARCHAR(50) NOT NULL,
    PRICE NUMBER(10) DEFAULT 1000,
    CREATED_AT DATE
);


-- ������ ���� : INSERT
INSERT INTO GOODS
    (ID, GOODS_NAME, PRICE, CREATED_AT)
VALUES
    (1, '��ǳ��', 120000, SYSDATE);
    
INSERT INTO GOODS
    (ID, GOODS_NAME, PRICE, CREATED_AT)
VALUES
    (2, '��Ź��', 2000000, SYSDATE);
    
INSERT INTO GOODS
    (ID, GOODS_NAME, CREATED_AT)
VALUES
    (3, '�ް�', SYSDATE);
    
-- NOT NULL ���� �������� ���� ���� �Ұ���
    INSERT INTO GOODS
    (ID, PRICE, CREATED_AT)
VALUES
    (4,2000000, SYSDATE);
    
    INSERT INTO GOODS
    (ID, GOODS_NAME)
VALUES
    (5, '���');
    
INSERT INTO GOODS
    (GOODS_NAME, ID, CREATED_AT)
VALUES
    ('������',6, SYSDATE);
    
-- VALUES �տ� �÷����� �����ϸ�
-- ���̺� ������ ������ �÷��������
-- ���� ������ �־�� ��
INSERT INTO GOODS
VALUES
    (7, '������', 30000, SYSDATE);
    
    
-- ������ ���� : UPDATE
UPDATE GOODS
SET GOODS_NAME = '������'
WHERE ID = 1;
    
UPDATE GOODS
SET
    GOODS_NAME = '¥���'
    , PRICE = 8000
WHERE ID = 3;
    
COMMIT;
    
-- WHERE �������� ���� UPDATE
-- ������ ����!!�����Ͱ� ������ �� ����
-- ��� ȸ������ ���̸� �� �쾿 �ø� �� ����!
UPDATE GOODS
SET PRICE = 9999;

-- ID�� �����ϸ� �ٲٸ� �� ��!!
UPDATE GOODS
SET ID = 11
WHERE ID = 2;

UPDATE GOODS
SET PRICE = NULL
WHERE ID = 6;

--NOT NULL ���� ������ NULL�� ���� �Ұ�
UPDATE GOODS
SET GOODS_NAME = NULL
WHERE ID = 6;

-- ������ ���� : DELETE
DELETE FROM GOODS
WHERE ID = 1;

COMMIT;

--WHERE���� ���� DELETE�� ��ü���� ȿ���� ���Ѵ�.
-- �׷��� �̰��� ������ ����, TRUNCATE TABLE�� ���� �Ұ���
DELETE FROM GOODS;
ROLLBACK;

TRUNCATE TABLE GOODS;
    
--������ ��ȸ : SELECT
SELECT * FROM GOODS;

SELECT
    CERTI_CD
    , CERTI_NM
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

SELECT
    CERTI_NM
    , CERTI_CD
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

-- ���� ������� �����͸� ��� �� �� ����
SELECT  
    CERTI_NM
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

-- SELECT �ڿ� ALL�� �׻� ��������
-- DISTINCT : �ߺ� ����
SELECT DISTINCT
    ISSUE_INSTI_NM
FROM TB_CERTI
;

-- * : ��� �÷� ��ȸ
-- �ǹ����� * ��� X
SELECT
    *
FROM TB_CERTI
;
-- �÷� ��Ī ���� (ALIAS)
-- AS�� ���� ����!, ��쿡 ���� ""�� ���� ����!!
-- �׷��� ��Ī�� ���Ⱑ ���� ��� "" ���� XX
SELECT
    EMP_NM AS �����
    , ADDR "����� �ּ�"
FROM TB_EMP
;

--���ڿ� ����
SELECT
    '�ڰ��� ����: ' || CERTI_NM AS CERTI_DETAIL
FROM TB_CERTI
;

SELECT
    CERTI_NM || '(' || ISSUE_INSTI_NM ||')' AS CERTI_DETAIL
FROM TB_CERTI
;







    