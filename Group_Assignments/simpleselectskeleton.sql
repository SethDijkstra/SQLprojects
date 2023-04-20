rem Unit 10 Group Exercise Simple SELECT and Sorting 
set echo on
set linesize 150
set pagesize 66
spool C:\cprg250s\skeletonText.txt

rem Q1 - basic select columns with headers

select Fname "First", Lname "Last"
from author;

rem Q2 
select order# ||'-'||item# AS "Order-Item #",
isbn AS "Book ISBN",
quantity AS "Qty",
PaidEach AS "Price",
quantity * PaidEach AS "Line Total",
quantity * PaidEach * 0.05 AS "GST",
round((quantity * PaidEach) * 1.05, 2) AS "Total Price"
from orderitems
order by item#;
 


rem Q3 

select unique authorid
from bookauthor
order by authorid;

rem Q4 

select customer# || '-' || order# "Cust#-Order#",
ShipDate - OrderDate "Days to Ship"
from orders;

rem Q5 

select firstname || ', ' || lastname as "Name",
address || ', ' || City || ', ' || state || ', ' || zip
from customers;

spool off

