CREATE TABLE T_MEMBER(
    ID 				VARCHAR2(20) PRIMARY KEY,
    NAME 			VARCHAR2(20) NOT NULL,
    PASSWORD 		VARCHAR2(20) NOT NULL,
    EMAIL_ID 		VARCHAR2(30),
    EMAIL_DOMAIN 	VARCHAR2(20),
    TEL1 			CHAR(3),
    TEL2 			CHAR(4),
    TEL3 			CHAR(4),
    POST 			CHAR(6),
    BASIC_ADDR 		VARCHAR2(200),
    DETAIL_ADDR 	VARCHAR2(200),
    TYPE            CHAR(1) default 'U',
    REG_DATE 		DATE default sysdate
);

SELECT * FROM T_MEMBER;

insert into T_MEMBER(id, name, password, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3)
    values('kopo', '김코포', '1234', 'kopo', 'gmail.com', '010', '1234', '5678');

insert into T_MEMBER
  values('yura', '박유라', '2580', 'kopo1007', 'naver.com', '010', '3705', '2816', '서울시 강서구 화곡로', '9호', 'U', sysdate);
    
commit;
    