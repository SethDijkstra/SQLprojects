set echo on
set linesize 120
set pagesize 66
spool C:\cprg250s\Group_Assignments\groupFunctions.txt

select initcap(fname) || ' ' || initcap(lname) "Author Name",
       to_char(sum(quantity*paideach), '$99,999.00') "Value",
       to_char(sum(quantity*paideach*0.01), '$99,990.00') "Commision"
from author join bookauthor using(authorid)
     join books using(isbn)
     join orderitems using(isbn)
group by fname, lname
order by fname, lname;


select initcap(firstname) "First", initcap(lastname)"Last", 
    count(distinct authorid)"Number Authors"
from customers join orders using(customer#)
    join orderitems using(order#)
    join books using(isbn)
    join bookauthor using(isbn)
group by firstname, lastname
having count(distinct authorid) >= 2
order by 2,1;

select name,
    to_char(avg(retail-cost), '$99,900.00') "Avg Profit"
from publisher join books using(pubid)
group by name
order by name;

spool off