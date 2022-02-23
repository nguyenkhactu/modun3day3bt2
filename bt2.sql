use quanlybanhang;
show tables;
select * from customer;
insert into customer(cname,cage)
value('minh quan',10);
insert into customer(cname,cage)
value('ngoc oanh',20);
insert into customer(cname,cage)
value('hong ha',50);

drop index odate on orders;


select * from orders;
insert into orders(cid,odate)
value (1,'2006-03-21');
insert into orders(cid,odate)
value (2,'2006-3-23');
insert into orders(cid,odate)
value (1,'2006-3-13');
insert into orders(cid)
value (1);

truncate table orders;
alter table orders
drop cid;
alter table orders
add cid int DEFAULT NULL after oid;

alter table orders drop foreign key `orders_ibfk_1`;

alter table orders;
drop index odate on orders
ALGORITHM = INPLACE 
LOCK = DEFAULT;

alter table orders
add odate date DEFAULT NULL after oid ;

alter table orders;
drop index oid on orders
ALGORITHM = INPLACE 
LOCK = DEFAULT;

alter table oders
add oid int primary key first; 
DROP INDEX `PRIMARY` ON orders;
show tables;

select * from customer;
select * from orderdetail;
select * from product;
select * from orders;

insert into product(pname,pprice)
value ('maygiat',3);
insert into product(pname,pprice)
value ('tulanh',5);
insert into product(pname,pprice)
value ('dieuhoa',7);
insert into product(pname,pprice)
value ('quat',1);
insert into product(pname,pprice)
value ('bepdien',2);

insert into orderdetail(oid,pid,odqty)
value (1,1,3);
insert into orderdetail(oid,pid,odqty)
value (1,3,7);
insert into orderdetail(oid,pid,odqty)
value (1,4,2);
insert into orderdetail(oid,pid,odqty)
value (2,1,1);
insert into orderdetail(oid,pid,odqty)
value (3,1,8);
insert into orderdetail(oid,pid,odqty)
value (2,5,4);
insert into orderdetail(oid,pid,odqty)
value (2,3,3);
	
    select oid,odate,oTotalPrice from orderdetail
    join Orders on orderdetail.oid = Orders.oid;
    
    select * from Orders;
    
    update Orders
    set cid =1,odate ='2006-03-21'
    where oid = 1;
    update Orders
    set cid =2,odate ='2006-3-23'
    where oid = 2;
    update Orders
    set cid =1,odate ='2006-3-13'
    where oid = 3;
    
    select oid,odate,oTatolPrice from Orders;
    
    select * from customer;
    
    select cname,oid from customer
    join Orders on customer.cid = Orders.cid;

    select  Orders.oid,product.pname from OrderDetail
    join Orders on OrderDetail.oid = Orders.oid
    join Product on Product.pid = OrderDetail.pid;
    
    select customer.cnam,Product.pname from Customer
    join product on customer.cid = product.pid;
    
    select Customer.cname,product.pname from customer
    join Orders on customer.cid = Orders.cid
    join OrderDetail on OrderDetail.oid = Orders.oid
    join Product on Product.pid = OrderDetail.pid;
    
    select * from customer;
select * from orders;
select * from product;

select customer.cname from customer
join orders on customer.cid = orders.cid
where(select orders.cid from customer
left join orders on customer.cid = orders.cid) = null;

select distinct orders.cid from customer
left join orders on customer.cid = orders.cid;

select * from customer
left join orders on customer.cid = orders.cid
where customer.cid not in (select distinct orders.cid from customer
left join orders on customer.cid = orders.cid where orders.cid is not null
); 

select distinct orders.cid from customer
left join orders on customer.cid = orders.cid where orders.cid is not null;

select * from orders
join OrderDetail on orders.oid = OrderDetail.oid
join Product on Product.pid = OrderDetail.pid;
select * from orders
join OrderDetail on orders.oid = OrderDetail.oid
join Product on Product.pid = OrderDetail.pid;

select orders.oid, orders.odate, orders.otatolprice from orders
join OrderDetail on orders.oid = OrderDetail.oid
join Product on Product.pid = OrderDetail.pid;

select orders.oid,product.pname,product.pprice from orders
join OrderDetail on OrderDetail.oid = orders.oid
join Product on Product.pid =OrderDetail.pid;

select orders.oid,orders.oDate,sum( product.pprice) as 'oTotalPrice' from orders 
join OrderDetail on OrderDetail.oid = orders.oid
join Product on Product.pid =OrderDetail.pid
group by orders.oid;

select * from product;