--�Խ��ǰ� ���� ���ε��� �� �ִ� ���̺� ����
create table FILEBOARD(
    IDX NUMBER PRIMARY KEY,--Ű�� Ȱ��
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
    values (seq_board_num.nextval,'������', '�ڷ�� ����5 �Դϴ�.','����','1234');