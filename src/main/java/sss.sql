create table member(
    id varchar2(30) not null primary key,
    pw varchar2(60) not null,
    nickname varchar2 (60) not null,
    profilepath varchar2(200) not null,
    ismyplace number(1) default 0,
    moreinfo varchar2(1000) null,
    introduce varchar2(1000) null
);

create table placedetail(
    placeid varchar2(100) not null primary key,
    id varchar2(30) not null,
    price varchar2(30) not null,
    locationX number(10,7) null,
    locationY number(10,7) null,
    rule varchar2(2000) null,
    placetag varchar2(20) null,
    reservationrequest number(1) null,
    foreign key (id) references member(id)
);

drop table placedetail;
