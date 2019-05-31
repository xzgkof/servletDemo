create table mytable
(
myid integer primary key,
myname varchar(20),
myage number(3) default 1 check (myage between 1 and 100),
mysex varchar2(20) ,
myhobby varchar(50),
myinfo varchar(50)
)

--mysql
 create table mytable(
 myid int unsigned auto_increment primary key,
 myname varchar(50) default 0 check(myage between 0 and 100),
 myage int,
 mysex varchar(10),
 myhobby varchar(50),
 myinfo varchar(50)
 );
 
select * from mytable
drop table mytable

create  sequence mytab_seq 
increment by 1 
start with 1
nomaxvalue 
nocycle
cache 10;

drop sequence mytab_seq;

insert into mytable values(mytab_seq.nextval,'king',100,'ÄÐ','www','what');
