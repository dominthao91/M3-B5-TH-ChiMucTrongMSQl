create database demo;
use demo;
create table Products(
    pID int auto_increment primary key not null ,
    pCode int not null ,
    pName varchar(20) not null ,
    pPrice  int not null ,
    pAmount int not null ,
    pDescription varchar(50) not null ,
    pStatus bool not null
);
create unique index idex_products on Products(pCode);
create index idex_products1 on Products(pName,pPrice);
explain select * from products where pCode = 11;
explain select * from products where pName = 'tuan' or pPrice = 50;
create view view_product as select pCode,pName,pPrice,pStatus from products;
select * from view_product;
create or replace view view_product as select  pCode,pName,pPrice,pStatus from products;
drop view view_product;
delimiter //
 create procedure finAllProduct()
 begin
     select * from products;
 end //
 delimiter ;
 delimiter //
 create procedure addProducts()
 begin
     insert into Products (PCODE, PNAME, PPRICE, PAMOUNT, PDESCRIPTION, PSTATUS) value (12,'thit ga',10,18,'nguyen con',true);

 end //
 delimiter ;
 call addProducts();
delimiter //
create procedure editProduct(in  id int)
begin
    update products set Products.pName = 'thịt gà TUấn' where Products.pID = id;
end //
delimiter ;
call editProduct(2);
delimiter //
create procedure deleteProducts(in id int)
begin
    delete  from Products where  pID =id;
end //
delimiter ;
call deleteProducts(4);