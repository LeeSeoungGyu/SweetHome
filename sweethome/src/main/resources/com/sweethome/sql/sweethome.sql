create table product(
   productnum varchar(300) primary key,
   productname varchar(300) not null,
   productamount int,
   productcontents varchar(300),
   productphoto varchar(300)
);

create table user(
   userid varchar(300) primary key,
   userpw varchar(300) not null,
   username varchar(300) not null,
   usergender enum('M','W'),
   zipcode varchar(50),
   useraddr varchar(1000),
   useraddrdetail varchar(1000),
   useraddretc varchar(1000),
   userbirth varchar(100) not null,
   userphone varchar(300) not null,
   userphoto varchar(300) default "basicprofile.jpg"
);

create table shoppinglist(
   userid varchar(300),
   productnum varchar(300),
   foreign key(userid) references user(userid),
   foreign key(productnum) references product(productnum)
);

create table orderlist(
	ordernum_s varchar (10) default "D",
    ordernum_i int,
    productnum varchar(300),
    orderdate datetime default now(),
    userid varchar(300),
    p_condition varchar(300) default "결제완료",
    foreign key(userid) references user(userid),
    constraint orderlist_PK primary key(ordernum_s,ordernum_i)
);

   create table m_board(
   boardnum int primary key auto_increment,
   boardtitle varchar(300),
   boardcontents varchar(300),
   regdate datetime default now(),
   updatedate datetime,
   readcount int default 0,
   userid varchar(300),
   foreign key(userid) references user(userid)
);

create table t_reply(
   replynum int primary key auto_increment,
   replycontents varchar(1000) not null,
   regdate datetime default now(),
   updatechk enum('o','x') default 'x',
   userid varchar(300),
   boardnum bigint
);

create table qna(
   qnanum int primary key auto_increment,
   userid varchar(300),
   qnatitle varchar(300),
   qnacontents varchar(300),
   qnacheck varchar(10) default 'X',
   regdate datetime default now(),
   foreign key(userid) references user(userid)
);

create table reservation(
reservnum int primary key auto_increment,
username varchar(300),
reservdate varchar(300),
reservtime varchar(300),
reservcontents varchar(1000)
);

drop table reservation;

create table donate(
donatenum int primary key auto_increment,
name varchar(300),
money varchar(300),
content varchar(300),
date datetime default now()
);

