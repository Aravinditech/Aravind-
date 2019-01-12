create database market 

use market 

create table customer (id int primary key identity , name varchar(50)not null,city varchar(50) not null,
Phoneno bigint not null) 

create table stock( id int  not null, productname varchar(10), unitprice int )

create table sales( saleid int identity , customerid int not null, productid int not null, quantity int not null , 
amount int not null,  date date default getdate())

create table personsales( customerid int identity, salesid int , date date )

alter table sales add primary key (saleid)
alter table stock add primary key (id)
alter table sales add foreign key (customerid) references customer (id) 
alter table sales add foreign key (productid) references stock(id) 
alter table personsales add foreign key (salesid) references sales(saleid) 
alter table stock add quantity int 


insert into customer values ('Aravind','pondy',1234567890)
insert into customer values ('Sri','auroville',0987456123)
insert into customer values ('Sudar','Tv Nagar',45678932310)
insert into customer values ('Vj','Lawspet',0213456789)

insert into stock values (1,'pen',5,500)
insert into stock values (2,'pencil',3,500)
insert into stock values (3,'rubber',2,500)
insert into stock values (4,'scale',4,500)


select * from sales
select * from stock
select * from customer

alter proc bill @id1 int, @id2 int, @id3 int 
as	
begin 
declare @id4 int
declare @id5 int 
select @id4=quantity from stock where id =@id2
select @id5=unitprice from stock where id=@id2 
select @id4=@id4-@id3
if @id2>0
begin	
update stock set quantity=quantity-@id3 where id=@id2
insert into sales values(@id1,@id2,@id3,@id3*@id5,default)
end 
else
print 'unavailable stock' +convert(varchar(50),@id4)
end

create trigger aravind on sales for insert as 
begin
select * from sales 
end

bill 1,3,10

create proc count as 
select table1.productid,table2.productname as name, table1.count from 
(select productid,sum(quantity) as count from sales group by productid) as table1 join 
(select * from stock) as table2 on table1.productid= table2.id   

count

create proc joins as 
select c.name,s.date,t.productname,s.quantity from customer as c 
join sales s on c.id=s.customerid 
join stock t on t.id=s.productid

joins
