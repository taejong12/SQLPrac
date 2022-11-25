 CREATE TABLE USERS (
    ID NUMBER PRIMARY KEY,
    USERNAME VARCHAR2(100) NOT NULL,
    PASSWORD VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(50) ,
    NICKNAME VARCHAR2(50),
    POINT NUMBER DEFAULT 0,
    PHONE VARCHAR2(20) ,
    RATING VARCHAR2(50) DEFAULT 0,
    ROLE VARCHAR2(20) DEFAULT 'ROLE_USER'
);
    
    -- 유저 번호 자동증가    
    CREATE SEQUENCE USER_ID_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999999999
       NOCYCLE
       NOCACHE
       NOORDER;
 
COMMIT;

--연습용
CREATE TABLE TEST_BOARD(
    ID NUMBER(10) PRIMARY KEY,
    REG_TIME DATE,
    UPDATE_TIME DATE,
    CREATED_BY VARCHAR2(8) NOT NULL,
    MODIFIED_BY VARCHAR2(20) NOT NULL,
    ITEM_DETAIL VARCHAR2(100) NOT NULL,
    ITEM_NAME VARCHAR2(20) NOT NULL,
    ITEM_SELL_STATUS VARCHAR2(10) NOT NULL,
    PRICE NUMBER(20) NOT NULL,
    STOCK NUMBER(20) NOT NULL
);

CREATE SEQUENCE TEST_BOARD_SEQ;


alter table TEST_BOARD modify(REG_TIME DATE DEFAULT SYSDATE);
alter table TEST_BOARD modify(CREATED_BY VARCHAR2(100));

alter table TEST_BOARD drop(MODIFIED_BY);
alter table TEST_BOARD drop(REG_TIME);

create table testone (
    id number(10) primary key,
    writer varchar2(30) not null,
    item_name varchar2(50) not null,
    item_detail varchar2(1000) not null,
    item_status VARCHAR2(20) not null,
    price number(20) not null,
    stock number(20) not null,
    time date DEFAULT SYSDATE
);

alter table testone rename column item_name to iname;
alter table testone rename column item_detail to idetail;
alter table testone rename column item_status to istatus;

CREATE SEQUENCE testone_seq;
