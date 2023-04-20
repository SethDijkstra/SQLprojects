
set echo on
set linesize 150
set pagesize 66
spool C:\cprg250s\Group_Assignments\join.txt

rem Q1 

select authorid "AUTH", fName, Lname
from author 
except
select authorid "AUTH", fName, Lname
from author natural join bookauthor natural join books natural join orderitems;

rem Q2 

select order#, item#, title, quantity, paideach, quantity * paideach as "Item Total", gift
from orderitems oi, books b, promotion p
where oi.isbn = b.isbn and oi.quantity * oi.paideach between p.Minretail and p.Maxretail
order by order#;

rem Q3 

select customer#, FirstName, LastName, title
from customers full outer join orders using (customer#)
    left join orderitems using (order#)
    right outer join books using (isbn)
order by 3,2,4;

rem Q4 



rem Q5 



spool off

