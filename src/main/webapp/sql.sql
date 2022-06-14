create table EZUSER(
    userID varchar2(20),
    userPassword varchar2(20),
    userNickName varchar2(20),
    userProfilePath varchar2(200),
    userMoreInfo varchar2(1000),
    primary key(userID)
);
desc ezuser;

insert into ezuser values('admin', 'admin', '包府磊','','包府磊');


desc ezuser;

commit;

select * from ezuser;


create table EZPLACE(
	placeID int not null primary key,
    userID varchar2(20),
    placeTag varchar2(100),
	placeTitle varchar2(50),
    placeIntroduce varchar2(3000),
    placeRule varchar2(3000),
    reservationRequestDate date,
    reservationUser varchar2(20),
    location varchar2(200),
    ofile varchar2(200), 
    sfile varchar2(50) , 
    price number(10),
    realPath varchar2(200)
    
);

create sequence seq_board_num 
  increment by 1
  start with 1
  nocache;

select * from EZPLACE;
drop table review;

create table review(
    reviewIndex int not null primary key,
    reviewPlaceID int not null, 
    reviewUserID varchar2(20),
    reviewText varchar2(2000)
);

select * from review;
