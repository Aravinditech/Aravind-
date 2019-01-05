create database market 

use market 


create table customer (id int primary key identity , name varchar(50)not null,city varchar not null,
Phoneno bigint not null) 

create table stock( id int  not null, productname varchar(10), unitprice int )

create table sales( saleid int identity , customerid int not null, productid int not null, quantity int not null , 
amount int not null,  date date default getdate())

create table personsales( salesid int identity, customerid int , date date default getdate() ) 

alter table sales add primary key (saleid)
alter table stock add primary key (id)
alter table sales add foreign key (customerid) references customer (id) 
alter table sales add foreign key (productid) references stock(id) 
alter table personsales add foreign key (salesid) references sales(saleid) 
alter table stock add quantity int 

alter table customer alter column city varchar(50)  

select * from personsales

alter proc bill @id1 int, @id2 int, @id3 int 
as	
begin 
declare @id4 int
declare @id5 int
select @id1=id from customer where id=@id1
select @id4=quantity from stock where id =@id2
select @id5=unitprice from stock where id=@id2 
select @id4=@id4-@id3	  
if @id4>0
begin	
update stock set quantity=quantity-@id3 where id=@id2
insert into sales values(@id1,@id2,@id3,@id3*@id5,default)
insert into personsales values (@id1,default) 
end 
else
print 'unavailable stock' +convert(varchar(50),@id4)
end


delete   personsales
bill 2,3,4

select * from personsales

alter trigger ab on sales for insert 
 as 
 begin 
 begin tran
 select * from sales
 rollback tran
 end

 select * into aravind from sales

 select * from aravind
 insert into aravind select * from sales column_name 
 drop table aravind 