create table board1 (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자, 회원 게시판은 불 필요
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	readcount number default 0, -- 읽은 횟수
	password varchar2(12) not null, -- 암호, 암호를 아는 사람만 수정/삭제, 회원 게시판은 불 필요
	ref number not null, -- 답변글끼리 그룹
	re_step number not null, -- ref내의 순서
	re_level number not null, -- 들여쓰기
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null, -- 작성일
	del char(1) default 'n' -- 실제로 삭제 않하고 삭제한 것 처럼 표시
);