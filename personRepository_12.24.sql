CREATE TABLE tbl_person (
    id BIGINT PRIMARY KEY ,
    person_name VARCHAR(100) NOT NULL ,
    age INT DEFAULT 0
);

SELECT * FROM tbl_person;

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL COMMENT '상품명',
    price INT NOT NULL COMMENT '가격',
    stock_quantity INT NOT NULL COMMENT '재고수량',
    description TEXT COMMENT '상품설명',
    seller VARCHAR(50) NOT NULL COMMENT '판매자',
    status VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '상품상태',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='상품';