CREATE TABLE member
(
    idx           int            primary key auto_increment, 
    email         VARCHAR(100)    UNIQUE NOT NULL, 
    phone         VARCHAR(20)     NULL, 
    password      VARCHAR(50)     NULL, 
    username      VARCHAR(50)     NULL, 
    lev           int(1)        NULL, 
    gender        VARCHAR(20)     NULL 
);
insert into member (email,phone,password,username,lev,gender) 
	values ('hi_manse@naver.com','010-8766-5193','123!@#qwe','운영자',2,'male');

SELECT * FROM MEMBER;

DROP TABLE MEMBER;


CREATE TABLE membership(
    idx         int           primary key auto_increment, 
    products    text    NULL, 
    content      text   	   NULL, 
    price       int        NULL, 
    lev         int(1)        NULL, 
    regdate     timestamp     default now()
);

DROP TABLE membership;

SELECT * FROM membership;

CREATE TABLE membership_file(
    idx      INT            primary key auto_increment, 
    ref      INT            NULL, 
    ofile    text    NULL, 
    sfile    text    NULL
);

DROP TABLE membership_file;

SELECT * FROM MEMBERSHIP;
select max(idx) from membership;
SELECT * FROM membership_file;

CREATE TABLE qna(
    idx         int           primary key auto_increment, 
    id    VARCHAR(100)          NOT NULL, 
    title    text       , 
    content      longtext			 , 
    lev         int(1)       , 
    regdate     TIMESTAMP        default now() 
);
select * from qna;
DROP TABLE qna;

CREATE TABLE qna_comment(
    idx         int           primary key auto_increment, 
    ref         int           NOT NULL, 
    id     VARCHAR(100)         NOT NULL, 
    content     text   NULL, 
    lev         int(1)        NULL, 
    regdate     TIMESTAMP        default now()
);
DROP TABLE qna_comment;

select * from qna_comment;



