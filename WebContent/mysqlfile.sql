
select * from EMP911;
======signupdata=====
select * from signupdata;
drop table signupdata;
create table signupdata (id varchar2(300),firstname varchar2(200),lastname varchar2(200),email varchar2(200),username varchar2(200),phonenumber varchar2(200),cpassword varchar2(200),address varchar2(200));
======signupdata=====
productprize
======Add item=====
select * from additem;
drop table additem;
create table additem (id number(20), productname varchar2(2000), productprize varchar2(2999), launchdate varchar2(2999), imagelocation varchar2(299), des varchar2(3333));
======add item=====


===add to cart====

select * from addtocart;
create table addtocart (id number(20), productname varchar2(2000), productprize varchar2(2999), launchdate varchar2(2999), imagelocation varchar2(299), des varchar2(3333));
drop table addtocart;
===add to cart====

SELECT COUNT(id) FROM addtocart;
select sum(productprize) from addtocart;

select * from additem where productname like 'a%';