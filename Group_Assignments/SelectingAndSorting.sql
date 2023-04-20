rem Unit 10 Group Exercise Simple SELECT and Sorting 
set echo on
set linesize 150
set pagesize 66
spool C:\cprg250s\select_sort.txt

rem Q1 - basic select columns with headers

select Title "Title", upper(PubDate) "Pub Date", Category "Category", Retail "Retail Price"
from books
where upper(category) in 'COMPUTER' and retail < 30 or PubDate > '31-dec-05'
order by PubDate;

rem Q2 

select order# "Order #", customer# "Customer #", orderdate "Date Ord"
from orders
where shipdate is null
order by customer#, order#;

rem Q3 

select order#, shipdate, ShipState "SH"
from orders
where shipdate between '01-APR-09' and '03-APR-09' and shipstate != 'WA'
order by shipdate;


rem Q4 

select title, pubid, retail
from books
where pubid in ('2', '3', '4') or retail < 30
order by title;

rem Q5 

select customer#, Address, Referred, Email
from Customers
where Referred = 1003 or Address like 'P.O.%' or Email like '%axe.com'
order by customer#;


spool off

