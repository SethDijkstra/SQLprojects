set echo on
set linesize 150
set pagesize 66
spool C:\cprg250s\Group_Assignments\selectGroup1.txt

select isbn, initcap(title) "Title",
       nvl2(discount, 'Fixed Discount', '20% Discount') "Discount Type",
       to_char(retail, '$9,999.00') "Orig Price",
       to_char(nvl(discount, retail * 0.2), '$9,999.00') "Discount",
       to_char(nvl(retail - discount, retail-retail*0.2), '$9,999.00') "Final $"
from books
order by 2;

column 'Customer' format A30
column 'Order Date' format A25
column 'Ship Date' format A25
column 'Days to Ship' format A20

--Fix Centering On Days to ship Column
select firstname || ' ' || lastname "Customer", 
       order# "Order #",
       to_char(orderdate, 'fmMonth dd, yyyy') "Order Date", 
       shipdate "Ship Date",
       nvl(to_char(shipdate-orderdate), 'Not Shipped') as "Days to Ship"
from customers join orders using (customer#)
order by lastname;
clear columns

column 'Customer' format A25
column 'Title' format A30

select firstname || ' ' || lastname "Customer",
       order# "Order #",
       title "Title",
       orderdate "Order Date",
       pubdate "Pub Date",
       round(months_between(orderdate, pubdate)) "Months Old"
from customers join orders using (customer#)
    join orderitems using (order#)
    join books using (isbn)
order by lastname, order#;

clear columns

spool off

