-- �Խ��� ���̺� ����
create table t_board(
    no          number(5)       primary key
    , title     varchar2(200)   not null
    , writer    varchar2(50)    not null
    , content   varchar2(4000)  not null
    , view_cnt  number(5)      default 0
    , reg_date  date            default sysdate
);

create sequence seq_t_board_no;

-- seq_t_board_no.nextval
-- ���������� �ϳ��� �� ������

select * from t_board;

insert into T_BOARD(no, title, writer, content)
    values(seq_t_board_no.nextval, '�����Դϴ�', 'ȫ�浿', '�����Դϴ�');
    
    insert into T_BOARD(no, title, writer, content)
    values(seq_t_board_no.nextval, '����2�Դϴ�', 'ȫ�浿', '����2�Դϴ�');

commit;    

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
    values('kopo', '������', '1234', 'kopo', 'gmail.com', 010, 1234, 5678);
    
commit;
    