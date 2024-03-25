create database	itvedant;
show databases;
use itvedant;
create table student (
id int,
student_name varchar(20),
age int,
city varchar(50)
);
show tables;
drop table student;
alter table student drop age; 
drop table student;
create table studentd (
roll_no int,
fname varchar(20),
lname varchar(20),
contact int unique key
);
desc studentd;
alter table studentd add primary key (roll_no);
 alter table studentd modify contact bigint unique key ;
 
insert into studentd values (1,'abhishek','jagtap',9870194979);
select * from studentd;

insert into studentd values (2,'ashish','more',8779774921);

insert into studentd values (3,'dishank','gawas',788898812);

insert into studentd values (4,'sahil','chavan',677787754);

insert into studentd values (5,'oral','robert',988212311);
insert into studentd values (6,'ashwinin','naik',37666239283);
insert into studentd values (7,'shahrukh','khan',124121333);
insert into studentd values (8,'akshay','kumar',9887634443);
insert into studentd values (9,'salman','khan',21212121212);
insert into studentd values (10,'rohit','saraf',18888891111);
insert into studentd values (5,'oral','robert',988212311),(11,'dhoom','adhad',1298192);
insert into studentd values(11,'dhoom','adhad',1298192),(12,'noob','jango',1281921121);

/* --trucate ka syntax 
truncate table table_name 
-- upadte ka syntax 
update table_name set column_name ='upadted_value' where connected_column = 'value'*/

update studentd set fname = 'rohit' where roll_no = '6';
/* default or column add karne ko syntax 
alter table table_name add column column_name datatype constraint(default 'defaultvalue')
*/

alter table studentd add column city varchar(20) default 'mumbai';
truncate table studentd;
alter table studentd modify roll_no int auto_increment;
insert into studentd (fname,lname,contact) values ('abhishek','jagtap',9870194979);
desc studentd;

/* 7 march 2024*/
/* del ka syntax same as update 
 delete from table_name where refrence_col = reference_value;
 */
 
 select * from studentd;
 insert into studentd (fname,lname,contact) values ('abhishek','jagtap',98701949735);
delete from studentd where roll_no = 2;
delete from studentd;
truncate table studentd;
insert into studentd values (1,'ashish','more',8779774921,'mumbai');


/*  
To off the safe mode in ysql
SET SQL_SAFE_UPDATES = 0;*/

 select * from studentd;
select fname , lname from studentd;  

-- Operators
/* list operator 
 1 - in 
 2 - not in 
 set operators 
 1- union
 2- union all 
 3- inersect 
 4- except 
*/


-- 11 march 2024
show tables;
drop table std_data;
create table std_data (
id int auto_increment primary key , name varchar(20),dept varchar(20),marks float, paid_fees int,attendance int);

insert into std_data ( name,dept,marks,paid_fees,attendance) values ('abhishek', 'mechanical', 99,2500,90),('ashish', 'mechanical', 100,2510,80),('srk', 'electrical', 99,5500,98),('salman', 'mechanical', 89,2600,88),('akshay', 'mechanical', 77,2500,70),('sanket', 'extc', 99,3500,88),('sid', 'mechanical', 55,2300,97),('amir', 'electrical', 77,2500,65),('saud', 'electrical', 77,2800,89);
select * from std_data;

-- like wildcard operator 
select * from std_data where name like 'a%';
-- like wildcard operator with 2 condition 
select * from std_data where name like 'a%' and marks = 99;
--  like without wildcard 
select * from std_data where name like 's__d';

-- limit
select * from std_data limit 4;

-- order by (highest fees paid) 
select * from std_data order by paid_fees desc limit 1;
-- second highest fees 
select * from std_data order by paid_fees desc limit 1,1;    	-- distnict can be use to get UNIQUE values
-- Distinct 
  select distinct  * from std_data order by paid_fees desc limit 1;

/* 12 march 2024*/

-- in / not in operator 
select * from std_data;
select name from std_data where id in (4); 					-- use () after in operator 
-- not in 
select name, dept from std_data where id not in (4,5,6);

create table table1 ( id int primary key auto_increment , name varchar(20));
create table table2 ( id int primary key auto_increment , name varchar(20));
drop table  table2;
insert into table1 (name) values ('a'),('b'),('c'),('d'),('e'),('f'),('aa'),('bb');
select* from table1;

insert into table2 (name) values ('aa'),('bb'),('g'),('h'),('ii'),('jj'),('kk'),('lll');
select * from table2;


-- set operators 
-- 1- union 
select * from table1 union  select * from table2;
-- 2- union all 
select name from table1 union all select name from table2;
-- 3-  intersect 
select id from table1 intersect select id from table2;
-- 4- except (output is from left table only )
select name from table1 except select name from table2;

-- aggregate funtions 
-- 1- max 2- min 3- count 4-sum 5-avg 
-- group by -- having (this two use with agg fun)

select * from std_data;
-- count ()
select count(id),dept from std_data group by 2;

/* 13 march 2024 */ 
select count(id),marks from std_data where marks not in (99) group by 2
;
 
-- in built functions 
/*    1 - string function 
		--> upper ()
        --> lower ()
		--> concat () 
        --> replace() ` syntax = rename (original string , replacing word, new word)
        --> len()
        --> trim() `` remove start and end 
				-- rtrim = rightside 
                -- ltrim = leftside 
                
	 2 - math function 
       --> abs() --- negative ko poistive 
       --> cell() --- convert number to int value without decimal 
       --> round() --- range .1 to .5 same  ka number .6 to .9 aage ka
       --> truncate() --- manage number after point 
       --> mod ()-- returns remainder 
       --> floor() -- floor div ( point ki phli value) 
       --> pow () -- power dega 
       --> sqrt() -- sq root dega 
       
	3 - date function 
      --> curdate()
      --> now() -- abhi ka date n time 
      --> sysdate() -- 
      --> last.day() -- jo date rahega uske month ka last day dega 
      --> date.format () -- changing the format of date 
      
    */ 

        select name ,marks from std_data limit 1;
        select * from std_data;
        select name , dept from std_data where dept = 'mechanical' or dept= 'extc';

select name , dept ,'paid_fees'- 50000 as total_marks from std_data;

-- 14 march 2024 
select mod(11,4);
select floor(11.4);


select* from std_data;

select name ,floor(mod(marks,5)) from std_data;

-- date function   
 /* --
c - month in number 
M - month in charc
m - do digit dega 
a - day dega short form 
W - day in full form 
*/

select date_format(now(), '%d-%c-%Y, %h:%i:%s');
 

create table abc ( 
id int primary key ,
 dob date ,
 age int check(age>=18));
 
 desc  abc;
insert into abc values (1 , '2001-10-22',18),(2,'1999-03-12',22),(3,'1991-03-12',24);

select * from abc
;
select* from std_data;

select dept from std_data group by dept
;
select distinct dept from std_data;


-- foreign key  `` used to create relation between two tables``
-- synatx = foreign key (col_name) references table_name(col_name) 

create table user ( uid int auto_increment primary key , uname varchar(50)
 );
insert into user ( uname ) values ('abhishek');

create table orders ( oid int auto_increment primary key , pname varchar(20), uid int , foreign key (uid) references user(uid));
drop table orders;
drop table user;
insert into orders ( pname , uid ) values ( 'pen',1);

select * from orders;
select * from user;
select user.uname,orders.pname from user inner join orders on user.uid = orders.uid;




-- i) To display the day like “Monday”, “Tuesday”,from the date when India got independence.
select date_format('1997-08-15', '%W');

-- ii) To display the specified number of characters from a particular position of the given string.
select substr('hello world',7) ;

-- iii) To display the name of the month in which you were born.
select date_format('2001-10-22', '%M');

-- iv) To display your name in capital letters.
select upper('abhishek');



-- 1. Write a query to concat strings "MySQL","is","Fun"
select concat('mysql',' is',' fun');

-- 2. Write query to replace "Coding" with "MySQL" in the sentence:"I Love Coding"
select replace('I love coding', 'coding', 'MySql');

-- 3. Write a query to display the number of characters from "I Love India"
select length("I Love India");

-- -- --- -- -- - -- - -- -- -- -- -- -- --- -- --------------------------------------------------------------------

-- CASE STATEMENT  = use to give class / intervals 
select * from std_data;
select max(marks) from std_data;
select min(marks) from std_data;

select name ,
case 
when marks>=50 and marks<= 75 then 'C'
when marks>75 and marks <= 90 then 'B'
when marks>90 and marks <= 100 then 'A'
end as Grades
from std_data;

-- JOINS 
/* 
	 1. Inner Join -- Common values dega
     
     2. Full Outer Join -- all values from both tables 
		a. Left Join -- all values from left table  and common values from right table 
        b. Right Join -- all values from right table and common values from left table 
        
	3. Natural Join -- join without any condition 
    
    4. Self Join -- ek he table pe join 
    
    5.Cross Join -- compare all values 
    */
    
create table college ( cid int primary key , clg_name varchar(20), location varchar(20));

create table students ( sid int primary key , sname varchar(20),age int not null , city varchar(20) not null , cid int , foreign key(cid) references college(cid));
insert into college( cid,clg_name,location) values( 101,'dy patil','Nerul'), ( 102,' ltce','kopar khairane'),( 103,'ac patil','kharghar'),(104,'kjsomaiya','vidyavihar'),( 105,'ratnam','Bhandup');
insert into students values (1,'abc',22,'mumbai',102),(2,'bbc',23,'nahur',101),(3,'xyz',18,'Mumbai',101),( 4, 'ashish',20,'mumbai',105),(5,'abhishek',22,'bhandup',102),(6,'sanket',22,'thane',103),(7,'sahil',22,'mumbai',104),(8,'dishu',22,'mumbai',102),(9,'ffff',23,' navi mumbai',105),( 10,' ', 25,'mumbai',104),(11,' ',12,'mumbai',103);


select* from college;
select* from students;
-- inner join 
  select students.sname,college.clg_name from students inner join college on students.cid=college.cid;
  
  drop table students;
  
  
  -- 		left join 
  select * from students left join college on students.cid=college.cid;
  -- right join 
    select * from students right join college on students.cid=college.cid; 
-- full outer join  
select * from students left join college on students.cid=college.cid
union 
select * from students right join college on students.cid=college.cid; 

-- self join 
create table emp (eid int primary key , ename varchar(30),designation varchar(20),mid int );
insert into emp values ( 1,'rahul','dev',6),(2,'dddd','dev',6),(3,'rohit','dev',6),(4,'devsoni','HR',5),(5,'big-boss','CEO',0),(6,'strak','manager',5);
select* from emp;
select e.ename as emp_name,m.designation as designation, m.ename as manager_name from emp e ,emp m where e.eid=m.mid;
-- using inner join 
select e.ename as emp_name,m.designation as designation, m.ename as manager_name from emp e  inner join emp m on   e.eid = m.mid;

-- using cross join 
select students.sname , college.clg_name from students cross join college ;

select * from emp where eid in( 1,5);

-- sub queries 




