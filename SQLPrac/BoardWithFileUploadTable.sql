--게시판과 파일 업로드할 수 있는 테이블 생성
create table FILEBOARD(
    IDX NUMBER PRIMARY KEY,--키값 활용
    NAME VARCHAR2(50) NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000) NOT NULL,
    POSTDATE DATE DEFAULT SYSDATE NOT NULL,
    OFILE VARCHAR2(200),
    NFILE VARCHAR2(100),
    DOWNCOUNT NUMBER(5) DEFAULT 0 NOT NULL,
    VISITCOUNT  NUMBER(5) DEFAULT 0 NOT NULL,
    PASS VARCHAR(50) NOT NULL
);

insert into fileboard (idx,name,title,content,pass)
    values (seq_board_num.nextval,'대조영', '자료실 제목5 입니다.','내용','1234');