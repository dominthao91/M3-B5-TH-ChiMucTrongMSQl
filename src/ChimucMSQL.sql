use classicmodels;
# tìm thông tin của khách hàng có tên là Land Of Toys Inc;
select *
from customers
where customerName = '%Land Of Toys Inc%';
# theo dõi kết quả “Tăng tốc MySQL”
explain
select *
from customers
where customerName = '%Land Of Toys Inc%';
# thêm chỉ mục cho bảng customers;
alter table customers
    add index idex_customerName (customerName);
explain
select *
from customers
where customerName = '%Land Of Toys Inc%';
alter table customers
    add index idex_full_name (contactFirstName, contactLastName);
explain
select *
from customers
where contactFirstName = 'Jean'
   or contactFirstName = 'King';
alter table customers
    drop index idex_full_name;

# Store Procedure
# Tạo Mysql Stored Procedure đầu tiên
delimiter //
create procedure findAllCustomers()
begin
    select * from  customers;
end //
delimiter ;
call findAllCustomers();
 delimiter //
 drop procedure if exists `findAllCustomers`//
 create procedure findAllCustomers()
 begin
     select * from customers where customerNumber = 175;
 end //
 delimiter ;

# Truyền tham số vào Store Procedure;
# tham số loại IN;
delimiter //
create procedure getCusById(in cusNum int(11))
begin
    select * from customers where customerNumber = cusNum;
end //
delimiter ;
call getCusById(177);
# Tham số loại OUT
delimiter //
create procedure getCustomersCountByCity(
in  in_city varchar(50),
out total int
)
begin
    select count(customerNumber)
        into total
    from customers where city = in_city;
end //
delimiter ;
call getCustomersCountByCity('Lyon',@total);
select @total;
# tham sô loại inOUT
delimiter //
create procedure setCounter(
inout counter int,
in inc int
)
begin
    set counter =counter+inc;
end //
delimiter ;
set @counter =1;
call setCounter(@counter,1);
call setCounter(@counter,1);
call setCounter(@counter,5);
select @counter;