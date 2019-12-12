DROP TABLE MEMBER;
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
/* admin 계정 */
insert into member (email,phone,password,username,lev,gender) 
	values ('hi_manse@naver.com','010-8766-5193','123!@#qwe','운영자',2,'male');
/* 일반회원 계정 */
insert into member (email,phone,password,username,lev,gender) 
	values ('slasnrndu@gmail.com','010-8766-5193','123!@#qwe','회원',0,'female');
insert into member (email,phone,password,username,lev,gender) 
	values ('luckyguytrg@naver.com','010-8766-5193','123!@#qwe','회원',0,'male');


DROP TABLE membership;
CREATE TABLE membership(
    idx         int           primary key auto_increment, 
    products    text    NULL, 
    content      text   	   NULL, 
    price       int        NULL, 
    lev         int(1)        NULL, 
    regdate     timestamp     default now()
);
DROP TABLE membership_file;
CREATE TABLE membership_file(
    idx      INT            primary key auto_increment, 
    ref      INT            NULL, 
    ofile    text    NULL, 
    sfile    text    NULL
);

insert into membership (products,content,price,lev) values ('마포 M요가&필라테스',
'요가는 운동이 아니라 수련? 마포 M요가의 양형지 원장님을 만나보세요.

우리동네 헬스장 고객님을 위한 상시할인 10%와 선착순 5명 특별할인
모든 우리동네 헬스장 추천코드 결제고객 상시할인 10%
요가+필라 주 3회 / 3개월 특별 추가할인 [선착순 5명]
VIP 패키지 (플라잉+매트) / 3개월권 특별 추가할인 [선착순 5명]

==============================================================================

왜 엠요가스튜디오를 다녀야 할까요? Why M 요가...

1. "요가 전문가가 직접 상담 해드립니다."
2. "강사들의 선생님인 시니어 강사진이 수업합니다."
3. "깨끗,따뜻,시원,공기까지 신경 쓰는 곳"
4. "남녀 공용 커플 수련 가능"
5. "다수 방송 및 잡지 자문, 연예인/운동선수 특강
6. "프리미엄 임산부 수업 자체 개발"
==============================================================================
가격정보
요가&필라테스 (주 3회 or 임산부)
					1개월			3개월			6개월		  12개월
정상가			    160,000원		400,000원		560,000원		840,000원
우리동네 회원가					360,000원		504,000원		756,000원
선착순 우주최저가					340,000원		
				 월 160,000원		월 113,333원   	 월 84,000원	 	 월 63,000원

==============================================================================

운영시간
[평　일] 09:00 ~ 22:30
[토요일] 09:00 ~ 13:30
[휴관일] 일요일,공휴일



',1000000,2);
insert into membership_file (ref,ofile,sfile) values (1,'마포 M요가&필라테스.jpg','마포 M요가&필라테스.jpg');

insert into membership (products,content,price,lev) values ('건대입구 스카이요가쿨라',
'뻣뻣하면 요가 못한다고?? 스카이요가쿨라 사라 강사님을 만나보세요.

우리동네 회원들을 위한 스카이요가쿨라 전지점 할인 혜택
가장 저렴한 주2회 가격으로 주4회 회원권 이용 가능!

==============================================================================

왜 스카이요가쿨라를 다녀야할까요? Why Sky yoga kula?

1. "회원님의 몸과 마음보다 중요한 것은 없습니다."
→ 수업 전후로 쉴 수 있는 편안한 인테리어와 공간이 전지점에 준비되어있습니다!

2. "개인의 몸의 특성에 맞는 난이도수업과 맞춤 지도를 해드립니다."
→ 여러 클래스를 준비하고 선생님들께서 수업시간에 각 회원님들께 맞춤으로 지도!

3. "새로운 요가 트렌드에 맞게 항상 변화를 추구합니다."
→ 스테이시파드,요가닥터,엑스바디 등등 회원들을 위한 투자를 아끼지 않습니다!

4. "급이 다른 수업의 퀄리티를 보장합니다."
→ 스카이요가쿨라에서는 요가 강사들을 배출하는 요가 선생님들이 직접 고객을 지도합니다.

==============================================================================
가격정보
매트 요가 (주 4회)
						1개월		3개월		6개월			12개월
정상가				250,000원	490,000원	700,000원		1,250,000원
우리동네 회원가					390,000원	590,000원		990,000원
					월 250,000원	월 130,000원	월 98,333원		월 82,500원

==============================================================================

공지사항
※ 플라잉요가 수업은 인원제한으로 현장을 방문하셔서 결제 가능합니다.

==============================================================================
운영시간
[평　일] 09:30 ~ 23:30
[토요일] 10:30 ~ 15:00
[휴관일] 공휴일,매주 일요일


',1000000,2);
insert into membership_file (ref,ofile,sfile) values (2,'건대입구 스카이요가쿨라.jpg','건대입구 스카이요가쿨라.jpg');

insert into membership (products,content,price,lev) values ('경복궁 바디체커',
'베테랑 15년 경력 P.T 바디체커!

==============================================================================

가격정보
헬스
						1개월		3개월		6개월		12개월
정상가				88,000원		264,000원	528,000원	1,000,000원
우리동네 회원가					165,000원	330,000원	660,000원
					월 88,000원	월 55,000원	월 55,000원	월 55,000원

==============================================================================

공지사항
※헬스 회원권은 정원이 있습니다, 센터에 반드시 문의후 결제해주세요.
==============================================================================
운영시간
[평　일] 08:00 ~ 22:00
[토요일] 10:00 ~ 15:00
[공휴일] 10:00 ~ 15:00
[휴관일] 일요일 및 명절

',1000000,2);
insert into membership_file (ref,ofile,sfile) values (3,'경복궁 바디체커.jpg','경복궁 바디체커.jpg');

insert into membership (products,content,price,lev) values ('홍대서교 짐티피 1호점',
'모든 포유류들은 섹시해지고 싶다!
래퍼 스윙스가 아닌 짐티피 문지훈 대표님으로.

여기가 홍대에서 젤로 hot하다는...
괴물래퍼 Swi*gs가 운영하는 헬스장?
(가격, 시설 실화? ㄷㄷ)

#1호점은 최고급 DRAX머신 풀세트
==============================================================================

가격정보
헬스
						1개월		3개월		6개월		12개월
정상가				120,000원	198,000원	297,000원	396,000원
우리동네 회원가		99,000원		175,000원				350,000원
					월 99,000원	월 58,333원	월 49,500원	월 29,167원
==============================================================================
공지사항
※ 3,12개월 선착순 우주최저가 이벤트는 조기 마감되었습니다.

※ 짐티피 1,2,3,4호점 프리패스 회원권 안내사항
3개월: 50,000원 / 6개월: 80,000원 / 12개월: 100,000원
현장에서 추가 결제시 전 지점 이용가능합니다. (단, 1개월 회원 및 통합회원권 고객은 프리패스 적용이 불가합니다.)
==============================================================================
운영시간
[평　일] 06:00 ~ 24:00
[주　말] 10:00 ~ 20:00
[휴관일] 공휴일


',1000000,2);
insert into membership_file (ref,ofile,sfile) values (4,'홍대서교 짐티피 1호점.jpg','홍대서교 짐티피 1호점.jpg');

DROP TABLE qna;
CREATE TABLE qna(
    idx         int           primary key auto_increment, 
    id    VARCHAR(100)          NOT NULL, 
    title    text       , 
    content      longtext			 , 
    lev         int(1)       , 
    regdate     TIMESTAMP        default now() 
);

DROP TABLE qna_comment;
CREATE TABLE qna_comment(
    idx         int           primary key auto_increment, 
    ref         int           NOT NULL, 
    id     VARCHAR(100)         NOT NULL, 
    content     text   NULL, 
    lev         int(1)        NULL, 
    regdate     TIMESTAMP        default now()
);
insert into qna (id,title,content,lev) 
	values ('slasnrndu@gmail.com','이헬스장도 우리동네 헬스장 혜택이 가능한가요??','여기는 짐피티3호점인거 같은데 <br>1호점은 현재 우리동네 혜택을 받을수 있는거 같은데 <br>3호점도 가능한지 궁금하네요~!<br><p><iframe frameborder="0" src="//www.youtube.com/embed/aQgXGQ9z2Sc" width="640" height="360" class="note-video-clip"></iframe><br></p>','0');
insert into qna_comment (ref,id,content,lev) 
	values (1,'hi_manse@naver.com','현재 우리동네 헬스장에서는 짐피티 1호점과 계약을 맺은 상태입니다. 추후 다른 매장과도 계약을 맺을 예정입니다.','2');

insert into qna (id,title,content,lev) 
	values ('luckyguytrg@naver.com','가입시 혜택은 어떤것들이 있나요??',
'추가할인 혜택이 우리동네 헬스장 할인가 말고<br>
다른것들이 있는지 궁금합니다.!','0');
insert into qna_comment (ref,id,content,lev) 
	values (2,'hi_manse@naver.com',
	'우리동네 헬스장과 계약한 헬스장은 
우리동네 헬스장에서 준비한 할인된 가격으로 만나보실수 있으십니다.','2');

insert into qna (id,title,content,lev) 
	values ('luckyguytrg@naver.com','우리동네 헬스장과 계약을 맺으려면 어떻게 해야하나요??',
'저희 헬스장을 홍보하고 싶습니다.<br>
홍보 비용은 얼마이며 몇개월 동안 홍보가 가능한지 알고싶습니다.!','0');
insert into qna_comment (ref,id,content,lev) 
	values (3,'hi_manse@naver.com','저희 아래에 기제된 번호로 연락을 주시면 감사하겠습니다.','2');



