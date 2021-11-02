use classicmodels;
# tìm thông tin của khách hàng có tên là Land Of Toys Inc;
select * from customers where customerName = '%Land Of Toys Inc%';
# theo dõi kết quả “Tăng tốc MySQL”
explain select * from customers where customerName = '%Land Of Toys Inc%';
# thêm chỉ mục cho bảng customers;
alter table customers add index idex_customerName(customerName);
explain select * from customers where customerName = '%Land Of Toys Inc%';
alter table  customers add index idex_full_name (contactFirstName,contactLastName);
explain  select * from customers where contactFirstName = 'Jean' or contactFirstName = 'King';
alter table customers drop index idex_full_name;